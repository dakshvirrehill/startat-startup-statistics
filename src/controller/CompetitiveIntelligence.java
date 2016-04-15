package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.DBOperations;

/**
 * Servlet implementation class CompetitiveIntelligence
 */
@WebServlet("/CompetitiveIntelligence")
public class CompetitiveIntelligence extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CompetitiveIntelligence() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String comparedwith=request.getParameter("comparedwith");
		int pop=Integer.parseInt(request.getParameter("pop"));
		int custr=Integer.parseInt(request.getParameter("custr"));
		int cust18=Integer.parseInt(request.getParameter("cust18"));
		int cust24=Integer.parseInt(request.getParameter("cust24"));
		int cust40=Integer.parseInt(request.getParameter("cust40"));
		int cid=Integer.parseInt(request.getParameter("cid"));
		String value=request.getParameter("value");
		if(comparedwith.equals("myntra")) {
			int score[]=new int[4];
			String scoreval[]=new String[5];
			if(pop>30000) {
				score[0]=(int)(((pop-30000)/30000)*50+50);
			}
			else if(pop<30000) {
				score[0]=(int)(((pop)/30000)*50);
			}
			else
			{
				score[0]=50;
			}
			if(custr>25000) {
				score[1]=(int)(((custr-25000)/35000)*50+50);
			}
			else if(custr<25000) {
				score[1]=(int)(((custr)/25000)*50);
			}
			else
			{
				score[1]=50;
			}
			if(cust18>12000) {
				score[2]=(int)(((cust18-12000)/48000)*50+50);
			}
			else if(cust18<30000) {
				score[2]=(int)(((cust18)/12000)*50);
			}
			else
			{
				score[2]=50;
			}
			if(cust24>12000) {
				score[2]+=(int)(((cust24-12000)/48000)*50+50);
			}
			else if(pop<12000) {
				score[2]+=(int)(((cust24)/12000)*50);
			}
			else
			{
				score[2]+=50;
			}
			if(cust40>6000) {
				score[2]+=(int)(((cust40-6000)/24000)*50+50);
			}
			else if(pop<30000) {
				score[2]+=(int)(((cust40)/6000)*50);
			}
			else
			{
				score[2]+=50;
			}
			score[2]=(int)(((score[2])/300)*100);
			String k[]=value.split(";");
			if(k.length>4) {
				score[3]=(int)(((k.length-4)/6)*50+50);
			}
			else if(k.length<4) {
				score[3]=(int)(((k.length)/4)*50);
			}
			else {
				score[3]=50;
			}
			scoreval[0]=comparedwith;
			scoreval[1]="The above score depicts the popularity your company has as compared to Myntra. A score above 50 depicts that your company is more popular and below 50 means it is less popular. If the value is 50 it means that your popularity score is same as Myntra's. This has been calculated with the help of our state of the art algorithm which is proprietary to our website.";
			scoreval[2]="The above score depicts customer relationships your company has as compared to Myntra. A score above 50 depicts that your company has better customer relationship and below 50 means myntra has better relationship. If the value is 50 it means that your customer relationship score is same as Myntra's. This has been calculated with the help of our state of the art algorithm which is proprietary to our website.";
			scoreval[3]="The above score depicts how well you target your audience as compared to Myntra. A score above 50 depicts that your company has a better target mechanism and below 50 means myntra has a better target mechanism. If the value is 50 it means that your customer segment score is same as Myntra's. This has been calculated with the help of our state of the art algorithm which is proprietary to our website.";
			scoreval[4]="The above score depicts value propositions your company has as compared to Myntra. A score above 50 depicts that your value propositions are more valueable as compared to Myntra and below 50 means it is less valuable. If the value is 50 it means that your value proposition score is same as Myntra's. This has been calculated with the help of our state of the art algorithm which is proprietary to our website.";
			if(DBOperations.setScore(score, cid, scoreval)) {
				getServletContext().getRequestDispatcher("/competitive.jsp?name="+cid).forward(request,response);
			}
			else {
				String message="Couldn't calculate score. Please try again.";
				request.setAttribute("msg", message);
				getServletContext().getRequestDispatcher("/competitive.jsp?name="+cid).include(request, response);
			}
		}
		else {
			String message="Company information not with us.Regret the inconvenience";
			request.setAttribute("msg", message);
			getServletContext().getRequestDispatcher("/competitive.jsp?name="+cid).include(request,response);
		}
	}

}
