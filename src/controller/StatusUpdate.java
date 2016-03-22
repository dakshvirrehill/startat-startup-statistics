package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.DBOperations;

/**
 * Servlet implementation class StatusUpdate
 */
@WebServlet("/StatusUpdate")
public class StatusUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StatusUpdate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String status=request.getParameter("status");
		String username=request.getParameter("username");
		if(DBOperations.addUserStatus(username, status))
		{
			String message="Status updated";
			request.setAttribute("msg3", message);
			getServletContext().getRequestDispatcher("/profile.jsp").forward(request,response);
		}
		else
		{
			String message="Couldn't save data due to some error. Kindly retry.";
			request.setAttribute("msg2", message);
			getServletContext().getRequestDispatcher("/profile.jsp").include(request, response);
		}
	}

}
