package com.fssa.parkin.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

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
 * Servlet implementation class ListPlace
 */
@WebServlet("/ListPlace")
public class ListPlace extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * Default constructor.
     */
    public ListPlace() {
        super();
    }

    /**
     * Handles HTTP GET requests.
     *
     * @param request  The HttpServletRequest object.
     * @param response The HttpServletResponse object.
     * @throws ServletException If a servlet-specific error occurs.
     * @throws IOException      If an I/O error occurs.
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        UserService placeservice = new UserService();

        try {
            // Retrieve a list of parking places from the UserService.
            List<User> parkingPlaceList = UserService.readUser();
            System.out.println(parkingPlaceList);

            // Set the parkingPlaceList as an attribute in the request.
            request.setAttribute("parkingPlaceList", parkingPlaceList);
            System.out.println(request.getAttribute("parkingPlaceList"));

            // Forward the request to the viewplace.jsp page.
            RequestDispatcher dis = request.getRequestDispatcher("viewplace.jsp");
            dis.forward(request, response);

        } catch (DAOException | SQLException e) {
            // Handle exceptions by printing the stack trace.
            e.printStackTrace();
        }
    }

    /**
     * Handles HTTP POST requests.
     *
     * @param request  The HttpServletRequest object.
     * @param response The HttpServletResponse object.
     * @throws ServletException If a servlet-specific error occurs.
     * @throws IOException      If an I/O error occurs.
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Delegate to the doGet method for handling POST requests.
        doGet(request, response);
    }

}
