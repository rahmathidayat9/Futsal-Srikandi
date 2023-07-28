<!DOCTYPE html>
<html>

<head>
    <title>Your Order | {{ env('APP_NAME') }}</title>
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
</body>

</html>
