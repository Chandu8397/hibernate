package com.coforge.training.assignments;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class BookServlate
 */
@WebServlet(name = "BookServlet", urlPatterns = { "/BookServlet" })
public class BookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String title = request.getParameter("title");
        String author = request.getParameter("author");
        String publisher = request.getParameter("publisher");
       String quantity = request.getParameter("quantity");
       if (title != null && author != null && publisher != null &&  quantity != null) {
	         Integer Quantity = Integer.parseInt(quantity);

    try {
        BookDAO b2 = new BookDAO();
        b2.addUserDetails(title, author, publisher, Quantity);
        response.sendRedirect("Book.jsp");
    } catch (Exception e) {
 
        e.printStackTrace();
    }
       }
       else {
      	 response.sendRedirect("Book.html");
      }
	}
 
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
