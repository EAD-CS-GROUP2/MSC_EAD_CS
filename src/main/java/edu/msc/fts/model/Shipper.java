/**
 * 
 */
package edu.msc.fts.model;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

/**
 * @author harsha
 *
 */
@Document(collection="shipers")
public class Shipper {

	@Id
	private String 		shipperId;
	private String 		shipperName;
	private	String		addressLine1;
	private String		addressLine2;
	private String		city;
	private String		country;
	
	
	public String getShipperId() {
		return shipperId;
	}
	public String getShipperName() {
		return shipperName;
	}
	public String getAddressLine1() {
		return addressLine1;
	}
	public String getAddressLine2() {
		return addressLine2;
	}
	public String getCity() {
		return city;
	}
	public String getCountry() {
		return country;
	}
	public void setShipperId(String shipperId) {
		this.shipperId = shipperId;
	}
	public void setShipperName(String shipperName) {
		this.shipperName = shipperName;
	}
	public void setAddressLine1(String addressLine1) {
		this.addressLine1 = addressLine1;
	}
	public void setAddressLine2(String addressLine2) {
		this.addressLine2 = addressLine2;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	
	
	
}
