<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Thank you</title>
</head>

<body>
    @php
        $total = $transaction->price - $transaction->price * ($transaction->diskon / 100);
    @endphp
    <h1>Thank you for your purchase</h1>
    <p>Mohon kirim dana sebesar Rp. {{ number_format($total) }} ke rekening kami</p>

    <ul>
        <li>BANK: BCA</li>
        <li>No rekening: 9348597348957</li>
        <li>Atas Nama: Pepet</li>
    </ul>

    <p>Thank you</p>

    <a href="{{ url('/') }}">Kembali</a>

</body>

</html>
