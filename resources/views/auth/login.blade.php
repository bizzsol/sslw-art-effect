<!doctype html>
<html lang="en">

<head>
      <!-- Required meta tags -->
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
      <title>{{ session()->get('system-information')['name'] }}</title>
      <!-- Fav icon -->
      <link rel="icon" href="{{ asset(session()->get('system-information')['icon']) }}" type="image/png">

      <!-- Styles -->
      <link href="{{ asset('css/app.css') }}" rel="stylesheet">

      <!-- Style CSS -->
      <link rel="stylesheet" href="{{ asset('assets/css/style.css') }}">  
      <!-- Responsive CSS -->
      <link rel="stylesheet" href="{{ asset('assets/css/responsive.css') }}">
      <style>
          .sign-in-page{
            position: absolute;
            top: 35%;
            transform: translate(0, -35%);
            padding: 10px;
            width: 100%;
            height: auto;
          }
          .sign-in-detail {
            max-width: 100%;
            height: 100%;
          }
      </style>
</head>
   <body>
      <!-- loader END -->
      <div id="app">
        <!-- Sign in Start -->
        <section class="sign-in-page">
            <div class="container sign-in-page-bg mt-4 p-0">
                <div class="row no-gutters pl-5">
                    <div class="col-md-6 text-center ">
                        <div class="sign-in-detail text-white">
                            <div >
                                <div class="item login-slider">
                                    <img src="{{ asset(session()->get('system-information')['secondary_logo']) }}" class="img-fluid mb-2 radius-10 bg-white p-2" alt="logo">
                                    <h4 class="mb-1 text-white">{{ session()->get('system-information')['organization'] }}</h4>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 position-relative">
                        <div class="sign-in-from">
                            <form method="POST" action="{{ route('login') }}" class="mt-4">
                            @csrf
                                <a class="sign-in-logo text-center mb-3 " href="#">
                                    <img src="{{ asset(session()->get('system-information')['logo']) }}" class="img-fluid" alt="Bizz">
                                </a>
                                <div class="form-group">
                                    <label for="email">Email Address</label>
                                    <input name="email" type="email" class="form-control mb-0 @error('email') is-invalid @enderror" id="email" value="{{ old('email') }}" placeholder="Enter email" autofocus="autofocus">
                                    @error('email')
                                      <span class="invalid-feedback" role="alert">
                                          <strong>{{ $message }}</strong>
                                      </span>
                                    @enderror
                                </div>
                                <div class="form-group">
                                    <label for="password">Password</label>
                                    <input name="password" type="password" class="form-control mb-0 @error('password') is-invalid @enderror" id="password" placeholder="Password" value="{{ old('password') }}">
                                    @error('password')
                                      <span class="invalid-feedback" role="alert">
                                          <strong>{{ $message }}</strong>
                                      </span>
                                  @enderror
                                </div>
                                <div class="d-inline-block w-100">
                                    <div class="row">
                                        <div class="col-md-6 pt-2">
                                            <a class="text-primary" href="{{ route('password.request') }}"><strong>Forgot Password ?</strong></a>
                                        </div>
                                        <div class="col-md-6 text-right">
                                            <button type="submit" class="btn btn-primary">Sign in</button>
                                        </div>
                                    </div>
                                </div>
                                
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Sign in END -->
      </div>
      <script src="{{ asset('js/app.js') }}"></script>
      <script>
        $(document).ready(function() {
          $("#email").focus();  
        });
      </script>
   </body>

</html>