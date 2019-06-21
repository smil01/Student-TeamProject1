<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.0.0.js"></script>
<fmt:requestEncoding value="UTF-8"/>
<title>Insert title here</title>
</head>
<body>
id : ${param.id}<br>
name : ${param.name}<br>
<img alt="프로필 이미지" src="${param.profile_image}" style="border-radius: 100%; width: 150px; height: 150px;">
</body>
</html>