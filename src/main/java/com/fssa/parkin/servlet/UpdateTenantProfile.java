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
 * Servlet implementation class UpdateTenantProfile
 */
@WebServlet("/UpdateTenantProfile")
public class UpdateTenantProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateTenantProfile() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		User user = new User();
		user.setFirstName(request.getParameter("name"));
		user.setEmail(request.getParameter("hiddenEmail"));
		user.setpPhoneNum(request.getParameter("phone"));
		user.setAddress(request.getParameter("address"));
		user.setPassword(request.getParameter("password"));
		user.setBikephotourl(request.getParameter("image"));
		
		
		UserService userService=new UserService(new UserDao(),new UserValidator());
		try {
			userService.updateTenant(user);
			
			User user1 = userService.getTenantByEmail(user.getEmail());
			
			HttpSession session = request.getSession();
			request.setAttribute("successMsg", "Profile updated successfully");
			session.setAttribute("currenttenant", user1);
			Logger.info("User details is updated sucessfully");
			
		} catch (DAOException | UserException e) {
			Logger.info("User details is updation failed");

			request.setAttribute("errorMsg", e.getMessage());
			e.printStackTrace();
		}
		
		RequestDispatcher rd = request.getRequestDispatcher("tenant-profile.jsp");
		rd.forward(request, response);
	}
	

}