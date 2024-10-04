package com.alexanderdoma.peruinolvidable.controller;

import com.alexanderdoma.peruinolvidable.model.DAOException;
import com.alexanderdoma.peruinolvidable.model.mysql.UserDAO;
import com.alexanderdoma.peruinolvidable.model.entity.User;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "UserController", urlPatterns = {"/profile", "/login", "/session", "/logout", "/update", "/insert", "/delete"})
public class UserController extends HttpServlet{
    
    private final UserDAO objUserDAO = new UserDAO();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String action = request.getServletPath();
        switch (action) {
            case "/login":
                request.getRequestDispatcher("login.jsp").forward(request, response);
                break;
                
            case "/profile":
                request.getRequestDispatcher("profile.jsp").forward(request, response);
                break;
                
            case "/logout":
                session.removeAttribute("user_id");
                response.sendRedirect(request.getContextPath());
                break;

            case "/delete":
                delete(request, session);
                response.sendRedirect(request.getContextPath());
                session.removeAttribute("user_id");
                break;
                
            default:
                response.sendRedirect(request.getContextPath() + "/error");
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User objUser;
        String action = request.getServletPath();
        switch (action) {
            case "/session":
                objUser = login(request);
                if(objUser == null) { request.setAttribute("status", "invalidCredentials"); request.getRequestDispatcher("login.jsp").forward(request, response); return;}
                session.setAttribute("user_id", objUser.getId());
                response.sendRedirect(request.getContextPath());
                break;
                
            case "/insert":
                insert(request);
                response.sendRedirect(request.getContextPath() + "/login");
                break;
                
            case "/update":
                update(request, session);
                request.getRequestDispatcher("profile.jsp").forward(request, response);
                break;
                
            default:
                request.getRequestDispatcher("error.jsp").forward(request, response);
                break;
        }
    }
    
    User login(HttpServletRequest request) {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        try {
            return objUserDAO.login(username, password);
        } catch (DAOException ex) {
            Logger.getLogger(UserController.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    void insert(HttpServletRequest request){
        User objUser = new User();
        objUser.setName(request.getParameter("name"));
        objUser.setLastname(request.getParameter("lastname"));
        objUser.setUsername(request.getParameter("username"));
        objUser.setPassword(request.getParameter("password"));
        objUser.setEmail(request.getParameter("email"));
        try {
            objUserDAO.add(objUser);
        } catch (DAOException ex) {
            Logger.getLogger(UserController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    void delete(HttpServletRequest request, HttpSession session){
        try {
            objUserDAO.delete((int) session.getAttribute("user_id"));
        } catch (DAOException ex) {
            Logger.getLogger(UserController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    void update(HttpServletRequest request, HttpSession session){
        try {
            User objUser = new User();
            objUser.setId((int) session.getAttribute("user_id"));
            objUser.setName(request.getParameter("name"));
            objUser.setLastname(request.getParameter("lastname"));
            objUser.setUsername(request.getParameter("username"));
            objUser.setPassword(request.getParameter("password"));
            objUser.setEmail(request.getParameter("email"));
            objUserDAO.update(objUser);
        } catch (DAOException ex) {
            Logger.getLogger(UserController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
