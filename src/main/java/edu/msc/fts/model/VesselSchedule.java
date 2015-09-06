package edu.msc.fts.model;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;


@Document(collection = "vesselSchedules")
public class VesselSchedule {

    /**
	 * @param id
	 * @param ship
	 * @param departureDate
	 * @param arrivalDate
	 * @param departurePort
	 * @param arrivalPort
	 * @param distance
	 * @param status
	 * @param arDate
	 * @param deDate
	 */
	public VesselSchedule(String id, Vessel ship, Date departureDate,
                          Date arrivalDate, String departurePort, String arrivalPort,
                          double distance, String status, String arDate, String deDate) {
		super();
		this.id = id;
		this.ship = ship;
		this.departureDate = departureDate;
		this.arrivalDate = arrivalDate;
		this.departurePort = departurePort;
		this.arrivalPort = arrivalPort;
		this.distance = distance;
		this.status = status;
		this.arDate = arDate;
		this.deDate = deDate;
	}

	/**
	 *
	 */
	public VesselSchedule() {
		// TODO Auto-generated constructor stub
	}

	@Id
    private String id;
    private Vessel ship;
    @DateTimeFormat(pattern = "dd/MM/yyyy")
    private Date departureDate;
    @DateTimeFormat(pattern = "dd/MM/yyyy")
    private Date arrivalDate;
    private String departurePort;
    private String arrivalPort;
    private double distance;
    private String status;
    private String arDate;
    private String deDate;

    public double getDistance() {
        return distance;
    }

    public void setDistance(double distance) {
        this.distance = distance;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Vessel getShip() {
        return ship;
    }

    public void setShip(Vessel ship) {
        this.ship = ship;
    }

    public Date getDepartureDate() {
        return departureDate;
    }

    public void setDepartureDate(Date departureDate) {
        this.departureDate = departureDate;
    }

    public Date getArrivalDate() {
        return arrivalDate;
    }

    public void setArrivalDate(Date arrivalDate) {
        this.arrivalDate = arrivalDate;
    }

    public String getDeparturePort() {
        return departurePort;
    }

    public void setDeparturePort(String departurePort) {
        this.departurePort = departurePort;
    }

    public String getArrivalPort() {
        return arrivalPort;
    }

    public void setArrivalPort(String arrivalPort) {
        this.arrivalPort = arrivalPort;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getArDate() {
        return arDate;
    }

    public void setArDate(String arDate) {
        this.arDate = arDate;
    }

    public String getDeDate() {
        return deDate;
    }

    public void setDeDate(String deDate) {
        this.deDate = deDate;
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 47 * hash + (this.id != null ? this.id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final VesselSchedule other = (VesselSchedule) obj;
        if ((this.id == null) ? (other.id != null) : !this.id.equals(other.id)) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "ShipSchedule{" + "id=" + id + ", ship=" + ship + ", departureDate=" + departureDate + ", arrivalDate=" + arrivalDate + ", departurePort=" + departurePort + ", arrivalPort=" + arrivalPort + ", status=" + status + '}';
    }

}
