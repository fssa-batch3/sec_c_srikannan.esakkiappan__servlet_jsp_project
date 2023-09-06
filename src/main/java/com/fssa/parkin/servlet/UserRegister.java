package com.fssa.parkin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fssa.parkinplace.exception.DAOException;
import com.fssa.parkinplace.model.User;
import com.fssa.parkinplace.service.UserService;

/**
 * Servlet implementation class UserRegister
 */
@WebServlet("/UserRegister")
public class UserRegister extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * Default constructor.
     */
    public UserRegister() {
        super();
    }

    /**
     * Handles the HTTP POST request for user registration.
     *
     * @param request  The HTTP request object.
     * @param response The HTTP response object.
     * @throws ServletException If there is a servlet-related problem.
     * @throws IOException      If there is an I/O problem.
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // Retrieve user input from the form
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");
        String address = request.getParameter("address");
        String mapUrl = request.getParameter("mapUrl");
        String photoUrl = request.getParameter("photoUrl");

        // Create a User object with the retrieved data
        User user = new User(name, address, email, phone, password, mapUrl, photoUrl);

        try {
            // Call the UserService to add the user to the system
            UserService.addUser(user);

            // Redirect to the index.jsp page on successful registration
            response.sendRedirect("index.jsp");
        } catch (DAOException e) {
            // If an exception occurs, display the error message
            response.getWriter().append(e.getMessage());
        }
    }
}
