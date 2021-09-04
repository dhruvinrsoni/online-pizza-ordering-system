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

import com.springmvc.model.Item;

import com.springmvc.service.*;
import com.springmvc.model.User;

import com.springmvc.service.UserService;

import java.text.DateFormat;
import java.text.SimpleDateFormat;



@Service(value = "ItemService")
@Transactional
public class ItemServiceimpl implements ItemService {
	
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
	public List<Item> getItemsFromDB()
	{
		List<Item> nullItemList = new ArrayList<Item>();
		List<Item> itemList = new ArrayList<Item>();
		
		try
		{
			int itemPrice=0;
			connectToDB() ;
			Statement stmt = connection.createStatement();
			
			String getItemsQuery =  "select * from items;" ;
			System.out.println("Select  Query of getItems:- "+getItemsQuery) ;
			Statement statement = connection.createStatement();
			ResultSet resultSet = statement.executeQuery(getItemsQuery) ;
			while(resultSet.next()){
					Item item = new Item();
					item.setItemId(resultSet.getInt("item_id"));
					item.setItemName(resultSet.getString("item_name"));
					item.setPrice(resultSet.getInt("item_price"));
					item.setItemType(resultSet.getInt("item_type"));
					item.setIsVeg(resultSet.getInt("isVeg"));
					item.setDescription(resultSet.getString("description"));
					item.setImageUrl(resultSet.getString("image_url"));
					
					itemList.add(item);
				}
			
			return itemList;
			
		}catch(SQLException e) {
			e.printStackTrace() ; return nullItemList ;
		}
		finally {
			closeDBconnection() ;
		}
		
	}


}

