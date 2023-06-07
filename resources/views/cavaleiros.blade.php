<html>
    <head>
        <head>
            <meta charset="utf-8" />
            <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
            <meta name="description" content="" />
            <meta name="author" content="" />
            <title>Cavaleiros do Zodíaco</title>
            <!-- Favicon-->
            <link rel="icon" type="image/x-icon" href="assets/favicon.ico.png" />
            <!-- Bootstrap icons-->
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
            <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
            <!-- Core theme CSS (includes Bootstrap)-->
            <link href="{{asset('css1/style.css')}}" rel="stylesheet" />
        </head>
    </head>
    <body>
         <!-- Navigation-->
         <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container px-4 px-lg-5">
                <img src="assets/favicon.ico.png" width="50px" height="50px"> <br> <br>
                <a class="navbar-brand" href="principal">Star Cine</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="principal">Filmes</a></li>
                        <li class="nav-item"><a class="nav-link" href="sobre">Sobre nós</a></li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Mais opções</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="filme">Lista e cadastro de filmes</a></li>
                                <li><hr class="dropdown-divider" /></li>
                                <li><a class="dropdown-item" href="produto">Lista e cadastro de produtos  </a></li>
                                <li><a class="dropdown-item" href="funcionario">Lista e cadastro de funcionários</a></li>
                            </ul>
                        </li>
                    </ul>
                    <a class="btn btn-dark" href="{{ route('logout') }}"
                                onclick="event.preventDefault(); document.getElementById('logout-form').submit();">
                                <i class='fas fa-sign-out-alt'></i> {{ __('Sair') }}</a>
                            <form id="logout-form" action="{{ route('logout') }}" method="POST" class="d-none">
                                @csrf
                            </form>
                </div>
            </div>
        </nav>

        <section class="py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="row gx-4 gx-lg-5 align-items-center">
                    <div class="col-md-6"><img class="card-img-top mb-5 mb-md-0" src="https://br.web.img3.acsta.net/pictures/23/04/24/21/50/1055506.jpg" alt="..." /></div>
                    <div class="col-md-6">
                        <h1 class="display-5 fw-bolder"> Cavaleiros do <br> Zodíaco Saint <br> Seiya: O Começo </h1>
                        Seiya, um obstinado adolescente de rua, passa seu tempo lutando por dinheiro enquanto procura por 
                        sua irmã sequestrada. Quando uma de suas lutas inadvertidamente desperta poderes místicos que ele 
                        nunca soube que tinha, Seiya se vê lançado em um mundo de santos guerreiros, treinamento mágico 
                        antigo e uma deusa reencarnada que precisa de sua proteção. Se ele quiser sobreviver, precisará 
                        abraçar seu destino e sacrificar tudo para ocupar seu lugar de direito entre os Cavaleiros do 
                        Zodíaco.
                        <p class="lead"></p>
                        <div class="d-flex justify-content-center small text-warning mb-2">
                            <div class="bi-star-fill"></div>
                            <div class="bi-star-fill"></div>
                            <div class="bi-star-fill"></div>
                            <div class="bi-star-fill"></div>
                        </div>
                        <br>
                        <p> Gênero: Ação/Aventura <br> Classificação indicativa: 12 anos <br> Duração: 1h52min </p>
                        <p> Horários: </p> 
                        <a href="comprar" class="btn btn-dark"> R$| 14:30 </a>
                        <a href="comprar" class="btn btn-dark"> R$| 21:10 </a>
                </div>
            </div>
        </section>
    </body>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
</html>