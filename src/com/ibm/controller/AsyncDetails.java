package com.ibm.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.ibm.dao.*;
import java.sql.*;
/**
 * Servlet implementation class AsyncDetails
 */
@WebServlet("/AsyncDetails")
public class AsyncDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AsyncDetails() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String s=request.getParameter("busno");  
		
		if(s!=null){ 
			CABDAO object = new CABDAO();
				try{
				String location = object.GetLocation(s);     
				System.out.println("heh : " + s);
					if(location.length()>1){
						out.print(location);
						System.out.println("heh" + location);
					}
				}catch(Exception e){
					
				}
		}
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
