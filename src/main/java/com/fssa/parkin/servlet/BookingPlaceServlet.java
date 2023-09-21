package com.fssa.parkin.servlet;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Locale;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.fssa.parkinplace.model.BookingPlace;
import com.fssa.parkinplace.exception.DAOException;
import com.fssa.parkinplace.model.User;
import com.fssa.parkinplace.service.BookingPlaceService;

/**
 * Servlet implementation class BookingPlace
 */
@WebServlet("/BookingPlaceServlet")
public class BookingPlaceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public BookingPlaceServlet() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession(false);
		User currenttenant = (User) session.getAttribute("currenttenant");

		String leaserEmail = (String) request.getParameter("leaseremail");
		String tenantEmail = currenttenant.getEmail();
		System.out.println(leaserEmail);
		System.out.println(tenantEmail);

		// TODO: tenant-chooseduration.jsp la string ah varum athu respective data type
		// ah parse pannu
		String startDateTimeString = request.getParameter("startDate");
		String endDateTimeString = request.getParameter("endDate");

		// Define a DateTimeFormatter for the input format
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd hh:mm a", Locale.ENGLISH);


		// Parse the date-time strings into LocalDateTime objects
		LocalDateTime startingPeriod = LocalDateTime.parse(startDateTimeString, formatter);
		LocalDateTime endingPeriod = LocalDateTime.parse(endDateTimeString, formatter);

		// Set other fields (amount and status) based on your logic
		double amount = Double.parseDouble(request.getParameter("parkingcharge"));
		String status = "Waiting List"; // Replace with your desired status

		BookingPlace bookingplace = new BookingPlace(leaserEmail, tenantEmail, startingPeriod, endingPeriod, amount, status);
		

		try {
			
			BookingPlaceService.createBookingPlace(bookingplace);
			
			request.setAttribute("success","User Added Successfully!");
			
		} catch (DAOException e) {
			System.out.println(e.getMessage());
			
			request.setAttribute("error", e.getMessage());
		}

	}
	
	 @Override
	    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    	doPost(req, resp);
	    }

}
