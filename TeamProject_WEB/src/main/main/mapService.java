package main.main;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.front.CommandService;

public class mapService implements CommandService{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		return "map.jsp";
	}

	@Override
	public boolean getType() {
		return false;
	}

}
