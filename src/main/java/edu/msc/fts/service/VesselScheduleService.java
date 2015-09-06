package edu.msc.fts.service;

import edu.msc.fts.model.VesselSchedule;

import java.util.Date;
import java.util.List;
import java.util.Set;


public interface VesselScheduleService {

    List<VesselSchedule> getSchedule(String arrivalPort, String departurePort, Date startDate, Date endDate);

    VesselSchedule getScheduleItem(String shipId);

    void save(VesselSchedule shipSchedule);

    Set<String> findDeparturePorts();

    Set<String> findArrivalPorts();

    VesselSchedule findByShipId(String shipId);

    List<VesselSchedule> findAll();
    
    VesselSchedule findOne(String id);
    
    void Delete(String id);

    }
