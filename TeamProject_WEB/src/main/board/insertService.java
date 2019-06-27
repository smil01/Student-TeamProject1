package main.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import main.front.CommandService;
import main.member.sessionDTO;

public class insertService implements  CommandService{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		sessionDTO sdto= (sessionDTO)session.getAttribute("member");

		String title = request.getParameter("title");
		String content = request.getParameter("content");
		int member_code = sdto.getMember_id();
		String writer = sdto.getName();
		
		boardDTO dto = new boardDTO(0, title, content, member_code, null, writer);
		boardDAO dao = boardDAO.getDao();

		dao.insert(dto);

		return "boardService.do";
	}

	@Override
	public boolean getType() {
		// TODO Auto-generated method stub
		return false;
	}

}
