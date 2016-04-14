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
	private boolean isMultipart;
	private String filePath;
	private int maxFileSize = 50 * 1024;
	private int maxMemSize = 4 * 1024;
	private File file ;      
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Add_Comp() {
        super();
        // TODO Auto-generated constructor stub
    }
    public void init( ){
        // Get the file location where it would be stored.
        filePath = getServletContext().getInitParameter("file-upload"); 
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
		String profile="useruploads/";
		isMultipart = ServletFileUpload.isMultipartContent(request);
		DiskFileItemFactory factory = new DiskFileItemFactory();
	    // maximum size that will be stored in memory
	    factory.setSizeThreshold(maxMemSize);
	    // Location to save data that is larger than maxMemSize.
	    factory.setRepository(new File("F:\\temp"));
	    // Create a new file upload handler
	    ServletFileUpload upload = new ServletFileUpload(factory);
	    // maximum file size to be uploaded.
	    upload.setSizeMax( maxFileSize );
	    try{ 
	    // Parse the request to get file items.
	    List fileItems = upload.parseRequest(request);
	    // Process the uploaded file items
	    Iterator i = fileItems.iterator();
	    while ( i.hasNext () ) 
	    {
	       FileItem fi = (FileItem)i.next();
	       if ( !fi.isFormField () )	
	       {
	          // Get the uploaded file parameters
	          String fieldName = fi.getFieldName();
	          String fileName = fi.getName();
	          String contentType = fi.getContentType();
	          boolean isInMemory = fi.isInMemory();
	          long sizeInBytes = fi.getSize();
	          // Write the file
	          if( fileName.lastIndexOf("\\") >= 0 ){
	        	  profile=profile+username+fileName.substring(fileName.lastIndexOf('\\'));
	             file =new File( filePath +username+"_"+name+fileName.substring(fileName.lastIndexOf("\\"))) ;
	          }else{
	        	  profile=profile+username+fileName.substring(fileName.lastIndexOf('\\')+1);
	             file =new File( filePath +username+"_"+name+fileName.substring(fileName.lastIndexOf("\\")+1)) ;
	          }
	          fi.write( file ) ;
	       }
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
   }catch(Exception e) {
	   	e.printStackTrace();
   }
}
}
