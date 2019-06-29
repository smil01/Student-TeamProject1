package main.main;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class setModal
 */
@WebServlet("/setModal")
public class setModal extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String code = request.getParameter("code");
		String name = request.getParameter("name");
		
		System.out.println("code : "+code);
		System.out.println("name : "+name);
		
		PrintWriter out = response.getWriter();
		out.print("으아아아아아");
	}

}
