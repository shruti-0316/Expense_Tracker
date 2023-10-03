package com.conn;

import java.util.Properties;




import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.cfg.Environment;

import com.entity.Expense;
import com.entity.User;

public class HibernateUtil {
 private static SessionFactory sessionfactory;
 
 public static  SessionFactory getSessionFactory() {
	 if(sessionfactory==null) {
		 Configuration config = new Configuration();
		 Properties properties = new Properties();
		 
		 properties.put(Environment.DRIVER, "com.mysql.jdbc.Driver");
		 properties.put(Environment.URL, "jdbc:mysql://localhost:3306/hibernate_db");
		 properties.put(Environment.USER, "root");
		 properties.put(Environment.PASS, "ganu1603");
		 properties.put(Environment.DIALECT, "org.hibernate.dialect.MySQL8Dialect");
		 properties.put(Environment.HBM2DDL_AUTO, "update");
		 properties.put(Environment.SHOW_SQL, "true");
		 properties.put(Environment.FORMAT_SQL, "true");
		 
		 config.setProperties(properties);
		 config.addAnnotatedClass(User.class);
		 config.addAnnotatedClass(Expense.class);
		StandardServiceRegistry serviceregistry = new StandardServiceRegistryBuilder().applySettings(config.getProperties()).build();
		sessionfactory = config.buildSessionFactory(serviceregistry);
	 }
	 return sessionfactory;
 }
}
