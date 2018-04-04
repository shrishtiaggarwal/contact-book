package com.spring.demo.controller;

import com.spring.demo.entity.User;
import com.spring.demo.service.CategoryService;
import com.spring.demo.service.ContactService;
import com.spring.demo.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;


@Controller
public class LoginController {

    @Autowired
    UserService userService;
    @Autowired
    CategoryService categoryService;
    @Autowired
    ContactService contactService;
//    @Autowired
//    ContactListService contactListService;

    @RequestMapping(value = "/index",method = RequestMethod.GET)
    public ModelAndView loginPage(){
        ModelAndView modelAndView=new ModelAndView( "home" );
        return modelAndView;
    }

    @RequestMapping(value = "/loginDone",method = RequestMethod.POST)
   public ModelAndView loginDone(@RequestParam("userName") String userName,
                                 @RequestParam("password") String password,
                                 HttpSession session){

        User user=userService.validateUser( userName,password );
        if(user==null){
            ModelAndView modelAndView=new ModelAndView( "home" );
            modelAndView.addObject( "msg","Invalid user!!" );
            return modelAndView;
        }else {
            ModelAndView modelAndView=new ModelAndView( "userLogin" );
            modelAndView.addObject( "user",user );
            modelAndView.addObject( "category",categoryService.getCategory( user ) );
            modelAndView.addObject( "contactList",contactService.getAllContacts( user,1 ) );

            session.setAttribute( "userobj",user );
            session.setAttribute( "userlogedin",true );
            return modelAndView;

        }

    }
}
