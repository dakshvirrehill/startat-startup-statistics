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
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String username=request.getParameter("lusername");
		String password=request.getParameter("ppassword");
		if(username.equals("")||password.equals(""))
		{
			String message="Required Fields Empty";
			request.setAttribute("msg2", message);
			getServletContext().getRequestDispatcher("/login.jsp").include(request, response);
		}
		else
		{
			if(DBOperations.checkUser(username,password))
			{
				HttpSession session=request.getSession();
				session.setAttribute("username", username);
				getServletContext().getRequestDispatcher("/dashboard.jsp").forward(request, response);
			}
			else
			{
				String message="Couldn't login due to some error. Kindly retry.";
				request.setAttribute("msg2", message);
				getServletContext().getRequestDispatcher("/login.jsp").include(request, response);
			}
		}
	}

}
