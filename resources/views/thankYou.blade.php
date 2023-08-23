<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Tnank You</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
  </head>
  <body>
    <div class="container mt-5">
        <div class="row mx-auto">
            <div class="col-md-6 mx-auto">
                <div class="card">
                    <div class="card-body">
                        @php
                            $total = $transaction->price - $transaction->price * ($transaction->diskon / 100);
                        @endphp
                        <h1>Terimakasih atas pemesanan nya</h1>
                        <p>Mohon kirim dana sebesar Rp. {{ number_format($total) }} ke rekening kami</p>

                        <ul>
                            <li>BANK: BCA</li>
                            <li>No rekening: 9348597348957</li>
                            <li>Atas Nama: Pepet</li>
                        </ul>

                        <p>Thank you</p>

                        <a href="{{ url('/') }}">Kembali</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
  </body>
</html>