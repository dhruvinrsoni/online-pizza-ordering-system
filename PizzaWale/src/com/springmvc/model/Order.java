package com.springmvc.model;

public class Order {
	
	private String ordereditems;
	private int margherita;
	private int dcmargherita;
	private int farmhouse;
	private int deluxeveggie ;
	private int mexgw;
private int peppypan;
private String name ;
private String address ;
private String  mobileNum ;

	private String email;

	
	public String getMobileNum() {
		return mobileNum;
	}
	public void setMobileNum(String mobileNum) {
		this.mobileNum = mobileNum;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
	
	
	public String getOrderItem() {
		return ordereditems;
		}
		public void setOrderItem(String ordereditems) {
			this.ordereditems = ordereditems;
		}
	
	
	
	public String getEmail() {
	return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}

	public int getMargherita() {
		return margherita;
	}
	public void setMargherita(int margherita) {
		this.margherita = margherita;
	}
	
	public int getDCMargherita() {
		return dcmargherita;
	}
	public void setDCMargherita(int dcmargherita) {
		this.dcmargherita = dcmargherita;
	}
	
	public int getFarmhouse() {
		return farmhouse;
	}
	public void setFarmhouse(int farmhouse) {
		this.farmhouse = farmhouse;
	}
	
	public int getDeluxeVeggie () {
		return deluxeveggie ;
	}
	public void setDeluxeVeggie(int deluxeveggie) {
		this.deluxeveggie  = deluxeveggie ;
	}
	
	public int getMexGW() {
		return mexgw ;
	}
	public void setMexGW(int mexgw) {
		this.mexgw = mexgw;
	}

	public int getPeppyPan() {
		return peppypan ;
	}
public void setPeppyPan(int peppypan) {
		this.peppypan = peppypan;
}

//@Override
//public String toString() {
//	return "Order [gender=" + gender + ", userId=" + userId
//			+ ", name=" + name + ", address=" + address
//			+ ", password=" + password + ", userType=" + userType
//			+ ", mobileNum=" + mobileNum + ", email=" + email + "]";
//}
	
	

	
}