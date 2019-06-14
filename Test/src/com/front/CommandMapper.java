package com.front;

import java.util.HashMap;

public class CommandMapper {
	public static HashMap<String, CommandService> getMap() {
		HashMap<String, CommandService> map = new HashMap<String, CommandService>();

		map.put(null, null);

		return map;
	}
}
