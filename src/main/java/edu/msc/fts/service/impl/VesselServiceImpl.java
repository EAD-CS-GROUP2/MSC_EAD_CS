package edu.msc.fts.service.impl;

import edu.msc.fts.model.Vessel;
import edu.msc.fts.repository.VesselRepository;
import edu.msc.fts.service.VesselService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class VesselServiceImpl implements VesselService {

    @Autowired
    private VesselRepository vesselRepository;

    @Override
    public void save(Vessel vessel) {
        vesselRepository.save(vessel);
    }

    @Override
    public List<Vessel> findAll() {
        return vesselRepository.findAll();
    }

    @Override
    public Vessel findOne(String id) {
        return vesselRepository.findOne(id);
    }

	@Override
	public void Delete(String id) {
		vesselRepository.delete(id);		
	}
}
