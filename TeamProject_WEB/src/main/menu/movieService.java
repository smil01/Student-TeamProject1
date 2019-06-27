package main.menu;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.front.CommandService;
import main.member.top3Util;

public class movieService implements CommandService {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setAttribute("video", top3Util.get(20));

		return "video.jsp";
	}

	@Override
	public boolean getType() {
		return false;
	}

}
