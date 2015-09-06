package edu.msc.fts.controllers;

import edu.msc.fts.model.Shipment;
import edu.msc.fts.service.ShipmentService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

/**
 *
 */

@Controller
@RequestMapping(value = "/report/")
@PreAuthorize("hasRole('ROLE_BACK_OFFICE_STAFF')")
public class ReportController {

    @Autowired
    public ShipmentService shipmentService;

    private static final Logger logger = Logger.getLogger(BackEndController.class);

    @RequestMapping(method = RequestMethod.GET, value = "report")
    public String report() {

        logger.info("dashboard | get method called | ");
        return "backend/report";
    }

    @ModelAttribute(value = "lastfiveshipmentlist")
    public List<Shipment> findLastFiveShipment() {
        List<Shipment> lastfiveshipmentlist = shipmentService.findAll();

        if(lastfiveshipmentlist.size() > 5)
        {
            return lastfiveshipmentlist.subList(lastfiveshipmentlist.size() - 5, lastfiveshipmentlist.size());
        }
        else
        {
            return lastfiveshipmentlist;
        }


    }
}
