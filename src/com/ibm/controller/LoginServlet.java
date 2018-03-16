package com.ibm.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ibm.dao.CABDAO;
import com.ibm.model.RegModel;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String uname=request.getParameter("uname");
		String pwd=request.getParameter("pwd");
		
		RegModel obj = new RegModel();
		obj.setUname(uname);
		obj.setPwd(pwd);
		
		String sql = "select * from admin_user where uname=? and pwd = ?";
		
		CABDAO obj1 = new CABDAO();
		String msg = obj1.ValidateUser(obj ,sql);
		//String msg = CABDAO.ValidateUser(obj ,sql);
		if(msg.equals("success"))
		{
			HttpSession session=request.getSession();  
	        session.setAttribute("uname","admin");
	        response.sendRedirect("Admin-Page.jsp");
			
			
		}
		else
		{						
			response.sendRedirect("Admin-Login.jsp?error=INVALID USERNAME OR PASSWORD");
		}
		
		
		
		
	
	}

}
