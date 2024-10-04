<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Review</title>
        <%@include file="components/links.jsp" %>
        <style type="text/css">
            table {
                border: 0;
            }
            table td {
                padding: 5px;
            }
        </style>
    </head>
    <body>
        <%@include file="components/header.jsp" %>
        <div class="container">
            <h1>Porfavor, revisar antes de pagar</h1>
            <hr class="my-3">
            <div class="row g-5">
                <div class="col-md-6 order-md-last">
                    <h4 class="d-flex justify-content-between align-items-center mb-3">
                        <span class="text-primary">Dirección del comprador</span>
                        <span class="badge bg-primary rounded-pill">3</span>
                    </h4>
                    <ul class="list-group mb-3">
                        <li class="list-group-item d-flex justify-content-between lh-sm">
                            <div>
                                <h6 class="my-0">Descripción</h6>
                                    <small class="text-muted">${transaction.description}</small>
                            </div>
                        </li>
                        <li class="list-group-item d-flex justify-content-between lh-sm">
                            <div>
                                <h6 class="my-0">Subtotal</h6>
                                <small class="text-muted">${transaction.amount.details.subtotal} USD</small>
                            </div>
                        </li>
                        <li class="list-group-item d-flex justify-content-between">
                            <span>Total (USD)</span>
                            <strong>${transaction.amount.total} USD</strong>
                        </li>
                    </ul>
                </div>
                <div class="col-md-6">
                    <h4 class="mb-2">Información del comprador</h4>
                    <form action="execute_payment" class="needs-validation" novalidate method="post">
                        <input type="hidden" name="paymentId" value="${param.paymentId}" />
                        <input type="hidden" name="PayerID" value="${param.PayerID}" />
                        <div class="row g-3">
                            <div class="col-sm-6">
                                <label for="firstName" class="form-label">Nombre</label>
                                <input value="${payer.firstName}" type="text" class="form-control" id="firstName" placeholder required disabled>
                                <div class="invalid-feedback">
                                    Se requiere un nombre válido.
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <label for="lastName" class="form-label">Apellido</label>
                                <input value="${payer.lastName}" type="text" class="form-control" id="lastName" placeholder value required disabled>
                                <div class="invalid-feedback">
                                    Se requiere apellido válido.
                                </div>
                            </div>
                            <div class="col-12">
                                <label for="email" class="form-label">Email <span class="text-muted">(Opcional)</span></label>
                                <input value="${payer.email}" type="email" class="form-control" id="email" placeholder="tu@example.com" disabled>
                            </div>
                        </div>
                        <hr class="my-3">
                        <button class="w-100 btn btn-primary btn-lg" type="submit">Confirmar pago</button>
                    </form>
                </div>
            </div>
        </div>
        <%@include file="components/footer.jsp" %>
    </body>
</html>