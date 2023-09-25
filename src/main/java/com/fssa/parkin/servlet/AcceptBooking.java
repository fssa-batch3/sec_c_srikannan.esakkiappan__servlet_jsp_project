package com.fssa.parkin.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fssa.parkinplace.exception.BookingException;
import com.fssa.parkinplace.exception.DAOException;
import com.fssa.parkinplace.service.BookingPlaceService;

/**
 * Servlet implementation class AcceptBooking
 */
@WebServlet("/AcceptBooking")
public class AcceptBooking extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AcceptBooking() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    
    /**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String status = request.getParameter("status");
		System.out.println(status);
		
		String leaserIdString = request.getParameter("leaserId");
		int leaserId = Integer.parseInt(leaserIdString);
		String updatedStatus = "Accepted";
		System.out.println(leaserId);
		
		try {
			BookingPlaceService.updateStatusById(leaserId, status, updatedStatus);
			
			response.sendRedirect("leaser-accept.jsp");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}
	
	

}
