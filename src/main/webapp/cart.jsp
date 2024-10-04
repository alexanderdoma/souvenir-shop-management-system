<%@page import="com.alexanderdoma.peruinolvidable.model.mysql.ProductDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.alexanderdoma.peruinolvidable.model.entity.Product"%>
<%@page import="java.util.List"%>
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
        <!-- Productos -->
        <div class="container-sm mb-5">
            <c:if test="${(orderlines.size() == 0)}">
                <div class="d-flex flex-column align-items-center justify-content-center" style="height: 50vh">
                    <h1 class="mt-3 font-monospace text-secondary text-center mb-3">Tu carrito esta vacio</h1>
                    <a class="btn btn-dark btn-block " style="border-radius: 0" href="<%=request.getContextPath()%>/products">Seguir comprando</a>
                </div>
            </c:if>
            <c:if test="${(orderlines.size() > 0)}">
                <div class="d-flex justify-content-between align-items-center">
                    <div><h2 class="mt-3 font-monospace text-secondary">Tu carrito</h2></div>
                    <div><a class="text-dark" href="<%=request.getContextPath()%>/products">Seguir comprando</a></div>
                </div>
                <!-- Contenedor de Productos -->
                <form action="checkout" method="get">
                    <div class="mt-4 mb-4">
                        <table class="table">
                            <thead>
                                <tr class="text-secondary">
                                    <th>Producto</th>
                                    <th>Cantidad</th>
                                    <th>Total</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:set var="total" value="0" scope="session"/>
                                <c:forEach items="${orderlines}" var = "orderline">
                                    <tr>
                                        <td class="product-name">
                                            <div class="d-flex align-items-center">
                                                <a href="<%=request.getContextPath()%>/product?id=${orderline.getProduct().getId()}">
                                                    <img src="//hangertips.com/cdn/shop/files/cuy-limpias2_4f2cf6c6-e67f-432f-b0b7-b583576d9521.jpg?v=1706542512&amp;width=300"class="img-fluid" alt="Polo hombre Cuy RX charcoal" loading="lazy" width="150" height="150">
                                                </a>
                                                <div class="ms-3">
                                                    ${orderline.getProduct().getName()}
                                                    <div class="product-details">
                                                        <p>${orderline.getProduct().getBrand()}</p>
                                                        <p>${orderline.getProduct().getPrice()}</p>
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="align-middle">
                                            <div class="qty-control">
                                                <input type="number" value="${orderline.getQuantity()}" disabled>
                                                <a class="px-3" href="cart/remove?orderline_id=${orderline.getProduct().getId()}">
                                                    <i class="bi bi-trash dark"></i>
                                                </a>
                                            </div>
                                        </td>
                                        ${orderline.setTotal(orderline.getQuantity() * orderline.getProduct().getPrice())}
                                        <td class="align-middle">S/. ${orderline.getQuantity() * orderline.getProduct().getPrice()}</td>
                                    </tr>
                                    <c:set scope = "session" var="total" value="${total + (orderline.getQuantity() * orderline.getProduct().getPrice())}"/>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <div class="d-flex justify-content-end">
                        <div>
                            <div class="text-end mb-4">
                                <p class="fw-bold d-inline text-success-emphasis px-3 fs-5">Subtotal: </p>
                                    <p class="fw-bold d-inline text-secondary fs-5">${total} USD</p>
                            </div>
                            <p class="text-center text-muted small mb-4">
                                Impuesto incluido. Los gastos de envío se calculan en la pantalla de pago.
                            </p>
                            <div class="text-center">
                                <button type="submit" class="btn btn-dark btn-lg w-100">
                                    Pagar pedido
                                </button>
                            </div>
                        </div>
                    </div>
                </form>
            </c:if>
        </div>

        <div class="container-sm mb-5">
            <h2>Productos destacados</h2>
            <div class="row row-cols-4">
                <% request.setAttribute("products", new ProductDAO().getAll());%>
                <c:forEach items="${products}" var="product">
                    <div class="col">
                        <div class="card" style="border: none">
                            <img src="//hangertips.com/cdn/shop/products/cuymarron_1.jpg?v=1670366071&amp;width=150" alt="Medias Cuy" class="motion-reduce hover-zoom" loading="lazy">
                            <div class="card-body">
                                <h5 class="card-title">${product.getName()}</h5>
                                <p class="card-text">${product.getDescription()} - S/.${product.getPrice()}</p>
                                <a href="product?id=${product.getId()}" class="btn btn-primary">Ver</a>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
        <%@include file="components/footer.jsp" %>
        <script src="assets/js/main.js"></script>
        <!-- Script de Bootstrap -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
    </body>
</html>
