package main.front;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.do")
public class FrontController extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		String command = CommandUtil.getCommand(request);
		CommandService input = CommandMapper.getMap().get(command);

		if (input == null) {
			response.sendRedirect("error.do");
		} else if (input.getType()) {
			response.sendRedirect(input.execute(request, response));
		} else {
			ServletContext context = request.getServletContext();
			RequestDispatcher dispatcher = context.getRequestDispatcher("/" + input.execute(request, response));
			dispatcher.forward(request, response);
		}

	}

}
