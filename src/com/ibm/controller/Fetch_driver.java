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
import com.ibm.model.RegModel;

/**
 * Servlet implementation class Fetch_driver
 */
@WebServlet("/Fetch_driver")
public class Fetch_driver extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Fetch_driver() {
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
		// TODO Auto-generated method stub
		/*String busno = request.getParameter("busno");
		String driver = "";
		String nl = System.getProperty("line.seperator");
		
		RegModel obj = new RegModel();
		obj.setBusno(busno);
		
		CABDAO obj2 = new CABDAO();
		ResultSet rs = obj2.FetchDriver(obj);
	try{	
		while(rs.next())
		{
			driver = driver + rs.getString(1)+" "+ rs.getString(2)+" "+rs.getString(3)+" "+rs.getString(4)+" "+rs.getString(5)+" "+rs.getString(6)+" "+rs.getString(7)+" "+rs.getString(8)+" "+rs.getString(9)+ "- " ;
			System.out.println(driver);
		}
		response.sendRedirect("BusDetails.jsp?msg="+rs);
	}
	catch(Exception e)
	{
		e.printStackTrace();
		System.out.println("error reaching site");
	}
	
*/
		String busno= request.getParameter("busno");
		CABDAO obj2 = new CABDAO();
		String m = obj2.FetchDriver(busno);
		if(m.equals("done"))
		{
			System.out.println("succes in fetch driver");
			response.sendRedirect("BusDetails.jsp");
		}
		else
			System.out.println("fail in fetch");
			response.sendRedirect("BusDetails.jsp");
		
	}
	}
