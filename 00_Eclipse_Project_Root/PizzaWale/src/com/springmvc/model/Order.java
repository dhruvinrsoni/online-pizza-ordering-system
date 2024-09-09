package com.springmvc.model;
import java.util.Date;
public class Order {
	
	private String orderEmail; 
	private String orderAddresss;
	private String orderName;
	private String orderPinCode;
	private String orderMobile;
	private int ordertotal;
	private Date orderTS;
	private int paymentID;
	
	public String getOrderEmail() {
		return orderEmail;
	}
	public void setOrderEmail(String orderEmail) {
		this.orderEmail = orderEmail;
	}
	public String getOrderAddresss() {
		return orderAddresss;
	}
	public void setOrderAddresss(String orderAddresss) {
		this.orderAddresss = orderAddresss;
	}
	public String getOrderName() {
		return orderName;
	}
	public void setOrderName(String orderName) {
		this.orderName = orderName;
	}
	public String getOrderPinCode() {
		return orderPinCode;
	}
	public void setOrderPinCode(String orderPinCode) {
		this.orderPinCode = orderPinCode;
	}
	public String getOrderMobile() {
		return orderMobile;
	}
	public void setOrderMobile(String orderMobile) {
		this.orderMobile = orderMobile;
	}
	public int getOrdertotal() {
		return ordertotal;
	}
	public void setOrdertotal(int ordertotal) {
		this.ordertotal = ordertotal;
	}
	public Date getOrderTS() {
		return orderTS;
	}
	public void setOrderTS(Date orderTS) {
		this.orderTS = orderTS;
	}
	public int getPaymentID() {
		return paymentID;
	}
	public void setPaymentID(int paymentID) {
		this.paymentID = paymentID;
	}
	@Override
	public String toString() {
		return "Order [orderEmail=" + orderEmail + ", orderAddresss="
				+ orderAddresss + ", orderName=" + orderName
				+ ", orderPinCode=" + orderPinCode + ", orderMobile="
				+ orderMobile + ", ordertotal=" + ordertotal + ", orderTS="
				+ orderTS + ", paymentID=" + paymentID + "]";
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((orderAddresss == null) ? 0 : orderAddresss.hashCode());
		result = prime * result
				+ ((orderEmail == null) ? 0 : orderEmail.hashCode());
		result = prime * result
				+ ((orderMobile == null) ? 0 : orderMobile.hashCode());
		result = prime * result
				+ ((orderName == null) ? 0 : orderName.hashCode());
		result = prime * result
				+ ((orderPinCode == null) ? 0 : orderPinCode.hashCode());
		result = prime * result + ((orderTS == null) ? 0 : orderTS.hashCode());
		result = prime * result + ordertotal;
		result = prime * result + paymentID;
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Order other = (Order) obj;
		if (orderAddresss == null) {
			if (other.orderAddresss != null)
				return false;
		} else if (!orderAddresss.equals(other.orderAddresss))
			return false;
		if (orderEmail == null) {
			if (other.orderEmail != null)
				return false;
		} else if (!orderEmail.equals(other.orderEmail))
			return false;
		if (orderMobile == null) {
			if (other.orderMobile != null)
				return false;
		} else if (!orderMobile.equals(other.orderMobile))
			return false;
		if (orderName == null) {
			if (other.orderName != null)
				return false;
		} else if (!orderName.equals(other.orderName))
			return false;
		if (orderPinCode == null) {
			if (other.orderPinCode != null)
				return false;
		} else if (!orderPinCode.equals(other.orderPinCode))
			return false;
		if (orderTS == null) {
			if (other.orderTS != null)
				return false;
		} else if (!orderTS.equals(other.orderTS))
			return false;
		if (ordertotal != other.ordertotal)
			return false;
		if (paymentID != other.paymentID)
			return false;
		return true;
	}
	
	

	
}