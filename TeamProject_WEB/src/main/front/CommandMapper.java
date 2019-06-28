package main.front;

import java.util.HashMap;

import main.board.boardService;
import main.board.deleteService;
import main.board.insertService;
import main.board.modifyService;
import main.board.selectService;
import main.board.updateService;
import main.board.writeService;
import main.main.mapService;
import main.member.errorService;
import main.member.lobbyService;
import main.member.loginService;
import main.member.logoutService;
import main.member.mainService;
import main.member.reLoginService;
import main.member.reLoginService2;
import main.menu.introService;
import main.menu.movieService;
import main.menu.tempManage;

public class CommandMapper {
	public static HashMap<String, CommandService> getMap() {
		HashMap<String, CommandService> map = new HashMap<String, CommandService>();

		map.put("main.do", new mainService());
		map.put("loginService.do", new loginService());
		map.put("logoutService.do", new logoutService());
		map.put("lobbyService.do", new lobbyService());
		map.put("reLoginService.do", new reLoginService());
		map.put("reLoginService2.do", new reLoginService2());
		map.put("introService.do", new introService());
		map.put("error.do", new errorService());
		map.put("boardService.do", new boardService());
		map.put("writeService.do", new writeService());
		map.put("insertService.do", new insertService());
		map.put("selectService.do", new selectService());
		map.put("deleteService.do", new deleteService());
		map.put("modifyService.do", new modifyService());
		map.put("updateService.do", new updateService());
		map.put("movieService.do", new movieService());
		map.put("mapService.do", new mapService());
		map.put("tempManage.do", new tempManage());

		return map;
	}
}
