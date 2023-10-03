package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Dao.USerDao;
import com.conn.HibernateUtil;
import com.entity.User;

@WebServlet("/userRegister")
public class Registration extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String fullname = req.getParameter("fullname");
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		String about = req.getParameter("about");
		
		User ur = new User(fullname,email,password,about);
		USerDao dao = new USerDao(HibernateUtil.getSessionFactory());
		boolean f = dao.saveuser(ur);
		HttpSession session = req.getSession();
		if(f) {
			session.setAttribute("success", "User Register Successfully");
			System.out.println("user register successfully");
		}else {
			session.setAttribute("success", "Something went wrong");
			System.out.println("Something went wrong");
		}
		resp.sendRedirect("register.jsp");
	}
  
}
