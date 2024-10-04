<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inicio de sesión</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" href="assets/css/login.css">
    </head>
    <body>
        <input type='hidden' id='status' value="<%=request.getAttribute("status")%>">
        <div class="container d-flex justify-content-center align-items-center min-vh-100">
            <div class="row border rounded-5 p-3 bg-white shadow box-area">
                <div class="col-md-6 rounded-4 d-flex justify-content-center align-items-center flex-column left-box"
                     style="background: #103cbe;">
                    <div class="featured-image mb-3">
                        <img src="assets/img/file.png" class="img-fluid" style="width: 250px;">
                    </div>
                    <p class="text-white fs-2" style="font-family: 'Courier New', Courier, monospace; font-weight: 600;">¡Bienvenido!</p>
                    <small class="text-white text-wrap text-center"
                           style="width: 17rem;font-family: 'Courier New', Courier, monospace;">Descubre y adquiere los mejores souvenirs peruanos.</small>
                </div>
                <div class="col-md-6 right-box">
                    <div class="row align-items-center">
                        <div class="header-text mb-4">
                            <h2>Hola de nuevo</h2>
                            <p>Nos alegra verte de vuelta.</p>
                        </div>
                        <form action="session" method="post">
                            <input type="hidden" name="action" value="login">
                            <div class="input-group mb-3">
                                <input type="text" class="form-control form-control-lg bg-light fs-6" required="required" name = "username" placeholder="Correo electrónico">
                            </div>
                            <div class="input-group mb-1">
                                <input type="password" class="form-control form-control-lg bg-light fs-6" required="required" name = "password" placeholder="Contraseña">
                            </div>
                            <div class="input-group mb-5 d-flex justify-content-between">
                                <div class="form-check">
                                    <input type="checkbox" class="form-check-input" id="formCheck">
                                    <label for="formCheck" class="form-check-label text-secondary"><small>Recordarme</small></label>
                                </div>
                                <div class="forgot">
                                    <small><a href="#">¿Olvidaste tu contraseña?</a></small>
                                </div>
                            </div>
                            <div class="input-group mb-3">
                                <button type="submit" class="btn btn-lg btn-primary w-100 fs-6">Iniciar Sesión</button>
                            </div>
                        </form>
                        <div class="input-group mb-3">
                            <!-- <button class="btn btn-lg btn-light w-100 fs-6"><img src="images/google.png" style="width:20px"
                                  class="me-2"><small>Iniciar sesión con Google</small></button> -->
                        </div>
                        <div class="row">
                            <small>¿No tienes cuenta? <a href="register.jsp">Regístrate</a></small>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script type="text/javascript">
                var status = document.getElementById("status").value;
                if(status == "invalidCredentials") {
                    Swal.fire({
                        title: "El usuario o contraseña es incorrecta",
                        text: "Ingrese nuevamente sus credenciales",
                        icon: "error"
                    });
                }
        </script>
    </body>
</html>
