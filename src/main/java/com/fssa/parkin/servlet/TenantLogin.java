package com.fssa.parkin.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fssa.logger.Logger;
import com.fssa.parkinplace.dao.UserDao;
import com.fssa.parkinplace.exception.DAOException;
import com.fssa.parkinplace.exception.UserException;
import com.fssa.parkinplace.model.User;
import com.fssa.parkinplace.service.UserService;
import com.fssa.parkinplace.validation.UserValidator;

/**
 * Servlet implementation class TenantLogin
 */
@WebServlet("/TenantLogin")
public class TenantLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TenantLogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String email = request.getParameter("email");
		String password = request.getParameter("password");

		Logger.info("email :" + email + "///" + " Password :" + password);
		User user;
		UserService userService = new UserService(new UserDao(), new UserValidator());
		RequestDispatcher rd;
		try {
			user = userService.Tenantlogin(email, password);

			if (user != null) {
				HttpSession session = request.getSession();

				session.setAttribute("currenttenant", user);

				Logger.info(user.toString());
				request.setAttribute("successMsg", "Logged in successfully");
				rd = request.getRequestDispatcher("tenant-profile.jsp");

				Logger.info("logged in successfully");

			} else {
				request.setAttribute("errorMsg","Incorrect username or password");
				rd = request.getRequestDispatcher("Tenant-log.jsp");

				Logger.info("Tenant doesn't exist");
				

			}
		} catch (DAOException | UserException e) {

			request.setAttribute("errorMsg",((Throwable) e).getMessage());
			rd = request.getRequestDispatcher("Tenant-log.jsp");

			Logger.info(((Throwable) e).getMessage());
			((Throwable) e).printStackTrace();

		}

		rd.forward(request, response);
	}
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
