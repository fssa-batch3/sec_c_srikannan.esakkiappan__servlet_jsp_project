package com.fssa.parkin.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.ValidationException;

import org.mindrot.jbcrypt.BCrypt;

import com.fssa.logger.Logger;
import com.fssa.parkinplace.dao.UserDao;
import com.fssa.parkinplace.exception.DAOException;
import com.fssa.parkinplace.exception.UserException;
import com.fssa.parkinplace.model.User;
import com.fssa.parkinplace.service.UserService;
import com.fssa.parkinplace.validation.UserValidator;
import com.fssa.util.EncryptPassword.Password;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String email = request.getParameter("email");
		String pass = request.getParameter("password");

		System.out.println(pass);

		Logger.info("email :" + email + "///" + " Password :" + pass);

		User user;
		UserService userService = new UserService(new UserDao(), new UserValidator());
		RequestDispatcher rd = request.getRequestDispatcher("error.jsp");
		try {
			user = userService.login(email);
			System.out.println(user);

			if (user != null) {
				String pwd = user.getPassword();
				System.out.println(pwd);
				System.out.println(BCrypt.checkpw(pass, pwd));
				
				if (!BCrypt.checkpw(pass, pwd)) {
					request.setAttribute("error", "Incorrect password");
					rd = request.getRequestDispatcher("/leaser-log.jsp");
					Logger.info("Incorrect password");
				} else {
					HttpSession session = request.getSession();
					session.setAttribute("currentuser", user);
					Logger.info(user.toString());
					request.setAttribute("success", "Logged in successfully");
					rd = request.getRequestDispatcher("/leaser-profile.jsp");
					Logger.info("logged in successfully");
				}
			} else {
				request.setAttribute("error", "User doesn't exist");
				rd = request.getRequestDispatcher("/leaser-log.jsp");
				Logger.info("User doesn't exist");
			}

		} catch (DAOException | UserException e) {
			request.setAttribute("error", e.getMessage());
			rd = request.getRequestDispatcher("leaser-log.jsp");
			Logger.info(e.getMessage());
			e.printStackTrace();
		}

		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

}
