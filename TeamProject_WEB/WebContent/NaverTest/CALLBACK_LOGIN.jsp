<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="com.google.gson.JsonParser"%>
<%@page import="com.google.gson.JsonArray"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.net.URL"%>
<%@ page import="java.net.HttpURLConnection"%>
<%@ page import="java.io.BufferedReader"%>
<%@ page import="java.io.InputStreamReader"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
<title>네이버로그인</title>
</head>
<body>
	<%
		String clientId = "XsWuw1QRFltibzeqedSC";//애플리케이션 클라이언트 아이디값";
		String clientSecret = "ZP_1uNvRDc";//애플리케이션 클라이언트 시크릿값";
		String code = request.getParameter("code");
		String state = request.getParameter("state");
		String redirectURI = URLEncoder.encode("http://localhost:8081/NaverTest/CALLBACK_LOGIN.jsp", "UTF-8");
		String apiURL;
		apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&";
		apiURL += "client_id=" + clientId;
		apiURL += "&client_secret=" + clientSecret;
		apiURL += "&redirect_uri=" + redirectURI;
		apiURL += "&code=" + code;
		apiURL += "&state=" + state;
		String access_token = "";
		String refresh_token = "";

		String token = "";// 네이버 로그인 접근 토큰;
		try {
			URL url = new URL(apiURL);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setRequestMethod("GET");
			int responseCode = con.getResponseCode();
			BufferedReader br;
			if (responseCode == 200) { // 정상 호출
				br = new BufferedReader(new InputStreamReader(con.getInputStream(), "UTF-8"));
			} else { // 에러 발생
				br = new BufferedReader(new InputStreamReader(con.getErrorStream(), "UTF-8"));
			}
			String inputLine;
			StringBuffer res = new StringBuffer();
			JsonParser jsonParser = new JsonParser();
			JsonObject object = new JsonObject();
			while ((inputLine = br.readLine()) != null) {
				object = (JsonObject) jsonParser.parse(inputLine);
				res.append(inputLine);
			}
			token = object.get("access_token").getAsString();
			br.close();
			if (responseCode == 200) {
				//out.println(res.toString());
			}
		} catch (Exception e) {
			//System.out.println(e);
		}

		String header = "Bearer " + token; // Bearer 다음에 공백 추가
		try {
			String apiURL2 = "https://openapi.naver.com/v1/nid/me";
			URL url = new URL(apiURL2);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setRequestMethod("GET");
			con.setRequestProperty("Authorization", header);
			int responseCode = con.getResponseCode();
			BufferedReader br;
			if (responseCode == 200) { // 정상 호출
				br = new BufferedReader(new InputStreamReader(con.getInputStream(), "UTF-8"));
			} else { // 에러 발생
				br = new BufferedReader(new InputStreamReader(con.getErrorStream(), "UTF-8"));
			}
			String inputLine;
			StringBuffer response2 = new StringBuffer();
			JsonParser jsonParser = new JsonParser();
			JsonObject object = new JsonObject();
			while ((inputLine = br.readLine()) != null) {
				object = (JsonObject) jsonParser.parse(inputLine);
				response2.append(inputLine);
			}
			JsonObject object2 = (JsonObject) object.get("response");

			HashMap<String, String> map = new HashMap<String, String>();
			map.put("id", object2.get("id").getAsString());
			map.put("nickname", object2.get("nickname").getAsString());
			map.put("profile_image", object2.get("profile_image").getAsString());
			map.put("email", object2.get("email").getAsString());
			session.setAttribute("map", map);

			br.close();
			//out.println(response2.toString());
		} catch (Exception e) {
			//System.out.println(e);
		}

		response.sendRedirect("result.jsp");
	%>
</body>
</html>