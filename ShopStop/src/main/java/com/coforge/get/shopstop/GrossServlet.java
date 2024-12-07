package com.coforge.get.shopstop;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class GrossServlet
 */
@WebServlet("/GrossServlet")
public class GrossServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GrossServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		float basic = Float.parseFloat(request.getParameter("basic"));
        float da = basic * 0.8f;
        float hra = basic * 0.3f;
        float gross = basic + da + hra;
        
        //ServletCommunication
        // attributes are used for sharing values between one servlet and another - 
        request.setAttribute("b",basic); // float b=basic;
        request.setAttribute("da",da);
        request.setAttribute("hra",hra);
        request.setAttribute("gr", gross);
        
        RequestDispatcher rd = request.getRequestDispatcher("net.jsp");
        rd.forward(request, response);  
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
