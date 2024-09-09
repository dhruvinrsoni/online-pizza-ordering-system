package com.reflexis.project8;

public class Customer {

	/**
	 * @param args
	 */
	private int custID=0;
	private String custName="";
	private String custAddr="";
	private String username="";
	private int number=0;
	private int pincode=0;
	
	public Customer(int custID, String custName, String custAddr,
			String username, int number, int pincode) {
		super();
		this.custID = custID;
		this.custName = custName;
		this.custAddr = custAddr;
		this.username = username;
		this.number = number;
		this.pincode = pincode;
	}
	
	public int getCustID() {
		return custID;
	}
	public void setCustID(int custID) {
		this.custID = custID;
	}
	public String getCustName() {
		return custName;
	}
	public void setCustName(String custName) {
		this.custName = custName;
	}
	public String getCustAddr() {
		return custAddr;
	}
	public void setCustAddr(String custAddr) {
		this.custAddr = custAddr;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public int getNumber() {
		return number;
	}
	public void setNumber(int number) {
		this.number = number;
	}
	public int getPincode() {
		return pincode;
	}
	public void setPincode(int pincode) {
		this.pincode = pincode;
	}
	
	
	
}
