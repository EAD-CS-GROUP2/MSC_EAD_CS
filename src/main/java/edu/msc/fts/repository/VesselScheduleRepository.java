package edu.msc.fts.repository;

import edu.msc.fts.model.VesselSchedule;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.data.mongodb.repository.Query;

import java.util.Date;
import java.util.List;

public interface VesselScheduleRepository extends MongoRepository<VesselSchedule, String> {

    @Query("{arrivalPort : ?0, departurePort: ?1}")
    public List<VesselSchedule> findSchedules(String arrivalPort, String departurePort, Date startDate, Date endDate);

    @Query("{'ship._id' : ?0}")
    public VesselSchedule findByShipId(String shipId);

}
