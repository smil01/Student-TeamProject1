package main.main;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.front.CommandService;

public class chartService implements CommandService{
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		cropDAO dao = cropDAO.getDao();
		ArrayList<cropDTO> crop_list = dao.getCropSelectAll();
		ArrayList<localDTO> local_list = dao.getLocalSelectAll();

		request.setAttribute("crop", crop_list);
		request.setAttribute("local", local_list);

		return "chart.jsp";
	}

	@Override
	public boolean getType() {
		return false;
	}

}
