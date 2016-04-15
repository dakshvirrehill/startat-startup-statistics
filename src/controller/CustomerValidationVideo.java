package controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
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

import model.DBOperations;

/**
 * Servlet implementation class CustomerValidationVideo
 */
@WebServlet("/CustomerValidationVideo")
public class CustomerValidationVideo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CustomerValidationVideo() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String CID=request.getParameter("cid");
		int CId=Integer.parseInt(CID);
		String username=(String)request.getSession().getAttribute("username");
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
                        profile=request.getServletContext().getRealPath("/")+"useruploads/"+username+"_"+CId+"_"+item.getName();
                        item.write(file);
                }
            }
        } catch (FileUploadException e) {
                throw new RuntimeException(e);
        } catch (Exception e) {
                throw new RuntimeException(e);
        }
        if(DBOperations.addVideo(CId, profile)){
        	getServletContext().getRequestDispatcher("/custmval.jsp?name="+CId).include(request,response);
        }
        else {
        	String message="Video could not be uploaded please try again";
        	request.setAttribute("msg", message);
        	getServletContext().getRequestDispatcher("/custmval.jsp?name="+CId).include(request,response);
        }
	}

}
