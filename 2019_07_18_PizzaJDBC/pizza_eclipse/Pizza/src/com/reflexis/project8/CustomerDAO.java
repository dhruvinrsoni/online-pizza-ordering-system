package com.reflexis.project8;

import java.util.ArrayList;

public interface CustomerDAO {
	public ArrayList<Customer> getAllCustomers();
	public int addCustomer(Customer cust);
}
