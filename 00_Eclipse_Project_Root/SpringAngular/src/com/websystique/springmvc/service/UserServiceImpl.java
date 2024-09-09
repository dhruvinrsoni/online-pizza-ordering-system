package com.websystique.springmvc.service;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.atomic.AtomicLong;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.io.*;
import java.util.*;
import java.sql.*;
import javax.sql.*;
import javax.naming.*;
import java.util.*;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.websystique.springmvc.model.User;

@Service("userService")
@Transactional
public class UserServiceImpl implements UserService{

	private static final AtomicLong counter = new AtomicLong();

	private static List<User> users;

	private java.sql.Connection conn = null;

	//			private java.sql.Connection conn = null;
	String url = "jdbc:mysql://localhost:3306/";
	String dbName = "user";
	String driver = "com.mysql.jdbc.Driver";
	String userName = "root";
	String password = "root";
	String strQuery= "";
	Statement pst = null;
	//PreparedStatement pst=null;
	ResultSet rst=null;

	//PreparedStatement pst=null;
	//	ResultSet rst=null;



	private void connectToDB()
	{
		try
		{
			Class.forName(driver).newInstance();
			conn = DriverManager.getConnection(url+dbName,userName,password);
		}
		catch (Exception ex)
		{

			System.out.println("CandidateSchemeDAO Error: could not connect to db");
			System.out.println("- Exception: " + ex.toString());
		}
	}

	public void closeDBConn()
	{
		try
		{
			if (!conn.isClosed())
				conn.close();
		}
		catch (Exception ex)
		{

			System.out.println("- Exception: " + ex.toString());
		}
	}


	static{
		users= populateDummyUsers();
		//users=findAllUsers();
	}

	public List<User> findAllUsers() {

		connectToDB();
		User u =null;
		List<User> users = new ArrayList<User>();
		try
		{
			//StringBuffer query=null;

			//         String query = new StringBuffer("select * from user_details");
			String query ="select * from user_details";
			//pst=conn.prepareStatement(query.toString());
			pst = conn.createStatement();
			rst = pst.executeQuery(query);

			while(rst.next())
			{
				u = new User();
				u.setId(rst.getInt("id"));
				System.out.println("aaaaaaa"+u.getId());
				
				u.setUserId(rst.getString("user_id"));
				u.setPassword(rst.getString("pwd"));
				u.setFirstName(rst.getString("first_name"));
				u.setLastName(rst.getString("last_name"));

				u.setUsername(rst.getString("username"));
				u.setAddress(rst.getString("address"));
				u.setEmail(rst.getString("email"));
				users.add(u);
				System.out.println("list is =>>>>"+users);
			}
			//users.add(u);
			//System.out.println("list is =>>>>"+users);
			//return users;
		}
		catch(Exception e)
		{
			System.out.println("iiiiiiiiiiiiiiiii");
			e.printStackTrace();
		}
		finally
		{
			//rst.close();
			//pst.close();
			closeDBConn();
		}

		return users;
	}

	public User findByUserId(String uid) {
		
		System.out.println("users.size(): " + users.size());
		List<User> users = this.findAllUsers();

		for(User user : users){
			if(user.getUserId().trim().equals(uid.trim())) {
				return user;
			}
		}
		return null;
	}
	
	public User findById(long id) {
		for(User user : users){
			if(user.getId() == id){
				return user;
			}
		}
		return null;
	}

	public User findByName(String name) {
		for(User user : users){
			if(user.getUsername().equalsIgnoreCase(name)){
				return user;
			}
		}
		return null;
	}

	public void saveUser(User user) {
		
		user.setId(counter.incrementAndGet());
		String uname = user.getUsername();
		System.out.println("name is "+uname);

		String query ="insert into user_details (username,address,email) values ('"+ user.getUsername()+"','"+ user.getAddress()+"','"+ user.getEmail()+"')";
		
		try {
			connectToDB();
			
			int r;
			Statement st = null;
			st = conn.createStatement();
			r = st.executeUpdate(query);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally
		{
			//rst.close();
			//pst.close();
			closeDBConn();
		}
		

		users.add(user);
	}

	public void updateUser(User user) {
		long id = user.getId();
		int index = users.indexOf(user);
		users.set(index, user);
		String query ="update user_details set username='"+ user.getUsername()+"', address='"+ user.getAddress()+"', email='"+ user.getEmail()+"' where id="+id;
		try {
			connectToDB();
			
			int r;
			Statement st = null;
			st = conn.createStatement();
			r = st.executeUpdate(query);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally
		{
			//rst.close();
			//pst.close();
			closeDBConn();
		}
	}

	public void deleteUserById(long id) {

//		for (Iterator<User> iterator = users.iterator(); iterator.hasNext(); ) {
//			User user = iterator.next();
//			if (user.getId() == id) {
//				iterator.remove();
//			}
//		}
		String query ="delete from user_details where id="+id;
		try {
			connectToDB();
			
			int r;
			Statement st = null;
			st = conn.createStatement();
			r = st.executeUpdate(query);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally
		{
			//rst.close();
			//pst.close();
			closeDBConn();
		}
		
	}

	public boolean isUserExist(User user) {
		return findByName(user.getUsername())!=null;
	}

	public void deleteAllUsers(){
		users.clear();
	}

	private static List<User> populateDummyUsers(){
		System.out.println("i am in DummyUsers Method");
		List<User> users = new ArrayList<User>();
		System.out.println("i am in Dummy Users Method after");
		UserServiceImpl u = new UserServiceImpl();
		users = u.findAllUsers();
		//users.add(new User(counter.incrementAndGet(),"Sam", "NY", "sam@abc.com"));
		//users.add(new User(counter.incrementAndGet(),"Tomy", "ALBAMA", "tomy@abc.com"));
		//users.add(new User(counter.incrementAndGet(),"Kelly", "NEBRASKA", "kelly@abc.com"));
		return users;
	}

}
