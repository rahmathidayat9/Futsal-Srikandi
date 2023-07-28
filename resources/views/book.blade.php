<!DOCTYPE html>
<html>

<head>
    <title>Booking langsung | Futsal Srikandi</title>
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    <script type="text/javascript" src="{{ asset('js/googlemap.js') }}"></script>
    <!-- Vue JS -->
    <script type="text/javascript" src="{{ asset('js/vue/vue.js') }}"></script>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <!-- Popper JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="{{ asset('css/tambahsewa-style.css') }}">
    <link rel="stylesheet" type="text/css" href="{{ asset('css/profile-style.css') }}">
</head>

<body>
    <section class="newsletter" id="newsletter">
        <h3 class="header-text" style="color: white;">Booking langsung</h3>
        <div class="content-area my-5">
            <div class="single-contact">
                @if (session('error'))
                    <div class="alert alert-danger">
                        {{ session('error') }}
                    </div>
                @endif
                <button class="btn btn-block btn-success" onclick="member()">Member</button>
                <br>
                <button class="btn btn-block btn-success" onclick="nonmember()">Non Member</button>
                <br><br>
                <div id="form"></div>
            </div>
        </div>
    </section>

    <footer>
        <p>All Right reserved by &copy; <a href="#">Team Basing Aja 2020</a></p>
    </footer>

    <script src="{{ asset('js/profile.js') }}"></script>
    <script src="https://kit.fontawesome.com/3f4aa1c6f5.js" crossorigin="anonymous"></script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDdg3NKQlbc9sVcuo8aRzLZQLtPoLrPZsw&callback=loadMap" async
        defer></script>
    <!--   Core JS Files   -->
    <script src="{{ asset('js/jquery.3.2.1.min.js') }}" type="text/javascript"></script>
    <script src="{{ asset('js/bootstrap.min.js') }}" type="text/javascript"></script>

    <script type="text/javascript">
        const nonmember = () => {
            $('#form').html('');

            $('#form').append(`
                <form action="{{ url('/book') }}" method="POST">
                    @csrf
                    <div class="form-group">
                        <label for="name">Nama</label>
                        <input type="text" id="name" name="name" class="form-control" required/>
                    </div>
                    <div class="form-group">
                        <label for="email">E-mail</label>
                        <input type="email" id="email" name="email" class="form-control" required/>
                    </div>
                    <div class="form-group">
                        <label for="phone">No. HP</label>
                        <input type="text" id="phone" name="phone" class="form-control" required/>
                    </div>
                    <button class="btn btn-primary">Book</button>
                </form>
            `);
        }
        const member = () => {
            $('#form').html('');

            $('#form').append(`
                <form action="{{ url('/book') }}" method="POST">
                    @csrf
                    <div class="form-group">
                        <label for="email_user">Masukan email anda</label>
                        <input type="email" id="email_user" name="email_user" class="form-control" required/>
                    </div>
                    <button class="btn btn-primary">Book</button>
                </form>
            `);
        }
    </script>
</body>

</html>
