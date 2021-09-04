package com.springmvc.model;

public class OrderItem extends Order{
	private int qty;
	private String itemName;
	private int ItemId;
	private int price;
	private int subTotal;
	@Override
	public String toString() {
		return "OrderItem [qty=" + qty + ", itemName=" + itemName + ", price="
				+ price + ", subTotal=" + subTotal + "]";
	}
	public int getQty() {
		return qty;
	}
	public void setQty(int qty) {
		this.qty = qty;
	}
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getSubTotal() {
		return subTotal;
	}
	public void setSubTotal(int subTotal) {
		this.subTotal = subTotal;
	}
	
	
}
