/**
 * 
 */
package edu.msc.fts.controllers;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.io.FileUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import edu.msc.fts.model.Coordinates;
import edu.msc.fts.model.Vessel;
import edu.msc.fts.service.VesselService;

/**
 * @author harsha
 *
 */
@Controller
@RequestMapping(value = "/ajax/")
public class AjaxController {

	private static Logger logger = Logger.getLogger(AjaxController.class);
	List<String> portList = new ArrayList<String>();

	@Autowired
	public VesselService vesselService;

	@RequestMapping(value = "getPorts", method = RequestMethod.GET)
	public @ResponseBody List<String> getVesselByID(
			@RequestParam String arrivalPort) {
		List<String> results = new ArrayList<String>();
		try {
			loadData();
		} catch (Exception e) {
			logger.warn("Error loading data");
			e.printStackTrace();
		}
		for (String port : portList) {
			if (arrivalPort.toLowerCase().contains(port)) {
				results.add(port);
			}
		}
		return portList;
	}

	@RequestMapping(value = "updateVesselLocation", method = RequestMethod.GET)
	public @ResponseBody boolean UpdateVesselLocation(@RequestParam String vesselId, @RequestParam String status,
			@RequestParam String latitude, @RequestParam String longitude) {
		System.out.println("Vessel update received :"+vesselId+" location : "+latitude+","+longitude);
		List<Vessel> vessels = vesselService.findAll();
		Vessel currentVessel = null;
		for (Vessel v : vessels) {
			if (v.getId().equals(vesselId) || v.getName().equals(vesselId)) {
				currentVessel = v;
				break;
			}
		}
		if (currentVessel != null) {
			try {
				currentVessel.setStatus(status);
				currentVessel.setLocation(new Coordinates(Double
						.parseDouble(latitude), Double.parseDouble(longitude)));
				vesselService.save(currentVessel);
				return true;
			} catch (Exception e) {
				return false;
			}
		}
		return false;
	}

	/**
	 * load data from portal static data file.
	 * 
	 * @throws Exception
	 * **/
	private void loadData() throws Exception {
		logger.info("Going to load static data.");

		if (portList == null || portList.size() == 0) {
			portList = new ArrayList<String>();

			ClassLoader classLoader = getClass().getClassLoader();
			File dataFile = new File(classLoader.getResource(
					"data/portalstaticdata.dat").getFile());

			List lines = FileUtils.readLines(dataFile, "UTF-8");

			for (int i = 0; i < lines.size(); i++) {
				portList.add((String) lines.get(i));
			}
		}

	}
}
