package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.DBOperations;

/**
 * Servlet implementation class AddNeed
 */
@WebServlet("/AddNeed")
public class AddNeed extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddNeed() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String need=request.getParameter("need");
		String name=request.getParameter("name");
		int CId=Integer.parseInt((String)request.getParameter("CId"));
		boolean a=DBOperations.setNeed(CId, need);
		if(a) {
			String message="Could not store need. Kindly retry";
			request.setAttribute("msg", message);
		}
		getServletContext().getRequestDispatcher("investor.jsp?name="+name+"&CId="+CId).forward(request, response);
	}

}
