<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="myCSS.css">
</head>
<body>
	<div>
		<fieldset>
			<legend><h1>도서관리프로그램</h1></legend>
				<form action="LoginCon.do" method="post">
					<table align="center">
						<tr>
							<td>ID</td>
							<td><input type="text" name="id"></td>
							<td rowspan="2" ><input type="submit" value="로그인"> </td>
						</tr>
						<tr>
							<td>PW</td>
							<td><input type="password" name="pw"> </td>
						</tr>
						<tr>
							<td colspan="3">아이디가 없다면 <a href="Question6_Join.jsp" >회원가입</a>클릭</td>
						</tr>
					</table>
				</form>
		</fieldset>
	</div>
</body>
</html>