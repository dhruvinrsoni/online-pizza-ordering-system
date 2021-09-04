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

import com.springmvc.model.Item;
import com.springmvc.model.User;

import com.springmvc.service.ItemService;


import org.springframework.http.MediaType;

@RestController
public class ItemController {
	    
    //create new order
    
    @Autowired
	ItemService itemService ;
	
    @RequestMapping(value="/items", method=RequestMethod.GET,  produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<List<Item>> getItems(HttpServletRequest req) {
		System.out.println("Inside getItems Controller") ;
		
		List<Item> items= itemService.getItemsFromDB() ;
		HttpHeaders headers = new HttpHeaders() ;
		HttpSession session= req.getSession();
		User user =(User)session.getAttribute("email");
		
		
		//System.out.println(item + " " ) ;
		if(items !=null) {
			return new ResponseEntity<List<Item>>(items, HttpStatus.CREATED) ;
		}
		else {
			return new ResponseEntity<List<Item>>(items ,HttpStatus.CONFLICT) ;
		}
	}
}
    