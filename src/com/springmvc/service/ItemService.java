package com.springmvc.service;



import com.springmvc.model.Item;
import java.util.ArrayList;
import java.util.List;


public interface ItemService {
	
	//public List<OrderItem> saveOrder(String[] orderList) ;
	//public int getItemPrice(int itemId);
	//public String getItemName(int itemId);
	//public int setOrder(Order order);
	//public int setOrderTotal(Order order, int orderId);
	//public int setOrderItem(OrderItem orderItem, int itemId, int OrderId);
	//public int setPayment(int paymentMode);
	public List<Item> getItemsFromDB();
	
	/*public int updateOrder(OrderItem orderItem);
	public String printOrder(OrderItem orderItem);
	public int submitOrder(OrderItem orderItem) ;
	public OrderItem getOrderItem(OrderItem orderItem);
	String printOrder(List<String> orderItem);*/
	
	
}