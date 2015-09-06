package com.colomboyard.ships;

public class Coordinates {
    public Double latitude;
    public Double longitude;

    public Coordinates(){}
    
    public Coordinates(double la, double lng){
        this.latitude = la;
        this.longitude = lng;
    }

	public Double getLatitude() {
		return latitude;
	}

	public void setLatitude(double latitude) {
		this.latitude = latitude;
	}

	public Double getLongitude() {
		return longitude;
	}

	public void setLongitude(double longitude) {
		this.longitude = longitude;
	}
    
    
}
