
package edu.msc.fts.service.impl;

import edu.msc.fts.model.VesselSchedule;
import edu.msc.fts.repository.VesselScheduleRepository;
import edu.msc.fts.service.VesselScheduleService;
import edu.msc.fts.service.VesselService;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Service
public class VesselScheduleServiceImpl implements VesselScheduleService {

    @Autowired
    private VesselScheduleRepository shipScheduleRepository;
    @Autowired
    private VesselService shipService;

    private static final Logger LOGGER = Logger.getLogger(VesselScheduleServiceImpl.class);

    @Override
    public List<VesselSchedule> getSchedule(String arrivalPort, String departurePort, Date startDate, Date endDate) {
        return shipScheduleRepository.findSchedules(arrivalPort, departurePort, startDate, endDate);
    }

    @Override
    public VesselSchedule getScheduleItem(String shipmentRef) {
        return shipScheduleRepository.findOne(shipmentRef);
    }

    @Override
    public void save(VesselSchedule shipSchedule) {
        LOGGER.debug(shipSchedule);
        if (shipSchedule == null || shipSchedule.getShip() == null || shipSchedule.getShip().getId() == null) {
            return;
        }
        shipSchedule.setShip(shipService.findOne(shipSchedule.getShip().getId()));
        shipScheduleRepository.save(shipSchedule);
    }

    @Override
    public VesselSchedule findByShipId(String shipId){
        VesselSchedule vesselSchedule = shipScheduleRepository.findByShipId(shipId);
        return vesselSchedule;
    }

    @Override
    public Set<String> findDeparturePorts() {
        Set<String> portSet = new HashSet<String>();
        List<VesselSchedule> ports = shipScheduleRepository.findAll();
        for(VesselSchedule shipSchedule : ports){
            portSet.add(shipSchedule.getDeparturePort());
        }
        return portSet;
    }

    @Override
    public Set<String> findArrivalPorts() {
        Set<String> portSet = new HashSet<String>();
        List<VesselSchedule> ports = shipScheduleRepository.findAll();
        for(VesselSchedule shipSchedule : ports){
            portSet.add(shipSchedule.getArrivalPort());
        }
        return portSet;
    }

    @Override
    public List<VesselSchedule> findAll() {
        return shipScheduleRepository.findAll();
    }

	@Override
	public VesselSchedule findOne(String id) {
		
		return shipScheduleRepository.findOne(id);
	}

	@Override
	public void Delete(String id) {
		
		shipScheduleRepository.delete(id);
		
	}
}
