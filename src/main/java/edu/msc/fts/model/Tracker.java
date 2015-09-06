package edu.msc.fts.model;

/**
 * Created by harshadura on 9/3/15.
 */
public class Tracker {

    public Coordinates startPort;
    public Coordinates destPort;
    public Coordinates shipCoordinate;
    public String shipId;

    public Coordinates getStartPort() {
        return startPort;
    }

    public void setStartPort(Coordinates startPort) {
        this.startPort = startPort;
    }

    public String getShipId() {
        return shipId;
    }

    public void setShipId(String shipId) {
        this.shipId = shipId;
    }

    public Coordinates getDestPort() {
        return destPort;
    }

    public void setDestPort(Coordinates destPort) {
        this.destPort = destPort;
    }

	public Coordinates getShipCoordinate() {
		return shipCoordinate;
	}

	public void setShipCoordinate(Coordinates shipCoordinate) {
		this.shipCoordinate = shipCoordinate;
	}
    
    
}

