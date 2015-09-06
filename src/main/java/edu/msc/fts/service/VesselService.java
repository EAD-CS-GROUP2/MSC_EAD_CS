package edu.msc.fts.service;

import edu.msc.fts.model.Vessel;

import java.util.List;

import com.rabbitmq.client.AMQP.Exchange.Delete;

public interface VesselService {

    void save(Vessel vessel);

    List<Vessel> findAll();

    Vessel findOne(String id);
    
    void Delete(String id);
    
}
