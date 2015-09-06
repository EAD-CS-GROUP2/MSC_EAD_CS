package edu.msc.fts.repository;

import edu.msc.fts.model.Vessel;
import org.springframework.data.mongodb.repository.MongoRepository;

public interface VesselRepository extends MongoRepository<Vessel, String> {

//    Vessel findByReferenceId(String referenceId);
	

}
