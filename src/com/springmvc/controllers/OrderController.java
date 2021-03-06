package com.springmvc.controllers;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.springmvc.model.Order;
import com.springmvc.model.OrderItem;
import com.springmvc.model.Orders;
import com.springmvc.model.User;

import com.springmvc.service.OrderService;
import com.springmvc.controllers.UserController;


import org.springframework.http.MediaType;

@RestController
public class OrderController {
	    
    //create new order
    
    @Autowired
	OrderService orderService ;
	
    @RequestMapping(value="/order", method=RequestMethod.POST,  produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<List<OrderItem>> createOrder(@RequestBody Map<Integer, Integer> orderList, HttpServletRequest req) {
		System.out.println("Inside create Order Controller.java") ;
		HttpSession session= req.getSession();
		Object emailObj = req.getAttribute("email");
		User user =(User)session.getAttribute("email");

		System.out.println("Order orderList is:"+orderList);
		//int returned = orderService.saveOrder(orderList) ;
		String email=req.getHeader("email");
		HttpHeaders headers = new HttpHeaders() ;
		System.out.println(orderList + " ") ;
		Order order = new Order();
		List<OrderItem> orderItems = new ArrayList<OrderItem>();
		orderItems = orderService.saveOrder(orderList, email) ;
		System.out.println("Printing the orderItems list.................");
		System.out.println(orderItems);
		/*if(returned == 1) {
			return new ResponseEntity<Order>(order, HttpStatus.CREATED) ;
			
    		
		}
		else {
			return new ResponseEntity<Order>(order ,HttpStatus.CONFLICT) ;
		}*/
		if(orderItems != null) {
			return new ResponseEntity<List<OrderItem>>(orderItems, HttpStatus.CREATED) ;
			
    		
		}
		else {
			return new ResponseEntity<List<OrderItem>>(orderItems ,HttpStatus.CONFLICT) ;
		}
	}
    @RequestMapping(value="/orders", method=RequestMethod.GET,  produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<List<Orders>> getOrders(HttpServletRequest req) {
    	System.out.println("Inside create Order Controller.java") ;
    	HttpSession session= req.getSession();
    	Object emailObj = req.getAttribute("email");
    	User user =(User)session.getAttribute("email");
    	
    	
    	//int returned = orderService.saveOrder(orderList) ;
    	String email=req.getHeader("email");
    	HttpHeaders headers = new HttpHeaders() ;
    	
    	Order order = new Order();
    	List<Orders> orders = new ArrayList<Orders>();
    	orders = orderService.getAllOrders();
    	System.out.println("Printing the orders list.................");
    	System.out.println(orders);
    	/*if(returned == 1) {
			return new ResponseEntity<Order>(order, HttpStatus.CREATED) ;
			
    		
		}
		else {
			return new ResponseEntity<Order>(order ,HttpStatus.CONFLICT) ;
		}*/
    	if(orders != null) {
    		return new ResponseEntity<List<Orders>>(orders, HttpStatus.CREATED) ;
    		
    		
    	}
    	else {
    		return new ResponseEntity<List<Orders>>(orders ,HttpStatus.CONFLICT) ;
    	}
    }
    

    @RequestMapping(value="/orderitems", method=RequestMethod.POST,  produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<List<OrderItem>> getOrderItems(@RequestBody OrderItem orderItem, HttpServletRequest req) {
		System.out.println("Inside getOrderItems Controller") ;
		
		List<OrderItem> orderItems= orderService.getOrderItems() ;
		HttpHeaders headers = new HttpHeaders() ;
		HttpSession session= req.getSession();
		User user =(User)session.getAttribute("email");
		
		
		System.out.println(orderItem + " " ) ;
		if(orderItems !=null) {
			return new ResponseEntity<List<OrderItem>>(orderItems, HttpStatus.CREATED) ;
		}
		else {
			return new ResponseEntity<List<OrderItem>>(orderItems ,HttpStatus.CONFLICT) ;
		}
	}
    
	
    @RequestMapping(value="/updateorder", method=RequestMethod.POST,  produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<Order> updateOrder(@RequestBody OrderItem orderItem, HttpServletRequest req) {
		System.out.println("Inside update Order Controller") ;
		
		int returned = orderService.updateOrder(orderItem) ;
		HttpHeaders headers = new HttpHeaders() ;
		HttpSession session= req.getSession();
		User user =(User)session.getAttribute("email");
		
		
		System.out.println(orderItem + " " + returned) ;
		if(returned == 1) {
			return new ResponseEntity<Order>(orderItem, HttpStatus.CREATED) ;
		}
		else {
			return new ResponseEntity<Order>(orderItem ,HttpStatus.CONFLICT) ;
		}
	}
    
    @RequestMapping(value="/submit", method=RequestMethod.POST,  produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<Order> submitOrder(@RequestBody OrderItem orderItem, HttpServletRequest req) {
		System.out.println("Inside submit Order Controller") ;
		HttpSession session= req.getSession();
		User user =(User)session.getAttribute("email");
		
		
		int returned = orderService.submitOrder(orderItem) ;
		HttpHeaders headers = new HttpHeaders() ;
		System.out.println(orderItem + " " + returned) ;
		if(returned == 1) {
			return new ResponseEntity<Order>(orderItem, HttpStatus.CREATED) ;
			
    		
		}
		else {
			return new ResponseEntity<Order>(orderItem ,HttpStatus.CONFLICT) ;
		}
	}

}
