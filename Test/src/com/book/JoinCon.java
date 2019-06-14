package com.book;

import java.io.IOException;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.front.CommandService;
import com.sun.corba.se.pept.transport.Connection;

public class JoinCon implements CommandService {
	int cnt=0;
	PreparedStatement pst=null;
	Connection conn=null;
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String url = null;
		
		String id=request.getParameter("id");
		String pw=request.getParameter("pw");
		String nick=request.getParameter("nick");
		String email=request.getParameter("email");
		String tel=request.getParameter("tel");
		
		BookDTO dto=new BookDTO(id, pw, nick,email,tel);
		BookDAO dao=BookDAO.getDao();
			
		int cnt = dao.join(dto);

		if (cnt > 0) {
			url = "Question6_Login.jsp";
		} else {
			url = "Question6_Join.jsp";
		}
		return url;
	}
}
