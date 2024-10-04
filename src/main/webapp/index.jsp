<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.alexanderdoma.peruinolvidable.model.entity.Orderline"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.alexanderdoma.peruinolvidable.model.mysql.CategoryDAO"%>
<%@page import="java.util.List"%>
<%@page import="com.alexanderdoma.peruinolvidable.model.mysql.ProductDAO"%>
<%@page import="com.alexanderdoma.peruinolvidable.model.entity.Product"%>
<%@page import="com.alexanderdoma.peruinolvidable.model.entity.Category"%>
<%@page import="com.sun.tools.javac.resources.compiler"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Perú Inolvidable | Tienda online</title>
        <%@include file="components/links.jsp" %>
        <%List<Orderline> orderlines = new ArrayList<>();%>
        <%if(session.getAttribute("orderlines") == null ){ session.setAttribute("orderlines", orderlines);} %>
    </head>
    <body>
        <%@include file="components/header.jsp" %>
        <div>
            <img
                src="//hangertips.com/cdn/shop/files/banner-polomujer_1940bac1-9525-437c-9cf7-77b0e5034eba.jpg?v=1670454876&amp;width=1500"
                class="image-banner"
                srcset="//hangertips.com/cdn/shop/files/banner-polomujer_1940bac1-9525-437c-9cf7-77b0e5034eba.jpg?v=1670454876&amp;width=375 375w, //hangertips.com/cdn/shop/files/banner-polomujer_1940bac1-9525-437c-9cf7-77b0e5034eba.jpg?v=1670454876&amp;width=550 550w, //hangertips.com/cdn/shop/files/banner-polomujer_1940bac1-9525-437c-9cf7-77b0e5034eba.jpg?v=1670454876&amp;width=750 750w, //hangertips.com/cdn/shop/files/banner-polomujer_1940bac1-9525-437c-9cf7-77b0e5034eba.jpg?v=1670454876&amp;width=1100 1100w, //hangertips.com/cdn/shop/files/banner-polomujer_1940bac1-9525-437c-9cf7-77b0e5034eba.jpg?v=1670454876&amp;width=1500 1500w"
                width="1920" height="800.0" loading="lazy" sizes="100vw">
        </div>
        <div class="container-sm">
            <h2 class="mt-3 font-monospace text-secondary mt-4 text-center">Los más vendidos</h2>
            <div class="row my-3 row-cols-4">
                <% request.setAttribute("products", new ProductDAO().getAll()); %>
                <c:forEach items="${products}" var="product">
                    <a class="card col text-decoration-none hover-zoom" style="border: none" href="product?id=${product.getId()}">
                        <img src="//hangertips.com/cdn/shop/products/cuymarron_1.jpg?v=1670366071&amp" style="width: 250px" alt="Medias Cuy"
                             class="motion-reduce hover-zoom" loading="lazy">
                        <div class="card-body p-0">
                            <p class="card-title" style="font-size: 15px">${product.getName()}</p>
                            <p class="card-text">${product.getPrice()}</p>
                        </div>
                    </a>
                </c:forEach>  
            </div>
        </div>
        <div class="container-sm mt-4">
            <div class="collage">
                <div class="collage__item--left">
                    <div class="d-flex flex-column">
                        <img class="img-fluid hover-zoom"
                             srcset="//hangertips.com/cdn/shop/collections/portada_0002_mockup_taza_ari.jpg?v=1696862743&amp;width=165 165w,//hangertips.com/cdn/shop/collections/portada_0002_mockup_taza_ari.jpg?v=1696862743&amp;width=330 330w,//hangertips.com/cdn/shop/collections/portada_0002_mockup_taza_ari.jpg?v=1696862743&amp;width=535 535w,//hangertips.com/cdn/shop/collections/portada_0002_mockup_taza_ari.jpg?v=1696862743&amp;width=750 750w,//hangertips.com/cdn/shop/collections/portada_0002_mockup_taza_ari.jpg?v=1696862743&amp;width=1000 1000w,//hangertips.com/cdn/shop/collections/portada_0002_mockup_taza_ari.jpg?v=1696862743 1081w"
                             src="//hangertips.com/cdn/shop/collections/portada_0002_mockup_taza_ari.jpg?v=1696862743&amp;width=1500"
                             alt="" height="1921" loading="lazy" class="motion-reduce">
                    </div>
                </div>
                <div class="collage__item--right-top">
                    <div class="d-flex flex-column h-100">
                        <img class="img-fluid h-100 hover-zoom"
                             srcset="//hangertips.com/cdn/shop/collections/portada_0005_Mockup_cartera_llamacorn.jpg?v=1671721772&amp;width=165 165w,//hangertips.com/cdn/shop/collections/portada_0005_Mockup_cartera_llamacorn.jpg?v=1671721772&amp;width=330 330w,//hangertips.com/cdn/shop/collections/portada_0005_Mockup_cartera_llamacorn.jpg?v=1671721772&amp;width=535 535w,//hangertips.com/cdn/shop/collections/portada_0005_Mockup_cartera_llamacorn.jpg?v=1671721772&amp;width=750 750w,//hangertips.com/cdn/shop/collections/portada_0005_Mockup_cartera_llamacorn.jpg?v=1671721772 800w"
                             src="//hangertips.com/cdn/shop/collections/portada_0005_Mockup_cartera_llamacorn.jpg?v=1671721772&amp;width=1500"
                             sizes="
                             (min-width: 1200px) 550px,
                             (min-width: 750px) calc((100vw - 10rem) / 2),
                             calc(100vw - 3rem)" alt="" height="600" width="800" loading="lazy" class="motion-reduce">
                    </div>
                </div>
                <div class="collage__item--right-bottom">
                    <div class="d-flex flex-column h-100">
                        <img class="img-fluid h-100 hover-zoom"
                             srcset="//hangertips.com/cdn/shop/collections/portada_0005_Mockup_cartera_llamacorn.jpg?v=1671721772&amp;width=165 165w,//hangertips.com/cdn/shop/collections/portada_0005_Mockup_cartera_llamacorn.jpg?v=1671721772&amp;width=330 330w,//hangertips.com/cdn/shop/collections/portada_0005_Mockup_cartera_llamacorn.jpg?v=1671721772&amp;width=535 535w,//hangertips.com/cdn/shop/collections/portada_0005_Mockup_cartera_llamacorn.jpg?v=1671721772&amp;width=750 750w,//hangertips.com/cdn/shop/collections/portada_0005_Mockup_cartera_llamacorn.jpg?v=1671721772 800w"
                             src="//hangertips.com/cdn/shop/collections/portada_0005_Mockup_cartera_llamacorn.jpg?v=1671721772&amp;width=1500"
                             sizes="
                             (min-width: 1200px) 550px,
                             (min-width: 750px) calc((100vw - 10rem) / 2),
                             calc(100vw - 3rem)" alt="" height="600" width="800" loading="lazy" class="motion-reduce">
                    </div>
                </div>
            </div>
        </div>
        <div class="container-sm mt-4 mb-4">
            <h2 class="mt-3 font-monospace text-secondary mt-4 text-center">Categorias</h2>
            <div class="row row-cols-3">
                <% request.setAttribute("categories", new CategoryDAO().getAll()); %>
                <c:forEach items="${categories}" var="category">
                    <div class="col d-flex flex-column">
                        <a href="#">
                        <img
                            srcset="//hangertips.com/cdn/shop/collections/portada_0009_banners4.0.jpg?v=1671720984&amp;width=165 165w,//hangertips.com/cdn/shop/collections/portada_0009_banners4.0.jpg?v=1671720984&amp;width=330 330w,//hangertips.com/cdn/shop/collections/portada_0009_banners4.0.jpg?v=1671720984&amp;width=535 535w,//hangertips.com/cdn/shop/collections/portada_0009_banners4.0.jpg?v=1671720984&amp;width=750 750w,//hangertips.com/cdn/shop/collections/portada_0009_banners4.0.jpg?v=1671720984 800w"
                            src="//hangertips.com/cdn/shop/collections/portada_0009_banners4.0.jpg?v=1671720984&amp;width=1500"
                            sizes="
                            (min-width: 1200px) 366px,
                            (min-width: 750px) calc((100vw - 10rem) / 2),
                            calc(100vw - 3rem)" alt="" height="600" width="800" loading="lazy"
                            class="motion-reduce img-fluid hover-zoom">
                        </a>
                        <h4 class="text-secondary mt-3">${category.getName()}<i class="bi bi-arrow-right"></i></h4>
                    </div>
                </c:forEach>
            </div>
        </div>
        <%@include file="components/footer.jsp"%>
    </body>
</html>
