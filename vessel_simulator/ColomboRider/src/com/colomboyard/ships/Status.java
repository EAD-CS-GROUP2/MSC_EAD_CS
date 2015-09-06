package com.colomboyard.ships;

public class Status {

	public static final String PENDING_DISPATCH_CUSTOM_CLEARANCE = "Pending dispatch customs";
	public static final String PENDING_RECEIVING_CUSTOM_CLEARANCE = "Pending receiving customs";
	public static final String CUSTOM_CLEARANCE_DECLINED = "Customs rejected";
	public static final String PENDING_SHIPPING = "Pending shipping";
	public static final String SHIPPING_ON_TIME = "Shipment on time";
	public static final String SHIPPING_DELAY = "Shipment delayed";
	public static final String READY_PICKUP = "Ready for pickup";
	public static final String DELIVERED = "Delivered";
	
	public static String increment(String status){
		if (status == null)
			return null;
		if (status.equals(PENDING_DISPATCH_CUSTOM_CLEARANCE)){
			return PENDING_SHIPPING;
		}else if (status.equals(PENDING_SHIPPING))
			return SHIPPING_ON_TIME;
		else if (status.equals(SHIPPING_ON_TIME))
			return PENDING_RECEIVING_CUSTOM_CLEARANCE;
		else if (status.equals(PENDING_RECEIVING_CUSTOM_CLEARANCE))
			return READY_PICKUP;
		else if (status.equals(READY_PICKUP))
			return DELIVERED;
		return null;
	}
	
	public static String reject(String status){
		if (status.equals(PENDING_DISPATCH_CUSTOM_CLEARANCE) || status.equals(PENDING_RECEIVING_CUSTOM_CLEARANCE))
			return CUSTOM_CLEARANCE_DECLINED;
		else if (status.equals(SHIPPING_ON_TIME))
			return SHIPPING_DELAY;
		return null;
	}
	
}
