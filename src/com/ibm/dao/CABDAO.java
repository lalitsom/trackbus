package com.ibm.dao;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;

import com.ibm.model.RegModel;

public class CABDAO {

	
	public static String drivername="com.mysql.jdbc.Driver";
	public static String url="jdbc:mysql://sql12.freemysqlhosting.net:3306/sql12227019";
	public static String username="sql12227019";
	public static String password="nI6Fj4TIry";
	
	
	
//	public static String drivername="com.mysql.jdbc.Driver";
//	public static String url="jdbc:mysql://eu-cdbr-sl-lhr-01.cleardb.net:3306/ibmx_bdf80219d95cb55";
//	public static String username="b3fe4ceb1069ca";
//	public static String password="ea90b5c0";
	
	public static Connection con=null;
	public BufferedReader br;
	public String line=null;
	public ArrayList<String> dat;
	public StringTokenizer t;
	public String s = null;
	public ResultSet rs1 = null;
	public ResultSet rs2 = null;
	static
	{
		
		try {
			Class.forName(drivername);
			con=DriverManager.getConnection(url,username,password);
		    System.out.println("connected");
		
		   } catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	
	public String AddBusDetails(String filename,String path){
		try
		{
			String sql = "insert into bus_details(service_no, sequence, station, latitude, longitude) values (?,?,?,?,?);";	
			//string filepath = getfilepath;
			//br = new BufferedReader(new FileReader("filepath\data.csv"));
			System.out.println(filename+" this "+path );
			br = new BufferedReader(new FileReader(path+filename));
			
			
			//delete all the database entries
			String sql_del = "delete from bus_details where id >0";
			PreparedStatement ps_del = con.prepareStatement(sql_del);
			ps_del.executeUpdate();
			// just a temporary fix to avoid redundancy
			
			
			
			while((line= br.readLine())!= null)
			{
				 String[] array = line.split(",");
				 
				 PreparedStatement ps = con.prepareStatement(sql);
					ps.setString(1,array[0]);
					ps.setString(2,array[1]);
					ps.setString(3,array[2]);
					ps.setString(4,array[3]);
					ps.setString(5,array[4]);
					System.out.println(ps.toString());
					ps.executeUpdate();
					
					try{
						//also add a bus driver field for each bus						
						String sql2 = "INSERT INTO `driver_bus` (`service_no`, `driver_name`, `contact`, `exp`, `age`, `shift_time`) VALUES ('"+array[0]+"', '', '', '', '', '')";
						 PreparedStatement ps2 = con.prepareStatement(sql2);
						
							ps2.executeUpdate();
							
					}catch(Exception e){
						System.out.println("driver : " + e.getMessage());
					}
			}
			
			
				return "done";
		}
		catch(Exception e)
		{
			e.printStackTrace();
			System.out.println("stted : " + e.getMessage());
			
		}
		
		return "";

	}
	
	
	
	
	
	
	public ResultSet FetchAllDriver(String sql)
	{
		
		//delete redundant entries from driver table
		try{
			//also add a bus driver field for each bus						
			String sql2 = "delete from driver_bus where service_no NOT IN  (select service_no from bus_details);";
			 PreparedStatement ps2 = con.prepareStatement(sql2);
			// System.out.println("driver : " + ps2.toString());
				ps2.executeUpdate();
			
		}catch(Exception e){
			System.out.println("driver : " + e.getMessage());
		}		
		
		
		ResultSet rs = null;
		try
		{
			PreparedStatement ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
			System.out.print(e);
		}
		
		
		
		
		
		
		
		return rs;
		
	}
	
	
	
	public String updateDriverBySer(String sql,String ser,String drivername,String contact,String exp,String age,String shifttime)
	{			
		
			try
			{
				PreparedStatement ps=con.prepareStatement(sql);
				ps.setString(1, drivername);
				ps.setString(2, contact);
				ps.setString(3, exp);
				ps.setString(4, age);
				ps.setString(5, shifttime);
				ps.setString(6, ser);				
						
				int i=ps.executeUpdate();
				
				if(i==1)
				{
					return "success";
				}
				else
				{
					return "fail";
				}
				
			}
			catch(Exception e)
			{
				e.printStackTrace();
				System.out.print("error in updation");
			}
			
			return "";
			
		}
	
	
	
	
	
	public String FetchDriver(String busno)
	{
		ResultSet rs = null;
		try{
			String sql = "select driver_name from driver_bus where service_no = ?";
			PreparedStatement ps=con.prepareStatement(sql);
            ps.setString(1,busno);        
            rs=ps.executeQuery();
            if(rs.next())
            {
            	s = "done";
            	System.out.print(s);
            }
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
			System.out.println("error in fetching driver");
		}
		return s;
	}
	public ResultSet FetchLat(String ser)
    {
		
        try
        {        
        	String sql = "select service_no,sequence,station,latitude,longitude from bus_details where service_no = ?";
            PreparedStatement ps=con.prepareStatement(sql);
            ps.setString(1,ser);        
            rs2=ps.executeQuery();
            
            
        }
        catch(Exception e)
        {
        	System.out.println("error : " + e.getMessage());
        }        
         
        return rs2;
         
    }
	public ResultSet GetDriver(String busno)
	{
		try
		{
			String sql = "select * from driver_bus where service_no = ?";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1,busno);
			rs1=ps.executeQuery();
			
		}
		catch(Exception e)
		{
		e.printStackTrace();
		System.out.print("error in gtedriver");
		}
		
		return rs1;
	}
	
	public ResultSet GetAllBus(String sql,String ststop,String endstop)
    {
		ResultSet rs =null;
        try
        {        	
            PreparedStatement ps=con.prepareStatement(sql);
            ps.setString(1,ststop);
            ps.setString(2,endstop);            
            rs=ps.executeQuery();
        }
        catch(Exception e)
        {
        	System.out.println("error : " + e.getMessage());
        }        
         
        return rs;
         
    }
	
	
	public ResultSet GetAllStations()
    {
		String sql ="select distinct station from bus_details;";
		ResultSet rs =null;
        try
        {        	
            PreparedStatement ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
        }
        catch(Exception e)
        {
        	System.out.println("error : " + e.getMessage());
        }        
         
        return rs;
         
    }
    
	
	public String Update_Bus_Loc(String serviceno, String newlat, String newlon ){
		try
        {
        	String sql = "update bus_location set current_latitude = ?, current_longitude = ? where service_no =?;";
            PreparedStatement ps=con.prepareStatement(sql);
            ps.setString(1, newlat);
            ps.setString(2, newlon);
            ps.setString(3, serviceno);
            ps.execute();
                      
             
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
		
		return "";
	}
     
	
	public String GetLocation(String serviceno)
    {
		ResultSet rs = null;
		String location ="";
        try
        {
        	String sql = "select current_latitude,current_longitude from bus_location where service_no = ?";
            PreparedStatement ps=con.prepareStatement(sql);
            ps.setString(1, serviceno);
            rs=ps.executeQuery();
            
        //    while(rs.next())
            {
          //  	 System.out.println("loc : " + rs.getString(1));
            }
            
            
           if(rs.next())
           {
        	  location = rs.getString(1)+";" + rs.getString(2); 
           }
             
             
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
         System.out.println("loce : " + location);
         
        return location;
         
    }
	
	public  String ValidateUser(RegModel obj,String sql){
		try{
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString( 1, obj.getUname() );
			ps.setString( 2, obj.getPwd());
			
			
			ResultSet res = ps.executeQuery();
	        
			if (res.next())
			{
				return "success";
				
			}
			else
				return "fail";
			
		}
		
		catch(Exception e){
			
			System.out.print("fail : " + e.getMessage());
		}
		
		
		return "";
	}
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
