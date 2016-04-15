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
 * Servlet implementation class Chprodet
 */
@WebServlet("/Chprodet")
public class Chprodet extends HttpServlet {
	private static final long serialVersionUID = 1L;
/**
     * @see HttpServlet#HttpServlet()
     */
    public Chprodet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String name=request.getParameter("name");
		String description=request.getParameter("description");
		String username=request.getParameter("username");
		String profile="";
		if(username.equals("")||name.equals("")||description.equals(""))
		{
			String message="Required Fields Empty";
			request.setAttribute("msg1", message);
			getServletContext().getRequestDispatcher("/profile.jsp").include(request, response);
		}
		if (!ServletFileUpload.isMultipartContent(request)) {
            throw new IllegalArgumentException("Request is not multipart, please 'multipart/form-data' enctype for your form.");
        }

        ServletFileUpload uploadHandler = new ServletFileUpload(new DiskFileItemFactory());
        try {
            List<FileItem> items = uploadHandler.parseRequest(request);
            for (FileItem item : items) {
                if (!item.isFormField()) {
                        File file = new File(request.getServletContext().getRealPath("/")+"useruploads/", item.getName());
                        profile=request.getServletContext().getRealPath("/")+"useruploads/"+username+"_"+item.getName();
                        item.write(file);
                }
            }
        } catch (FileUploadException e) {
                throw new RuntimeException(e);
        } catch (Exception e) {
                throw new RuntimeException(e);
        }
	    if(DBOperations.addUserProfile(username,name,description,profile))
	    {
	    	String message="Changes saved successfully";
	    	request.setAttribute("msg", message);
	    	getServletContext().getRequestDispatcher("/profile.jsp").forward(request, response);
	    }
	    else
	    {
	    	String message="Couldn't save data due to some error. Kindly retry.";
	    	request.setAttribute("msg1", message);
	    	getServletContext().getRequestDispatcher("/profile.jsp").include(request, response);
	    }
}
}
