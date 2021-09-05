package com.springmvc.service;



import com.springmvc.model.Order;
import com.springmvc.model.OrderItem;
import com.springmvc.model.Orders;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;


public interface OrderService {
	
	public List<OrderItem> saveOrder(Map<Integer, Integer> orderList, String email) ;
	public int getItemPrice(int itemId);
	public String getItemName(int itemId);
	public int setOrder(Order order);
	public int setOrderTotal(Order order, int orderId);
	public int setOrderItem(OrderItem orderItem, int itemId, int OrderId);
	public int setPayment(int paymentMode);
	public List<OrderItem> getOrderItems();
	
	public int updateOrder(OrderItem orderItem);
	public String printOrder(OrderItem orderItem);
	public int submitOrder(OrderItem orderItem) ;
	public OrderItem getOrderItem(OrderItem orderItem);
	String printOrder(List<String> orderItem);
	
	List<Orders> getAllOrders();
}