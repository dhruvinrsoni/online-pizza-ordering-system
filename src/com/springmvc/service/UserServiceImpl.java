package com.springmvc.service;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import org.springframework.lang.UsesJava7;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.springmvc.service.*;
import com.springmvc.model.User;

@Service("UserService")
@Transactional
public class UserServiceImpl implements UserService {
	
	private static ArrayList<User> users ;
	private Connection connection = null ;
	private String dB_URL = "jdbc:mysql://localhost:3306/" ;
	private String dB_name = "pizzawale" ;
	private String driver = "com.mysql.jdbc.Driver" ;
	private String userName = "root" ; 
	private String password = "root" ;
	private PreparedStatement statement = null ; 
	private ResultSet resultSet = null ;
	
	private void connectToDB() {
		System.out.println("Trying to connect to database...");
		try {
			Class.forName(driver).newInstance() ;
			connection = DriverManager.getConnection(dB_URL + dB_name, userName , password) ;
			System.out.println("DB Connection Successful...!");
		}
		catch(Exception e) {
			System.out.println("Could not connect to the database !" + e.toString()) ;
		}
	}

	
	private void closeDBconnection() {
		try {
			if(!connection.isClosed()) {
				connection.close() ;
				System.out.println("Connection to DB has been successfully closed.");
			}
		}
		catch(Exception e) {
			System.out.println("Could not close the database !" + e.toString()) ;
		}
	}
	
	//@Override
	public boolean doesUserExist(User user) {
		if(findByEmail(user.getEmail()) != null) {
			return true ;
		}
		return false ;
	}

	public User findByID(int user_id) {
		users = findAllUsers() ;
		for(User user : users) {
			if(user.getUserId() == user_id) {
				System.out.println("Inside findByEmail method and email found...! user:"+user.getName()+" and email:"+user.getUserId());
				return user ;
			}
		}
		return null ;
	}

	public User findByEmail(String email) {
		try
		{
			connectToDB() ;
			System.out.println("findByEmail email:-"+email);
			String qry="select * from `user` where `email`='"+email+"';";

			System.out.println("findByEmail qry:-"+qry);
			PreparedStatement statement = connection.prepareStatement(qry) ;
			ResultSet resultSet = statement.executeQuery() ;
			if(resultSet.next()) {
				User user = new User() ;
				user.setUserId(resultSet.getInt("user_id")) ;
				user.setEmail(resultSet.getString("email")) ;
				user.setPassword(resultSet.getString("password")) ;
				user.setMobileNum(resultSet.getString("mobile_num")) ;
				user.setName(resultSet.getString("user_name")) ;
				user.setAddress(resultSet.getString("address")) ;
				user.setPincode(resultSet.getString("pincode"));
				user.setUserType(resultSet.getInt("user_type")) ;
				return user;
			}
			else return null;
		}
		catch(SQLException e) {
			e.printStackTrace(); return null;
		}
		finally {
			closeDBconnection() ;
		}
		/*users = findAllUsers() ;
		for(User user : users) {
			if(user.getEmail().equals(email)) {
				System.out.println("Inside findByEmail in UserServiceImpl method and email found...! user:"+user.getName()+" and email:"+user.getEmail());
				return user ;
			}
		}*/
	}
	
	/*public User findByemail(String email) {
		if(email==null)
		{
			System.out.println("There is no email id sent...");
			return null;
		}
		System.out.println(" Still finding...");
		for(User user : users){
			if(user.getEmail().equalsIgnoreCase(email)){
				System.out.println("Inside findByEmail method and email found...! user:"+user.getName()+" and email:"+user.getUserId());
				return user;
			}
		}
		return null;
	}*/
	
	//String loginQuery = "select * from user where user_id=? and password=?;";
	/*
	 * admin@pizzawale.com 		admin
	 * dhruvin@gmail.com 		dhruvin
	 * dhruvin@pizzawale.com 	dhruvin
	 * employee@pizzawale.com	emp
	 * tommy@gmail.com			t
	 * */
	public User validateLogin(User user)
	{
		User loginUser = new User();
		User nullLoginUser = new User();
		System.out.println("inside validatLogin() function...:-"+user);
		try {
			connectToDB() ;
			String loginQuery = "select * from `user` where `email`=? and `password`=?;";
			
			PreparedStatement statement = connection.prepareStatement(loginQuery) ;
			String email =  user.getEmail();
			String password = user.getPassword();
			System.out.println("User Email:-"+email+" & password:-"+password);
			statement.setString(1,email);
			statement.setString(2, getHash(password));
			System.out.println(statement);
			ResultSet resultSet = statement.executeQuery() ;
			if(resultSet.next()) 
			{
				loginUser = findByEmail(user.getEmail());
				System.out.println("Success!");
				//return loginUser;
				return loginUser;
			}
			else
			{
				System.out.println("Failure!");
				//return nullLoginUser;
				return null;
			}
		}
		catch(SQLException e) {
			e.printStackTrace(); return null;
		}
		finally {
			closeDBconnection() ;
		}
	}
	
	public ArrayList<User> findAllUsers() {
		connectToDB() ;
		users = new ArrayList<User>();
		try {
			String query = "SELECT * from user" ;
			PreparedStatement statement = connection.prepareStatement(query) ;
			ResultSet resultSet = statement.executeQuery() ;
			while(resultSet.next()) {
				User user = new User() ;
				user.setUserId(resultSet.getInt("user_id")) ;
				user.setEmail(resultSet.getString("email")) ;
				user.setPassword(resultSet.getString("password")) ;
				user.setMobileNum(resultSet.getString("mobile_num")) ;
				user.setName(resultSet.getString("user_name")) ;
				user.setAddress(resultSet.getString("address")) ;
				user.setPincode(resultSet.getString("pincode"));
				user.setUserType(resultSet.getInt("user_type")) ;
				users.add(user) ;
			}
		}
		catch(Exception e) {
			e.printStackTrace() ;
		}
		finally {
			closeDBconnection() ;
		}
		return users ;
	}

	//@Override
	public int saveUser(User user) {
		System.out.println(user);
		try {
			connectToDB() ;
			
			Statement stmt = connection.createStatement() ;
			String query = "insert into user (email, user_name, address, password, mobile_num , user_type, pincode) values ('"+ user.getEmail()+"','"+ 
							user.getName()+"','"+user.getAddress() +"','"+ getHash(user.getPassword())+"','"+
							user.getMobileNum()+"','"+3+"','"+user.getPincode()+"');" ;
			System.out.println("saveUser Query:- "+query) ;
			int returned = stmt.executeUpdate(query) ;
			if(returned == 1) 
			{
				/*users.add(user) ;*/
				System.out.println("saveUser function added data successfully and returned value:- "+returned);
			}
			return returned ;
		}
		catch(SQLException e) {
			e.printStackTrace() ; return 0 ;
		}
		finally {
			closeDBconnection() ;
		}
		
	}
	
	public String getHash(String password)
	{
		String passwordToHash = password;
        String generatedPassword = null;
        try {
            // Create MessageDigest instance for MD5
            MessageDigest md = MessageDigest.getInstance("MD5");
            //Add password bytes to digest
            md.update(passwordToHash.getBytes());
            //Get the hash's bytes
            byte[] bytes = md.digest();
            //This bytes[] has bytes in decimal format;
            //Convert it to hexadecimal format
            StringBuilder sb = new StringBuilder();
            for(int i=0; i< bytes.length ;i++)
            {
                sb.append(Integer.toString((bytes[i] & 0xff) + 0x100, 16).substring(1));
            }
            //Get complete hashed password in hex format
            generatedPassword = sb.toString();
        }
        catch (NoSuchAlgorithmException e)
        {
            e.printStackTrace();
        }
        System.out.println(">>>>>generatedPassword:-"+generatedPassword);
        return generatedPassword;
	}

}

