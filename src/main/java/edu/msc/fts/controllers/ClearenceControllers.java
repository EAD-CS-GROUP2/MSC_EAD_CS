/**
 * 
 */
package edu.msc.fts.controllers;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.msc.fts.model.Shipment;
import edu.msc.fts.model.Status;
import edu.msc.fts.service.ShipmentService;
import edu.msc.fts.service.impl.NotificationService;

/**
 * @author harsha
 *
 */

@Controller
@RequestMapping(value = "/clearence/")
@PreAuthorize("hasRole('ROLE_BACK_OFFICE_STAFF')")
public class ClearenceControllers {
	
	
	
	 private static final Logger logger = Logger.getLogger(ClearenceControllers.class);
	 
	 
	 @Autowired
	   public  ShipmentService shipmentService;
	 @Autowired
	    public NotificationService notificationService;
	 
	 
	 @RequestMapping(method = RequestMethod.GET, value = "custom-clearence")
	  public String redirectClear() {
	        return "clearence/custom-clearence";
	  }
	 
	 
	 @ModelAttribute(value = "shipments")
	    public List<Shipment> findAllShipment() {
		 
		 List<Shipment> shipmentlist	=	new ArrayList<Shipment>();
		 List<Shipment> _shipmentlist	=	shipmentService.findAll();
		 
		 
		for (Shipment shipment:_shipmentlist) {
				
			if(Status.PENDING_DISPATCH_CUSTOM_CLEARANCE.equals(shipment.getStatus()) || Status.PENDING_RECEIVING_CUSTOM_CLEARANCE.equals(shipment.getStatus())){
				shipmentlist.add(shipment);
			}
			
		}
	         
	        return shipmentlist;
	    }
	 
	 
	 @RequestMapping(method = RequestMethod.POST, value = "item-clearence")
	  public String clearItem(String id,String status) {
		 
		 logger.info("Item clearense id"+id+"| status--> "+status);
		 
		 List<Shipment> shipmentlist		=	shipmentService.findAll();
		 Shipment		shipment			=	null;
		 
		 for (Shipment	_shipment:shipmentlist) {
			logger.info("id _--> "+id+" | "+_shipment.getShipmentid());
			 if(id.equals(_shipment.getShipmentid())){
				 shipment			=	_shipment;
				 String	currentStatus
				 					=	shipment.getStatus();
				 
				 
				 if("clear".equals(status)){
					 logger.info("current status-->"+currentStatus );
					 
					 shipment.setStatus(Status.increment(currentStatus));
					 logger.info("After status-->"+shipment.getStatus());
				 }else
					 shipment.setStatus(Status.reject(currentStatus));
				 
				 
				 break;
			 }
		}
		 
		 if(null!=shipment){
			 shipmentService.save(shipment);
			 sendNotifications(shipment);
		 }else
			 logger.fatal("Error, shipment is null "+shipment);
		 
	     return "redirect:/clearence/custom-clearence";
	  }
	 
	 
	 
	 private void sendNotifications(Shipment shipment){
		 
		 /**
	         * Sending Notifications
	         */
	        try {

	            String consigneeEmail = shipment.getConsignee().getEmail();
	            String consignorEmail = shipment.getConsignor().getEmail();

	            String consigneeTp = shipment.getConsignee().getMobilePhone();
	            String consignorTp = shipment.getConsignor().getMobilePhone();


	            String smsContent = "YOUR SHIPMENT # " + shipment.getShipmentid()+" ; STATUS CHANGED TO "+shipment.getStatus()+". AT CLEARANCE STAGE";
	            String emailContent = smsContent;
	            String emailSubject = "[MSC] SHIPMENT STATUS ALERT";

	            //Sending SMS
	            notificationService.sendMessage(smsContent, consigneeTp);
	            notificationService.sendMessage(smsContent, consignorTp);

	            //Sending Email
	            notificationService.sendEmail(emailSubject, emailContent, consignorEmail);
	            notificationService.sendEmail(emailSubject, emailContent, consigneeEmail);

	        }catch (Exception e){
	            e.printStackTrace();
	        }
	 }
	

}
