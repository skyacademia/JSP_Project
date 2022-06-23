<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Bootstrap demo</title>
  
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
  <link rel="stylesheet" href="./resources/css/carousel.css">
  <style>
    .icon {
      font-size: 24px;
    }

    .cardImage {
      background-size: cover;
    }
  </style>
  <!-- Custom styles for this template -->
  <!-- <link href="./css/carousel.css" rel="stylesheet"> -->
</head>

<body>

  <!--메뉴-->
  <div class="container">
    <nav class="navbar navbar-expand-md fixed-top bg-white">
      <div class="container-fluid">
        <a class="navbar-brand" href="./index.jsp">ForProgram</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse"
          aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
          <ul class="navbar-nav me-auto mb-2 mb-md-0">
            <li class="nav-item">
              <a class="nav-link active" aria-current="page" href="#">메인페이지</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="category.jsp">서비스 검색</a>
            </li>
            <li class="nav-item">
              <a class="nav-link disabled">서비스 등록</a>
            </li>
          </ul>
          
            <button class="btn btn-outline-primary me-3" onclick="location='Login.jsp'">로그인</button>
			<button class="btn btn-outline-success">회원가입</button></a>
          
        </div>                         
      </div>
    </nav>

    <!--이미지-->
    <div class="container-fluid">
      <img src="./resources/images/mainImg.jpg" class="img-fluid w-100" alt="...">
      <div class="carousel-caption text-start" style="right: 15%;
      left: 15%;">
      </div>
      <h1 class="display-4">여러분이 원하는 프로젝트를 찾아보세요</h1>
        <div class="mb-3">
          <input type="text" class="form-control bg-danger " id="..." style="--bs-bg-opacity: .0;">
        </div>
    </div>

    <hr class="featurette-divider">

    <div class="container">
      <h1 class="display-4" style="margin-top:50px;
      margin-bottom: 50px;">여러분이 원하는 프로젝트를 찾아보세요</h1>
      <div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-inner">
          <div class="carousel-item active">
            <div class="container">
              <div class="row" style="height: 20rem;">
                <div class="card col-md-4 cardImage " style="background-image: url(./resources/images/test1.jpg);">
                  <div class="card-body">
                    프론트엔드
                  </div>
                </div>
                <div class="card col-md-4 rounded-4 cardImage" style="background-image: url(./resources/images/test2.jpg);">
                  <div class="card-body">
                    백엔드
                  </div>
                </div>
                <div class="card col-md-4 cardImage" style="background-image: url(./resources/images/test3.jpg);">
                  <div class="card-body">
                    풀스택
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="carousel-item">
            <div class="container">
              <div class="row" style="height: 20rem;">
                <div class="card col-md-4 cardImage" style="background-image: url(./resources/images/test1.jpg);">
                  <div class="card-body">
                    안드로이드
                  </div>
                </div>
                <div class="card col-md-4 cardImage" style="background-image: url(./resources/images/test2.jpg);">
                  <div class="card-body">
                    IOS
                  </div>
                </div>
                <div class="card col-md-4 cardImage" style="background-image: url(./resources/images/test3.jpg);">
                  <div class="card-body">
                    크로스플랫폼
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <button class="carousel-control-prev opacity-0" type="button" data-bs-target="#carouselExampleControls"
          data-bs-slide="prev">
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next opacity-0" type="button" data-bs-target="#carouselExampleControls"
          data-bs-slide="next">
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Next</span>
        </button>
      </div>
    </div>

    <hr class="featurette-divider">

    <div class="container">
      <div class="row featurette">
        <div class="col-md-7">
          <h2 class="featurette-heading fw-normal lh-1">프로그래머를 위한 플랫폼</h2>
          <p class="text-start align-middle">Some great placeholder content for the first featurette here. Imagine some
            exciting prose
            here.</p>
        </div>
        <div class="col-md-5">
          <img class="img-fluid" src="./resources/images/test1.jpg" style="height: 500px; width: 500px;">
        </div>
      </div>
    </div>

    <hr class="featurette-divider">

    <div class="container">
      <div class="row featurette">
        <div class="col-md-7 order-md-2">
          <h2 class="featurette-heading fw-normal lh-1 display-5">프로그래머를 위한 플랫폼</h2>
          <p class="lead">Some great placeholder content for the first featurette here. Imagine some exciting prose
            here.</p>
        </div>
        <div class="col-md-5 order-md-1">
          <img class="img-fluid" src="./resources/images/test1.jpg" style="height: 500px; width: 500px;">
        </div>
      </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
      crossorigin="anonymous"></script>

</body>
<div class="container">
  <footer class="d-flex flex-wrap justify-content-between align-items-center py-3 my-4 border-top">
    <div class="col-md-4 d-flex align-items-center">
      <a href="/" class="mb-3 me-2 mb-md-0 text-muted text-decoration-none lh-1">
        <i class="bi bi-bootstrap-fill icon"></i>
      </a>
      <span class="mb-3 mb-md-0 text-muted">&copy; 2022 Company, Inc</span>
    </div>

    <ul class="nav col-md-4 justify-content-end list-unstyled d-flex">
      <li class="ms-3"><a class="text-muted" href="#"><i class="bi bi-twitter icon"></i></a></li>
      <li class="ms-3"><a class="text-muted" href="#"><i class="bi bi-instagram icon"></i></a></li>
      <li class="ms-3"><a class="text-muted" href="#"><i class="bi bi-facebook icon"></i></a></li>
    </ul>
  </footer>
</div>
</html>
