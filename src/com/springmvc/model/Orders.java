package com.springmvc.model;

import java.time.LocalDateTime;

public class Orders {
	
	private String orderEmail; 
	private String orderAddresss;
	private String orderName;
	private String orderPinCode;
	private String orderMobile;
	private int ordertotal;
	private String orderTS;
	private int paymentID;
	private int orderStatus;
	
	public Orders() {}
	
	public Orders(String orderEmail, String orderAddresss, String orderName, String orderPinCode, String orderMobile,
			int ordertotal, String orderTS, int paymentID, int orderStatus) {
		super();
		this.orderEmail = orderEmail;
		this.orderAddresss = orderAddresss;
		this.orderName = orderName;
		this.orderPinCode = orderPinCode;
		this.orderMobile = orderMobile;
		this.ordertotal = ordertotal;
		this.orderTS = orderTS;
		this.paymentID = paymentID;
		this.orderStatus = orderStatus;
	}
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
	public String getOrderTS() {
		return orderTS;
	}
	public void setOrderTS(String orderTS) {
		this.orderTS = orderTS;
	}
	public int getPaymentID() {
		return paymentID;
	}
	public void setPaymentID(int paymentID) {
		this.paymentID = paymentID;
	}
	
	
	public int getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(int orderStatus) {
		this.orderStatus = orderStatus;
	}

	@Override
	public String toString() {
		return "Order [orderEmail=" + orderEmail + ", orderAddresss=" + orderAddresss + ", orderName=" + orderName
				+ ", orderPinCode=" + orderPinCode + ", orderMobile=" + orderMobile + ", ordertotal=" + ordertotal
				+ ", orderTS=" + orderTS + ", paymentID=" + paymentID + ", orderStatus=" + orderStatus + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((orderAddresss == null) ? 0 : orderAddresss.hashCode());
		result = prime * result + ((orderEmail == null) ? 0 : orderEmail.hashCode());
		result = prime * result + ((orderMobile == null) ? 0 : orderMobile.hashCode());
		result = prime * result + ((orderName == null) ? 0 : orderName.hashCode());
		result = prime * result + ((orderPinCode == null) ? 0 : orderPinCode.hashCode());
		result = prime * result + orderStatus;
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
		Orders other = (Orders) obj;
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
		if (orderStatus != other.orderStatus)
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
