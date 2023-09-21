package com.fssa.parkin.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fssa.parkinplace.exception.DAOException;
import com.fssa.parkinplace.model.User;
import com.fssa.parkinplace.service.UserService;

/**
 * Servlet implementation class TenantRegister
 */
@WebServlet("/TenantRegister")
public class TenantRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TenantRegister() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // Retrieve user input from the form
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");
        String address = request.getParameter("address");
        String bikePhotoUrl = request.getParameter("photoUrl");

        // Create a User object with the retrieved data
        User user = new User(name, address, email, phone, password, bikePhotoUrl);

        RequestDispatcher rd = request.getRequestDispatcher("error.jsp");
        
        try {
            // Call the UserService to add the user to the system
            UserService.addTenant(user);
            
            request.setAttribute("success","Tenant Added Successfully!");
			
         // Redirect to the index.jsp page on successful registration
            rd = request.getRequestDispatcher("Tenant-log.jsp");  
           
        } catch (DAOException e) {
        	
        	System.out.println(e.getMessage());
        	
        	request.setAttribute("error", e.getMessage());
        	
        	rd = request.getRequestDispatcher("/Tenant-signup.jsp");
        }
        finally {
        	rd.forward(request, response);
        }
    }
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	doPost(req, resp);
    }
}

