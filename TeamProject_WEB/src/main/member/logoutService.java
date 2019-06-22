package main.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import main.front.CommandService;

public class logoutService implements CommandService{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = null;
		
		HttpSession session = request.getSession();

		sessionDTO sdto = (sessionDTO)session.getAttribute("member");
		
		if(sdto==null) {
			url = "error.do";
		} else {
			session.removeAttribute("member");
			
			url = "main.do";
		}
		
		return url;
	}

	@Override
	public boolean getType() {
		return false;
	}

}
