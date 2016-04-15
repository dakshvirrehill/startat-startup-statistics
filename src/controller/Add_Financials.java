package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Financials;
import model.DBOperations;
/**
 * Servlet implementation class Add_Financials
 */
@WebServlet("/Add_Financials")
public class Add_Financials extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Add_Financials() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Financials fin=new Financials();
		String type=request.getParameter("type");
		String name=request.getParameter("name");
		String date=request.getParameter("date");
		int sales=Integer.parseInt("sales");
		int cid=Integer.parseInt(request.getParameter("cid"));
		int amount=Integer.parseInt(request.getParameter("amount"));
		if(type.equals("")||name.equals("")||date.equals("")||request.getParameter("cid").equals("")||request.getParameter("amount").equals("")||request.getParameter("sales").equals("")) {
			String message="Required Fields Can not be Empty";
			request.setAttribute("msg", message);
			getServletContext().getRequestDispatcher("/financial.jsp?name="+cid).include(request, response);
		}
		fin.setCompanyId(cid);
		fin.setDate(date);
		fin.setFinancial_Name(name);
		fin.setFinancial_Type(type);
		fin.setSales(sales);
		String dates[]=date.split("/");
		fin.setMonth(Integer.parseInt(dates[1]));
		fin.setYear(Integer.parseInt(dates[2]));
		if(type.equals("cost"))
		{
			int cost=DBOperations.getCost(cid);
			cost+=amount;
			fin.setTotalCost(cost);
		}
		if(type.equals("revenue")) {
			int revenue=DBOperations.getRevenue(cid);
			revenue+=amount;
			fin.setTotalRev(revenue);
		}
		if(DBOperations.addFinancials(fin)) {
			String message="Financial Added Successfully";
			request.setAttribute("msg1", message);
			getServletContext().getRequestDispatcher("/financial.jsp?name="+cid).forward(request, response);
		}
		else {
			String message="Could not add financial. Try again.";
			request.setAttribute("msg", message);
			getServletContext().getRequestDispatcher("/financial.jsp?name="+cid).include(request, response);			
		}
	}

}
