package main.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import main.front.CommandService;

public class loginService implements CommandService {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = null;

		sessionDTO sdto = new sessionDTO(request.getParameter("id"), request.getParameter("name"),
				request.getParameter("profile_image") != null ? request.getParameter("profile_image") : "img/std.gif",
				request.getParameter("access"));

		if (sdto.getId() == null)
			return "error.do";

		memberDAO dao = memberDAO.getDao();
		memberDTO dto = dao.selectId(sdto.getId());

		int cnt = 0;
		if (dto == null) {
			if (sdto.getAccess().equals("k")) {
				cnt = dao.getJoin(new memberDTO(0, 0, sdto.getId(), null, sdto.getName(), sdto.getSrc()));
			} else if (sdto.getAccess().equals("n")) {
				cnt = dao.getJoin(new memberDTO(0, 0, null, sdto.getId(), sdto.getName(), sdto.getSrc()));
			}
		}

		request.getSession().setAttribute("member", sdto);

		if (cnt == 0 && dto == null) {
			url = "error.do";
		} else {
			url = "lobbyService.do";
		}

		return url;
	}

	@Override
	public boolean getType() {
		return true;
	}

}
