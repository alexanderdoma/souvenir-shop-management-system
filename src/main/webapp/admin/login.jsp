<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Spring eCommerce</title>


  <!-- Bootstrap core CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

  <!-- Custom styles for this template -->
  <link href="css/heroic-features.css" rel="stylesheet">

</head>

<body>

  <!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
      <a class="navbar-brand" href="index.html">Spring Ecommerce</a>


      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item">
            <a class="nav-link" href="login.html">Login</a>
          </li>
        </ul>
      </div>    
    </div>
  </nav>


  <!-- Page Content -->
  <div class="container">

    <div class="card mb-3">
      <div class="row no-gutters">
        <div class="col-md-4">
        </div>
        <div class="col-md-8">
          <div class="card-body">
            <h2>Ingresar</h2>

          </div>
        </div>
      </div>
    </div>

    
    <form  action="#" method="post">
      <div class="form-group">
        <label for="email"> Email:  </label>      
        <input type="email" class="form-control" id="email" name="email" placeholder="Ingrese su email" required autocomplete="off"> 

      </div>

      <div class="form-group">
        <label for="pwd"> Contraseña:</label>
        <input type="password"  class="form-control" id="password" name="password" placeholder="Ingrese su contraseña" required>       
      </div>

      <div class="form-group">
        <div class="col-sm-2">
          <button type="submit" class="btn btn-dark"> <span class="glyphicon glyphicon-ok"></span> Ingresar</button>
        </div>      
      </div>    
    </form>
    <a href="registro.html" class="card-link">Si aún no tiene cuenta aqui puede registrarse</a>
  </div>
  <!-- /.container -->

  <!-- Footer -->
  <footer class="py-5 bg-dark">
    <div class="container">
      <p class="m-0 text-center text-white">Copyright &copy; Spring eCommerce 2020</p>
    </div>
    <!-- /.container -->
  </footer>

  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

</body>

</html>
