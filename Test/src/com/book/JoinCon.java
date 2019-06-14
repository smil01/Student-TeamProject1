package com.book;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.front.CommandService;

public class JoinCon implements CommandService {
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = null;

		BookDAO dao = BookDAO.getDao();
		int cnt = dao.join(null);

		if (cnt > 0) {
			url = "Question6_Login.jsp";
		} else {
			url = "Question6_Join.jsp";
		}
		return url;
	}
}
