<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.alexanderdoma.peruinolvidable.model.mysql.ProductDAO"%>
<%@page import="com.sun.tools.javac.resources.compiler"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Nuestros productos</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" href="assets/css/index.css"/>
    </head>
    <body>
        <%@include file="components/header.jsp"%>
        
        <div class="container-sm">
            <div class="row row-cols-4">
                <c:forEach items="${products}" var = "product">
                    <div class="col my-3">
                        <div class="card" style="border: none">
                            <img src="//hangertips.com/cdn/shop/products/cuymarron_1.jpg?v=1670366071&amp;width=533" alt="Medias Cuy"
                                 class="motion-reduce hover-zoom" loading="lazy">
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
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </body>
</html>
