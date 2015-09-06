/**
 *
 */
package edu.msc.fts.model;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

import java.util.Date;


@Document(collection = "shipments")
public class Shipment {

    @Id
    private String id;
    private VesselSchedule vesselSchedule;
    private Item item;
    private String portofLoading;
    private String portofDischarge;
    private Date estimatedDilivaryDate;
    private Shipper shipper;
    private Contact consignee;
    private Contact consignor;
    private String ShipmentType;
    private Vessel vessel;
    private String shipId;
    private Shipment shipment;
    private String shipmentid;
    private String status;

    public Contact getConsignee() {
        return consignee;
    }

    public void setConsignee(Contact consignee) {
        this.consignee = consignee;
    }

    public Contact getConsignor() {
        return consignor;
    }

    public void setConsignor(Contact consignor) {
        this.consignor = consignor;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getShipmentid() {
        return shipmentid;
    }

    public void setShipmentid(String shipmentid) {
        this.shipmentid = shipmentid;
    }


    public Shipment getShipment() {
        return shipment;
    }

    public void setShipment(Shipment shipment) {
        this.shipment = shipment;
    }


    public String getShipId() {
        return shipId;
    }

    public void setShipId(String shipId) {
        this.shipId = shipId;
    }


    public VesselSchedule getVesselSchedule() {
        return vesselSchedule;
    }

    public void setVesselSchedule(VesselSchedule vesselSchedule) {
        this.vesselSchedule = vesselSchedule;
    }

    public Item getItem() {
        return item;
    }

    public void setItem(Item item) {
        this.item = item;
    }

    public String getPortofLoading() {
        return portofLoading;
    }

    public void setPortofLoading(String portofLoading) {
        this.portofLoading = portofLoading;
    }

    public String getPortofDischarge() {
        return portofDischarge;
    }

    public void setPortofDischarge(String portofDischarge) {
        this.portofDischarge = portofDischarge;
    }

    public Date getEstimatedDilivaryDate() {
        return estimatedDilivaryDate;
    }

    public void setEstimatedDilivaryDate(Date estimatedDilivaryDate) {
        this.estimatedDilivaryDate = estimatedDilivaryDate;
    }

    public Shipper getShipper() {
        return shipper;
    }

    public void setShipper(Shipper shipper) {
        this.shipper = shipper;
    }

    public String getShipmentType() {
        return ShipmentType;
    }

    public void setShipmentType(String shipmentType) {
        ShipmentType = shipmentType;
    }

    public Vessel getVessel() {
        return vessel;
    }

    public void setVessel(Vessel vessel) {
        this.vessel = vessel;
    }

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
    
    

}
