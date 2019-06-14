<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="myCSS.css"> 
</head>
<body>
	<div>
		<fieldset>
			<legend><h1>로그인한 아이디를 출력하시오</h1></legend>
			<!-- 일반회원 로그인 할 경우 도서검색,나의책방,즐겨찾기,회원정보 버튼만 나오게하기 -->
				<button>도서검색</button>
				<button>나의책방</button>
				<button>즐겨찾기</button>
				<button>회원정보</button>
			<!-- admin 로그인 할 경우 회원관리,도서관리,대여현황,재고관리 버튼만 나오게하기 -->
				<button>회원관리</button>
				<button>도서관리</button>
				<button>대여현황</button>
				<button>재고관리</button>
		</fieldset>
	</div>
</body>
</html>