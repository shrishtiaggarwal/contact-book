package com.spring.demo.controller;

import com.spring.demo.entity.Contact;
import com.spring.demo.entity.User;
import com.spring.demo.service.OperationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
public class OperationController {

    @Autowired
    OperationService operationService;

    @RequestMapping(value = "/deleteContact",method = RequestMethod.POST)
    @ResponseBody
    String deleteContact(@RequestParam("contactId") int id){
        operationService.deleteContact(id);
        System.out.println("ajax call");
        return "data deleted!";
    }

    @RequestMapping(value = "/contactInfo",method = RequestMethod.POST)
    Contact contactInfoToUpdate(@RequestParam("contactId") int id){
        operationService.retreiveContact( id );
        System.out.println("contactid:"+id);
        return operationService.retreiveContact( id );
    }

    @RequestMapping(value = "/updateData",method = RequestMethod.POST)
    @ResponseBody
    String updateContact(@ModelAttribute Contact contact){
        operationService.updateContact( contact );
        return "updateContact";
    }

}
