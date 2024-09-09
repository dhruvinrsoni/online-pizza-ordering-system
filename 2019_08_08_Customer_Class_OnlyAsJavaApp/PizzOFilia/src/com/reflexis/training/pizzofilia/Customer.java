/**
 * 
 */
package com.reflexis.training.pizzofilia;

/**
 * @author dhruvin.soni
 *
 */
public class Customer {
	private String name;
	private String username;
	private String password;
	private int customer_id;
	private String email_id;
	private long mobile_number;
	private String address;
	
	public Customer(String name, String username, String password,
			int customer_id, String email_id, long mobile_number, String address) {
		super();
		this.name = name;
		this.username = username;
		this.password = password;
		this.customer_id = customer_id;
		this.email_id = email_id;
		this.mobile_number = mobile_number;
		this.address = address;
	}
	
	public String toString() {
		return "Customer [\nname=" + name + ", \nusername=" + username
				+ ", \npassword=" + password + ", \ncustomer_id=" + customer_id
				+ ", \nemail_id=" + email_id + ", \nmobile_number=" + mobile_number
				+ ", \naddress=" + address + ", \ngetName()=" + getName()
				+ ", \ngetUsername()=" + getUsername() + ", \ngetPassword()="
				+ getPassword() + ", \ngetCustomer_id()=" + getCustomer_id()
				+ ", \ngetEmail_id()=" + getEmail_id() + ", \ngetMobile_number()="
				+ getMobile_number() + ", \ngetAddress()=" + getAddress()
				+ ", \ngetClass()=" + getClass() + ", \nhashCode()=" + hashCode()
				+ ", \ntoString()=" + super.toString() + "]";
	}

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getCustomer_id() {
		return customer_id;
	}
	public void setCustomer_id(int customer_id) {
		this.customer_id = customer_id;
	}
	public String getEmail_id() {
		return email_id;
	}
	public void setEmail_id(String email_id) {
		this.email_id = email_id;
	}
	public long getMobile_number() {
		return mobile_number;
	}
	public void setMobile_number(long mobile_number) {
		this.mobile_number = mobile_number;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
	public static void main(String args[]) {
		Customer cust = new Customer("Dhruvin", "dhruvin", "admin", 1, "dhruvin@pizzofilia.com", 987654321, "address");
		System.out.println(cust);
	}
}
