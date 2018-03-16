package com.ibm.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ibm.dao.CABDAO;

/**
 * Servlet implementation class update_driver
 */
@WebServlet("/update_driver")
public class update_driver extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public update_driver() {
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
		 	CABDAO obj=new CABDAO();
		  String msg=null;
			String [] ser = request.getParameterValues("serno");
		  String [] drivername = request.getParameterValues("drivername");
		  String [] contact = request.getParameterValues("contact");
		  String [] exp = request.getParameterValues("exp");
		  String [] age = request.getParameterValues("age");
		  String [] shifttime = request.getParameterValues("shifttime");

			  for(int i=0;i<ser.length;i++)
			  {
				  String sql="update driver_bus set driver_name=?,contact=?,exp=?,age=?,shift_time=?" + " where service_no=?";
				  msg=obj.updateDriverBySer(sql, ser[i],drivername[i],contact[i],exp[i],age[i],shifttime[i]);
			  }
			  response.sendRedirect("Admin-Page.jsp");
	}



}