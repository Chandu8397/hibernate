package com.coforge.training.get.hiberweb;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class EmployeeServlet
 */
@WebServlet(name = "EmployeeServlet", urlPatterns = { "/EmployeeServlet" })
public class EmployeeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EmployeeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// Employee data (simulating a form submission)
        String name = request.getParameter("name");
        String department = request.getParameter("department");
        String salaryStr = request.getParameter("salary");

        if (name != null && department != null && salaryStr != null) {
         Double salary = Double.parseDouble(salaryStr);
         
         try {
            EmployeeDAO empDAO=new EmployeeDAO();
            empDAO.addEmployeeDetails(name, department,salary);
             response.sendRedirect("viewEmployees.jsp");
         } catch (Exception e) {
  
             e.printStackTrace();
         }
        }
        else {
        	 response.sendRedirect("employee.html");
        }

		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
