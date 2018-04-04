package com.spring.demo.controller;

import com.spring.demo.entity.User;
import com.spring.demo.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class RegisterController {

    @Autowired
    UserService userService;

    @RequestMapping(value = "/registerationDone",method = RequestMethod.POST)
    ModelAndView register(User user){
        userService.saveUsers( user);
        ModelAndView modelAndView=new ModelAndView(  "home");
        return modelAndView;
    }
}
