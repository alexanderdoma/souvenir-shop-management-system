package com.alexanderdoma.peruinolvidable.controller;

import com.alexanderdoma.peruinolvidable.model.DAOException;
import com.alexanderdoma.peruinolvidable.model.entity.Product;
import com.alexanderdoma.peruinolvidable.model.mysql.ProductDAO;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ProductController", urlPatterns = {"/products", "/product"})
public class ProductController extends HttpServlet {
    private final ProductDAO objProductDAO = new ProductDAO();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getServletPath();
        switch (action) {
            case "/products":
                getProducts(request);
                request.getRequestDispatcher("products.jsp").forward(request, response);
                break;
                
            case "/product":
                getProduct(request);
                request.getRequestDispatcher("product.jsp").forward(request, response);
                break;
                
            default:
                throw new AssertionError();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
    
    void getProduct(HttpServletRequest request){
        int id = Integer.parseInt(request.getParameter("id"));
        try {
            request.setAttribute("product", objProductDAO.getById(id));
        } catch (DAOException ex) {
            Logger.getLogger(ProductController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    void getProducts(HttpServletRequest request){
        try {
            request.setAttribute("products", objProductDAO.getAll());
        } catch (DAOException ex) {
            Logger.getLogger(ProductController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
