package com.front;

import java.util.HashMap;

import com.book.JoinCon;

public class CommandMapper {
	public static HashMap<String, CommandService> getMap() {
		HashMap<String, CommandService> map = new HashMap<String, CommandService>();

		map.put("JoinCon.do", new JoinCon());

		return map;
	}
}
