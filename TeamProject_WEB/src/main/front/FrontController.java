package main.front;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.do") // 127.0.0.1/service.do
public class FrontController extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		String command = CommandUtil.getCommand(request); // 127.0.0.1/service.do -> String command = service.do;

		CommandService input = CommandMapper.getMap().get(command); // service.do -> 내가 만든 서비스 클래스로 이동

		System.out.println("================ 커멘드 확인 : " + command);
		if (input == null) {
			System.out.println("0. input : " + input);
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
