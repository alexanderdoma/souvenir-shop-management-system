<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <%@include file="components/header.jsp" %>
        <%
            User objUser = new UserDAO().getById((int) session.getAttribute("user_id"));
        %>
        <div class="container">
            <div class="row g-5">
                <div class="col-md-5 col-lg-4 order-md-last">
                    <h4 class="d-flex justify-content-between align-items-center mb-3">
                        <span class="text-primary">Tu carro</span>
                        <span class="badge bg-primary rounded-pill">${orderlines.size()}</span>
                    </h4>
                    
                    <ul class="list-group mb-3">
                        <c:forEach items="${orderlines}" var = "orderline">
                        <li class="list-group-item d-flex justify-content-between lh-sm">
                            <div>
                                <h6 class="my-0">${orderline.getProduct().getName()}</h6>
                                <small class="text-muted">${orderline.getProduct().getBrand()}</small>
                            </div>
                            <span class="text-muted">${orderline.getProduct().getPrice()}</span>
                        </li>
                        </c:forEach>
                        <li class="list-group-item d-flex justify-content-between">
                            <span>Total (USD)</span>
                            <strong>${total} USD</strong>
                        </li>
                    </ul>
                    
                </div>
                <div class="col-md-7 col-lg-8">
                    <h4 class="mb-2">Información del comprador</h4>
                    <form action="authorize_payment" class="needs-validation" novalidate method="post">
                        <div class="row g-3">
                            <div class="col-sm-6">
                                <label for="firstName" class="form-label">Nombre</label>
                                <input value="<%= objUser.getName()%>" type="text" class="form-control" id="firstName" placeholder required disabled>
                                <div class="invalid-feedback">
                                    Se requiere un nombre válido.
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <label for="lastName" class="form-label">Apellido</label>
                                <input value="<%= objUser.getLastname()%>" type="text" class="form-control" id="lastName" placeholder value required disabled>
                                <div class="invalid-feedback">
                                    Se requiere apellido válido.
                                </div>
                            </div>
                            <div class="col-12">
                                <label for="username" class="form-label">Nombre de usuario</label>
                                <div class="input-group has-validation">
                                    <span class="input-group-text">@</span>
                                    <input value="<%= objUser.getUsername()%>" type="text" class="form-control" id="username" placeholder="Nombre de usuario" required disabled>
                                    <div class="invalid-feedback">
                                        Tu nombre de usuario es requerido.
                                    </div>
                                </div>
                            </div>
                            <div class="col-12">
                                <label for="email" class="form-label">Email <span class="text-muted">(Opcional)</span></label>
                                <input value="<%= objUser.getEmail()%>" type="email" class="form-control" id="email" placeholder="tu@example.com" disabled>
                            </div>
                        </div>
                        <hr class="my-3">
                        <h4 class="mb-3">Pago</h4>
                        <div class="my-3">
                            <div class="form-check">
                                <input checked id="paypal" name="paymentMethod" type="radio" class="form-check-input" required>
                                <label class="form-check-label" for="paypal">PayPal</label>
                            </div>
                        </div>
                        <hr class="my-3">
                        <button class="w-100 btn btn-primary btn-lg" type="submit">Continuar con el pago</button>
                    </form>
                </div>
            </div>
        </div>
        <%@include file="components/footer.jsp" %>
    </body>
</html>
