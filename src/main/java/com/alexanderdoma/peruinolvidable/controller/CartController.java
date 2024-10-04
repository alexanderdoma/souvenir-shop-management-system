package com.alexanderdoma.peruinolvidable.controller;

import com.alexanderdoma.peruinolvidable.model.DAOException;
import com.alexanderdoma.peruinolvidable.model.entity.Orderline;
import com.alexanderdoma.peruinolvidable.model.mysql.ProductDAO;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "CartController", urlPatterns = {"/cart","/cart/add","/cart/remove"})
public class CartController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }
    
    ProductDAO objProductDAO = new ProductDAO();

   @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getServletPath();
        HttpSession session = request.getSession();
        switch (action) {
            case "/cart":
                request.getRequestDispatcher("cart.jsp").forward(request, response);
                break;
            case "/cart/remove":
                List<Orderline> orderlines = (List<Orderline>) session.getAttribute("orderlines");
                int id = Integer.parseInt(request.getParameter("orderline_id"));
                Iterator<Orderline> iterator =  orderlines.iterator();
                while (iterator.hasNext()){
                    Orderline orderline = iterator.next();
                    if(orderline.getProduct().getId() == id){
                        iterator.remove();
                    }
                }
                List<Orderline> newOrderlines = new ArrayList<>(orderlines);
                session.setAttribute("orderlines", newOrderlines);
                request.getRequestDispatcher("/cart").forward(request, response);
                break;
            default:
                throw new AssertionError();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getServletPath();
        HttpSession session = request.getSession();
        switch (action) {
            case "/cart/add":
                addProductToCart(request, session);
                response.sendRedirect(request.getContextPath() + "/cart");
                break;
                
            default:
                throw new AssertionError();
        }
    }

    void addProductToCart(HttpServletRequest request, HttpSession session){
        List<Orderline> orderlines = (List<Orderline>) session.getAttribute("orderlines");
        Orderline orderline = new Orderline();
        orderline.setQuantity(Integer.parseInt(request.getParameter("quantity")));
        int product_id = Integer.valueOf(request.getParameter("product_id"));
        try {
            orderline.setProduct(objProductDAO.getById(product_id));
        } catch (DAOException ex) {
            Logger.getLogger(CartController.class.getName()).log(Level.SEVERE, null, ex);
        }
        orderlines.add(orderline);
        session.setAttribute("orderlines", orderlines);
    }
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
