package com.ibm.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.List;
import java.util.StringTokenizer;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;
import org.apache.tomcat.util.http.fileupload.servlet.ServletRequestContext;

import com.ibm.dao.CABDAO;

//import com.ibm.dao.CABDAO;
//import com.ibm.model.RegModel;


/**
 * Servlet implementation class store_data
 */
@WebServlet("/store_data")
//@WebServlet("/fileUpload")
@MultipartConfig(maxFileSize = 16177215)

public class store_data extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public store_data() {
  //      super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
			
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
/*		boolean upload_status = false;
		boolean is_loggedin = false;
			HttpSession session1=request.getSession();  
				    		
				if(session1.getAttribute("uname")=="admin")
				{		
			        is_loggedin = true;		
			    }
				
		 if(ServletFileUpload.isMultipartContent(request) && is_loggedin){
	         String filepath = "";   
			 try {
	                List <FileItem> multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(new ServletRequestContext(request));
	                for(FileItem item : multiparts){
	                    if(!item.isFormField()){
	                        String name = new File(item.getName()).getName();
	                        System.out.println( );
	                        //filepath = getserverfilepath;
	                        //item.write( new File("filepath/data.csv"));
	                        item.write( new File("../files/data.csv"));
	                    }
	                }
	               //File uploaded successfully
	                upload_status = true;
	               request.setAttribute("message", "File Uploaded Successfully");
	            } catch (Exception ex) {
	               request.setAttribute("message", "File Upload Failed due to " + ex);
	            }         		
	        }else{
	
	            request.setAttribute("message","No File found");
}
	        //request.getRequestDispatcher("/Admin").forward(request, response);
	
		 if(upload_status){

		        System.out.println("im in admin");
		    	CABDAO obj1 = new CABDAO();
		    	String m = obj1.AddBusDetails();
		    	if(m.equals("done"))
		    	{
		    		System.out.println("Entry added in db");
		    		response.sendRedirect("Admin-Page.jsp?filestatus=Last Upload was successfull");
		    	}    
 
		 }
		 else{
	    		System.out.println("database not updated with csv");
	    		response.sendRedirect("Admin-Page.jsp?error=database error");
		 }*/
	
		//String firstName = request.getParameter("firstName");
		//String lastName =  request.getParameter("lastName");
		System.out.println("enter store data");
		PrintWriter out=response.getWriter();
		response.setContentType("text/html");
		//out.println(firstName+" "+lastName);
		
		
		InputStream inputStream = null;
		//InputStream inputstream = null;
		String savePath = getServletContext().getRealPath("/")+"files\\";
		//String savePathcsv = getServletContext().getRealPath("/")+"images\\";
		
		Part filePart = request.getPart("fname");
		//Part filePartcsv = request.getPart("csvnm");
		if (filePart != null) {
			// debug messages
			System.out.println(filePart.getName());
			System.out.println(filePart.getSize());
			System.out.println(filePart.getContentType());

			//System.out.println(filePartcsv.getName());
			//System.out.println(filePartcsv.getSize());
			//System.out.println(filePartcsv.getContentType());

			// obtains input stream of the upload file
			inputStream = filePart.getInputStream();
			//inputstream = filePartcsv.getInputStream();
			BufferedInputStream bf=new BufferedInputStream(inputStream);
			//BufferedInputStream bfcsv=new BufferedInputStream(inputstream);
			System.out.println("after buffer");
			//********************************GETTING FILE NAME*****************************************
			String header=filePart.getHeader("content-disposition");
			//String headercsv=filePartcsv.getHeader("content-disposition");
			System.out.println("after header");
			StringTokenizer st=new StringTokenizer(header,";");
			//StringTokenizer stcsv=new StringTokenizer(headercsv,";");
			System.out.println("after token");
			String fileToken="";
			//String fileTokencsv="";
			while(st.hasMoreElements())
			{
				fileToken=st.nextToken();
			}
			System.out.println("after while");
			/*while(stcsv.hasMoreElements())
			{
				fileTokencsv=stcsv.nextToken();
			}*/
		    System.out.println(fileToken);
		    //out.println(fileTokencsv);
		    StringTokenizer st1=new StringTokenizer(fileToken,"=");
		    //StringTokenizer st1csv=new StringTokenizer(fileTokencsv,"=");
            String Filename="";
            //String csvname="";
            while(st1.hasMoreElements())
			{
				Filename=st1.nextToken();
				
			}
            /*while(st1csv.hasMoreElements())
			{
				csvname=st1csv.nextToken();
				
			}*/
            System.out.println("<h1>"+Filename+"</h1>");
            Filename=Filename.replace("\"", "");
            System.out.println("<h1>"+Filename+"</h1>");
            //out.println("<h1>"+csvname+"</h1>");
            //Filename=Filename.replace("\"", "");
            //out.println("<h1>"+csvname+"</h1>");
            //************************************************************************************
            FileOutputStream fout=new FileOutputStream(savePath+Filename);
            //FileOutputStream foutcsv=new FileOutputStream(savePathcsv+csvname);
          //  out.println(""+savePath+""+savePathcsv);
            //out.println(""+Filename+"");
            
            //out.println("<img src='files/"+csvname+"' />");
            int i=0;
            while((i=bf.read())!=-1)
            {
            	fout.write(i);
            }
            
            CABDAO obj = new CABDAO();		
            String m =obj.AddBusDetails(Filename,savePath);
            if(m.equals("done"))
            {
            	System.out.println("data added");
            	System.out.println("Entry added in db");
	    		response.sendRedirect("Admin-Page.jsp?filestatus=Last Upload was successfull");
	    	}    

	 
	 else{
    		System.out.println("database not updated with csv");
    		response.sendRedirect("Admin-Page.jsp?error=database error");
	 }
		}

	
	}
	
}	

	


