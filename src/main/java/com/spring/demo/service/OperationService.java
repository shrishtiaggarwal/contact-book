package com.spring.demo.service;

import com.spring.demo.entity.Contact;
import com.spring.demo.entity.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.LocalSessionFactoryBean;
import org.springframework.stereotype.Service;

@Service
public class OperationService {

    @Autowired
    LocalSessionFactoryBean sessionFactoryBean;

    public void deleteContact(Integer contactId){

        SessionFactory sessionFactory = sessionFactoryBean.getObject();
        Session session=sessionFactory.openSession();
        session.beginTransaction();
        Contact contact= (Contact) session.get( Contact.class,contactId );
        session.delete( contact );
        session.getTransaction().commit();
        session.close();

    }
    public Contact retreiveContact(Integer contactId){

        SessionFactory sessionFactory=sessionFactoryBean.getObject();
        Session session=sessionFactory.openSession();
        Contact contact= (Contact) session.get( Contact.class,contactId );
        session.beginTransaction();
        session.getTransaction().commit();
//        session.close();
        return contact;
    }


    public Contact updateContact(Contact contact){

        SessionFactory sessionFactory=sessionFactoryBean.getObject();
        Session session=sessionFactory.openSession();
        session.beginTransaction();
        session.update( contact );
        session.getTransaction().commit();
        session.close();
        return contact;
    }


}
