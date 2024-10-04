<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="components/links.jsp"%>
    </head>
    <body>
        <div class="container-fluid d-flex justify-content-center align-items-center" style="height: 100vh">
            <div class="row">
                <form role="form" action="insert" method="post">
                    <input type="hidden" name="action" value="insert">
                    <h2>Registro de usuario</h2>
                    <hr class="colorgraph">
                    <div class="row mb-3">
                        <div class="col-6">
                            <div class="form-group">
                                <input type="text" name="name" id="first_name" class="form-control input-lg" placeholder="Nombres" tabindex="1">
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="form-group">
                                <input type="text" name="lastname" id="last_name" class="form-control input-lg" placeholder="Apellidos" tabindex="2">
                            </div>
                        </div>
                    </div>
                    <div class="form-group mb-3">
                        <input type="text" name="username" id="display_name" class="form-control input-lg" placeholder="Nombre de usuario" tabindex="3">
                    </div>
                    <div class="form-group mb-3">
                        <input type="email" name="email" id="email" class="form-control input-lg" placeholder="Correo electrónico" tabindex="4">
                    </div>
                    <div class="row mb-3">
                        <div class="col-xs-12 col-sm-6 col-md-6">
                            <div class="form-group">
                                <input type="password" name="password" id="password" class="form-control input-lg" placeholder="Contraseña" tabindex="5">
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6">
                            <div class="form-group">
                                <input type="password" name="password_confirmation" id="password_confirmation" class="form-control input-lg" placeholder="Confirmar contraseña" tabindex="6">
                            </div>
                        </div>
                    </div>
                    <hr class="colorgraph">
                    <button type="submit" class="btn btn-outline-dark btn-block btn-lg form-control mb-3" tabindex="7">Crear cuenta</button>
                    <a href="login.jsp" class="btn btn-outline-dark btn-block btn-lg form-control">Regresar</a>
                </form>
            </div>
        </div>
    </body>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script type="text/javascript">
        var status = document.getElementById("status").value;
        if (status == "invalidCredentials") {
            Swal.fire({
                title: "El usuario o contraseña es incorrecta",
                text: "Ingrese nuevamente sus credenciales",
                icon: "error"
            });
        }
    </script>
</html>
