package com.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Dao.USerDao;
import com.conn.HibernateUtil;
import com.entity.User;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		USerDao dao = new USerDao(HibernateUtil.getSessionFactory());
		List<User> u =  dao.login(email, password);
		HttpSession session = req.getSession();
		
		  if(u !=null && !u.isEmpty()) { 
			  User loggedInUser = u.get(0);
		       
			  session.setAttribute("loginUser", loggedInUser);
			  resp.sendRedirect("user/home.jsp");
			
		  }else { 
			  session.setAttribute("msg", "Invalid Email or Password");
			  resp.sendRedirect("login.jsp");
		  }
		 
	}

}
