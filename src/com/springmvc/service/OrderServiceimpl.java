package com.springmvc.service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.UsesJava7;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.springmvc.model.Order;
import com.springmvc.model.OrderItem;

import com.springmvc.model.User;

import com.springmvc.service.*;
import com.springmvc.service.UserService;

import java.text.DateFormat;
import java.text.SimpleDateFormat;



@Service(value = "OrderService")
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
	
	//@Override
	public int getItemPrice(int itemId)
	{
		try
		{
			int itemPrice=0;
			connectToDB() ;
			Statement stmt = connection.createStatement();
			
			String getPriceQuery =  "select item_price from items where item_id='"+itemId+"';" ;
			System.out.println("Select  Query of getItemPrice:- "+getPriceQuery) ;
			Statement statement = connection.createStatement();
			ResultSet resultSet = statement.executeQuery(getPriceQuery) ;
			if(resultSet.next()){
				itemPrice=resultSet.getInt("item_price");
				}
			
			return itemPrice;
			
		}catch(SQLException e) {
			e.printStackTrace() ; return 0 ;
		}
		finally {
			closeDBconnection() ;
		}
	}
	
	//@Override
	public String getItemName(int itemId)
	{
		try
		{
			String itemName="";
			connectToDB() ;
			Statement stmt = connection.createStatement();
			
			String getPriceQuery =  "select item_name from items where item_id='"+itemId+"';" ;
			System.out.println("Insert Query to getItemName:- "+getPriceQuery) ;
			Statement statement = connection.createStatement();
			ResultSet resultSet = statement.executeQuery(getPriceQuery) ;
			if(resultSet.next()){
				itemName=resultSet.getString("item_name");
				}
			return itemName;
			
		}catch(SQLException e) {
			e.printStackTrace() ; return null ;
		}
		finally {
			closeDBconnection() ;
		}
	}
	

	//@Override
	public int setOrderItem(OrderItem orderItem, int itemId, int orderId)
	{
		try
		{
			//java.sql.Timestamp ts = new java.sql.Timestamp(new Date().getTime());
			connectToDB() ;
			
			Statement statement = connection.createStatement() ;
			String insertQuery = "insert into `orderitem` ( item_id, quantity, order_id, subtotal) values ("+itemId+", "+orderItem.getQty()+", "+orderId+", "+orderItem.getSubTotal()+");";
			System.out.println("Insert Query to setOrder:- "+insertQuery) ;
			int returnValue=statement.executeUpdate(insertQuery) ;
			if(returnValue==1)
			{
				return returnValue;
			}
			else
			{
				return 0;
			}
		
			
		}catch(SQLException e) {
			e.printStackTrace() ; return 0 ;
		}
		finally {
			closeDBconnection() ;
		}
	}
	
	//@Override
	public int setPayment(int paymentMode)
	{
		try
		{
			int paymentId=0;
			//java.sql.Timestamp ts = new java.sql.Timestamp(new Date().getTime());
			connectToDB() ;
			java.sql.Timestamp sqlTs = new Timestamp(new Date().getTime());
			Statement statement = connection.createStatement() ;
			String insertQuery = "insert into `payment` ( payment_mode, payment_time ) values ("+paymentMode+", "+sqlTs+");";
			System.out.println("Insert Query to setPayment:- "+insertQuery) ;
			int returnValue=statement.executeUpdate(insertQuery) ;
			if(returnValue==1)
			{
				Statement stmt = connection.createStatement();
				String getPaymentIdQuery =  "select `payment_id` from `payment` where payment_time='"+sqlTs+"';" ;
				System.out.println("Select Query to setPayment:- "+getPaymentIdQuery) ;
				ResultSet resultSet = statement.executeQuery(getPaymentIdQuery) ;
				if(resultSet.next())
				{
					paymentId=resultSet.getInt("order_id");
				}
				return paymentId;
			}
			else
			{
				return 0;
			}
		
			
		}catch(SQLException e) {
			e.printStackTrace() ; return 0 ;
		}
		finally {
			closeDBconnection() ;
		}
	}
	
	//@Override
	public int setOrder(Order order)
	{
		try
		{
			int orderId=0;
			//java.sql.Timestamp ts = new java.sql.Timestamp(new Date().getTime());
			connectToDB() ;
			//int paymentId=setPayment(1);
			Statement statement = connection.createStatement() ;
			String insertQuery = "insert into `order` ( order_email, order_address, order_name, order_pincode, order_mobile, payment_id) values ('"+order.getOrderEmail()+"', '"+order.getOrderAddresss()+"', '"+order.getOrderName()+"', '"+order.getOrderPinCode()+"', '"+order.getOrderMobile()+"', "+1+");";
			System.out.println("Insert Query to setOrder:- "+insertQuery) ;
			int returnValue=statement.executeUpdate(insertQuery) ;
			if(returnValue==1)
			{
				Statement stmt = connection.createStatement();
				String getOrderIdQuery =  "select `order_id` from `order` where order_email='"+order.getOrderEmail()+"' and order_total="+order.getOrdertotal()+" ;" ;
				System.out.println("Select Query to setOrder:- "+getOrderIdQuery) ;
				ResultSet resultSet = statement.executeQuery(getOrderIdQuery) ;
				if(resultSet.next())
				{
					orderId=resultSet.getInt("order_id");
				}
				return orderId;
			}
			else
			{
				return 0;
			}
		
			
		}catch(SQLException e) {
			e.printStackTrace() ; return 0 ;
		}
		finally {
			closeDBconnection() ;
		}
	}

	//@Override
	public int setOrderTotal(Order order, int orderId)
	{
		try
		{
			
			//java.sql.Timestamp ts = new java.sql.Timestamp(new Date().getTime());
			connectToDB() ;
			
			Statement statement = connection.createStatement() ;
			//String insertQuery = "insert into `order` ( order_total) values ("+order.getOrdertotal()+") where order_id="+orderId+";";
			String updateTotalQuery = "update `order` set `order_total` = "+order.getOrdertotal()+" where order_id="+orderId+";";
			System.out.println("updateTotalQuery Query to setOrderTotal:- "+updateTotalQuery) ;
			int returnValue=statement.executeUpdate(updateTotalQuery) ;
			if(returnValue==1)
			{
				/*Statement stmt = connection.createStatement();
				String getOrderIdQuery =  "select `order_id` from `order` where order_email='"+order.getOrderEmail()+"' and order_total="+order.getOrdertotal()+" ;" ;
				System.out.println("Select Query to setOrder:- "+getOrderIdQuery) ;
				ResultSet resultSet = statement.executeQuery(getOrderIdQuery) ;
				if(resultSet.next())
				{
					orderId=resultSet.getInt("order_id");
				}*/
				return returnValue;
			}
			else
			{
				return 0;
			}
		
			
		}catch(SQLException e) {
			e.printStackTrace() ; return 0 ;
		}
		finally {
			closeDBconnection() ;
		}
	}
	
	public static java.util.Date convertFromSQLDateToJAVADate(
            java.sql.Date sqlDate) {
        java.util.Date javaDate = null;
        if (sqlDate != null) {
            javaDate = new Date(sqlDate.getTime());
        }
        return javaDate;
    }
	

	public static java.sql.Date convertFromJAVADateToSQLDate(
            java.util.Date javaDate) {
        java.sql.Date sqlDate = null;
        if (javaDate != null) {
            sqlDate = (java.sql.Date) new Date(javaDate.getTime());
        }
        return sqlDate;
    }
	
	//@Override
	public List<OrderItem> saveOrder(String[] orderList) {
		System.out.println("inside saveOrder of orderServiceImpl...");
		//delete
		//List<OrderItem> orderItems =  (List<OrderItem>) new OrderItem();
		OrderItem orderItem2 = new OrderItem();
		List<OrderItem> nullOrderObj=new ArrayList<OrderItem>();
		Order order = new Order();
		List<OrderItem> orderItems=new ArrayList<OrderItem>();
		//java.sql.Date now = new java.sql.Date(System.currentTimeMillis());
		Date date = new Date();
		int subtotal=0, total=0, itemPrice=0;
		String itemName="";
		User user = new User();
		System.out.println("email is:-"+orderList[0]);
		if(userService.findByEmail(orderList[0])!=null)
		{
			user = userService.findByEmail(orderList[0]);
		}
		else
		{
			System.out.println("The email id field is null... Error...!");
			//return 0;
			return nullOrderObj;
		}
		
		order.setOrderTS(date);
		order.setOrderAddresss(user.getAddress());
		order.setOrderEmail(user.getEmail());
		order.setOrderMobile(user.getMobileNum());
		order.setOrderName(user.getName());
		order.setOrderPinCode(user.getPincode());
		int orderId=0;
		orderId=setOrder(order);
		if(orderId==0)
		{
			System.out.println("Setting the Order to DB has failed...!");
			//return 0;
			return nullOrderObj;
		}
		
		System.out.println("Length of orderList:- "+orderList.length);
		for(int i=1;i<orderList.length;i++)
		{
			System.out.println("\n-----------------------------------\norderList["+i+"]:-"+orderList[i]+" ");
			if(orderList[i]!=null)
			{
				OrderItem orderItem=new OrderItem();
				itemPrice=getItemPrice(i);
				System.out.println(" for i:"+i+" the itemPrice:-"+itemPrice);
				subtotal=Integer.parseInt(orderList[i])*itemPrice;
				total+=subtotal;
				itemName=getItemName(i);
				System.out.println(" for i:"+i+" the itemName:-"+itemName);
				
				orderItem.setItemName(itemName);
				orderItem.setSubTotal(subtotal);
				orderItem.setQty(Integer.parseInt(orderList[i]));
				orderItem.setPrice(itemPrice);
				
				setOrderItem(orderItem, i, orderId);
				System.out.println(orderItem.getItemName());
				orderItem.setOrderTS(date);
				orderItem.setOrderAddresss(user.getAddress());
				orderItem.setOrderEmail(user.getEmail());
				orderItem.setOrderMobile(user.getMobileNum());
				orderItem.setOrderName(user.getName());
				orderItem.setOrderPinCode(user.getPincode());
				orderItem.setOrdertotal(total);
				
				orderItems.add(orderItem);
				System.out.println(orderItem.getItemName());
			}
		}
		for(OrderItem o:orderItems){
			System.out.println(o.getItemName());
		}
		System.out.println("\n============================The object\n===============================\n");
		System.out.println(orderItems);
		order.setOrdertotal(total);
		int orderTotalReturn = setOrderTotal(order, orderId);
		if(orderTotalReturn==0)
		{
			System.out.println("Setting Order total failed...");
			return nullOrderObj;
		}
		/*orderItem.setOrderTS(date);
		orderItem.setOrderAddresss(user.getAddress());
		orderItem.setOrderEmail(user.getEmail());
		orderItem.setOrderMobile(user.getMobileNum());
		orderItem.setOrderName(user.getName());
		orderItem.setOrderPinCode(user.getPincode());
		orderItem.setOrdertotal(total);
		orderItems.add(orderItem);*/
		return orderItems;
		
		/*try {
			//'"+ order.getOrderid()+"',
			connectToDB() ;
			Statement stmt = connection.createStatement() ;
			String query1 = "insert into " ;
			System.out.println("Insert Query to orderinfo:- "+query1) ;
			stmt.executeUpdate(query1) ;

			String query = "" ;
			System.out.println(query) ;
			int returned = stmt.executeUpdate(query) ;
			if(returned == 1) orders.add((Order) orderItem) ;
			return returned ;
		}
		catch(SQLException e) {
			e.printStackTrace() ; return 0 ;
		}
		finally {
			closeDBconnection() ;
		}*/
		
	}
	
	//@Override
	public List<OrderItem> getOrderItems()
	{
		List<OrderItem> nullOrderItemList = new ArrayList<OrderItem>();
		List<OrderItem> orderItemList = new ArrayList<OrderItem>();
		
		try
		{
			int itemPrice=0;
			connectToDB() ;
			Statement stmt = connection.createStatement();
			
			String getPriceQuery =  "select * from items;" ;
			System.out.println("Select  Query of getOrderItems:- "+getPriceQuery) ;
			Statement statement = connection.createStatement();
			ResultSet resultSet = statement.executeQuery(getPriceQuery) ;
			if(resultSet.next()){
				itemPrice=resultSet.getInt("item_price");
				}
			
			return orderItemList;
			
		}catch(SQLException e) {
			e.printStackTrace() ; return nullOrderItemList ;
		}
		finally {
			closeDBconnection() ;
		}
		
	}

	//@Override
	public int updateOrder(OrderItem orderItem) {
		// TODO Auto-generated method stub
		return 0;
	}


	//@Override
	public String printOrder(List<String> orderItem) {
		// TODO Auto-generated method stub
		return null;
	}


	//@Override
	public int submitOrder(OrderItem orderItem) {
		// TODO Auto-generated method stub
		return 0;
	}


	//@Override
	public String printOrder(OrderItem orderItem) {
		// TODO Auto-generated method stub
		return null;
	}
	
	//@Override
	public OrderItem getOrderItem(OrderItem orderItem)
	{
		return orderItem;
	}
	
}

