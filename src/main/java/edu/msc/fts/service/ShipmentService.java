package edu.msc.fts.service;

import edu.msc.fts.model.Shipment;

import java.util.List;

public interface ShipmentService {

    void save(Shipment shipment);

    List<Shipment> findAll();

    Shipment findOne(String id);

    void Delete(String id);
}
