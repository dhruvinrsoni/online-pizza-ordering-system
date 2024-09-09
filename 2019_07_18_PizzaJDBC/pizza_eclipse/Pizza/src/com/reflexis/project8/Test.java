package com.reflexis.project8;

public class Test {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		System.out.println("Hello World!");
		
		CustomerDAO custImplObj = new CustomerDAOImplementation();
		custImplObj.getAllCustomers();
		
		Customer cust=new Customer(5,"Shiva","Shiva Address","shiva",1472,1001);
		int result=custImplObj.addCustomer(cust);
		System.out.println("result of insert: "+result);
	}

}
