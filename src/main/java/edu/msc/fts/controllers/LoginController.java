package edu.msc.fts.controllers;

import java.util.UUID;

import edu.msc.fts.service.impl.NotificationService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.StandardPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.msc.fts.model.User;
import edu.msc.fts.repository.UserRepositoryDao;

import javax.servlet.http.HttpServletRequest;

@Controller
public class LoginController {
    @Autowired
    private NotificationService notificationService;

    @Autowired
    private UserRepositoryDao userRepositoryDao;

    private static final Logger LOGGER = Logger.getLogger(LoginController.class);

    @RequestMapping(method = RequestMethod.GET, value = "/")
    public String redirect() {
        LOGGER.info("redirect to portal");
        return "portal";
    }

    @RequestMapping(method = RequestMethod.GET, value = "/portal")
    public String redirectPortal() {
        LOGGER.info("redirect to portal");
        return "portal";
    }

    private void sendTestSMS(){
        try {
            notificationService.sendMessage("Your order has been dispatched!", "0712217611");
        } catch (Exception e){
            e.printStackTrace();
        }
    }


    private void sendTestEmail(){
        try {
            notificationService.sendEmail("[MSC] ORDER DISPATCHED", "Your order has been dispatched!", "harshadura@gmail.com");
        } catch (Exception e){
            e.printStackTrace();
        }
    }

    @PreAuthorize("hasRole('ROLE_BACK_OFFICE_STAFF')")
    @RequestMapping(method = RequestMethod.GET, value = "/main")
    public String redirectHome(ModelMap model, HttpServletRequest request) {
        LOGGER.info("redirect to home");
//        sendTestSMS();
//        sendTestEmail();

        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String name = auth.getName(); //get logged in username

//        SecurityContextHolder.getContext().getAuthentication().getPrincipal();
//        String name = user.getUsername(); //get logged in username
        request.getSession().setAttribute("loggedUser", name);

        return "main";
    }

    @RequestMapping(method = RequestMethod.GET, value = "/login")
    public String redirectTracking() {
        createStaffUser();
        LOGGER.info("redirect to tracking");
        return "/login";
    }

    @RequestMapping(method = RequestMethod.POST, value = "/login")
    public String redirectTracking2() {
        LOGGER.info("redirect to tracking");
        return "main";
    }

    @RequestMapping(value = "/accessdenied")
    public String loginerror(ModelMap model) {
        model.addAttribute("error", "true");
        return "denied";
    }

    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logout(ModelMap model, HttpServletRequest request) {
        request.getSession().setAttribute("loggedUser", null);
        return "login";
    }

    @RequestMapping(method = RequestMethod.GET, value = "/register")
    public String redirectRegister(User user, Model model) {

        user.setId(UUID.randomUUID().toString());
        StandardPasswordEncoder encoder = new StandardPasswordEncoder("mobile$123");
        String result = encoder.encode(user.getPassword());
        user.setPassword(result);
        userRepositoryDao.save(user);

        model.addAttribute("success_reg", "true");

        LOGGER.info("new user regged!");
        return "main";
    }

    @RequestMapping(method = RequestMethod.POST, value = "/register")
    public String redirectRegister2(User user, Model model) {

        user.setId(UUID.randomUUID().toString());
        StandardPasswordEncoder encoder = new StandardPasswordEncoder("mobile$123");
        String result = encoder.encode(user.getPassword());
        user.setPassword(result);

        userRepositoryDao.save(user);

        model.addAttribute("success_reg", "true");

        LOGGER.info("new user regged!");
        return "main";
    }

//    @RequestMapping(method = RequestMethod.POST, value = "/register")
//    public String redirectRegister(User user) {
//        LOGGER.info("Create account : {}" + user.getSurname());
//        return "login";
//    }

    public void createStaffUser(){

        String testAdminUsername = "staff1@msc.ship";

        edu.msc.fts.model.User user = userRepositoryDao.findByUsername(testAdminUsername);

        if (user == null) {
                User user1 = new User();
                user1.setId(UUID.randomUUID().toString());

            StandardPasswordEncoder encoder = new StandardPasswordEncoder("mobile$123");
            String result = encoder.encode("123");

            user1.setPassword(result);
                user1.setRole(2);//staff role
                user1.setUsername(testAdminUsername);

                User user2 = new User();
                user2.setId(UUID.randomUUID().toString());

            String result2 = encoder.encode("123");
            user2.setPassword(result2);
                user2.setRole(1);//Customer role
                user2.setUsername("customer1@msc.ship");

                userRepositoryDao.save(user1);
                userRepositoryDao.save(user2);
        }


    }

}
