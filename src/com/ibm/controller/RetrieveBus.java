package com.ibm.controller;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ibm.dao.CABDAO;

/**
 * Servlet implementation class RetrieveBus
 */
@WebServlet("/RetrieveBus")
public class RetrieveBus extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RetrieveBus() {
        super();
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
	
		String startpoint=request.getParameter("startpoint");
		String endpoint=request.getParameter("endpoint");
		//System.out.println(startpoint);
		
				
		String buslist ="";
			

		String sql = "SELECT service_no FROM bus_details WHERE station=? and service_no IN (SELECT service_no FROM bus_details WHERE station =?)";
		
		CABDAO obj1 = new CABDAO();
		ResultSet rs = obj1.GetAllBus(sql ,startpoint,endpoint);
			try {
				
				while(rs.next()){
					buslist += rs.getString(1)+";";	
				}				
				buslist = buslist.substring(0,buslist.length()-1);
			} 
			catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		
	    response.sendRedirect("Find.jsp?listlength=" + buslist.length()
	    		+ "&buslist=" + buslist +"&start="+ startpoint + "&end=" + endpoint );
		
		
		
	}

}
