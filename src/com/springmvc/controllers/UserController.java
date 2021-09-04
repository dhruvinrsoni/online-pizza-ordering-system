package com.springmvc.controllers;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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


import com.springmvc.model.User;

import com.springmvc.service.UserService;



import org.springframework.http.MediaType;

@RestController
public class UserController {
	
	@Autowired
	UserService userService ;
	
	@RequestMapping(value="/register", method=RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<User> createUser(@RequestBody User user) {
		System.out.println("Inside User Controller: createUser method...") ;
		if(userService.doesUserExist(user)) {
			System.out.println("A user with email id " + user.getEmail() + " already exist!") ;
			return new ResponseEntity<User>(user,HttpStatus.CONFLICT) ;
		}
		int returned = userService.saveUser(user) ;
		HttpHeaders headers = new HttpHeaders() ;
		System.out.println("user object:-"+user + " & return value:-" + returned) ;
		if(returned == 1) {
			return new ResponseEntity<User>(user, HttpStatus.CREATED) ;
		}
		else {
			return new ResponseEntity<User>(user ,HttpStatus.CONFLICT) ;
		}
	}
	
	 //-------------------Retrieve Single User--------------------------------------------------------
    
   
    @RequestMapping(value = "/user/login", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<User> getUser(@RequestBody User user,HttpServletRequest req ) 
    {
        System.out.println("inside getUser for login: Fetching User with Email " + user.getEmail());
        boolean sql=true;
        if(sql)
        {
        	//SQL Injection proof
        	 //int returnVal=userService.validateLogin(user);
        	 User dbUser=userService.validateLogin(user);
        	 System.out.println("dbUser is:-"+dbUser);
             if(dbUser!=null)
             {
             	HttpSession session= req.getSession();
         		session.setAttribute("user", dbUser);
         		System.out.println("UserController.java: getUser: User password correct.!");
         		return new ResponseEntity<User>(dbUser, HttpStatus.OK);
             }
             else
             {
             	System.out.println("User passwrod incorrect.!");
        		 	return new ResponseEntity<User>(HttpStatus.FORBIDDEN);
             }
        }
        else
        {
        	//Potential to SQL Injection
        	User user1 = userService.findByEmail(user.getEmail());
            if (user1 == null) {
                System.out.println("User with Email " + user.getEmail() + " not found");
                return new ResponseEntity<User>(HttpStatus.NOT_FOUND);
            }
            else {
            	System.out.println("User with Email " + user.getEmail() + " found..!");
            
            	if (user1.getPassword().equals(user.getPassword())){ 
            		
            		HttpSession session= req.getSession();
            		session.setAttribute("email", user);
            		
            		return new ResponseEntity<User>(user, HttpStatus.OK);
            	}
            	else {
            		System.out.println("User password incorrect.!");
            		 return new ResponseEntity<User>(HttpStatus.FORBIDDEN);
            	}
            }

            //User loginUser = new User();
        }
    }
    
	
	@RequestMapping(value="/logout", method=RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<User> logout(HttpServletRequest req,HttpServletResponse res ) throws IOException 
	{
		System.out.println("Inside User Controller: logout method...") ;
		int returned = 1;
		HttpSession session= req.getSession();
 		session.removeAttribute("user");
 		session.invalidate();
		User user = new User();
		System.out.println("Logout method -> Successful...") ;
		//res.sendRedirect(req.getContextPath() + "/#/");
		//doGet(req, res);
 		return new ResponseEntity<User>(user, HttpStatus.OK) ;
	}

    
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException{
	    resp.sendRedirect(req.getContextPath() + "/#/");
	}

}
