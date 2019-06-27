package main.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.front.CommandService;

public class updateService implements CommandService{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int num = Integer.parseInt(request.getParameter("num"));
		String content = request.getParameter("content");
		
		boardDAO dao = boardDAO.getDao();
		dao.update(content, num);

		return "selectService.do?num=" + num;
	}

	@Override
	public boolean getType() {
		return true;
	}

}
