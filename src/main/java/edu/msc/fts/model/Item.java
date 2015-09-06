/**
 *
 */
package edu.msc.fts.model;

import org.springframework.data.mongodb.core.mapping.Document;

@Document(collection = "items")
public class Item {

    private String itemName;
    private String itemDescription;
    private double grossWeight;
    private double charges;

    public double getCharges() {
        return charges;
    }

    public void setCharges(double charges) {
        this.charges = charges;
    }

    public String getItemName() {
        return itemName;
    }

    public void setItemName(String itemName) {
        this.itemName = itemName;
    }

    public String getItemDescription() {
        return itemDescription;
    }

    public void setItemDescription(String itemDescription) {
        this.itemDescription = itemDescription;
    }

    public double getGrossWeight() {
        return grossWeight;
    }

    public void setGrossWeight(double grossWeight) {
        this.grossWeight = grossWeight;
    }


}
