<%@page import="com.alexanderdoma.peruinolvidable.model.mysql.UserDAO"%>
<%@page import="com.alexanderdoma.peruinolvidable.model.entity.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="components/links.jsp" %>
    </head>
    <body>
        <% User objUser = new UserDAO().getById((int) session.getAttribute("user_id"));%>
        <%@include file="components/header.jsp"%>
        <div class="container-fluid d-flex justify-content-center">
            <div class="row">
                <div class="col-12">
                    <h1>Mi información</h1>
                    <form role="form" action="update" method="post">
                        <div class="form-group mb-2">
                            <input type="text" name="name" id="first_name" class="form-control input-lg" placeholder="Nombres" tabindex="1" value="<%=objUser.getName()%>">
                        </div>
                        <div class="form-group mb-2">
                            <input type="text" name="lastname" id="last_name" class="form-control input-lg" placeholder="Apellidos" tabindex="2" value="<%=objUser.getLastname()%>">
                        </div>
                        <div class="form-group mb-2">
                            <input type="text" name="username" id="display_name" class="form-control input-lg" placeholder="Nombre de usuario" tabindex="3" value="<%=objUser.getUsername()%>">
                        </div>
                        <div class="form-group mb-2">
                            <input type="email" name="email" id="email" class="form-control input-lg" placeholder="Correo electrónico" tabindex="4" value="<%=objUser.getEmail()%>">
                        </div>
                        <div class="row mb-2">
                            <div class="col-xs-12 col-sm-6 col-md-6">
                                <div class="form-group">
                                    <input type="password" name="password" id="password" class="form-control input-lg" placeholder="Contraseña" tabindex="5" value="<%=objUser.getPassword()%>">
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6">
                                <div class="form-group">
                                    <input type="password" name="password_confirmation" id="password_confirmation" class="form-control input-lg" placeholder="Confirmar contraseña" tabindex="6" value="<%=objUser.getPassword()%>">
                                </div>
                            </div>
                        </div>
                        <hr class="colorgraph">
                        <button type="submit" class="btn btn-outline-dark form-control mb-2">Actualizar datos</button>
                        <a href="logout" class="btn btn-outline-dark form-control mb-2">Cerrar sesión</a>
                        <hr class="colorgraph">
                        <a href="delete" class="btn btn-outline-danger form-control">Eliminar cuenta</a>
                    </form>
                </div>
            </div>
        </div>
        <%@include file="components/footer.jsp"%>
    </body>
</html>
