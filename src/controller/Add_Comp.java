package controller;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.output.*;

import model.DBOperations;
/**
 * Servlet implementation class Add_Comp
 */
@WebServlet("/Add_Comp")
public class Add_Comp extends HttpServlet {
	private static final long serialVersionUID = 1L;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Add_Comp() {
        super();
        // TODO Auto-generated constructor stub
    }
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String name=request.getParameter("name");
		String company_domain=request.getParameter("company_domain");
		String email=request.getParameter("email");
		String website=request.getParameter("website");
		String stage_of_development=request.getParameter("stage_of_development");
		String established=request.getParameter("established");
		String username=request.getParameter("username");
		String description=request.getParameter("description");
		if(username.equals("")||company_domain.equals("default")||email.equals("")||stage_of_development.equals("default")||established.equals("")||description.equals("")){
			String message="Required Fields Empty";
			request.setAttribute("msg", message);
			getServletContext().getRequestDispatcher("/addcomp.jsp").include(request, response);
		}
		if(name.equals("")) {
			name="Unnamed";
		}
		String profile="";
		if (!ServletFileUpload.isMultipartContent(request)) {
            throw new IllegalArgumentException("Request is not multipart, please 'multipart/form-data' enctype for your form.");
        }

        ServletFileUpload uploadHandler = new ServletFileUpload(new DiskFileItemFactory());
        try {
            List<FileItem> items = uploadHandler.parseRequest(request);
            for (FileItem item : items) {
                if (!item.isFormField()) {
                        File file = new File(request.getServletContext().getRealPath("/")+"useruploads/", item.getName());
                        profile=request.getServletContext().getRealPath("/")+"useruploads/"+username+"_"+name+"_"+item.getName();
                        item.write(file);
                }
            }
        } catch (FileUploadException e) {
                throw new RuntimeException(e);
        } catch (Exception e) {
                throw new RuntimeException(e);
        }
	    
		if(DBOperations.addCompany(username,name,company_domain,email,website,stage_of_development,established,profile,description))
	    {
	    	String message="Changes saved successfully";
	    	request.setAttribute("msg1", message);
	    	getServletContext().getRequestDispatcher("/company.jsp").forward(request, response);
	    }
	    else
	    {
	    	String message="Couldn't save data due to some error. Kindly retry.";
	    	request.setAttribute("msg", message);
	    	getServletContext().getRequestDispatcher("/addcomp.jsp").include(request, response);
	    }
}
}
