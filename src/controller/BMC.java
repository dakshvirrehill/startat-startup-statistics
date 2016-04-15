package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.DBOperations;

/**
 * Servlet implementation class BMC
 */
@WebServlet("/BMC")
public class BMC extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BMC() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String tag="";
		String data="";
		String bmname=request.getParameter("bmn");
		String id=request.getParameter("id");
		int cid=Integer.parseInt(request.getParameter("CId"));
		if(request.getParameter("csmseg")!=null) {
			tag="Customer Segment";
			data=request.getParameter("CustomerSegments");
		}
		else if(request.getParameter("chanval")!=null) {
			tag="Channels";
			data=request.getParameter("ChannelsVal");
		}
		else if(request.getParameter("valprop")!=null) {
			tag="Value Propositions";
			data=request.getParameter("ValuePropositions");
		}
		else if(request.getParameter("custrel")!=null) {
			tag="Customer Relationships";
			data=request.getParameter("CustomerRelationships");
		}
		else if(request.getParameter("revstream")!=null) {
			tag="Revenue Streams";
			data=request.getParameter("RevenueStreams");
		}
		else if(request.getParameter("keyres")!=null) {
			tag="Key Resources";
			data=request.getParameter("KeyResources");
		}
		else if(request.getParameter("keyact")!=null) {
			tag="Key Activities";
			data=request.getParameter("KeyActivities");
		}
		else if(request.getParameter("keypart")!=null) {
			tag="Key Partners";
			data=request.getParameter("KeyPartners");
		}
		else if(request.getParameter("coststruct")!=null) {
			tag="Cost Structure";
			data=request.getParameter("CostStructure");
		}
		if(request.getParameter("BMN")!=null) {
			bmname=request.getParameter("bmname");
		}
		if(tag.equals("")&&data.equals("")) {
			response.sendRedirect("bmc.jsp?name="+cid+"&bmname="+bmname);
		}
		if(DBOperations.checkBMData(tag, cid,bmname)) {
			if(DBOperations.updateBMData(tag, data, cid,bmname)) {
				getServletContext().getRequestDispatcher("/bmc.jsp?name="+cid+"&bmname="+bmname+"#"+id).include(request,response);
			}
			else {
				String message="Try Again";
				request.setAttribute("msg", message);
				getServletContext().getRequestDispatcher("/bmc.jsp?name="+cid+"&bmname="+bmname).include(request, response);
			}
		}
		else {
			if(DBOperations.addBMData(tag, data, cid,bmname)) {
				getServletContext().getRequestDispatcher("/bmc.jsp?name="+cid+"&bmname="+bmname+"#"+id).include(request,response);				
			}
			else {
				String message="Try Again";
				request.setAttribute("msg", message);
				getServletContext().getRequestDispatcher("/bmc.jsp?name="+cid+"&bmname="+bmname).include(request, response);				
			}
		}
	}
}