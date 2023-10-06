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
 * Servlet implementation class UpdateUserProfile
 */
@WebServlet("/UpdateUserProfile")
public class UpdateUserProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateUserProfile() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		User user = new User();
		user.setFirstName(request.getParameter("name"));
		user.setEmail(request.getParameter("hiddenEmail"));
		user.setpPhoneNum(request.getParameter("phone"));
		user.setAddress(request.getParameter("address"));
		user.setMapurl(request.getParameter("location"));
		user.setPassword(request.getParameter("password"));
		user.setPlacephotourl(request.getParameter("image"));
		String leaserIdString = request.getParameter("leaserid");
		int leaserId = Integer.parseInt(leaserIdString);
		user.setId(leaserId);
		
		
		UserService userService=new UserService(new UserDao(),new UserValidator());
		try {
			userService.updateUser(user);
			Logger.info("User details is updated sucessfully");
			System.out.println(user.getUserId());
			User user1 = userService.getUserById(user.getUserId());
			System.out.println(user1);
			
			HttpSession session = request.getSession();
			request.setAttribute("successMsg", "Profile upddated successfully");
			session.setAttribute("currentuser", user1);
			
		} catch (DAOException e) {
			Logger.info("User details is updation failed");

			request.setAttribute("errorMsg", e.getMessage());
			e.printStackTrace();
		}
		
		RequestDispatcher rd = request.getRequestDispatcher("leaser-profile.jsp");
		rd.forward(request, response);
	}
	

}
