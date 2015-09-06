package edu.msc.fts.model;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

@Document(collection = "vessels")
public class Vessel {

    @Id
    private String id;
    private String name;
    private String description;
    private Coordinates location;
    private String status;

    public Vessel() {
    	this.location = new Coordinates(6.946484,79.832692);
    	this.status = Status.SHIPPING_ON_TIME;
    }

    public Vessel(String id, String referenceId, String name, String description) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.location = new Coordinates(6.946484,79.832692);
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

	public Coordinates getLocation() {
		return location;
	}

	public void setLocation(Coordinates location) {
		this.location = location;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
}
