package main.member;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.front.CommandService;

public class reLoginService2 implements CommandService{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String _code = request.getParameter("_code");
		sessionDTO sdto = (sessionDTO)request.getSession().getAttribute("member");
		@SuppressWarnings("unchecked")
		ArrayList<socialDTO> list = (ArrayList<socialDTO>)(request.getSession().getAttribute("list"));
		memberDAO dao = memberDAO.getDao();
		
		if(!dao.updateCode(sdto.getMember_id(), _code)) {
			System.out.println("reLoginService2 dao.updateCode. 결과 : 실패");
			return "error.do";
		}
		
		int int_code = 0;
		if(_code.equals("k")) {
			int_code = 0;
		} else if(_code.equals("n")) {
			int_code = 1;
		} else if(_code.equals("g")) {
			int_code = 2;
		}
		
		socialDTO sc_dto = list.get(int_code);
		sdto.setId(sc_dto.getId());
		sdto.setName(sc_dto.getName());
		sdto.setSrc(sc_dto.getSrc());
		sdto.setToken(_code);

		request.getSession().removeAttribute("member");
		request.getSession().setAttribute("member", sdto);
		request.getSession().setAttribute("check", "check");

		return "lobbyService.do";
	}

	@Override
	public boolean getType() {
		return false;
	}

}
