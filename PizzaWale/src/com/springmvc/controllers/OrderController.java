package com.springmvc.controllers;

import java.util.ArrayList;
import java.util.List;

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
	public ResponseEntity<List<OrderItem>> createOrder(@RequestBody String[] orderList, HttpServletRequest req) {
		System.out.println("Inside create Order Controller.java") ;
		HttpSession session= req.getSession();
		User user =(User)session.getAttribute("email");

		System.out.println("Order orderList is:"+orderList);
		//int returned = orderService.saveOrder(orderList) ;
		
		HttpHeaders headers = new HttpHeaders() ;
		System.out.println(orderList + " ") ;
		Order order = new Order();
		List<OrderItem> orderItems = new ArrayList<OrderItem>();
		orderItems = orderService.saveOrder(orderList) ;
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
