package com.fssa.parkin.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;

import com.fssa.parkinplace.dao.UserDao;
import com.fssa.parkinplace.exception.DAOException;
import com.fssa.parkinplace.model.BookingPlace;
import com.fssa.parkinplace.model.User;
import com.fssa.parkinplace.service.BookingPlaceService;
import com.fssa.parkinplace.service.UserService;
import com.fssa.parkinplace.validation.UserValidator;
import com.google.gson.Gson;

/**
 * Servlet implementation class LeaserNotification
 */
@WebServlet("/LeaserNotification")
public class LeaserNotification extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LeaserNotification() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		HttpSession session = request.getSession(false);
		User currentuser = (User) session.getAttribute("currentuser");
		
		int leaserId = currentuser.getUserId();
		System.out.println(leaserId);
		
		String status = "Waiting List";
		
		new BookingPlace();
		
		new UserService(new UserDao(), new UserValidator());
		try {
			List<BookingPlace> requestDetails = BookingPlaceService.findByLeaserIdAndStatus(leaserId, status);
			System.out.println(requestDetails);
			JSONArray requestDetailsJson = new JSONArray(requestDetails);
			PrintWriter out = response.getWriter();
			out.println(requestDetailsJson.toString());


//			response.sendRedirect("leaser-notification.jsp");
			
		}catch (DAOException | SQLException e) {
			
			e.printStackTrace();
		}	
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
