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

import com.springmvc.model.User;

import com.springmvc.service.UserService;



@Service("OrderService")
@Transactional
public class OrderServiceimpl implements OrderService {
	
	private static ArrayList<Order> orders;
	private Connection connection = null ;
	private String dB_URL = "jdbc:mysql://localhost:3306/" ;
	private String dB_name = "pizza" ;
	private String driver = "com.mysql.jdbc.Driver" ;
	private String userName = "root" ; 
	private String password = "root" ;
	private PreparedStatement statement = null ; 
	private ResultSet resultSet = null ;
 
	private void connectToDB() {
		System.out.println("Trying to connect to database.");
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
			if(!connection.isClosed()) {
				connection.close() ;
			}
		}
		catch(Exception e) {
			System.out.println("Could not close the database !" + e.toString()) ;
		}
	}
	
	@Autowired
	UserService userService ;
	
	@Override
	public int updateOrder(Order order) {

		
//		int index = users.indexOf(user);
//		users.set(index, user);
		String query ="update cart set Margherita='"+ order.getMargherita()+"', DCMargherita='"+
order.getDCMargherita()+"',Farmhouse='"+ order.getFarmhouse()+"',DeluxeVeggie='"+ 
order.getDeluxeVeggie()+"', MexGW='"+ order.getMexGW()+"',PeppyPan='"+ 
order.getPeppyPan();
		try {
			connectToDB();
			Statement stmt = connection.createStatement() ;
			System.out.println(query) ;
			int returned = stmt.executeUpdate(query) ;
			
			return returned ;
			
		}
		catch(SQLException e) {
			e.printStackTrace() ; return 0 ;
		}
		finally {
			closeDBconnection() ;
		}
		
		
	}
	


	@Override
	public int saveOrder(Order order) {
		orders= new ArrayList<Order>();
		System.out.println(order);
		String str = printOrder(order);
		System.out.println(str);
		order.setOrderItem(str);
		
		
		String email = order.getEmail();
		System.out.println(email);
		User user = new User();
		
		
		user = userService.findByEmail(email);
		System.out.println(user);
		order.setAddress(user.getAddress());
		order.setName(user.getName());
		order.setMobileNum(user.getMobileNum());
		
		
		try {
			//'"+ order.getOrderid()+"',
			connectToDB() ;
			Statement stmt = connection.createStatement() ;
			String query1 = "insert into orderinfo1 ( email, address, mobile, name , ordereditems) values ('"+
					order.getEmail()+"','"+user.getAddress() +"','"+ user.getMobileNum()+"','"+ user.getName()+"','"+ str+"');" ;
	System.out.println(query1) ;
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
		
	

	//	, DeluxeVeggie , MexGW, PeppyPan, NVSupreme, ChickTikka, ChicFiesta, PPChic, Chicsau
	}
//	','"+ order.getNVSupreme()+"','"+order.getChickTikka()+"','"+order.getChicFiesta()+"','"+order.getPPChic()+"','"+
//	order.getChicsau()
	@Override
	public String printOrder(Order order) {
	String s = "";
	if(order.getMargherita()!=0){
		s=s+order.getMargherita()+" Margherita Pizza,  ";
		}
	if(order.getDCMargherita()!=0){
		s=s+order.getDCMargherita()+" Double Cheese Margherita Pizza,  ";
		}
	if(order.getFarmhouse()!=0){
		s=s+order.getFarmhouse()+" FarmHouse Pizza,  ";
		}
	if(order.getDeluxeVeggie()!=0){
		s=s+order.getDeluxeVeggie()+" Deluxe Veggie Pizza,  ";
		}
	if(order.getMexGW()!=0){
		s=s+order.getMexGW()+" Mexican Green Wave Pizza,  ";
		}
	if(order.getPeppyPan()!=0){
		s=s+order.getPeppyPan()+" Peppy Panner Pizza";
		}
	return s;
	}
	
	@Override
	public int submitOrder(Order order){
		String email = order.getEmail();

		User user = userService.findByEmail(email);
		
		System.out.println(order);
		String str = printOrder(order);
		System.out.println(str);
	  
	    
		
		try {
			connectToDB() ;
			Statement stmt = connection.createStatement() ;
			
			
			String query = "insert into orderinfo1 ( email, address, mobile, name , ordereditems) values ('"+
							order.getEmail()+"','"+user.getAddress() +"','"+ user.getMobileNum()+"','"+ order.getDeluxeVeggie()+"','"+ user.getName()+"','"+ str+"');" ;
			System.out.println(query) ;
			int returned = stmt.executeUpdate(query) ;
		
			return returned ;
		}
		catch(SQLException e) {
			e.printStackTrace() ; return 0 ;
		}
		finally {
			closeDBconnection() ;
		}
		
	
	
	

}}

