package com.front;

import java.util.HashMap;

import com.book.JoinCon;
import com.book.LoginCon;

public class CommandMapper {
	public static HashMap<String, CommandService> getMap() {
		HashMap<String, CommandService> map = new HashMap<String, CommandService>();

		map.put("JoinCon.do", new JoinCon());
		map.put("LoginCon.do", new LoginCon());

		return map;
	}
}
