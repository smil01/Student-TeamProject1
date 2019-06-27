package main.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.front.CommandService;

public class boardService implements CommandService{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		return "";
	}

	@Override
	public boolean getType() {
		// TODO Auto-generated method stub
		return false;
	}

	
	
}
