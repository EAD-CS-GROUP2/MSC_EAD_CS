package edu.msc.fts.model;

/**
 * Created by harshadura on 9/3/15.
 */
public class Coordinates {
    public double latitude;
    public double longitude;

    public Coordinates(){}
    
    public Coordinates(double la, double lng){
        this.latitude = la;
        this.longitude = lng;
    }

	public double getLatitude() {
		return latitude;
	}

	public void setLatitude(double latitude) {
		this.latitude = latitude;
	}

	public double getLongitude() {
		return longitude;
	}

	public void setLongitude(double longitude) {
		this.longitude = longitude;
	}
    
    
}
