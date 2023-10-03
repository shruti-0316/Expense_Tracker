package com.Dao;

import java.util.List;


import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.entity.User;

public class USerDao {
	private SessionFactory sessionfactory = null;
	private Session session = null;
	Transaction tx = null;

	public USerDao(SessionFactory sessionFactory) {
		super();
		// TODO Auto-generated constructor stub
		this.sessionfactory = sessionFactory;
	}

	public boolean saveuser(User user) {
		boolean f = false;
		try {
			
				session = sessionfactory.openSession();
				tx = session.beginTransaction();
			
				session.save(user);
				tx.commit();
				f = true;
			
		} catch (Exception e) {
			// TODO: handle exception
			if (tx != null) {
				f = false;
				e.printStackTrace();
			}
		}

		return f;

	}
	
	public List<User> login(String email, String password) {
	    List<User> users = null;
	    session = sessionfactory.openSession();
	    Query q =session.createQuery("from User where email=:em and password=:pd");
	    q.setParameter("em", email);
	    q.setParameter("pd", password);
	    users = q.list();
	    return users;
	}


}
