package com.book;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.front.CommandService;

public class LoginCon implements CommandService{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = null;
		
		String id=request.getParameter("id");
		String pw=request.getParameter("pw");
		
		BookDTO dto=new BookDTO(id, pw);
		BookDAO dao = BookDAO.getDao();
		
		BookDTO info = dao.login(dto);

		if (info != null) {
			HttpSession session=request.getSession();
			session.setAttribute("nick", info.getNick());
			url = "Question6_Main.jsp";
		} else {
			url = "Question6_Login.jsp";
		}
		return url;
	}

}
