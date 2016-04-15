package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Query;
import model.DBOperations;
/**
 * Servlet implementation class Contact
 */
@WebServlet("/Contact")
public class Contact extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Contact() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String name=request.getParameter("name");
		String email=request.getParameter("email");
		String message=request.getParameter("message");
		if(name.equals("")||email.equals("")||message.equals("")) {
			String mes="Required Fields Can not be Empty";
			request.setAttribute("msg", mes);
			getServletContext().getRequestDispatcher("/index.jsp").include(request,response);
		}
		Query q=new Query();
		q.setName(name);
		q.setEmail(email);
		q.setMessage(message);
		if(DBOperations.addQuery(q)) {
			getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
		}
		else {
			String mes="Could not create query try again.";
			request.setAttribute("msg", mes);
			getServletContext().getRequestDispatcher("/index.jsp").include(request, response);
		}
	}

}
