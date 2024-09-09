package com.springmvc.service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.UsesJava7;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.springmvc.model.Order;
import com.springmvc.model.OrderItem;

import com.springmvc.model.User;

import com.springmvc.service.UserService;



@Service("OrderService")
@Transactional
public class OrderServiceimpl implements OrderService {
	
	private static ArrayList<Order> orders;
	private static ArrayList<OrderItem> orderItems;
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
		}
		catch(Exception e) {
			System.out.println("Could not connect to the database !" + e.toString()) ;
		}
	}

	
	private void closeDBconnection() {
		try {
			System.out.println("Closing the connection with DB...");
			if(!connection.isClosed()) {
				connection.close() ;
				System.out.println("DB Connection closed...!");
			}
		}
		catch(Exception e) {
			System.out.println("Could not close the database !" + e.toString()) ;
		}
	}
	
	@Autowired
	UserService userService ;
	
	public OrderItem getOrderItem(OrderItem orderItem)
	{
		return orderItem;
	}
	
	@Override
	public int saveOrder(Order order) {
		System.out.println("inside saveOrder of orderServiceImpl...");
		//delete
		System.out.println("order object:- "+order);
		//String str = printOrder(order);
		System.out.println("Ordered items are:- "+str);
		//order.setOrderItem(str);
		String email = order.getEmail();
		System.out.println("user's email id:- "+email);
		User user = new User();
		user = userService.findByEmail(email);
		System.out.println("user email from User Service:- "+user);
		order.setAddress(user.getAddress());
		order.setName(user.getName());
		order.setMobileNum(user.getMobileNum());
		
		orderItems= new ArrayList<OrderItem>();
		
		
		try {
			//'"+ order.getOrderid()+"',
			connectToDB() ;
			Statement stmt = connection.createStatement() ;
			String query1 = "insert into orderinfo1 ( email, address, mobile, total, name , ordereditems) values ('"+
					order.getEmail()+"','"+user.getAddress() +"','"+ user.getMobileNum()+"','"+totalAmt+"' ,'"+ user.getName()+"','"+ str+"');" ;
	System.out.println("Insert Query to orderinfo:- "+query1) ;
	stmt.executeUpdate(query1) ;

			
			
			String query = "insert into cart ( Email, Margherita, DCMargherita, Farmhouse, DeluxeVeggie , MexGW, PeppyPan) values ('"+ order.getEmail()+"','"+
							order.getMargherita()+"','"+order.getDCMargherita() +"','"+ order.getFarmhouse()+"','"+ order.getDeluxeVeggie()+"','"+ order.getMexGW()+"','"+ order.getPeppyPan()+"');" ;
			System.out.println(query) ;
			int returned = stmt.executeUpdate(query) ;
			if(returned == 1) orders.add(order) ;
			return returned ;
		}
		catch(SQLException e) {
			e.printStackTrace() ; return 0 ;
		}
		finally {
			closeDBconnection() ;
		}
		
}}

