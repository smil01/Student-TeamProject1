package main.front;

import javax.servlet.http.HttpServletRequest;

public class CommandUtil {
	public static String getCommand(HttpServletRequest request) {
		String requestURI = request.getRequestURI();

		String contextPath = request.getContextPath();

		String command = requestURI.substring(contextPath.length() + 1);

		return command;
	}
}
