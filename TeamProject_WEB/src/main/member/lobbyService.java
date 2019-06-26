package main.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import main.front.CommandService;

public class lobbyService implements CommandService {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = null;

		HttpSession session = request.getSession();

		sessionDTO sdto = (sessionDTO) session.getAttribute("member");
		
		request.setAttribute("video", top3Util.get(3));

//		if (sdto == null) {
//			System.out.println("lobbyService. sdto : " + sdto);
//			url = "error.do";
//		} else {
//			url = "lobby.jsp";
//		}
//		return url;
		return "lobby.jsp";
	}

	@Override
	public boolean getType() {
		return false;
	}

}
