package main.main;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonIOException;

/**
 * Servlet implementation class setChart
 */
@WebServlet("/setChart")
public class setChart extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int crop_code = Integer.parseInt(request.getParameter("crop_code"));
		int local_code = Integer.parseInt(request.getParameter("local_code"));

		cropDAO dao = cropDAO.getDao();
		cropDTO crop = dao.getCropSelectAll(crop_code);
		ArrayList<localDTO> local = dao.getLocalSelectAll(local_code);

		request.setAttribute("crop", crop);
		request.setAttribute("local", local);
		
		ServletContext context = request.getServletContext();
		RequestDispatcher dispatcher = context.getRequestDispatcher("/chart_bar.jsp");
		dispatcher.forward(request, response);
	}
}
