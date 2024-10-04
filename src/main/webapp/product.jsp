<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.alexanderdoma.peruinolvidable.model.entity.Product"%>
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
        <div class="container-sm productos">
            <div class="d-flex">
                <div class="producto-imagen">
                    <img srcset="//hangertips.com/cdn/shop/products/3044995.jpg?v=1679155709&amp;width=493 493w,
                         //hangertips.com/cdn/shop/products/3044995.jpg?v=1679155709&amp;width=600 600w,
                         //hangertips.com/cdn/shop/products/3044995.jpg?v=1679155709&amp;width=713 713w,
                         //hangertips.com/cdn/shop/products/3044995.jpg?v=1679155709&amp;width=823 823w,
                         //hangertips.com/cdn/shop/products/3044995.jpg?v=1679155709&amp;width=990 990w,
                         //hangertips.com/cdn/shop/products/3044995.jpg?v=1679155709 1000w"
                         src="//hangertips.com/cdn/shop/products/3044995.jpg?v=1679155709&amp;width=1946"
                         sizes="(min-width: 1200px) 715px, (min-width: 990px) calc(65.0vw - 10rem), (min-width: 750px) calc((100vw - 11.5rem) / 2), calc(100vw - 4rem)"
                         width="500" height="500" alt="">
                </div>
                <div class="producto-contenido d-flex flex-column">
                    <form action="cart/add" method="post">
                        <jsp:useBean id="product" scope="request" type="java.lang.Object"/>
                        <input type="hidden" value="${product.getId()}" name="product_id">
                        <p class="fw-light">HANGERTIPS</p>
                        <h1 class="fw-light">${product.getName()}</h1>
                        <span class="mt-2 mb-2 fw-light">S/. ${product.getPrice()} PEN</span>
                        <p class="fw-light text-secondary">Impuesto incluido. Los gastos de envío se calculan en la pantalla de
                            pago.</p>
                        <p class="fw-light text-secondary">Cantidad</p>
                        <div class="mb-4">
                            <div class="qty-control">
                                <input type="number" value="1" name="quantity">
                            </div>
                        </div>
                        <button  type="submit" class="btn btn-outline-primary mt-2 mb-2">
                            Agregar al carrito
                        </button>
                        <p class="fw-light text-secondary">
                            ${product.getDescription()}
                        </p>
                        <p class="fw-light text-secondary">100% hecho en Perú</p>
                    </form>
                </div>
            </div>
        </div>
        <%@include file="components/footer.jsp" %>
    </body>
</html>
