package edu.msc.fts.service.impl;

import edu.msc.fts.model.Shipment;
import edu.msc.fts.repository.ShipmentRepository;
import edu.msc.fts.service.ShipmentService;
import edu.msc.fts.service.VesselService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ShipmentServiceImpl implements ShipmentService {

    @Autowired
    private ShipmentRepository shipmentRepository;

    //    @Autowired
//    private VesselSchedule shipSchedule;
//
    @Autowired
    private VesselService shipService;

    @Override
    public void save(Shipment shipment) {

//        shipSchedule.setShip(shipService.findOne(shipSchedule.getShip().getId()));
        shipmentRepository.save(shipment);
    }

    @Override
    public List<Shipment> findAll() {
        return shipmentRepository.findAll();
    }

    @Override
    public Shipment findOne(String id) {
        return shipmentRepository.findOne(id);
    }

    @Override
    public void Delete(String id) {
        shipmentRepository.delete(id);
    }
}
