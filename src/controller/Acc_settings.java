package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.DBOperations;

/**
 * Servlet implementation class Acc_settings
 */
@WebServlet("/Acc_settings")
public class Acc_settings extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Acc_settings() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		String cpassword=request.getParameter("cpassword");
		String email=request.getParameter("email");
		if(password.equals(cpassword))
		{	
			if(DBOperations.updateUserSettings(username, password, email)) {
				String message="Settings saved successfully";
				request.setAttribute("msg2", message);
				getServletContext().getRequestDispatcher("/settings.jsp").forward(request, response);
			}
			else
			{
				String message="Settings could not be saved due to an error. Kindly retry";
				request.setAttribute("msg", message);
				getServletContext().getRequestDispatcher("/settings.jsp").include(request,response);
			}
		}
		else
		{
			String message="Passwords don't match";
			request.setAttribute("msg", message);
			getServletContext().getRequestDispatcher("/settings.jsp").include(request, response);
		}
	}

}
