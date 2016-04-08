package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.DBOperations;

/**
 * Servlet implementation class Register
 */
@WebServlet("/Register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Register() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String username=request.getParameter("username");
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		String cpassword=request.getParameter("cpassword");
		if(username.equals("")||email.equals("")||password.equals("")||cpassword.equals(""))
		{
			String message="Required Fields Empty";
			request.setAttribute("msg2", message);
			getServletContext().getRequestDispatcher("/profile.jsp").include(request, response);
		}
		if(!cpassword.equals(password))
		{
			String message="Passwords don't match";
			request.setAttribute("msg1", message);
			getServletContext().getRequestDispatcher("/login.jsp").include(request, response);
		}
		else
		{
			if(DBOperations.addUser(username,email,password))
			{
				HttpSession session=request.getSession();
				session.setAttribute("username", username);
				getServletContext().getRequestDispatcher("/dashboard.jsp").forward(request, response);
			}
			else
			{
				String message="Couldn't Create Account due to some error. Kindly Retry.";
				request.setAttribute("msg1", message);
				getServletContext().getRequestDispatcher("/login.jsp").include(request, response);
			}
		}
	}

}
