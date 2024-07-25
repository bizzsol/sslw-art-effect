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
                            @if (session('status'))
                                <div class="alert alert-success" role="alert">
                                    {{ session('status') }}
                                </div>
                            @endif
                            <form method="POST" action="{{ route('password.update') }}">
                            @csrf
                                <a class="sign-in-logo text-center mb-4" href="#">
                                    <img src="{{ asset(session()->get('system-information')['logo']) }}" class="img-fluid" alt="Bizz">
                                </a>
                                <input type="hidden" name="token" value="{{ $token }}">
                                <div class="form-group">
                                    <label for="email">Email address</label>
                                    <input name="email" type="email" class="form-control mb-0 @error('email') is-invalid @enderror" id="email" value="{{ $email ?? old('email') }}" required autocomplete="email" autofocus readonly>
                                    @error('email')
                                      <span class="invalid-feedback" role="alert">
                                          <strong>{{ $message }}</strong>
                                      </span>
                                    @enderror
                                </div>

                                <div class="form-group">
                                    <label for="password">{{ __('Password') }}</label>
                                    <input id="password" type="password" class="form-control @error('password') is-invalid @enderror" name="password" required autocomplete="new-password">

                                    @error('password')
                                        <span class="invalid-feedback" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                    @enderror
                                </div>

                                <div class="form-group">
                                    <label for="password-confirm">{{ __('Confirm Password') }}</label>
                                    <input id="password-confirm" type="password" class="form-control" name="password_confirmation" required autocomplete="new-password">
                                </div>

                                <div class="form-group row mb-0">
                                    <div class="col-md-6 pt-2">
                                        <a class="text-primary" href="{{ route('password.request') }}"><strong>Go Back</strong></a>
                                    </div>
                                    <div class="col-md-6 text-right">
                                        <button type="submit" class="btn btn-primary">Reset Password</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </section>
      </div>
      <script src="{{ asset('js/app.js') }}"></script>
      <script>
        $(document).ready(function() {
          $("#email").focus();  
        });
      </script>
   </body>

</html>