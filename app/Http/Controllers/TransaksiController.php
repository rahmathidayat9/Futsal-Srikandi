<?php

namespace App\Http\Controllers;

use App\Mail\TransactionMail;
use App\Transaksi;
use App\User;
use App\Operator;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Mail;

class TransaksiController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        date_default_timezone_set("Asia/Jakarta");
        if (isset($request->tanggal)) {
            $tanggal = $request->tanggal;
        } else {
            $tanggal = date("Y-m-d");
        }

        $transaksi = Transaksi::with('operator')->where('tanggal', $tanggal)->get();

        return view('daftarpenyewa', compact('transaksi'), ['tanggal' => $tanggal, 'operator_nama' => $request->session()->get('nama')]);
    }

    public function directBook(Request $request)
    {
        $book =  request()->session()->get('book');

        if ($book) {
            DB::transaction(function () use ($request, $book) {
                if ($request->has('email_user')) {
                    $user = User::where(
                        'email',
                        $request->email_user
                    )->first();

                    if (!$user) {
                        return redirect()->back()->with('error', 'Email tidak terdaftar');
                    }

                    $time = intval($book['kode_jadwal'][1] . $book['kode_jadwal'][2]);

                    if ($time < 15) {
                        $price = 70000;
                    } elseif ($time < 18) {
                        $price = 80000;
                    } else {
                        $price = 110000;
                    }

                    $id = DB::table('transaksi')->insertGetId([
                        'email'             => $request->email_user,
                        'kode_lapangan'     => $book['kode_lapangan'],
                        'kode_jadwal'       => $book['kode_jadwal'],
                        'nama_user'         => $user->nama,
                        'price'             => $price,
                        'diskon'            => 0,
                        'tanggal'           => $book['tanggal'],
                        'phone'             => $user->telepon,
                    ]);

                    $transaction = DB::table('transaksi')->where('kode_transaksi', $id)->first();

                    Mail::to($request->email_user)->send(new TransactionMail($transaction));

                    request()->session()->put('transaction', $id);
                } else {
                    $time = intval($book['kode_jadwal'][1] . $book['kode_jadwal'][2]);

                    if ($time < 15) {
                        $price = 70000;
                    } elseif ($time < 18) {
                        $price = 80000;
                    } else {
                        $price = 110000;
                    }

                    $id = DB::table('transaksi')->insertGetId([
                        'email'             => $request->email,
                        'kode_lapangan'     => $book['kode_lapangan'],
                        'kode_jadwal'       => $book['kode_jadwal'],
                        'nama_user'         => $request->name,
                        'price'             => $price,
                        'diskon'            => 0,
                        'tanggal'           => $book['tanggal'],
                        'phone'             => $request->phone,
                    ]);

                    $transaction = DB::table('transaksi')->where('kode_transaksi', $id)->first();

                    Mail::to($request->email)->send(new TransactionMail($transaction));

                    request()->session()->put('transaction', $id);
                }
            });

            return redirect('/thank-you');
        }

        return abort(403);
    }

    public function directBookForm($code, $tanggal)
    {
        $kode_lapangan = $code;
        $kode_jadwal = $code[1] . $code[3] . $code[4];

        request()->session()->forget('book');

        request()->session()->put('book', [
            'kode_jadwal'       => $kode_jadwal,
            'kode_lapangan'     => $kode_lapangan,
            'tanggal'           => $tanggal,
        ]);

        return view('book');
    }

    public function thankYou()
    {
        $book =  request()->session()->get('book');
        $id =  request()->session()->get('transaction');

        if ($book && $id) {
            $transaction = DB::table('transaksi')->where('kode_transaksi', $id)->first();

            request()->session()->forget('book');
            request()->session()->forget('transaction');

            $data = [
                'transaction'   => $transaction
            ];

            return view('thankYou', $data);
        }

        return redirect()->to('/');
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $namaoperator = $request->nama_operator;

        $operator = Operator::where('nama', $namaoperator)->first();

        for ($i = 0; $i < count($request->kode_lapangan); $i++) {
            DB::transaction(function () use ($request, $i, $operator) {
                $userfdb = User::where([
                    ['nama', '=', $request->nama[$i]],
                    ['telepon', '=', $request->kontak[$i]],
                    ['email', '=', $request->email[$i]]
                ])->first();

                if (!$userfdb) {
                    User::create(
                        [
                            'kode_user' => null, 'nama' => $request->nama[$i],
                            'telepon'   => $request->kontak[$i],
                            'email'     => $request->email[$i]
                        ]
                    );

                    $userfdb = User::where([
                        ['nama', '=', $request->nama[$i]],
                        ['telepon', '=', $request->kontak[$i]],
                    ])->first();
                }

                $id = DB::table('transaksi')->insertGetId([
                    'email'             => $request->email[$i],
                    'kode_operator'     => $operator->kode_operator,
                    'kode_user'         => $userfdb->kode_user,
                    'kode_lapangan'     => $request->kode_lapangan[$i],
                    'kode_jadwal'       => $request->kode_jadwal[$i],
                    'nama_user'         => $request->nama[$i],
                    'diskon'            => $request->diskon[$i],
                    'price'             => $request->harga[$i],
                    'tanggal'           => $request->tanggal_jadwal[$i],
                    'phone'             => $request->kontak[$i],
                ]);

                $transaction = DB::table('transaksi')->where('kode_transaksi', $id)->first();

                Mail::to($request->email[$i])->send(new TransactionMail($transaction));
            });
        }

        return redirect('/tambahsewa');
    }


    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */


    /**
     * Display the specified resource.
     *
     * @param  \App\Transaksi  $transaksi
     * @return \Illuminate\Http\Response
     */
    public function show(Transaksi $transaksi)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Transaksi  $transaksi
     * @return \Illuminate\Http\Response
     */
    public function edit(Transaksi $transaksi)
    {
        return view('edit', compact('transaksi'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Transaksi  $transaksi
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {

        $updates = Transaksi::find($id);
        $updates->diskon = $request->diskon;
        $updates->kode_jadwal = $request->jadwal;
        $updates->tanggal = $request->tanggal;
        $updates->save();

        $updates = User::find($request->kode_user);
        $updates->nama = $request->nama;
        $updates->telepon = $request->kontak;
        $updates->save();

        // return redirect('/daftarpenyewa');
        return response()->json($updates);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Transaksi  $transaksi
     * @return \Illuminate\Http\Response
     */
    public function destroy(Transaksi $transaksi)
    {
        Transaksi::destroy($transaksi->kode_transaksi);
        return redirect('/daftarpenyewa');
    }
}
