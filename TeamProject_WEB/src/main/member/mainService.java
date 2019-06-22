package main.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.front.CommandService;

public class mainService implements CommandService{
	public boolean getAndpost = false;
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = null;

		url = "main.html";
		return url;
	}

	@Override
	public boolean getType() {
		return false;
	}

}
