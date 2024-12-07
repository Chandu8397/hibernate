package com.coforge.get.shopstop;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class CandidateDAO {

	//DAO-- Data Access Object layer is used for communication with db

	public static Connection getConnection()
	{  
		Connection con=null;  
		try{  
			Class.forName("com.mysql.cj.jdbc.Driver");  
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mysqljdbc","root","Chandu@8397");  
		}catch(Exception e){System.out.println(e);}  
		return con;  
	} 

	public static List<Candidate> getAllRecords(){  
		List<Candidate> list=new ArrayList<>();  

		try{  
			Connection con=getConnection();  
			PreparedStatement ps=con.prepareStatement("select * from candidates");  
			ResultSet rs=ps.executeQuery();  
			while(rs.next()){  

				Candidate c=new Candidate();  

				c.setId(rs.getInt("id"));
				c.setFirst_name(rs.getString("first_name"));
				c.setLast_name(rs.getString("last_name"));
				c.setDob(rs.getDate("dob"));
				c.setPhone(rs.getString("phone"));
				c.setEmail(rs.getString("email"));  


				list.add(c);  
			}  
		}catch(Exception e){System.out.println(e);}  
		return list;  
	} 	
}
