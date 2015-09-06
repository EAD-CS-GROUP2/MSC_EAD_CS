package edu.msc.fts.controllers;

import java.text.ParseException;
import java.util.List;
import java.util.Random;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import edu.msc.fts.model.Shipment;
import edu.msc.fts.model.Status;
import edu.msc.fts.model.Vessel;
import edu.msc.fts.model.VesselSchedule;
import edu.msc.fts.service.ShipmentService;
import edu.msc.fts.service.VesselScheduleService;
import edu.msc.fts.service.VesselService;
import edu.msc.fts.service.impl.NotificationService;

@Controller
@RequestMapping(value = "/backend/")
@PreAuthorize("hasRole('ROLE_BACK_OFFICE_STAFF')")
public class BackEndController {

    private static final Logger logger = Logger.getLogger(BackEndController.class);
    @Autowired
    public NotificationService notificationService;
    @Autowired
    public VesselService vesselService;
    @Autowired
    public VesselScheduleService vesselScheduleService;
    @Autowired
    public ShipmentService shipmentService;

    public static String generateRandomShipmentId() {
        int min = 1111;
        int max = 9999;

        Random rand = new Random();
        int randomNum = rand.nextInt((max - min) + 1) + min;

        return "MSC" + randomNum;
    }

    @RequestMapping(method = RequestMethod.GET, value = "/")
    public String redirect() {
//        LOGGER.info("redirect to portal");
        return "main";
    }

    @RequestMapping(method = RequestMethod.GET, value = "create-vessel")
    public String redirectShip() {
        return "backend/create-vessel";
    }

    @RequestMapping(method = RequestMethod.POST, value = "create-vessel")
    public ModelAndView submitShip(Vessel vessel) {
        vesselService.save(vessel);
        
        String view = "backend/create-vessel";

        ModelAndView mav = new ModelAndView(view);
        mav.addObject("success", "true");
                
        return mav;
    }

    @ModelAttribute(value = "shipList")
    public List<Vessel> findAllShips() {
        return vesselService.findAll();
    }

    @RequestMapping(method = RequestMethod.GET, value = "create-schedule")
    public String redirectShipSchedule() {

        logger.info("create-schedule | get method called | ");
        return "backend/create-schedule";
    }

    @RequestMapping(method = RequestMethod.POST, value = "create-schedule")
    public ModelAndView submitShipSchedule(VesselSchedule vesselSchedule) throws ParseException {
        vesselScheduleService.save(vesselSchedule);
        
        String view = "backend/create-schedule";
        
        ModelAndView mav = new ModelAndView(view);
        mav.addObject("success", "true");
                
        return mav;
    }

    @RequestMapping(method = RequestMethod.GET, value = "bill-of-lading")
    public String redirectBillOfLading() {

        logger.info("bill-of-lading | get method called | ");
        return "backend/bill-of-lading";
    }

    @RequestMapping(method = RequestMethod.GET, value = "manage-vessel")
    public String manageVessel() {

        logger.info("manage-vessel | get method called | ");
        return "backend/manage-vessel";
    }

    @RequestMapping(method = RequestMethod.POST, value = "manage-vessel")
    public ModelAndView submitShipment(Shipment shipment) throws ParseException {
        logger.info("*******  " + shipment.toString());

        List<VesselSchedule> vesselSchedules = vesselScheduleService.findAll();
        for (int i = 0; i < vesselSchedules.size(); i++) {
            logger.info("++++++++++++++++++++++" + vesselSchedules.get(i).getShip().getId());
            logger.info("++++++++++++++++++++++" + shipment.getShipId());
            if (vesselSchedules.get(i).getShip().getId().equals(shipment.getShipId())) {
                shipment.setVesselSchedule(vesselSchedules.get(i));
                break;
            }
        }

        String shipmentid = generateRandomShipmentId();
        shipment.setShipmentid(shipmentid);

        shipment.setStatus(Status.PENDING_DISPATCH_CUSTOM_CLEARANCE);

        shipmentService.save(shipment);

        String view = "backend/manage-vessel";

        ModelAndView mav = new ModelAndView(view);
        mav.addObject("success", "true");
        mav.addObject("shipmentid", shipmentid);

        /**
         * Sending Notifications
         */
        try {

            String consigneeEmail = shipment.getConsignee().getEmail();
            String consignorEmail = shipment.getConsignor().getEmail();

            String consigneeTp = shipment.getConsignee().getMobilePhone();
            String consignorTp = shipment.getConsignor().getMobilePhone();


            String smsContent = "Your shipment is pending customs clearance. Your Shipment ID is : " + shipmentid;
            String emailContent = smsContent;
            String emailSubject = "[MSC] YOUR SHIPMENT ADDED";

            //Sending SMS
            notificationService.sendMessage(smsContent, consigneeTp);
            notificationService.sendMessage(smsContent, consignorTp);

            //Sending Email
            notificationService.sendEmail(emailSubject, emailContent, consignorEmail);
            notificationService.sendEmail(emailSubject, emailContent, consigneeEmail);

        }catch (Exception e){
            e.printStackTrace();
        }

        return mav;
    }

    @RequestMapping(method = RequestMethod.POST, value = "bill-of-lading")
    public String displayBillOfLading(@RequestParam String referenceid, Model model) {

        logger.info("Reference--> " + referenceid);
        logger.info("bill-of-lading | Post method called | ");

        Shipment shipment = new Shipment();

        List<Shipment> shipmentList = shipmentService.findAll();

        logger.info("shipmentList.size---> " + shipmentList.size());

        for (Shipment _shipment : shipmentList) {

            logger.info("shipmentid--> " + _shipment.getShipmentid());

            if (referenceid.equals(_shipment.getShipmentid())) {
                shipment = _shipment;
                break;
            }
        }
        
        
        
        /*shipment.setBookingReference(referenceid);
        Item item		=	new Item();
        item.setItemDescription("Honda FIT Hybrid");
        item.setItemId("0087966");
        item.setItemName("CAR");
        item.setGrossWeight(850);
        item.setItemType(ItemType.VEHICLE);
		shipment.setItem(item);
		
		Vessel vessel	=	new Vessel();
		vessel.setId("1209");
		vessel.setName("Morning Cindy");
		vessel.setDescription("Vehicle Carrier");		
		
		
        
		VesselSchedule vesselSchedule		=	new VesselSchedule();
		vesselSchedule.setShip(vessel);
		vesselSchedule.setArDate("2015-09-29");
		vesselSchedule.setDeDate("2015-09-03");
		vesselSchedule.setDeparturePort("TOKYO");
		vesselSchedule.setArrivalPort("NEW YORK");
		vesselSchedule.setStatus("Available");
		vesselSchedule.setDistance(1200);
		
		shipment.setVesselSchedule(vesselSchedule);
		shipment.setPortofLoading("KOBE");
		shipment.setPortofDischarge("HAMBANTOTA");*/


        model.addAttribute("shipmentwrap", shipment);

        return "backend/display-bol";
    }

    @RequestMapping(method = RequestMethod.GET, value = "display-vessels")
    public String displayVessels() {

        logger.info("display-vessels | get method called | ");
        return "backend/display-vessel";
    }


    @RequestMapping(method = RequestMethod.POST, value = "edit-vessel")
    public String editVessels(Vessel vessel) throws ParseException {

        logger.info("edit-vessels | post method called | " + vessel.getId());

        vesselService.save(vessel);


        return "redirect:/backend/display-vessels";

    }

    @RequestMapping(method = RequestMethod.POST, value = "delete-vessel")
    public String deleteVessels(Vessel vessel) throws ParseException {

        logger.info("delete-vessels | post method called | " + vessel.getId());

        vesselService.Delete(vessel.getId());


        return "redirect:/backend/display-vessels";

    }

    @RequestMapping(value = "getShip", method = RequestMethod.GET)
    public
    @ResponseBody
    Vessel getVesselByID(@RequestParam String id) {
        logger.info("Get vessel by id | called");
        return vesselService.findOne(id);
    }

    @RequestMapping(method = RequestMethod.GET, value = "display-schedule")
    public String displayScheduls() {

        logger.info("display-schedule | get method called | ");
        return "backend/display-schedule";
    }

    @ModelAttribute(value = "scheduleList")
    public List<VesselSchedule> findAllSchedules() {
        return vesselScheduleService.findAll();
    }

    @RequestMapping(method = RequestMethod.POST, value = "edit-schedule")
    public String editScheduls(VesselSchedule vesselSchedule) {

        logger.info("edit-schedule | edit method called | ");

        VesselSchedule _vesselSchedule = vesselScheduleService.findOne(vesselSchedule.getId());
        Vessel vessel = _vesselSchedule.getShip();

        vesselSchedule.setShip(vessel);

        vesselScheduleService.save(vesselSchedule);


        return "redirect:/backend/display-schedule";
    }

    @RequestMapping(method = RequestMethod.POST, value = "delete-schedule")
    public String deleteScheduls(String id) {

        logger.info("delete-schedule | delete method called | ");

        vesselScheduleService.Delete(id);


        return "redirect:/backend/display-schedule";
    }

    @RequestMapping(method = RequestMethod.GET, value = "edit-shipment")
    public String editShipment() {

        logger.info("edit-shipment | get method called | ");
        return "backend/edit-shipment";
    }

    @ModelAttribute(value = "shipmentList")
    public List<Shipment> findAllShipment() {
        List<Shipment> shipmentlist = shipmentService.findAll();
        return shipmentlist;
    }

    @RequestMapping(method = RequestMethod.POST, value = "delete-shipment")
    public String deleteShipment(Shipment shipment) throws ParseException {

        logger.info("delete-shipment | post method called | " + shipment.getId());
        shipmentService.Delete(shipment.getId());
        return "redirect:/backend/edit-shipment";

    }

}
