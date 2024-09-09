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
	public ResponseEntity<Order> createOrder(@RequestBody Order order, HttpServletRequest req) {
		System.out.println("Inside create Order Controller") ;
		HttpSession session= req.getSession();
		User user =(User)session.getAttribute("email");
		
		
		int returned = orderService.saveOrder(order) ;
		HttpHeaders headers = new HttpHeaders() ;
		System.out.println("order object:-"+order + " & return value:-" + returned) ;
		if(returned == 1) {
			return new ResponseEntity<Order>(order, HttpStatus.CREATED) ;
			
    		
		}
		else {
			return new ResponseEntity<Order>(order ,HttpStatus.CONFLICT) ;
		}
	}
    
    
	
    @RequestMapping(value="/updateorder", method=RequestMethod.POST,  produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<Order> updateOrder(@RequestBody Order order, HttpServletRequest req) {
		System.out.println("Inside update Order Controller") ;
		
		int returned = orderService.updateOrder(order) ;
		HttpHeaders headers = new HttpHeaders() ;
		HttpSession session= req.getSession();
		User user =(User)session.getAttribute("email");
		
		
		System.out.println(order + " " + returned) ;
		if(returned == 1) {
			return new ResponseEntity<Order>(order, HttpStatus.CREATED) ;
		}
		else {
			return new ResponseEntity<Order>(order ,HttpStatus.CONFLICT) ;
		}
	}
    
    @RequestMapping(value="/submit", method=RequestMethod.POST,  produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<Order> submitOrder(@RequestBody Order order, HttpServletRequest req) {
		System.out.println("Inside submit Order Controller") ;
		HttpSession session= req.getSession();
		User user =(User)session.getAttribute("email");
		
		
		int returned = orderService.submitOrder(order) ;
		HttpHeaders headers = new HttpHeaders() ;
		System.out.println(order + " " + returned) ;
		if(returned == 1) {
			return new ResponseEntity<Order>(order, HttpStatus.CREATED) ;
			
    		
		}
		else {
			return new ResponseEntity<Order>(order ,HttpStatus.CONFLICT) ;
		}
	}

}
