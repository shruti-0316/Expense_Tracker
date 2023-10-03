package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Dao.ExpenseDao;
import com.conn.HibernateUtil;
import com.entity.Expense;
import com.entity.User;

@WebServlet("/update")
public class UpdateExpenseServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id = Integer.parseInt(req.getParameter("id"));
		String title = req.getParameter("title");
		String date = req.getParameter("date");
		String time = req.getParameter("time");
		String description = req.getParameter("description");
		String price = req.getParameter("price");
		
		
		HttpSession session = req.getSession();
		User u = (User) session.getAttribute("loginUser");
		
		Expense exp = new Expense(title, date, time, description, price, u);
	    exp.setId(id);
		
	    ExpenseDao dao = new ExpenseDao(HibernateUtil.getSessionFactory());
		boolean f = dao.updateExpense(exp);
		
		if(f) {
			session.setAttribute("msg", "Expense updated successfully");
			resp.sendRedirect("user/view_expense.jsp");
		}else {
			session.setAttribute("msg", "something went wrong");
			resp.sendRedirect("user/view_expense.jsp");
		}
		
		
	}
  
}
