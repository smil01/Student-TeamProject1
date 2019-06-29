package main.main;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonIOException;

/**
 * Servlet implementation class setModal
 */
@WebServlet("/setModal")
public class setModal extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String code = request.getParameter("code");
		String name = request.getParameter("name");
		
		localLvDAO dao = localLvDAO.getDao();
		localLvDTO dto = dao.getSelect(Integer.parseInt(code), Integer.parseInt(name));
		
		String result = new Gson().toJson(dto);
		
		
		try {
			response.setContentType("application/json");
			PrintWriter out = response.getWriter();
			out.print(result);
	        out.flush();
	        out.close();
		} catch (JsonIOException e) {
			e.printStackTrace();
		}
		
	}

}
