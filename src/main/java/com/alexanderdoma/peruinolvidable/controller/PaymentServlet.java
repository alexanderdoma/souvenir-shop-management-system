package com.alexanderdoma.peruinolvidable.controller;

import com.alexanderdoma.peruinolvidable.model.DAOException;
import com.alexanderdoma.peruinolvidable.model.entity.Order;
import com.alexanderdoma.peruinolvidable.model.entity.Orderline;
import com.alexanderdoma.peruinolvidable.model.entity.User;
import com.alexanderdoma.peruinolvidable.model.mysql.OrderDAO;
import com.alexanderdoma.peruinolvidable.model.mysql.UserDAO;
import com.alexanderdoma.peruinolvidable.services.PaymentService;
import com.paypal.api.payments.PayerInfo;
import com.paypal.api.payments.Payment;
import com.paypal.api.payments.Transaction;
import com.paypal.base.rest.PayPalRESTException;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.SQLData;
import java.time.Instant;
import java.time.LocalDate;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "PaymentServlet", urlPatterns = {"/checkout", "/authorize_payment", "/execute_payment"})
public class PaymentServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getServletPath();
        switch (action) {
            case "/checkout":
                request.getRequestDispatcher("checkout.jsp").forward(request, response);
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
        switch (action){
            case "/authorize_payment":
                try {
                    List<Orderline> orderlines = (List<Orderline>) session.getAttribute("orderlines");
                    int user_id = (int) session.getAttribute("user_id");
                    User objUser = new UserDAO().getById(user_id);
                    PaymentService paymentServices = new PaymentService();
                    String approvalLink = paymentServices.authorizatePayment(orderlines, objUser);
                    response.sendRedirect(approvalLink);
                } catch (PayPalRESTException ex) {
                    request.setAttribute("errorMessage", ex.getMessage());
                    ex.printStackTrace();
                    request.getRequestDispatcher("error.jsp").forward(request, response);
                } catch (DAOException ex) {
                Logger.getLogger(PaymentServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
                break;
                
            case "/execute_payment":
                String paymentId = request.getParameter("paymentId");
                String payerId = request.getParameter("PayerID");
                try {
                    PaymentService paymentServices = new PaymentService();
                    Payment payment = paymentServices.executePayment(paymentId, payerId);
                    OrderDAO objOrderDAO = new OrderDAO();
                    List<Orderline> orderlines = (List<Orderline>) session.getAttribute("orderlines");
                    int user_id = (int) session.getAttribute("user_id");
                    Order objOrder = new Order();
                    objOrder.setUser(new UserDAO().getById(user_id));
                    objOrder.setSubtotal((double) session.getAttribute("total"));
                    objOrder.setTotal((double) session.getAttribute("total"));
                    objOrder.setDate(Date.valueOf(LocalDate.now()));
                    objOrder.setStatus("COMPLETED");
                    objOrder.setPayment_id(paymentId);
                    objOrderDAO.add(objOrder, orderlines);
                    
                    PayerInfo payerInfo = payment.getPayer().getPayerInfo();
                    Transaction transaction = payment.getTransactions().get(0);

                    request.setAttribute("payer", payerInfo);
                    request.setAttribute("transaction", transaction);

                    request.getRequestDispatcher("receipt.jsp").forward(request, response);

                } catch (PayPalRESTException ex) {
                    request.setAttribute("errorMessage", ex.getMessage());
                    ex.printStackTrace();
                    request.getRequestDispatcher("error.jsp").forward(request, response);
                } catch (DAOException ex) {
                Logger.getLogger(PaymentServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
                break;

            default:
                throw new AssertionError();
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
