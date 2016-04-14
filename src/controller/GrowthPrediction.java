package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Vector;
import java.util.Iterator;
import model.DBOperations;
import model.Financials;
/**
 * Servlet implementation class GrowthPrediction
 */
@WebServlet("/GrowthPrediction")
public class GrowthPrediction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GrowthPrediction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int year=Integer.parseInt(request.getParameter("years"));
		int cid=Integer.parseInt(request.getParameter("cid"));
		Vector<Financials> finance=DBOperations.getFinancials(cid);
		Financials fin=new Financials();
		int prevCost=0,prevRevenue=0,cost=0,rev=0,curyear=0,ind=0,diffc[]=new int[20],diffr[]=new int[20],meandiffc=0,meandiffr=0;
		Iterator i=finance.iterator();
		fin=(Financials)i.next();
		prevCost=fin.getTotalCost();
		prevRevenue=fin.getTotalRev();
		curyear=fin.getYear();
		while(i.hasNext()) {
			if(fin.getYear()==(curyear+1)) {
				cost=fin.getTotalCost();
				rev=fin.getTotalRev();
				diffc[ind]=cost-prevCost;
				diffr[ind]=rev-prevRevenue;
				ind++;
				curyear=fin.getYear();
				prevCost=cost;
				prevRevenue=rev;
			}
			else {
				prevCost=fin.getTotalCost();
				prevRevenue=fin.getTotalRev();
			}
		}
		ind=0;
		while(ind<diffc.length) {
			meandiffc+=diffc[ind];
			meandiffr+=diffr[ind];
		}
		meandiffc/=diffc.length;
		meandiffr/=diffr.length;
		ind=0;
		for(ind=1;ind<=20;ind++) {
			fin.setCompanyId(cid);
			fin.setFinancial_Name("Predictive Data");
			fin.setFinancial_Type("Predictive Cost");
			meandiffc+=(int)(1000*Math.pow(1.3, ind));
			fin.setFinancialAmount(meandiffc);
			fin.setDate("01/01/"+(curyear+1));
			fin.setMonth(1);
			fin.setYear(curyear+1);
			fin.setTotalCost(prevCost+meandiffc);
			boolean b=DBOperations.addFinancials(fin);
			fin.setCompanyId(cid);
			fin.setFinancial_Name("Predictive Data");
			fin.setFinancial_Type("Predictive Revenue");
			meandiffr+=(int)(1000*Math.pow(1.3, ind));
			fin.setFinancialAmount(meandiffr);
			fin.setDate("01/03/"+(curyear+1));
			fin.setMonth(3);
			fin.setYear(curyear+1);
			fin.setTotalCost(prevCost+meandiffr);
			b=DBOperations.addFinancials(fin);
			curyear+=1;
		}
		response.sendRedirect("index.jsp");
	}

}
