package com.fssa.parkin.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fssa.parkinplace.exception.DAOException;
import com.fssa.parkinplace.exception.UserException;
import com.fssa.parkinplace.model.User;
import com.fssa.parkinplace.service.UserService;
import com.google.protobuf.ServiceException;

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
     * 
     */	
   
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    	PrintWriter out = response.getWriter();
    	
        // Retrieve user input from the form
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");
        String address = request.getParameter("address");
        String mapUrl = request.getParameter("mapUrl");
        String photoUrl = request.getParameter("photoUrl");
        double latitude = Double.parseDouble(request.getParameter("latitude"));
        double longitude = Double.parseDouble(request.getParameter("longitude"));
        
        
        // Create a User object with the retrieved data
        User user = new User(name, address, email, phone, password, mapUrl, photoUrl, latitude, longitude);
        

        RequestDispatcher rd = request.getRequestDispatcher("error.jsp");
        
            // Call the UserService to add the user to the system
            try {
				UserService.addUser(user);
				
				request.setAttribute("success", "Signed Up Successfully!");
				
				rd = request.getRequestDispatcher("/leaser-log.jsp");
				 
			} catch (DAOException | UserException e) {
				
				request.setAttribute("error", e.getMessage());
			
				 rd = request.getRequestDispatcher("/signup.jsp");
				 
				e.printStackTrace();
			} catch (ServiceException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				
				rd.forward(request, response);
			}	
        
    }
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	doPost(req, resp);
    }
}
