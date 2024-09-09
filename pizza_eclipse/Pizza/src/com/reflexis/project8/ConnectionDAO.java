package com.reflexis.project8;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionDAO {
	Connection conn;
	//database url
	static final String DATABASE_URL = "jdbc:mysql://localhost:3306/siddhant";
	
	
	public static Connection getConn(){
		Connection connection = null;
		                              
		   
		
		try{
			Class.forName("com.mysql.jdbc.Driver");
	         // establish connection to database                              
	         connection = DriverManager.getConnection( DATABASE_URL, "root", "root" );
	         //return connection;
		}
		 catch ( SQLException sqlException )                                
	      {                                                                  
	         sqlException.printStackTrace();
	      } // end catch    
		  catch ( ClassNotFoundException cnfe)                                
	      {                                                                  
	         cnfe.printStackTrace();
	      } // end catch 
		 return connection;
	}

}
