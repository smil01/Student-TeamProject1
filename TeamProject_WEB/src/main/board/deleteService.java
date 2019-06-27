package main.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.front.CommandService;

public class deleteService implements CommandService{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int num = Integer.parseInt(request.getParameter("num"));
		boardDAO dao = boardDAO.getDao();
		dao.delete(num);
		
		
		return "boardService.do";
	}

	@Override
	public boolean getType() {
		// TODO Auto-generated method stub
		return true;
	}

}
