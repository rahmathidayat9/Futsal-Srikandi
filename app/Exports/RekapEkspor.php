<?php

namespace App\Exports;

use App\Transaksi;
use Illuminate\Support\Facades\DB;
use Maatwebsite\Excel\Concerns\Exportable;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\ShouldAutoSize;
use Maatwebsite\Excel\Concerns\WithHeadings;

class RekapEkspor implements FromCollection, ShouldAutoSize, WithHeadings
{
    use Exportable;

    private $dari;
    private $ke;

    public function __construct($d, $k)
    {
        $this->dari = $d;
        $this->ke = $k;
    }
    /**
     * @return \Illuminate\Support\Collection
     */
    public function collection()
    {
        $data = [];

        $transactions = Transaksi::with('jadwal')->where([
            ['tanggal', '>=', $this->dari],
            ['tanggal', '<=', $this->ke]
        ])->orderBy('tanggal', 'ASC')->get();

        $i = 0;

        foreach ($transactions as $row) {
            $i++;

            $operator = $row->kode_operator ? DB::table('operator')->where('kode_operator', $row->kode_operator)->first()->nama : '';

            $jam = DB::table('jadwal')->where('kode_jadwal', $row->kode_jadwal)->first()->jam;

            $total = $row->price - $row->price * ($row->diskon / 100);

            $entry = [
                'A' => (string)$i,
                'B' => $row->nama_user,
                'C' => $row->phone,
                'D' => $row->email,
                'E' => $row->kode_transaksi,
                'F' => $operator,
                'G' => $row->kode_lapangan,
                'H' => $row->kode_jadwal,
                'I' => $row->diskon ? (string)$row->diskon . '%' : '0%',
                'J' => 'Rp.' . number_format($row->price),
                'K' => 'Rp.' . number_format($total),
                'L' => date('d-m-Y', strtotime($row->tanggal)),
                'M' => (string)$jam
            ];

            array_push($data, $entry);
        }

        return collect($data);
    }

    public function headings(): array
    {
        return [
            'No', 'Nama', 'No HP',
            'E-mail', 'Kode Transaksi', 'Operator',
            'Kode Lapangan', 'Kode Jadwal', 'Diskon',
            'Harga', 'Total', 'Tanggal', 'Jam'
        ];
    }
}
