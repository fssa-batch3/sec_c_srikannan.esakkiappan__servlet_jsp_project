package com.fssa.parkin.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import com.fssa.parkinplace.exception.DAOException;
import com.fssa.parkinplace.model.User;
import com.fssa.parkinplace.service.UserService;

/**
 * Servlet implementation class GetLeaserByEmail
 */
@WebServlet("/GetLeaserByEmail")
public class GetLeaserByEmail extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public GetLeaserByEmail() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
System.out.println("called");
		String leaserIdString = request.getParameter("leaserid");
		System.out.println(leaserIdString+"jsdgf");
		int leaserId = Integer.parseInt(leaserIdString);
		System.out.println(leaserId+"datas");
		PrintWriter out = response.getWriter();
		UserService userService = new UserService();
		User user = new User();
		try {
			user = UserService.getUserById(leaserId);
			JSONObject userObj = new JSONObject(user);
			out.print(userObj.toString());
			System.out.println(userObj.toString());
		} catch (DAOException e) {
			e.printStackTrace();
			out.println(e.getMessage());
		}
			
	}
		
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
