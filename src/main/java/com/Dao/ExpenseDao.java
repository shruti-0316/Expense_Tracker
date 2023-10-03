package com.Dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.query.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.entity.Expense;
import com.entity.User;

public class ExpenseDao {
	private SessionFactory sessionfactory = null;
	private Session session = null;
	Transaction tx = null;

	public ExpenseDao(SessionFactory sessionFactory) {
		super();
		// TODO Auto-generated constructor stub
		this.sessionfactory = sessionFactory;
	}

	public boolean saveExpense(Expense exp) {
		boolean f = false;

		try {
			session = sessionfactory.openSession();
			tx = session.beginTransaction();

			session.save(exp);
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

	public List<Expense> getAllExpense(User user) {
		List<Expense> list = new ArrayList<Expense>();
		try {
			session = sessionfactory.openSession();
			Query q = session.createQuery("from Expense where user=:us ");
			q.setParameter("us", user);
			list = q.list();

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return list;

	}
	public Expense getExpenseById(int id) {
		Expense ex = null;
		try {
			session = sessionfactory.openSession();
			Query q = session.createQuery("from Expense where id=:id");
			q.setParameter("id", id);
			ex = (Expense) q.uniqueResult();
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return ex;
	}
	
	public boolean updateExpense(Expense exp) {
		boolean f = false;

		try {
			session = sessionfactory.openSession();
			tx = session.beginTransaction();

			session.saveOrUpdate(exp);
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
	
	public boolean deleteExpense(int id) {
		boolean f =false;
		try {
			session = sessionfactory.openSession();
			tx =session.beginTransaction();
			
			Expense exp = session.get(Expense.class, id);
			session.delete(exp);
			tx.commit();
			f = true;
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return f;
	}
	
}
