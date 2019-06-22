package main.front;

import java.util.HashMap;

import main.member.errorService;
import main.member.lobbyService;
import main.member.loginService;
import main.member.logoutService;
import main.member.mainService;

public class CommandMapper {
	public static HashMap<String, CommandService> getMap() {
		HashMap<String, CommandService> map = new HashMap<String, CommandService>();

		map.put("main.do", new mainService());
		map.put("loginService.do", new loginService());
		map.put("logoutService.do", new logoutService());
		map.put("lobbyService.do", new lobbyService());
		map.put("error.do", new errorService());

		return map;
	}
}
