package edu.msc.fts.repository;

import edu.msc.fts.model.Shipment;
import edu.msc.fts.model.Vessel;
import org.springframework.data.mongodb.repository.MongoRepository;

public interface ShipmentRepository extends MongoRepository<Shipment, String> {


}
