package edu.msc.fts.controllers;

import java.io.IOException;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import edu.msc.fts.model.Coordinates;
import edu.msc.fts.model.Shipment;
import edu.msc.fts.model.Status;
import edu.msc.fts.model.Vessel;
import edu.msc.fts.service.ShipmentService;
import edu.msc.fts.service.VesselService;
import edu.msc.fts.service.impl.NotificationService;

@Controller
@RequestMapping(value = "/")
public class TrackController {

	@Autowired
	public ShipmentService shipmentService;

	@Autowired
	public NotificationService notificationService;

	@Autowired
	public VesselService vesselService;

	private static final Logger logger = Logger
			.getLogger(TrackController.class);

	private Coordinates mCurrentLocation;

	@RequestMapping(method = RequestMethod.GET, value = "tracking")
	public String redirectShip() {
		return "tracking";
	}

	@RequestMapping(value = "tracking", method = RequestMethod.POST)
	public ModelAndView trackShipByBookingId(@RequestParam String booking_id) {

		Vessel vessel = findVessel(booking_id);
		Shipment shipment = resolveShipment(booking_id);
		ModelAndView mav = new ModelAndView("tracking");
		if (shipment != null) {
			mav.addObject("status", shipment.getStatus());
			/***
			 * Ship only the cleared goods
			 */
			if (shipment.getStatus().equals(
					Status.PENDING_DISPATCH_CUSTOM_CLEARANCE)
					|| shipment.getStatus().equals(
							Status.CUSTOM_CLEARANCE_DECLINED)
					|| shipment.getStatus().equals(Status.READY_PICKUP)
					|| shipment.getStatus().equals(Status.DELIVERED)) {
				mav.addObject("found", "false");
				return mav;
			}

			/***
			 * Shipping the item.
			 */
			if (shipment.getStatus().equals(Status.PENDING_SHIPPING)) {
				shipment.setStatus(Status.increment(shipment.getStatus()));
				shipmentService.save(shipment);
				vessel.setStatus(Status.SHIPPING_ON_TIME);
				vesselService.save(vessel);
				sendNotifications(shipment);
			}
		}

		if (vessel != null) {
			logger.info("Ship tracker : " + vessel.getName());
			mav.addObject("found", "true");
			mav.addObject("shipmentId", shipment.getShipmentid());
			mav.addObject("vessel", vessel);
		} else
			mav.addObject("found", "false");

		return mav;
	}

	@RequestMapping(value = "vessel_status", method = RequestMethod.GET)
	public @ResponseBody Vessel getShipStatus(
			@RequestParam String vesselId, @RequestParam String pre_status,
			@RequestParam String shipmentId) {
		Vessel vessel = vesselService.findOne(vesselId);
		if (vessel != null) {
			boolean statusChange = !vessel.getStatus().equals(pre_status);
			if (statusChange) {
				Shipment shipment = resolveShipment(shipmentId);
				if (shipment != null) {
					shipment.setStatus(vessel.getStatus());
					shipmentService.save(shipment);
					sendNotifications(shipment);
				}
			}
		}
		return vessel;
	}

	private Shipment resolveShipment(String shipmentId) {
		Shipment shipment = null;
		List<Shipment> shipments = shipmentService.findAll();
		for (Shipment s : shipments) {
			if (s.getShipmentid().equals(shipmentId)) {
				shipment = s;
				break;
			}
		}
		return shipment;
	}

	private Vessel findVessel(String shipmentId) {
		Shipment shipment = resolveShipment(shipmentId);
		if (shipment != null)
			return vesselService.findOne(shipment.getShipId());
		return null;
	}

	private void sendNotifications(Shipment shipment) {
		String content = "Your %s. Shipment ID is : %s";
		content = String.format(content, shipment.getStatus(),
				shipment.getShipmentid());
		String consigneeEmail = shipment.getConsignee().getEmail();
		String consignorEmail = shipment.getConsignor().getEmail();

		String consigneeTp = shipment.getConsignee().getMobilePhone();
		String consignorTp = shipment.getConsignor().getMobilePhone();

		String emailContent = content;
		String emailSubject = "[MSC] SHIPMENT STATUS";

		// Sending SMS
		try {
			 notificationService
			 .sendMessage(content, consigneeTp);
			 notificationService
			 .sendMessage(content, consignorTp);

			// Sending Email
			notificationService.sendEmail(emailSubject, emailContent,
					consignorEmail);
			notificationService.sendEmail(emailSubject, emailContent,
					consigneeEmail);
		} catch (IOException e) {
			logger.error(e);
		}

	}

}
