/**
 * 
 */
package edu.msc.fts.model;

/**
 * @author harsha
 *
 */
public enum ItemType {

	VEHICLE("Vehicle"),ELECTRONICS("Electronics"),FOOD("Food"),APPAREL("Apparel");
	
	private String text;
	
	private ItemType(String type){
		text		=	type;
	}

	public String getText() {
		return text;
	}
	
	
}
