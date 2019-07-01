<%@page import="main.member.socialDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);

.jejugothic * {
	font-family: 'Jeju Gothic', sans-serif;
}

.imgbox {
	margin-bottom: 10px;
	padding: 20px;
	float: left;
	text-align: center;
}

.panel-body h2 {
	align-content: center;
	font-family: 'Jeju Gothic';
	color: #44bd32;
}

legend {
	text-align: left;
}
</style>
<meta charset="UTF-8">
<!-- 디스플레이 자동화 -->
<meta name="viewport" content="width=device-width" , initial-scale="1">
<!-- 부트스트랩 css 임포트 -->
<link rel="stylesheet" href="css/bootstrap.css">
<!-- 글꼴 및 점보트론 조정 css임포트 -->
<link rel="stylesheet" href="css/costom.css">
<!-- 타이틀 아이콘 -->
<link rel="icon" type="image/png" sizes="96x96"
	href="assets/img/favicon.png">
<title>스미원 - Tropic Trophy</title>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
	charset="utf-8"></script>
<meta name="google-signin-client_id"
	content="183312277531-653eugt70bdeqd1s2gb2u51fg3lev3gu.apps.googleusercontent.com">
<!-- 제이쿼리 임포트 -->
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<!-- 부트스트랩js 임포트 -->
<script src="js/bootstrap.js"></script>
<link href="css/select2.min.css" rel="stylesheet" />
<script src="js/select2.min.js"></script>
<fmt:requestEncoding value="UTF-8" />
</head>
<body>
		<!-- 1 네이게이션바 라인 시작 -->
	<nav class="navbar navbar-default navbar-fixed-top">
		<div class="container-fluid" style="">
			<!-- 1-1 헤더부분 시작 -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
					aria-expanded="false">
					<span class="sr-only"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span> <span class="icon-bar"></span>
				</button>
				<!-- 시작부터 윗부분은 사용을 위한 형식적인 의미없는 부분(아직은) -->

				<!-- 1-1-1 네비게이션바 가장 우측 브랜드 단 시작 -->
				<a class="navbar-brand" href="lobbyService.do">Tropic
					Trophy&nbsp;&nbsp; </a>
				<!-- 1-1-1 네비게이션바 가장 우측 브랜드 단 끝 -->
			</div>
			<!-- 1-1 헤더부분 끝-->

			<!-- 1-2 브렌드 우측부터 들어가는 개별적 메뉴들 시작 -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<!-- 1-2-1 첫번째 메뉴 (active는 현재 선택이 되어있는 효과를 줌) -->
					<li class="active main"></li>
					<li><a href="introService.do">스미원 소개&nbsp;</a></li>
					<!-- 1-2-2 두번째 메뉴 (active는 현재 선택이 되어있는 효과를 줌) -->
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">소통광장&nbsp;<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="boardService.do">자유게시판 </a></li>
							<li><a href="snslink.jsp">농업도 SNS </a></li>

						</ul></li>

					<!-- 1-2-3 세번째 메뉴 (드랍다운 리스트 시작) 시작 -->
					<li class="dropdown  active" ><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">작물이야기&nbsp;<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="tempManage.do">온도 관리 </a></li>
							<li><a href="storyService.do">작물소개 </a></li>
							<li><a href="movieService.do">최신영상보기</a></li>

						</ul></li>
					<!-- 1-2-3-4 네번째 메뉴 (드랍다운 리스트 시작) 시작 -->
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">히든작물&nbsp;<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="mapService.do">지도기반분석</a></li>
							<li><a href="chartService.do">차트기반분석</a></li>
						</ul></li>
				</ul>
				<!-- 1-2-3 세번째 메뉴 끝-->



				<!-- 1-2-4 네번째 검색창 시작 -->
				<form action="#" class="navbar-form navbar-left">
					<div class="form-group">
							<select class="js-example-basic-single" id="search_box"
								style="width: 250px" multiple="multiple">
							</select>
					</div>
				</form>
				<!-- 1-2-4 네번째 검색창 끝 -->

				<!-- 1-2-5 다섯번째 로그인 메뉴 시작 -->
				<c:if test="${sessionScope.member != null}">
					<ul class="nav navbar-nav navbar-right">
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false" style="padding: 7px;"><img
								class="img-circle" src="${sessionScope.member.src}" alt="프로필"
								height="36px" width="36px">&nbsp;${sessionScope.member.name}<span
								class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a data-target="#modal" data-toggle="modal">계정연동</a></li>
								<li><a id="logout">로그아웃</a></li>
							</ul></li>
					</ul>
				</c:if>
				<c:if test="${sessionScope.member == null}">
					<ul class="nav navbar-nav navbar-right">
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false" style="padding: 7px;"><img
								class="img-circle" src="img/m_img.png" alt="프로필" height="36px"
								width="36px">&nbsp;로그인<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a id="login" href="main.do">로그인 하러가기</a></li>
							</ul></li>
					</ul>
				</c:if>
				<!-- 1-2-5 다섯번째 로그인 메뉴 끝 -->
			</div>
			<!-- 1-2 브렌드 우측부터 들어가는 개별적 메뉴들 끝 -->
		</div>
	</nav>
	<!-- 1 네이게이션바 라인 끝 -->

	<!-- 2 컨테이너 div라인 시작 -->
	<div class="container">
	<br><br><br><br>
		<div class="row">
		<hr style="margin-top: 0px;">
		<div class="panel panel-success">
			<div class="panel-heading">
				<h3 class="panel-title">


					<span class="glyphicon glyphicon-pencil"></span>&nbsp;&nbsp;아보카도
				</h3>
			</div>
			<div class="panel-body">
				<hr style="margin-top: 12px;">

				<div>

					<fieldset>
						<legend>
							<h2 id="h2">&nbsp;&nbsp; 아보카도 재배법</h2>
							<br>
						</legend>
						<div class="inner page1" id="div_page">
							<p style="text-align: center; text-indent: 0pt;">
								<span
									style="border: 1pt rgb(0, 0, 0); border-image: none; font-family: 바탕; font-size: 24pt;">
								</span>
							</p>
							<p style="text-indent: 0pt;">
								<span
									style="font-family: 한양신명조; font-size: 14pt; font-weight: bold;">재배
									적지</span>
							</p>
							<p
								style="border: 1pt rgb(0, 0, 0); border-image: none; text-align: justify; text-indent: 0pt; -ms-text-justify: distribute-all-lines;">
								<span style="font-family: 한양신명조; font-size: 12pt;">최적의
									재배지역은 환경이 좋은 동남향의 따뜻한 지역의 서리가 없는 곳이다</span><span
									style="font-family: 한양신명조; font-size: 12pt;">. </span><span
									style="font-family: 한양신명조; font-size: 12pt;">아보카도는 아열대성
									과수이기 때문에 비교적 내한성이 강한 품종은 </span><span
									style="font-family: 한양신명조; font-size: 12pt;">5</span><span
									style="font-family: 한양신명조; font-size: 12pt;">℃까지 저온에 견딘다</span><span
									style="font-family: 한양신명조; font-size: 12pt;">. </span><span
									style="font-family: 한양신명조; font-size: 12pt;">겨울 최저온도</span><span
									style="font-family: 한양신명조; font-size: 12pt;">(-6</span><span
									style="font-family: 한양신명조; font-size: 12pt;">℃ </span><span
									style="font-family: 한양신명조; font-size: 12pt;">)</span><span
									style="font-family: 한양신명조; font-size: 12pt;">가 장시간 계속되는
									지역에서는 재배가 어렵다</span><span style="font-family: 한양신명조; font-size: 12pt;">.
								</span><span style="font-family: 한양신명조; font-size: 12pt;">또한 </span><span
									style="font-family: 한양신명조; font-size: 12pt;">4</span><span
									style="font-family: 한양신명조; font-size: 12pt;">월 중순부터 </span><span
									style="font-family: 한양신명조; font-size: 12pt;">6</span><span
									style="font-family: 한양신명조; font-size: 12pt;">월 상순까지 개화기에
									주간은 </span><span style="font-family: 한양신명조; font-size: 12pt;">17</span><span
									style="font-family: 한양신명조; font-size: 12pt;">℃ 이상이고 야간에는
								</span><span style="font-family: 한양신명조; font-size: 12pt;">11</span><span
									style="font-family: 한양신명조; font-size: 12pt;">℃ 이상인 지역이
									수분수정에 알맞다</span><span style="font-family: 한양신명조; font-size: 12pt;">.
								</span><span style="font-family: 한양신명조; font-size: 12pt;">재배지는
									햇볕이 잘 들고 경사가 약간 있는 지역이 좋다</span><span
									style="font-family: 한양신명조; font-size: 12pt;">. </span><span
									style="font-family: 한양신명조; font-size: 12pt;">아보카도는 잔뿌리가
									적은 심근성 작물이라서 물에 매우 민감하다</span><span
									style="font-family: 한양신명조; font-size: 12pt;">. </span><span
									style="font-family: 한양신명조; font-size: 12pt;">토양은 배수가 양호한
									표토에 깊은 사양토가 최적지이다</span><span
									style="font-family: 한양신명조; font-size: 12pt;">. </span><span
									style="font-family: 한양신명조; font-size: 12pt;">배수가 힘든 중점질토
									등 지하수위가 높은 습지는 뿌리부패를 유발한다</span><span
									style="font-family: 한양신명조; font-size: 12pt;">. </span><span
									style="font-family: 한양신명조; font-size: 12pt;">또한 사질토나 표토가
									낮은 토양은 가뭄을 잘 탄다</span><span
									style="font-family: 한양신명조; font-size: 12pt;">. </span><span
									style="font-family: 한양신명조; font-size: 12pt;">토양수분은 어느 정도
									유지되지 않으면 뿌리 발달이 나빠진다</span><span
									style="font-family: 한양신명조; font-size: 12pt;">.</span>
							</p>
							<p
								style="border: 1pt rgb(0, 0, 0); border-image: none; text-indent: 0pt;">
								<span style="font-family: 한양신명조; font-size: 12pt;"> </span>
							</p>
							<p style="text-indent: 0pt;">
								<span
									style="font-family: 한양신명조; font-size: 12pt; font-weight: bold;">가</span><span
									style="font-family: 한양신명조; font-size: 12pt; font-weight: bold;">.
								</span><span
									style="font-family: 한양신명조; font-size: 12pt; font-weight: bold;">재배지
									선정 </span><span
									style="font-family: 한양신명조; font-size: 12pt; font-weight: bold;">:
								</span><span
									style="font-family: 한양신명조; font-size: 12pt; font-weight: bold;">기후와
									토양 요구조건</span>
							</p>
							<p
								style="border: 1pt rgb(0, 0, 0); border-image: none; text-align: justify; text-indent: 0pt; -ms-text-justify: distribute-all-lines;">
								<span style="font-family: 한양신명조; font-size: 12pt;">아보카도
									나무는 뿌리가 잘 발달되어 있지 않고</span><span
									style="font-family: 한양신명조; font-size: 12pt;">, </span><span
									style="font-family: 한양신명조; font-size: 12pt;">뿌리털이 거의 없어
									수분 흡수 능력이 떨어진다</span><span
									style="font-family: 한양신명조; font-size: 12pt;">. </span><span
									style="font-family: 한양신명조; font-size: 12pt;">또한 근권이 얕아
									산소 요구량이 많아 짧은 시간의 산소 결핍에도 뿌리가 죽는다</span><span
									style="font-family: 한양신명조; font-size: 12pt;">. </span><span
									style="font-family: 한양신명조; font-size: 12pt;">또한 아보카도는 강한
									햇빛을 좋아하며</span><span style="font-family: 한양신명조; font-size: 12pt;">,
								</span><span style="font-family: 한양신명조; font-size: 12pt;">그늘에서는
									착과보다는 새순이 계속 나오면서 도장지 발생이 왕성하여 가지만 무성해지고 꽃눈의 수가 감소하는 결과를 초래한다</span><span
									style="font-family: 한양신명조; font-size: 12pt;">. </span><span
									style="font-family: 한양신명조; font-size: 12pt;">나무의 성장은 매우
									빠르고</span><span style="font-family: 한양신명조; font-size: 12pt;">,
								</span><span style="font-family: 한양신명조; font-size: 12pt;">정단부에서
									결실이 일어난다</span><span style="font-family: 한양신명조; font-size: 12pt;">.
								</span><span style="font-family: 한양신명조; font-size: 12pt;">뿌리와
									새순의 성장은 두 번 내지 세 번의 주요 성장기에 일어난다</span><span
									style="font-family: 한양신명조; font-size: 12pt;">.</span>
							</p>
							<p
								style="border: 1pt rgb(0, 0, 0); border-image: none; text-indent: 0pt;">
								<span style="font-family: 한양신명조; font-size: 12pt;"> </span>
							</p>
							<p style="text-indent: 0pt;">
								<span
									style="font-family: 한양신명조; font-size: 12pt; font-weight: bold;">나</span><span
									style="font-family: 한양신명조; font-size: 12pt; font-weight: bold;">.
								</span><span
									style="font-family: 한양신명조; font-size: 12pt; font-weight: bold;">온
									도</span>
							</p>
							<p
								style="border: 1pt rgb(0, 0, 0); border-image: none; text-align: justify; text-indent: 0pt; -ms-text-justify: distribute-all-lines;">
								<span style="font-size: 12pt;">적당한 기온은 생장과 착과 및 성공적인 재배에
									매우 중요한 요소이다</span><span style="font-size: 12pt;">. </span><span
									style="font-size: 12pt;">다음과 같</span><span
									style="font-size: 12pt;">은 미세기후 조건에서는 아보카도를 상업적으로 재배하기는
									쉽지 않다</span><span style="font-size: 12pt;">.</span>
							</p>
							<p style="text-indent: 0pt;">
								<span style="font-family: 한양신명조; font-size: 12pt;">겨울에
									기온이 ℃ 이하로 내려가는 날이 있는 경우</span>
							</p>
							<p
								style="border: 1pt rgb(0, 0, 0); border-image: none; text-indent: 0pt;">
								<span style="font-family: 한양신명조; font-size: 12pt;">개화기
									동안에 주간 기온이 </span><span style="font-family: 한양신명조; font-size: 12pt;">20</span><span
									style="font-family: 한양신명조; font-size: 12pt;">℃ 이하로 내려가는
									경우</span>
							</p>
							<p style="text-indent: 0pt;">
								<span style="font-family: 한양신명조; font-size: 12pt;">개화기
									동안에 야간 기온이 </span><span style="font-family: 한양신명조; font-size: 12pt;">10</span><span
									style="font-family: 한양신명조; font-size: 12pt;">℃ 이하로 내려가는
									경우</span>
							</p>
							<p
								style="border: 1pt rgb(0, 0, 0); border-image: none; text-indent: 0pt;">
								<span style="font-family: 한양신명조; font-size: 12pt;"></span><span
									style="font-family: 한양신명조; font-size: 12pt;">10</span><span
									style="font-family: 한양신명조; font-size: 12pt;">월에 서리가 종종
									내리는 경우</span>
							</p>
							<p
								style="text-align: justify; text-indent: 0pt; -ms-text-justify: distribute-all-lines;">
								<span style="font-size: 12pt;">기온이 낮은 생장 조건에서는 생식생장 </span><span
									style="font-size: 12pt;"> </span><span style="font-size: 12pt;">보다는
									영양생장이 우선 된다는 것이 뉴</span><span style="font-size: 12pt;">질랜드의 많은
									아보카도 생산 단지에서 재배결과 나타났다</span><span style="font-size: 12pt;">. </span><span
									style="font-size: 12pt;">기온이 올라감에 따</span><span
									style="font-size: 12pt;">라 빛의 양도 증가하고</span><span
									style="font-size: 12pt;">, </span><span
									style="font-size: 12pt;">나무는 점차 생식생장을 하게 된다</span><span
									style="font-size: 12pt;">. </span><span
									style="font-size: 12pt;">따라서 온도를 낮지 않</span><span
									style="font-size: 12pt;">도록 해주고 빛의 조건을 좋게 해주는 것이 좋다. 개</span><span
									style="font-size: 12pt;">화기 동안 개화가 잘 이루어지기 위해서는 따뜻하고 비교적
									건조한 조건이 요구된다. 특히 야간온도가 11℃ 이상, 2일 이상 17℃ 이상이 유지되도록 한다. 이러</span><span
									style="font-size: 12pt;">한 조건이 충족되지 않는 경우 열매 맺는 비율(착과율)은
									매우 낮아지고, 수확량</span><span style="font-size: 12pt;">도 떨어지게 된다.</span>
							</p>
						</div>
						
						<div class="inner page1" id="div_page">
							<p
								style="border: 1pt rgb(0, 0, 0); border-image: none; text-indent: 0pt;">
								<span style="font-family: 한양신명조; font-size: 12pt;">잎은 </span><span
									style="font-family: 한양신명조; font-size: 12pt;">-1</span><span
									style="font-family: 한양신명조; font-size: 12pt;">∼</span><span
									style="font-family: 한양신명조; font-size: 12pt;">-2</span><span
									style="font-family: 한양신명조; font-size: 12pt;">℃ 정도의 약한 서리
									피해에는 저항성이 있지만</span><span style="font-family: 한양신명조; font-size: 12pt;">,
								</span><span style="font-family: 한양신명조; font-size: 12pt;">어린 순은
									서리 피해에 매우 취약하다</span><span
									style="font-family: 한양신명조; font-size: 12pt;">. </span><span
									style="font-family: 한양신명조; font-size: 12pt;">꽃눈이 개화 전에
									서리 피해를 받을 경우 열매 달림</span><span
									style="font-family: 한양신명조; font-size: 12pt;">(</span><span
									style="font-family: 한양신명조; font-size: 12pt;">착과</span><span
									style="font-family: 한양신명조; font-size: 12pt;">)</span><span
									style="font-family: 한양신명조; font-size: 12pt;">이 일어나지 않는다</span><span
									style="font-family: 한양신명조; font-size: 12pt;">. </span><span
									style="font-family: 한양신명조; font-size: 12pt;">꽃눈이 부풀기
									시작하면 서리 피해는 더욱 커지고</span><span
									style="font-family: 한양신명조; font-size: 12pt;">, </span><span
									style="font-family: 한양신명조; font-size: 12pt;">개화기 동안에 적당한
									온도가 주어져도 열매 달림</span><span
									style="font-family: 한양신명조; font-size: 12pt;">(</span><span
									style="font-family: 한양신명조; font-size: 12pt;">착과</span><span
									style="font-family: 한양신명조; font-size: 12pt;">)</span><span
									style="font-family: 한양신명조; font-size: 12pt;">이 되지 않는다</span><span
									style="font-family: 한양신명조; font-size: 12pt;">. </span><span
									style="font-family: 한양신명조; font-size: 12pt;">그리고 우리나라처럼
									해양성기후에서 시설재배를 할 경우 공중습도가 높아지게 되는데 공중습도가 높으면 칼슘과 붕소 같은 특정 미네랄
									결핍현상이 일어날 수 있다</span><span
									style="font-family: 한양신명조; font-size: 12pt;">.</span>
							</p>
							<p style="text-indent: 0pt;">
								<span style="font-family: 한양신명조; font-size: 12pt;"> </span>
							</p>
							<p
								style="border: 1pt rgb(0, 0, 0); border-image: none; text-indent: 0pt;">
								<span
									style="font-family: 한양신명조; font-size: 12pt; font-weight: bold;">다</span><span
									style="font-family: 한양신명조; font-size: 12pt; font-weight: bold;">.
								</span><span
									style="font-family: 한양신명조; font-size: 12pt; font-weight: bold;">강
									우</span>
							</p>
							<p
								style="text-align: justify; text-indent: 0pt; -ms-text-justify: distribute-all-lines;">
								<span style="font-family: 한양신명조; font-size: 12pt;">아보카도를
									재배할 경우 관수 시설이 반드시 있어야 한다</span><span
									style="font-family: 한양신명조; font-size: 12pt;">. </span><span
									style="font-family: 한양신명조; font-size: 12pt;">꽃필 때</span><span
									style="font-family: 한양신명조; font-size: 12pt;">(</span><span
									style="font-family: 한양신명조; font-size: 12pt;">개화기</span><span
									style="font-family: 한양신명조; font-size: 12pt;">), </span><span
									style="font-family: 한양신명조; font-size: 12pt;">열매 달릴 때</span><span
									style="font-family: 한양신명조; font-size: 12pt;">(</span><span
									style="font-family: 한양신명조; font-size: 12pt;">착과기</span><span
									style="font-family: 한양신명조; font-size: 12pt;">), </span><span
									style="font-family: 한양신명조; font-size: 12pt;">과실 성장기 등순
									성장기에는 수분 요구량이 높다</span><span
									style="font-family: 한양신명조; font-size: 12pt;">. </span><span
									style="font-family: 한양신명조; font-size: 12pt;">또한 아보카도 나무는
									여름과 가을 동안 많은 수분을 요구한다</span><span
									style="font-family: 한양신명조; font-size: 12pt;">. </span><span
									style="font-family: 한양신명조; font-size: 12pt;">이러한 조건에서는
									수분 스트레스가 많이 발생하기 때문에 관수시설을 설치하여 나무의 생장과 과일 발육을 위하여 적당한 수분을
									공급해주어야 한다</span><span style="font-family: 한양신명조; font-size: 12pt;">.
								</span><span style="font-family: 한양신명조; font-size: 12pt;">아보카도는
									홍수에 매우 민감하고</span><span style="font-family: 한양신명조; font-size: 12pt;">,
								</span><span style="font-family: 한양신명조; font-size: 12pt;">단기간의
									침수에서도 성장에 저해를 받으며 미네랄 흡수가 변하고 뿌리가 죽게 된다</span><span
									style="font-family: 한양신명조; font-size: 12pt;">. </span><span
									style="font-family: 한양신명조; font-size: 12pt;">토양 수분이 많은
									경우 역병</span><span style="font-family: 한양신명조; font-size: 12pt;">(</span><span
									style="font-family: 한양신명조; font-size: 12pt; font-style: italic;">Phytophthora
									cinnamori</span><span style="font-family: 한양신명조; font-size: 12pt;">)</span><span
									style="font-family: 한양신명조; font-size: 12pt;">에 의한 뿌리
									썩음병이 발생하고</span><span style="font-family: 한양신명조; font-size: 12pt;">,
								</span><span style="font-family: 한양신명조; font-size: 12pt;">홍수와
									역병에 의한 영향은 누적되는 경향이 있으며</span><span
									style="font-family: 한양신명조; font-size: 12pt;">, </span><span
									style="font-family: 한양신명조; font-size: 12pt;">호흡과 탄소동화가
									감소된다</span><span style="font-family: 한양신명조; font-size: 12pt;">.
								</span><span style="font-family: 한양신명조; font-size: 12pt;">토양 수분이
									높은 경우에는 토양 침수의 영향으로 역병에 의한 뿌리 썩음병 발생을 조장한다</span><span
									style="font-family: 한양신명조; font-size: 12pt;">.</span>
							</p>
							<p style="text-indent: 0pt;">
								<span style="font-family: 한양신명조; font-size: 12pt;"> </span>
							</p>
							<p
								style="border: 1pt rgb(0, 0, 0); border-image: none; text-indent: 0pt;">
								<span
									style="font-family: 한양신명조; font-size: 12pt; font-weight: bold;">라</span><span
									style="font-family: 한양신명조; font-size: 12pt; font-weight: bold;">.
								</span><span
									style="font-family: 한양신명조; font-size: 12pt; font-weight: bold;">토양
									조건</span>
							</p>
							<p
								style="text-align: justify; text-indent: 0pt; -ms-text-justify: distribute-all-lines;">
								<span style="font-family: 한양신명조; font-size: 12pt;">아보카도는
									뿌리가 얕게 자라는 천근성이며</span><span
									style="font-family: 한양신명조; font-size: 12pt;">, </span><span
									style="font-family: 한양신명조; font-size: 12pt;">원래의 줄기에서
									갈라져 나간 가지가 많은 뿌리 구조를 가지고 있어서 통기와 배수가 좋아야 뿌리가 건강해진다</span><span
									style="font-family: 한양신명조; font-size: 12pt;">. </span><span
									style="font-family: 한양신명조; font-size: 12pt;">뿌리는 나뭇잎이나</span><span
									style="font-family: 한양신명조; font-size: 12pt;">, </span><span
									style="font-family: 한양신명조; font-size: 12pt;">거름과 같은 유기물의
									분해물로부터 유리된 미네랄을 효과적으로 흡수하고 순환시킨다</span><span
									style="font-family: 한양신명조; font-size: 12pt;">. </span><span
									style="font-family: 한양신명조; font-size: 12pt;">아보카도에 이상적인
									토양은 다음과 같은 물리적 특성을 가져야 한다</span><span
									style="font-family: 한양신명조; font-size: 12pt;">.</span>
							</p>
							<p style="text-indent: 0pt;">
								<span style="font-family: 한양신명조; font-size: 12pt;">토심은 </span><span
									style="font-family: 한양신명조; font-size: 12pt;">1.5m </span><span
									style="font-family: 한양신명조; font-size: 12pt;">이상 되어야 한다</span><span
									style="font-family: 한양신명조; font-size: 12pt;">.</span>
							</p>
							<p
								style="border: 1pt rgb(0, 0, 0); border-image: none; text-indent: 0pt;">
								<span style="font-family: 한양신명조; font-size: 12pt;">토양중에
									공기 함유도가 높아야 한다</span><span
									style="font-family: 한양신명조; font-size: 12pt;">.</span>
							</p>
							<p style="text-indent: 0pt;">
								<span style="font-family: 한양신명조; font-size: 12pt;">균일하고</span><span
									style="font-family: 한양신명조; font-size: 12pt;">, </span><span
									style="font-family: 한양신명조; font-size: 12pt;">배수가 자유로워야
									한다</span><span style="font-family: 한양신명조; font-size: 12pt;">.</span>
							</p>
							<p
								style="border: 1pt rgb(0, 0, 0); border-image: none; text-indent: 0pt;">
								<span style="font-family: 한양신명조; font-size: 12pt;">너무
									빽빽하지 않고</span><span style="font-family: 한양신명조; font-size: 12pt;">,
								</span><span style="font-family: 한양신명조; font-size: 12pt;">불침투층이
									있어서는 안 된다</span><span style="font-family: 한양신명조; font-size: 12pt;">.</span>
							</p>
						</div>
						
						<div class="inner page1" id="div_page">
							<p style="text-indent: 0pt;">
								<span style="font-family: 한양신명조; font-size: 12pt;">토양 산도는
								</span><span style="font-family: 한양신명조; font-size: 12pt;">6.4</span><span
									style="font-family: 한양신명조; font-size: 12pt;">∼</span><span
									style="font-family: 한양신명조; font-size: 12pt;">6.6 </span><span
									style="font-family: 한양신명조; font-size: 12pt;">정도이다</span><span
									style="font-family: 한양신명조; font-size: 12pt;">.&lt;</span><span
									style="font-family: 한양신명조; font-size: 12pt;">토양산도는 석회로
									조절이 가능</span><span style="font-family: 한양신명조; font-size: 12pt;">).</span>
							</p>
							<p
								style="border: 1pt rgb(0, 0, 0); border-image: none; text-indent: 0pt;">
								<span style="font-family: 한양신명조; font-size: 12pt;">토양은
									비옥도가 높아야 한다</span><span style="font-family: 한양신명조; font-size: 12pt;">.</span>
							</p>
							<p style="text-indent: 0pt;">
								<span style="font-family: 한양신명조; font-size: 12pt;">토양은
									유기물 농도가 높아야 하고</span><span
									style="font-family: 한양신명조; font-size: 12pt;">, </span><span
									style="font-family: 한양신명조; font-size: 12pt;">대부분의 경우 유기
									보충제 형태로 공급된다</span><span style="font-family: 한양신명조; font-size: 12pt;">.</span>
							</p>
							<p
								style="border: 1pt rgb(0, 0, 0); border-image: none; text-align: justify; text-indent: 0pt; -ms-text-justify: distribute-all-lines;">
								<span style="font-family: 한양신명조; font-size: 12pt;"> </span>
							</p>

							<p
								style="text-align: justify; text-indent: 0pt; -ms-text-justify: distribute-all-lines;">
								<span style="font-family: 한양신명조; font-size: 12pt;"> </span>
							</p>
							<p
								style="border: 1pt rgb(0, 0, 0); border-image: none; text-align: justify; text-indent: 0pt; -ms-text-justify: distribute-all-lines;">
								<span style="font-family: 한양신명조; font-size: 12pt;">토양이
									다음과 같은 특성 중에 한 가지라도 갖고 있으면 아보카도의 상업적인 생산은 적합하지 않다고 볼 수 있다</span><span
									style="font-family: 한양신명조; font-size: 12pt;">.</span>
							</p>
							<p
								style="border: 1pt rgb(0, 0, 0); border-image: none; text-indent: 0pt;">
								<span style="font-family: 한양신명조; font-size: 12pt;">주기적으로
									침수가 되는 토양</span>
							</p>
							<p style="text-indent: 0pt;">
								<span style="font-family: 한양신명조; font-size: 12pt;">최근에 매립
									등의 작업이 있었던 경우</span>
							</p>
							<p
								style="border: 1pt rgb(0, 0, 0); border-image: none; text-indent: 0pt;">
								<span style="font-family: 한양신명조; font-size: 12pt;">이탄 함량이
									높아 토양 산도가 낮은 경우</span>
							</p>
							<p style="text-indent: 0pt;">
								<span style="font-family: 한양신명조; font-size: 12pt;">비중</span><span
									style="font-family: 한양신명조; font-size: 12pt;">(Bulk
									Density)</span><span style="font-family: 한양신명조; font-size: 12pt;">이
								</span><span style="font-family: 한양신명조; font-size: 12pt;">0.65 </span><span
									style="font-family: 한양신명조; font-size: 12pt;">이하이거나 </span><span
									style="font-family: 한양신명조; font-size: 12pt;">0.85 </span><span
									style="font-family: 한양신명조; font-size: 12pt;">이상인 경우</span>
							</p>
							<p
								style="border: 1pt rgb(0, 0, 0); border-image: none; text-indent: 0pt;">
								<span style="font-family: 한양신명조; font-size: 12pt;">알루미늄이나
									나트륨 함량이 높은 토양</span>
							</p>
							<p style="text-indent: 0pt;">
								<span style="font-family: 한양신명조; font-size: 12pt;"> </span>
							</p>
							<p
								style="border: 1pt rgb(0, 0, 0); border-image: none; text-indent: 0pt;">
								<span
									style="font-family: 한양신명조; font-size: 12pt; font-weight: bold;">마</span><span
									style="font-family: 한양신명조; font-size: 12pt; font-weight: bold;">.
								</span><span
									style="font-family: 한양신명조; font-size: 12pt; font-weight: bold;">재배지의
									적합성</span>
							</p>
							<p
								style="text-align: justify; text-indent: 0pt; -ms-text-justify: distribute-all-lines;">
								<span style="font-family: 한양신명조; font-size: 12pt;">아보카도
									재배지를 결정하기 위해서는 전문가들이 직접 방문하여 부지의 특성을 평가하는 것이 좋다</span><span
									style="font-family: 한양신명조; font-size: 12pt;">. </span><span
									style="font-family: 한양신명조; font-size: 12pt;">작물 재배에 적합하지
									않은 지역의 경우에도 아보카도 재배에 부적합한 미세 기후를 나타내는 경우가 있다</span><span
									style="font-family: 한양신명조; font-size: 12pt;">. </span><span
									style="font-family: 한양신명조; font-size: 12pt;">재배지를 선정하는
									경우 전문가의 도움을 받는 것이 최선이다</span><span
									style="font-family: 한양신명조; font-size: 12pt;">. </span><span
									style="font-family: 한양신명조; font-size: 12pt;">기온을 포함한
									장기간의 기상 자료</span><span style="font-family: 한양신명조; font-size: 12pt;">,
								</span><span style="font-family: 한양신명조; font-size: 12pt;">특정 미세
									기후와 몇 가지의 정도의 토양 특성 검사 등의 정보가 필요하다</span><span
									style="font-family: 한양신명조; font-size: 12pt;">. </span><span
									style="font-family: 한양신명조; font-size: 12pt;">재배적지 선정 시
									고려해야 할 점은 아래와 같다</span><span
									style="font-family: 한양신명조; font-size: 12pt;">.</span>
							</p>
							<p style="text-indent: 0pt;">
								<span style="font-family: 한양신명조; font-size: 12pt;">겨울철 기온</span>
							</p>
							<p
								style="border: 1pt rgb(0, 0, 0); border-image: none; text-indent: 0pt;">
								<span style="font-family: 한양신명조; font-size: 12pt;">개화기 온도</span>
							</p>
							<p style="text-indent: 0pt;">
								<span style="font-family: 한양신명조; font-size: 12pt;">토양의
									물리적</span><span style="font-family: 한양신명조; font-size: 12pt;">,
								</span><span style="font-family: 한양신명조; font-size: 12pt;">화학적 특성</span>
							</p>
							<p
								style="border: 1pt rgb(0, 0, 0); border-image: none; text-indent: 0pt;">
								<span style="font-family: 한양신명조; font-size: 12pt;">방위</span>
							</p>
							<p style="text-indent: 0pt;">
								<span style="font-family: 한양신명조; font-size: 12pt;">물</span>
							</p>
						</div>
						
						<div class="inner page1" id="div_page">
							<p
								style="border: 1pt rgb(0, 0, 0); border-image: none; text-indent: 0pt;">
								<span style="font-family: 한양신명조; font-size: 12pt;">바람</span>
							</p>
							<p style="text-indent: 0pt;">
								<span style="font-family: 한양신명조; font-size: 12pt;">홍수가
									발생할 수 있거나</span><span style="font-family: 한양신명조; font-size: 12pt;">,
								</span><span style="font-family: 한양신명조; font-size: 12pt;">단기간이라도
									침수될 수 있는 지역은 재배지로는 적합하지 않다</span><span
									style="font-family: 한양신명조; font-size: 12pt;">. </span><span
									style="font-family: 한양신명조; font-size: 12pt;">북쪽으로 경사가
									지거나</span><span style="font-family: 한양신명조; font-size: 12pt;">,
								</span><span style="font-family: 한양신명조; font-size: 12pt;">그늘이
									지거나</span><span style="font-family: 한양신명조; font-size: 12pt;">,
								</span><span style="font-family: 한양신명조; font-size: 12pt;">햇빛이
									가리는 지역은 피하여야 하고</span><span
									style="font-family: 한양신명조; font-size: 12pt;">, </span><span
									style="font-family: 한양신명조; font-size: 12pt;">남동향이나 남향
									과수원이 최적이다</span><span style="font-family: 한양신명조; font-size: 12pt;">.
								</span><span style="font-family: 한양신명조; font-size: 12pt;">일부의 경우
									토양과 기후 특성은 개선될 수 있으나</span><span
									style="font-family: 한양신명조; font-size: 12pt;">, </span><span
									style="font-family: 한양신명조; font-size: 12pt;">겨울철 혹은 봄기온은
									개선이 불가능하다</span><span style="font-family: 한양신명조; font-size: 12pt;">.
								</span><span style="font-family: 한양신명조; font-size: 12pt;">재배지의
									경사도도 기온에 영향을 주는데</span><span
									style="font-family: 한양신명조; font-size: 12pt;">, </span><span
									style="font-family: 한양신명조; font-size: 12pt;">남향이나 동향이
									북향보다 따뜻하다</span><span style="font-family: 한양신명조; font-size: 12pt;">.
								</span><span style="font-family: 한양신명조; font-size: 12pt;">아보카도의
									잠재 생산량을 실현하는 유일한 방법은 최적 성장에 필요한 모든 조건을 충족시키는 것이다</span><span
									style="font-family: 한양신명조; font-size: 12pt;">.</span>
									<br>
									<br>
							</p>
							<p
								style="border: 1pt rgb(0, 0, 0); border-image: none; text-indent: 0pt;">
								<span
									style="color: rgb(38, 230, 197); font-family: 한양신명조; font-size: 12pt;">
								</span>
							</p>
							<p style="text-indent: 0pt;">
								<span
									style="font-family: 한양신명조; font-size: 14pt; font-weight: bold;">번식법</span>
							</p>
							<p
								style="border: 1pt rgb(0, 0, 0); border-image: none; text-indent: 0pt;">
								<span style="font-family: 한양신명조; font-size: 12pt;">묘목의
									번식방법에는 실생법과 삽목법이 있다</span><span
									style="font-family: 한양신명조; font-size: 12pt;">. </span><span
									style="font-family: 한양신명조; font-size: 12pt;">일반적으로 실생법을
									이용하는 경우는 내한성</span><span style="font-family: 한양신명조; font-size: 12pt;">,
								</span><span style="font-family: 한양신명조; font-size: 12pt;">내병성이
									강한 멕시코계의 멕시콜라종</span><span
									style="font-family: 한양신명조; font-size: 12pt;">, </span><span
									style="font-family: 한양신명조; font-size: 12pt;">토파토파종</span><span
									style="font-family: 한양신명조; font-size: 12pt;">, </span><span
									style="font-family: 한양신명조; font-size: 12pt;">듀크종</span><span
									style="font-family: 한양신명조; font-size: 12pt;">, G-6</span><span
									style="font-family: 한양신명조; font-size: 12pt;">품종이 대목용으로
									많이 사용되고 있다</span><span style="font-family: 한양신명조; font-size: 12pt;">.
								</span><span style="font-family: 한양신명조; font-size: 12pt;">여기에
									우량품종을 접목하여 묘목 증식을 한다</span><span
									style="font-family: 한양신명조; font-size: 12pt;">. </span><span
									style="font-family: 한양신명조; font-size: 12pt;">또한 대목용 품종의
									종자의 입수가 곤란한 경우에는 비교적 내한성이 강한 푸에르테</span><span
									style="font-family: 한양신명조; font-size: 12pt;">(Fuerte), </span><span
									style="font-family: 한양신명조; font-size: 12pt;">베이컨</span><span
									style="font-family: 한양신명조; font-size: 12pt;">(Bacon), </span><span
									style="font-family: 한양신명조; font-size: 12pt;">쥬타노</span><span
									style="font-family: 한양신명조; font-size: 12pt;">(Zutano)</span><span
									style="font-family: 한양신명조; font-size: 12pt;">품종의 실생묘를
									육성하여 대목으로 이용한다</span><span
									style="font-family: 한양신명조; font-size: 12pt;">. </span><span
									style="font-family: 한양신명조; font-size: 12pt;">종자의 발아를 시키기
									위하여 정부와 기부를 약 </span><span
									style="font-family: 한양신명조; font-size: 12pt;">5</span><span
									style="font-family: 한양신명조; font-size: 12pt;">㎜ 절단하고</span><span
									style="font-family: 한양신명조; font-size: 12pt;">, </span><span
									style="font-family: 한양신명조; font-size: 12pt;">종자의 상부를 약</span><span
									style="font-family: 한양신명조; font-size: 12pt;">1</span><span
									style="font-family: 한양신명조; font-size: 12pt;">㎝ 위로 노출시켜서
									심는다</span><span style="font-family: 한양신명조; font-size: 12pt;">.
									1</span><span style="font-family: 한양신명조; font-size: 12pt;">개월 쯤
									지나면 일제히 발아된다</span><span style="font-family: 한양신명조; font-size: 12pt;">.
								</span><span style="font-family: 한양신명조; font-size: 12pt;">바탕나무</span><span
									style="font-family: 한양신명조; font-size: 12pt;">(</span><span
									style="font-family: 한양신명조; font-size: 12pt;">대목</span><span
									style="font-family: 한양신명조; font-size: 12pt;">)</span><span
									style="font-family: 한양신명조; font-size: 12pt;">이약 </span><span
									style="font-family: 한양신명조; font-size: 12pt;">1m</span><span
									style="font-family: 한양신명조; font-size: 12pt;">로 생장하게 되면
									지상 </span><span style="font-family: 한양신명조; font-size: 12pt;">30</span><span
									style="font-family: 한양신명조; font-size: 12pt;">㎝ 정도에서 절단하여
									재배품종을 줄기에서 높게 접한다</span><span
									style="font-family: 한양신명조; font-size: 12pt;">. </span><span
									style="font-family: 한양신명조; font-size: 12pt;">접목 시기는 꽃이
									피기 </span><span style="font-family: 한양신명조; font-size: 12pt;">2~3</span><span
									style="font-family: 한양신명조; font-size: 12pt;">개월 전에 실시하며
									저장양분이 많은 것이 좋다</span><span
									style="font-family: 한양신명조; font-size: 12pt;">. </span><span
									style="font-family: 한양신명조; font-size: 12pt;">접목 방법은 깎기접</span><span
									style="font-family: 한양신명조; font-size: 12pt;">(</span><span
									style="font-family: 한양신명조; font-size: 12pt;">절접</span><span
									style="font-family: 한양신명조; font-size: 12pt;">), </span><span
									style="font-family: 한양신명조; font-size: 12pt;">눈접</span><span
									style="font-family: 한양신명조; font-size: 12pt;">(</span><span
									style="font-family: 한양신명조; font-size: 12pt;">아접</span><span
									style="font-family: 한양신명조; font-size: 12pt;">)</span><span
									style="font-family: 한양신명조; font-size: 12pt;">과 쪼개접</span><span
									style="font-family: 한양신명조; font-size: 12pt;">(</span><span
									style="font-family: 한양신명조; font-size: 12pt;">활접</span><span
									style="font-family: 한양신명조; font-size: 12pt;">) </span><span
									style="font-family: 한양신명조; font-size: 12pt;">등이 있다</span><span
									style="font-family: 한양신명조; font-size: 12pt;">. </span><span
									style="font-family: 한양신명조; font-size: 12pt;">삽목법은 뿌리내림</span><span
									style="font-family: 한양신명조; font-size: 12pt;">(</span><span
									style="font-family: 한양신명조; font-size: 12pt;">발근</span><span
									style="font-family: 한양신명조; font-size: 12pt;">)</span><span
									style="font-family: 한양신명조; font-size: 12pt;">이 잘 되지 않기
									때문에 실용화되지 않고 있다</span><span
									style="font-family: 한양신명조; font-size: 12pt;">.</span>
							</p>
							<br>
							<br>

							<p style="text-indent: 0pt;">
								<span
									style="font-family: 한양신명조; font-size: 14pt; font-weight: bold;">재식
									및 어린나무 관리</span>
							</p>
							<p style="text-indent: 0pt;">
								<span style="font-size: 12pt;">아보카도는 자웅이숙</span><span
									style="font-size: 12pt;">(</span><span style="font-size: 12pt;">雌雄異熟</span><span
									style="font-size: 12pt;">)</span><span style="font-size: 12pt;">이기
									때문에 암꽃과 수꽃의 활동시기가 다르고 개</span><span style="font-size: 12pt;">화형은
								</span><span style="font-size: 12pt;">A</span><span
									style="font-size: 12pt;">형과 </span><span
									style="font-size: 12pt;">B</span><span style="font-size: 12pt;">형으로
									나눈다</span><span style="font-size: 12pt;">. </span><span
									style="font-size: 12pt;">재식할 경우에는 </span><span
									style="font-size: 12pt;">A</span><span style="font-size: 12pt;">형에
									속하는 품종과 </span><span style="font-size: 12pt;">B</span><span
									style="font-size: 12pt;">형에 속</span><span
									style="font-size: 12pt;">하는 품종을 혼식하는 것이 좋다. 재</span><span
									style="font-size: 12pt;">식거리는 노지에서 재배할 경우는 6m×6m로 하고,
									성목에서는 수간 폭이 협소</span><span style="font-size: 12pt;">하기 때문에 간벌로
									12m×12m로 한다. 미국의 캘리포니아에서는 ‘램하스(lamb </span><span
									style="font-size: 12pt;">hass)’ 품종의 경우 2.25m×2.25m로 빽빽하게
									심어(밀식) 재배하기도 하는데, 우리나라는 시설재배를 하여야 하기 때문에 심는(재식)거리를 좁히고 나무높이를
									낮추는 재배법이 필요하다고 판단된다. 일본에서는 대기 온도가 낮은 편이기 때문에 B형에 속하는 품종을 A형에
									속하는 품종보다 많이 식재하는 경향이 있는데 우리나라의 경우에도 적절한 품종 선택이 필요하다. 그러나 B형 품종의
									경우에는 어느 정도자가수분이 가능하다. 심는시기(재식시기)는 3~5월,10~11월이 좋다. 아보카도는 곧은 뿌리를
									가지고 있어 플라스틱 콘테이너, 비닐포트에서 기른 묘목들이 뿌리의 손상이 적어 뿌리 내림착이 좋다. 식재 후에는
									뿌리내림(활착)이 잘 되도록 관수를 계속한다. 식재 시에 시비는 한 구덩이 당 퇴비 20㎏, 골분 2㎏,요소
									100g, 과인산석회 1㎏, 용성인비 500g, 염화가리 100g을 퇴비와 혼합한 후에 넣어준다. 토양
									산도는5.5 이상이 좋다. 식재 구덩이는 80㎝×80㎝로 한다. 식재 후 2~3년 동안 나무가 어렸을 때는 추위에
									약하기 때문에 보온해 주어야 한다.</span>
							</p>
						</div>
						
						<div class="inner page1" id="div_page">
							<p
								style="border: 1pt rgb(0, 0, 0); border-image: none; text-indent: 0pt;">
								<br />
							</p>
							
							<p
								style="text-align: justify; text-indent: 0pt; -ms-text-justify: distribute-all-lines;">
								<span style="font-family: 한양신명조; font-size: 12pt;"> </span>
							</p>
							<p
								style="border: 1pt rgb(0, 0, 0); border-image: none; text-align: justify; text-indent: 0pt; -ms-text-justify: distribute-all-lines;">
								<span
									style="font-family: 한양신명조; font-size: 14pt; font-weight: bold;">연중관리</span>
							</p>
							<p
								style="border: 1pt rgb(0, 0, 0); border-image: none; text-indent: 0pt;">
								<span
									style="font-family: 한양신명조; font-size: 12pt; font-weight: bold;">가</span><span
									style="font-family: 한양신명조; font-size: 12pt; font-weight: bold;">.
								</span><span
									style="font-family: 한양신명조; font-size: 12pt; font-weight: bold;">생육과
									관리 요점</span>
							</p>
							<p
								style="border: 1pt rgb(0, 0, 0); border-image: none; text-indent: 0pt;">
								<span style="font-size: 12pt;">아보카도를 재배하고 있는 외국의 주산지에서 </span><span
									style="font-size: 12pt;">5~6</span><span
									style="font-size: 12pt;">월에 꽃을 피우는 경우 꽃눈의 </span><span
									style="font-size: 12pt;">분화는 전년도 </span><span
									style="font-size: 12pt;">11</span><span
									style="font-size: 12pt;">월부터 시작되고</span><span
									style="font-size: 12pt;">, </span><span
									style="font-size: 12pt;">꽃이 피는 시기는 </span><span
									style="font-size: 12pt;">3</span><span style="font-size: 12pt;">월에
									이루어진다</span><span style="font-size: 12pt;">. 4</span><span
									style="font-size: 12pt;">월에 이</span><span
									style="font-size: 12pt;">르면 급속히 화수가 발육한다</span><span
									style="font-size: 12pt;">. </span><span
									style="font-size: 12pt;">개화기는 </span><span
									style="font-size: 12pt;">5</span><span style="font-size: 12pt;">월
									상순부터 </span><span style="font-size: 12pt;">6</span><span
									style="font-size: 12pt;">월 상순까지 긴 편이다</span><span
									style="font-size: 12pt;">. </span><span
									style="font-size: 12pt;">가지의 신장은 봄</span><span
									style="font-size: 12pt;">, </span><span
									style="font-size: 12pt;">여름에 이루어져서 봄가지와 여름가지가 된다</span><span
									style="font-size: 12pt;">. </span><span
									style="font-size: 12pt;">영양상태가 좋으면 가을까지 가지가 자라는 경우가 있다</span><span
									style="font-size: 12pt;">. </span><span
									style="font-size: 12pt;">과실은 </span><span
									style="font-size: 12pt;">6</span><span style="font-size: 12pt;">월부터
								</span><span style="font-size: 12pt;">8</span><span
									style="font-size: 12pt;">월 상순에 급속히 발달하고 </span><span
									style="font-size: 12pt;">10</span><span
									style="font-size: 12pt;">월에는 비대생장이 이루어지지 않으며</span><span
									style="font-size: 12pt;">, </span><span
									style="font-size: 12pt;">그 후에는 익는 시기가 된다</span><span
									style="font-size: 12pt;">. </span><span
									style="font-size: 12pt;">익는 시기</span><span
									style="font-size: 12pt;">(</span><span style="font-size: 12pt;">숙기</span><span
									style="font-size: 12pt;">)</span><span style="font-size: 12pt;">는
								</span><span style="font-size: 12pt;">11</span><span
									style="font-size: 12pt;">월부터 </span><span
									style="font-size: 12pt;">2</span><span style="font-size: 12pt;">월까지로
									수상 월동이 될 수 있다</span><span style="font-size: 12pt;">. </span><span
									style="font-size: 12pt;">개화 후부터 과실이 발육할 때까지 심하게 생리적 낙화와
									낙과가 발생하여 결실수가 매우 적어진다</span><span style="font-size: 12pt;">. </span><span
									style="font-size: 12pt;">일반적으로 결실률은 약 </span><span
									style="font-size: 12pt;">5</span><span style="font-size: 12pt;">천분의
								</span><span style="font-size: 12pt;">1</span><span
									style="font-size: 12pt;">과 정도이다</span><span
									style="font-size: 12pt;">. </span><span
									style="font-size: 12pt;">낙화와 낙과의 원인은 </span><span
									style="font-size: 12pt;">1</span><span style="font-size: 12pt;">차
									낙화는 수정불량</span><span style="font-size: 12pt;">, 2</span><span
									style="font-size: 12pt;">차 낙과는 과실간의 양분경합이 원인이다</span><span
									style="font-size: 12pt;">. </span><span
									style="font-size: 12pt;">낙엽은 봄 가지와 여름가지의 신장기에 집중적으로 일어나며
									묵은 잎과 새로운 잎의 교대가 이루어진다</span><span style="font-size: 12pt;">. </span><span
									style="font-size: 12pt;">재배관리는 상록과수와 같은 방식으로 한다</span><span
									style="font-size: 12pt;">. </span><span
									style="font-size: 12pt;">비료를 많이 주면 수형이 크게 되므로 시비는 조심해야
									한다</span><span style="font-size: 12pt;">. </span><span
									style="font-size: 12pt;">수세가 강하기 때문에 적절한 정지전정을 행한다</span><span
									style="font-size: 12pt;">. </span><span
									style="font-size: 12pt;">약제 살포는 일조량이 좋은 지역에서는 병해충 발생이 거의
									없기 때문에 큰문제가 되지 않는다</span><span style="font-size: 12pt;">.</span>
							</p>
						</div>
						
						<div class="inner page1" id="div_page">
							<p style="text-indent: 0pt;">
								<span style="font-family: 한양신명조; font-size: 12pt;"> </span>
							</p>
							<p
								style="border: 1pt rgb(0, 0, 0); border-image: none; text-indent: 0pt;">
								<span
									style="font-family: 한양신명조; font-size: 12pt; font-weight: bold;">나</span><span
									style="font-family: 한양신명조; font-size: 12pt; font-weight: bold;">.
								</span><span
									style="font-family: 한양신명조; font-size: 12pt; font-weight: bold;">관수와
									토양관리</span>
							</p>
							<p
								style="text-align: justify; text-indent: 0pt; -ms-text-justify: distribute-all-lines;">
								<span style="font-family: 한양신명조; font-size: 12pt;"> 아보카도
									재배지에는 스프링클러</span><span style="font-family: 한양신명조; font-size: 12pt;">,
								</span><span style="font-family: 한양신명조; font-size: 12pt;">점적관수 등
									관수시설이 있어야 한다</span><span style="font-family: 한양신명조; font-size: 12pt;">.
								</span><span style="font-family: 한양신명조; font-size: 12pt;">그리고
									나무의 뿌리 근처에 </span><span style="font-family: 한양신명조; font-size: 12pt;">1</span><span
									style="font-family: 한양신명조; font-size: 12pt;">개씩 살수시설을
									설치하여 토양에 수분이 부족하면 자동적으로 살수할 수 있고 물거름살수</span><span
									style="font-family: 한양신명조; font-size: 12pt;">(</span><span
									style="font-family: 한양신명조; font-size: 12pt;">액비살수</span><span
									style="font-family: 한양신명조; font-size: 12pt;">)</span><span
									style="font-family: 한양신명조; font-size: 12pt;">도 할 수 있도록
									하는 것이 좋다</span><span style="font-family: 한양신명조; font-size: 12pt;">.
								</span><span style="font-family: 한양신명조; font-size: 12pt;">토양수분의
									증발을 방지하기 위하여 짚 등을 깔아주거나</span><span
									style="font-family: 한양신명조; font-size: 12pt;">, </span><span
									style="font-family: 한양신명조; font-size: 12pt;">유기물을 투입하여
									지력의 증진을 꾀한다</span><span style="font-family: 한양신명조; font-size: 12pt;">.
								</span><span style="font-family: 한양신명조; font-size: 12pt;">수확기 판단
									아보카도는 조생</span><span style="font-family: 한양신명조; font-size: 12pt;">,
								</span><span style="font-family: 한양신명조; font-size: 12pt;">중생</span><span
									style="font-family: 한양신명조; font-size: 12pt;">, </span><span
									style="font-family: 한양신명조; font-size: 12pt;">만생종이 있으며
									이들을 같이 재식할 경우 연중 수확이 가능하다</span><span
									style="font-family: 한양신명조; font-size: 12pt;">. </span><span
									style="font-family: 한양신명조; font-size: 12pt;">유통에 알맞은
									만생종인 하스</span><span style="font-family: 한양신명조; font-size: 12pt;">(Hass)
								</span><span style="font-family: 한양신명조; font-size: 12pt;">품종은 </span><span
									style="font-family: 한양신명조; font-size: 12pt;">11</span><span
									style="font-family: 한양신명조; font-size: 12pt;">월부터 다음해 </span><span
									style="font-family: 한양신명조; font-size: 12pt;">3~4</span><span
									style="font-family: 한양신명조; font-size: 12pt;">월까지 수확이
									가능하다</span><span style="font-family: 한양신명조; font-size: 12pt;">.
								</span><span style="font-family: 한양신명조; font-size: 12pt;">일본에서
									재배되는 중생종 계통의 푸에르테</span><span
									style="font-family: 한양신명조; font-size: 12pt;">(Fuerte), </span><span
									style="font-family: 한양신명조; font-size: 12pt;">베이컨</span><span
									style="font-family: 한양신명조; font-size: 12pt;">(Bacon), </span><span
									style="font-family: 한양신명조; font-size: 12pt;">쥬타노</span><span
									style="font-family: 한양신명조; font-size: 12pt;">(Zutano) </span><span
									style="font-family: 한양신명조; font-size: 12pt;">품종은 </span><span
									style="font-family: 한양신명조; font-size: 12pt;">10</span><span
									style="font-family: 한양신명조; font-size: 12pt;">월부터 </span><span
									style="font-family: 한양신명조; font-size: 12pt;">5</span><span
									style="font-family: 한양신명조; font-size: 12pt;">월까지가 익는 시기다</span><span
									style="font-family: 한양신명조; font-size: 12pt;">. </span><span
									style="font-family: 한양신명조; font-size: 12pt;">그러나 일본에서는 </span><span
									style="font-family: 한양신명조; font-size: 12pt;">1~2</span><span
									style="font-family: 한양신명조; font-size: 12pt;">월의 저온에 과피가
									검은색으로 변하기 때문에 연내에 수확이 이루어지고 있다</span><span
									style="font-family: 한양신명조; font-size: 12pt;">. </span><span
									style="font-family: 한양신명조; font-size: 12pt;">수확기는 익어도
									녹색을 띄어 외형적으로는 알 수 없기 때문에 적기 판단이 어렵다</span><span
									style="font-family: 한양신명조; font-size: 12pt;">. </span><span
									style="font-family: 한양신명조; font-size: 12pt;">일찍 수확하면 추숙</span><span
									style="font-family: 한양신명조; font-size: 12pt;">(</span><span
									style="font-family: 한양신명조; font-size: 12pt;">후숙</span><span
									style="font-family: 한양신명조; font-size: 12pt;">)</span><span
									style="font-family: 한양신명조; font-size: 12pt;">이 원만하게
									이루어지지 않는다</span><span style="font-family: 한양신명조; font-size: 12pt;">.
								</span><span style="font-family: 한양신명조; font-size: 12pt;">수확적기를
									판정하는 방법에 대한 연구도 필요하다</span><span
									style="font-family: 한양신명조; font-size: 12pt;">.</span>
							</p>
							<p
								style="text-align: justify; text-indent: 0pt; -ms-text-justify: distribute-all-lines;">
								<span style="font-family: 한양신명조; font-size: 12pt;"> </span>
							</p>
							<p
								style="border: 1pt rgb(0, 0, 0); border-image: none; text-indent: 0pt;">
								<span
									style="font-family: 한양신명조; font-size: 12pt; font-weight: bold;">라</span><span
									style="font-family: 한양신명조; font-size: 12pt; font-weight: bold;">.
								</span><span
									style="font-family: 한양신명조; font-size: 12pt; font-weight: bold;">비료
									주기</span><span
									style="font-family: 한양신명조; font-size: 12pt; font-weight: bold;">(</span><span
									style="font-family: 한양신명조; font-size: 12pt; font-weight: bold;">시비</span><span
									style="font-family: 한양신명조; font-size: 12pt; font-weight: bold;">)</span>
							</p>
							<p
								style="text-align: justify; text-indent: 0pt; -ms-text-justify: distribute-all-lines;">
								<span style="font-family: 한양신명조; font-size: 12pt;">아보카도는
									특별하게 수세가 강하여 </span><span style="font-family: 한양신명조; font-size: 12pt;">2~3</span><span
									style="font-family: 한양신명조; font-size: 12pt;">년생이면 </span><span
									style="font-family: 한양신명조; font-size: 12pt;">2m</span><span
									style="font-family: 한양신명조; font-size: 12pt;">까지 자란다</span><span
									style="font-family: 한양신명조; font-size: 12pt;">. </span><span
									style="font-family: 한양신명조; font-size: 12pt;">비료의 양이 많으면
									거목</span><span style="font-family: 한양신명조; font-size: 12pt;">(18~25m)</span><span
									style="font-family: 한양신명조; font-size: 12pt;">으로 자라기 때문에
									주의해야 한다</span><span style="font-family: 한양신명조; font-size: 12pt;">.</span>
							</p>
							<p
								style="text-align: justify; text-indent: 0pt; -ms-text-justify: distribute-all-lines;">
								<span style="font-family: 한양신명조; font-size: 12pt;"> </span>
							</p>
							<p
								style="border: 1pt rgb(0, 0, 0); border-image: none; text-indent: 0pt;">
								<span
									style="font-family: 한양신명조; font-size: 12pt; font-weight: bold;">마</span><span
									style="font-family: 한양신명조; font-size: 12pt; font-weight: bold;">.
								</span><span
									style="font-family: 한양신명조; font-size: 12pt; font-weight: bold;">가지
									고르기</span><span
									style="font-family: 한양신명조; font-size: 12pt; font-weight: bold;">(</span><span
									style="font-family: 한양신명조; font-size: 12pt; font-weight: bold;">정지</span><span
									style="font-family: 한양신명조; font-size: 12pt; font-weight: bold;">)</span><span
									style="font-family: 한양신명조; font-size: 12pt; font-weight: bold;">·다듬기</span><span
									style="font-family: 한양신명조; font-size: 12pt; font-weight: bold;">(</span><span
									style="font-family: 한양신명조; font-size: 12pt; font-weight: bold;">전정</span><span
									style="font-family: 한양신명조; font-size: 12pt; font-weight: bold;">)<span
									style="font-family: 한양신명조; font-size: 12pt;"> </span></span>
							</p>
							<p
								style="border: 1pt rgb(0, 0, 0); border-image: none; text-align: justify; text-indent: 0pt; -ms-text-justify: distribute-all-lines;">
								<span style="font-size: 12pt;">아보카도는 격년결과성이 있고 수세가 강하여
									나무가 무성하게 자라기 쉽기 때문</span><span style="font-size: 12pt;">에 전정이
									필요하다</span><span style="font-size: 12pt;">. </span><span
									style="font-size: 12pt;">나무가 어릴 때에 가지의 갈라지는 지점은 토양에서 </span><span
									style="font-size: 12pt;">30~40</span><span
									style="font-size: 12pt;">㎝ 높이로 해서 주지를 </span><span
									style="font-size: 12pt;">3~4</span><span
									style="font-size: 12pt;">개로 한다</span><span
									style="font-size: 12pt;">. </span><span
									style="font-size: 12pt;">수형은 개심자연형</span><span
									style="font-size: 12pt;">, </span><span
									style="font-size: 12pt;">배상형</span><span
									style="font-size: 12pt;">, </span><span
									style="font-size: 12pt;">변칙주간형 등</span><span
									style="font-size: 12pt;">이 있지만 직립이 되지 않도록 하는 수형이 좋다</span><span
									style="font-size: 12pt;">. </span><span
									style="font-size: 12pt;">나무가 다 큰 후의 수형은 원가지</span><span
									style="font-size: 12pt;">(</span><span style="font-size: 12pt;">주지</span><span
									style="font-size: 12pt;">)</span><span style="font-size: 12pt;">를
									약하지 않을 정도로 하고 웃자람가지</span><span style="font-size: 12pt;">(</span><span
									style="font-size: 12pt;">도장지</span><span
									style="font-size: 12pt;">)</span><span style="font-size: 12pt;">가
									많이 나오고 착화량이 적어지는 경우는 직립하는 가지를 수평으로 유인한다.<span
									style="font-size: 12pt;">또한 껍질돌려벗기기(환상박피)를 하는 것이 좋다. 직경
										7~8㎝의 큰 가지를 절단한 후에는 톱신페스트 등으로 도포하여 절단한 부위를 보호한다. 푸에르테품종의 경우
										생산량은 성목으로 될 때까지는 증가하지만 14년생 이후부터는 줄어든다. 15~19년생 사이에 다듬기(전정) 또는
										솎아베기(갈벌)를 통하여 일사량을 좋게 하고 원가지(주지)를 갱신하면 생산량이 다시 증가하게 된다.</span>
								</span>
							</p>
						</div>
						
						<div class="inner page1" id="div_page">
								<span
									style="font-family: 한양신명조; font-size: 12pt; font-weight: bold;">바</span><span
									style="font-family: 한양신명조; font-size: 12pt; font-weight: bold;">.
								</span><span
									style="font-family: 한양신명조; font-size: 12pt; font-weight: bold;">동해
									방지</span>
							</p>
							<p
								style="text-align: justify; text-indent: 0pt; -ms-text-justify: distribute-all-lines;">
								<span style="font-size: 12pt;">아보카도는 아열대성이기 때문에 겨울의 찬바람과
									최저기온에 크게 영향을 받는</span><span style="font-size: 12pt;">다</span><span
									style="font-size: 12pt;">. </span><span
									style="font-size: 12pt;">특히 </span><span
									style="font-size: 12pt;">2</span><span style="font-size: 12pt;">월
									중하순의 혹한기에 낙엽이나 꽃눈에 동해가 발생할 수 있다</span><span style="font-size: 12pt;">.
								</span><span style="font-size: 12pt;">방한대</span><span
									style="font-size: 12pt;">책으로는 우선 냉기의 침체가 이루어지기 쉬운 장소는
									피하고 시설재배를 실시하</span><span style="font-size: 12pt;">며 가온시설을 하는
									것이 좋다</span><span style="font-size: 12pt;">. </span><span
									style="font-size: 12pt;">캘리포니아에서는 동해나 서리피해에 대비하여 발연통</span><span
									style="font-size: 12pt;">(</span><span style="font-size: 12pt;">히터</span><span
									style="font-size: 12pt;">), </span><span
									style="font-size: 12pt;">대형 선풍기</span><span
									style="font-size: 12pt;">(</span><span style="font-size: 12pt;">방사팬</span><span
									style="font-size: 12pt;">)</span><span style="font-size: 12pt;">를
									설치하고 있으며 스프링클러를 서리피해 방지에 이용하기도 한다</span><span style="font-size: 12pt;">.
								</span><span style="font-size: 12pt;">일본에서의 </span><span
									style="font-size: 12pt;">아보카도 재배관련 보고에 따르면 </span><span
									style="font-size: 12pt;">-6</span><span
									style="font-size: 12pt;">℃가 </span><span
									style="font-size: 12pt;">4</span><span style="font-size: 12pt;">시간
									이상 계속되면 낙엽이나 꽃눈이 </span><span style="font-size: 12pt;">말라죽는 현상이
									나타난다</span><span style="font-size: 12pt;">. </span><span
									style="font-size: 12pt;">또한 이른 봄의 늦서리에 의하여 꽃봉오리에 피해가 </span><span
									style="font-size: 12pt;">일어나기도 한다</span><span
									style="font-size: 12pt;">.</span>
							</p>
							<p
								style="text-align: justify; text-indent: 0pt; -ms-text-justify: distribute-all-lines;">
								<span style="font-family: 한양신명조; font-size: 12pt;"> </span>
							</p>
							<p
								style="border: 1pt rgb(0, 0, 0); border-image: none; text-indent: 0pt;">
								<span
									style="font-family: 한양신명조; font-size: 12pt; font-weight: bold;">사</span><span
									style="font-family: 한양신명조; font-size: 12pt; font-weight: bold;">.
								</span><span
									style="font-family: 한양신명조; font-size: 12pt; font-weight: bold;">저장</span><span
									style="font-family: 한양신명조; font-size: 12pt; font-weight: bold;">,
								</span><span
									style="font-family: 한양신명조; font-size: 12pt; font-weight: bold;">추숙</span><span
									style="font-family: 한양신명조; font-size: 12pt; font-weight: bold;">(</span><span
									style="font-family: 한양신명조; font-size: 12pt; font-weight: bold;">후숙</span><span
									style="font-family: 한양신명조; font-size: 12pt; font-weight: bold;">),
								</span><span
									style="font-family: 한양신명조; font-size: 12pt; font-weight: bold;">출하</span>
							</p>
							<p
								style="text-align: justify; text-indent: 0pt; -ms-text-justify: distribute-all-lines;">
								<span style="font-size: 12pt;">수확은 손으로 하지만 높은 것은 대나무 끝에
									헝겊을 씌우고 과경을 잘라 수확한</span><span style="font-size: 12pt;">다</span><span
									style="font-size: 12pt;">. </span><span
									style="font-size: 12pt;">수확한 과실은 즉시 다른 과실의 과피에 상해가 나지 않게
									과경을 모두 자른다</span><span style="font-size: 12pt;">. </span><span
									style="font-size: 12pt;">과실은 크기별로 선별하고 과실 사이에 스폰지를 넣어 수송
									중에 상처가 나지 않도록 한다</span><span style="font-size: 12pt;">. </span><span
									style="font-size: 12pt;">아보카도 과실은 클라이메트릭형의 과실이라서 열매껍질</span><span
									style="font-size: 12pt;">(</span><span style="font-size: 12pt;">과피</span><span
									style="font-size: 12pt;">)</span><span style="font-size: 12pt;">에
									상처가 나면 호흡량 상승이 빨라져 익는 시기</span><span style="font-size: 12pt;">(</span><span
									style="font-size: 12pt;">숙기</span><span
									style="font-size: 12pt;">)</span><span style="font-size: 12pt;">가
									매우 빨라지면서 부패된다</span><span style="font-size: 12pt;">. </span><span
									style="font-size: 12pt;">우리나라의 경우 수입품종인 하스가 </span><span
									style="font-size: 12pt;">11~4</span><span
									style="font-size: 12pt;">월이 단경기이기 때문에 일본</span><span
									style="font-size: 12pt;">(</span><span style="font-size: 12pt;">한국과
									생산시기 같은</span><span style="font-size: 12pt;">)</span><span
									style="font-size: 12pt;">에서는 </span><span
									style="font-size: 12pt;">12</span><span
									style="font-size: 12pt;">월중·하순에 수확하는 중생종의 경우 수입품종과 경쟁이
									이루어지지 않는다</span><span style="font-size: 12pt;">. </span><span
									style="font-size: 12pt;">수확후의 저장은 </span><span
									style="font-size: 12pt;">4</span><span style="font-size: 12pt;">℃에서
								</span><span style="font-size: 12pt;">2~3</span><span
									style="font-size: 12pt;">주간 저장할 수 있다</span><span
									style="font-size: 12pt;">. </span><span
									style="font-size: 12pt;">일반적으로 수확 후 </span><span
									style="font-size: 12pt;">2</span><span style="font-size: 12pt;">주간
									연화시키고 나서 먹을 수 있다</span><span style="font-size: 12pt;">.</span>
							</p>
						</div>
					</fieldset>
				</div>

			</div>
		</div>
	</div>
	</div>

	<!-- 2 컨테이너 div라인 끝 -->

	<!-- 3 푸터라인 시작 -->
	<footer>
		<div class="container">
			<br>
			<div class="row">
				<div class="col-sm-3">
					<h5>Copyright&copy;2019</h5>
					<h5>오대근, 이승경</h5>
					<h5>김정우, 김수빈</h5>
					<h5>손은진, 고영윤</h5>
				</div>
				<div class="col-sm-3">
					<h4>프로젝트소개</h4>
					<h5>머신러닝기반의 아열대작물 추천 시스템입니다. 또한 작물을 키우는데 필요한 각종 정보를 제공하고 있습니다.</h5>
				</div>
				<div class="col-sm-3">
					<h4>네비게이션</h4>
					<div class="list-group">
						<a href="introService.do" class="list-group-item">스미원 소개</a> <a
							href="boardService.do" class="list-group-item">소통광장</a>
					</div>
				</div>
				<div class="col-sm-3">
					<h4>SNS</h4>
					<div class="list-group">
						<a href="https://www.smhrd.or.kr/" class="list-group-item">유튜브</a>
						<a href="https://www.facebook.com/smhrd0317"
							class="list-group-item">페이스북</a>
					</div>
				</div>
			</div>
		</div>
	</footer>
	<br>
	<!-- 끝부분 여백효과 -->
	<!-- 3 푸터라인 끝 -->

	<!-- 4 모달영역 시작 -->
	<div class="row">
		<div class="modal" id="modal" tabindex="-1">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<div class="modal-header">
						<h1>계정연동 페이지</h1>
					</div>
					<div class="modal-body" style="text-align: left;">
						<!-- 판넬 -->
						<div class="panel panel-success">
							<div class="panel-heading">
								<h3 class="panel-title">
									<span class="glyphicon glyphicon-pencil"></span>&nbsp;&nbsp;계정목록
								</h3>
							</div>
							<div class="panel-body">
								<div class="media">
									<div class="media-left">
										<c:if test="${sessionScope.list[0] != null}">
											<a href="#"><img class="media-object"
												src="${sessionScope.list[0].src}" height="120px"
												width="120px" style="border-radius: 3px;"></a>
										</c:if>
										<c:if test="${sessionScope.list[0] == null}">
											<a href="#"><img class="media-object"
												src="img/kakao_log.png" height="120px" width="120px"
												style="border-radius: 3px;"></a>
										</c:if>
									</div>
									<div class="media-body">
										<c:if test="${sessionScope.list[0] != null}">
											<h4 class="media-heading">
												카카오톡&nbsp;&nbsp;
												<c:if test="${sessionScope.member.token == 'k'}">
													<span class="badge">대표계정</span>
												</c:if>
												&nbsp;
												<c:if test="${sessionScope.member.access == 'k'}">
													<span class="badge ">로그인中</span>
												</c:if>
											</h4>
										회원번호: ${sessionScope.list[0].id}<br>
										닉네임 : ${sessionScope.list[0].name}<br>
											<c:if test="${sessionScope.member.token != 'k'}">
												<a class="btn btn-info" href="reLoginService2.do?_code=k">대표계정
													설정</a>
											</c:if>
											<c:if test="${sessionScope.member.access == 'k'}">
												<a class="btn btn-danger"
													href="https://cs.kakao.com/helps?category=226&locale=ko&service=8">회원정보
													수정</a>
											</c:if>
										</c:if>
										<c:if test="${sessionScope.list[0] == null}">
											<div class="button-get-started">
												<a id="kakao-login-btn"></a>
											</div>
										</c:if>
									</div>
								</div>
								<hr>
								<div class="media">
									<c:if test="${sessionScope.list[1] != null}">
										<div class="media-left">
											<a href="#"><img class="media-object"
												src="${sessionScope.list[1].src}" height="120px"
												width="120px" style="border-radius: 3px;"></a>
										</div>
									</c:if>
									<c:if test="${sessionScope.list[1] == null}">
										<div class="media-left">
											<a href="#"><img class="media-object"
												src="img/naver_log.jpg" height="120px" width="120px"
												style="border-radius: 3px;"></a>
										</div>
									</c:if>
									<div class="media-body">
										<c:if test="${sessionScope.list[1] != null}">
											<h4 class="media-heading">
												네이버&nbsp;&nbsp;
												<c:if test="${sessionScope.member.token == 'n'}">
													<span class="badge">대표계정</span>
												</c:if>
												&nbsp;
												<c:if test="${sessionScope.member.access == 'n'}">
													<span class="badge ">로그인中</span>
												</c:if>
											</h4>
									회원번호: ${sessionScope.list[1].id}<br>
									닉네임 : ${sessionScope.list[1].name}<br>
											<c:if test="${sessionScope.member.token != 'n'}">
												<a class="btn btn-info" href="reLoginService2.do?_code=n">대표계정
													설정</a>
											</c:if>
											<c:if test="${sessionScope.member.access == 'n'}">
												<a class="btn btn-danger"
													href="https://nid.naver.com/user2/help/myInfo.nhn?lang=ko_KR">회원정보
													수정</a>
											</c:if>
										</c:if>
										<c:if test="${sessionScope.list[1] == null}">
											<div id="naver_id_login"></div>
										</c:if>
									</div>
								</div>
								<hr>
								<div class="media">
									<c:if test="${sessionScope.list[2] != null}">
										<div class="media-left">
											<a href="#"><img class="media-object"
												src="${sessionScope.list[2].src}" height="120px"
												width="120px" style="border-radius: 3px;"></a>
										</div>
									</c:if>
									<c:if test="${sessionScope.list[2] == null}">
										<div class="media-left">
											<a href="#"><img class="media-object"
												src="img/google_log.jpg" height="120px" width="120px"
												style="border-radius: 3px;"></a>
										</div>
									</c:if>
									<div class="media-body">
										<c:if test="${sessionScope.list[2] != null}">
											<h4 class="media-heading">
												구글&nbsp;&nbsp;
												<c:if test="${sessionScope.member.token == 'g'}">
													<span class="badge">대표계정</span>
												</c:if>
												&nbsp;
												<c:if test="${sessionScope.member.access == 'g'}">
													<span class="badge ">로그인中</span>
												</c:if>
											</h4>
									회원번호: ${sessionScope.list[2].id}<br>
									닉네임 : ${sessionScope.list[2].name}<br>
											<c:if test="${sessionScope.member.token != 'g'}">
												<a class="btn btn-info" href="reLoginService2.do?_code=g">대표계정
													설정</a>
											</c:if>
											<c:if test="${sessionScope.member.access == 'g'}">
												<a class="btn btn-danger"
													href="https://myaccount.google.com/personal-info">회원정보
													수정</a>
											</c:if>
										</c:if>
										<c:if test="${sessionScope.list[2] == null}">
											<div class="google" align="left">
												<a onclick=""> <img src="img/googleBtn.png"
													style="width: 222px; height: 48px; border-radius: 3px;">
												</a>
											</div>
										</c:if>
									</div>
								</div>
							</div>
						</div>
						<div align="center">
							<button data-dismiss="modal" class="btn btn-success">
								<h3 style="margin: 0px;">닫기</h3>
							</button>
						</div>
						<!-- 판넬 -->
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 4 모달영역 시작 -->
	<div class="row">
		<div class="modal" id="modal2" tabindex="-1">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<div class="modal-body" style="text-align: left;">
						<!-- 판넬 -->
						<div class="panel panel-success">
							<div class="panel-heading">
								<h3 class="panel-title">
									<span class="glyphicon glyphicon-film"></span>&nbsp;&nbsp;<a
										id="modal2-title"></a>&nbsp;
								</h3>
							</div>
							<div class="panel-body">
								<div class="embed-responsive embed-responsive-16by9">
									<iframe class="embed-responsive-item" src="" id="modal2-video"></iframe>
								</div>
							</div>
						</div>
						<div align="center">
							<button data-dismiss="modal" class="btn btn-success">
								<h3 style="margin: 0px;">닫기</h3>
							</button>
						</div>
						<!-- 판넬 -->
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 4 모달영역 끝 -->
	<script type="text/javascript">
		$(document).ready(function() {
			$("#myBtn").click(function() {
				$("#myModal").modal();
			});
		});

		window.alert = function() {
		};

		function video(title, link) {
			document.getElementById("modal2-title").innerText = title;
			document.getElementById("modal2-video").src = link;

			$('div#modal2').modal();
		}

		function init() { // 시작하자 마자 커넥션
			console.log('init');
			gapi
					.load(
							'auth2',
							function() {
								console.log('auth2');
								window.gauth = gapi.auth2
										.init({
											client_id : '183312277531-653eugt70bdeqd1s2gb2u51fg3lev3gu.apps.googleusercontent.com'
										});
								gauth.then(function() {
									console.log('google auth success');
								}, function() {
									console.log('google auth fail');
								});
							});
		}
		$(document)
				.ready(
						function() {
	<%String check = (String) session.getAttribute("check");
			if (check != null) {%>
		$('div.modal').modal();
	<%session.removeAttribute("check");
			}%>
		var jumbotron = document.getElementById('jimg');
							var jtext = document.getElementById('jtitle');
							var jurl = document.getElementById('jurl');

							var img_arr = new Array("news1.jpg", "news2.jpg",
									"news3.jpg", "news4.jpg", "news5.jpg",
									"news6.jpg", "news7.jpg", "news8.jpg");
							var txt_arr = new Array("RPC 벼 매입자금 배정 ‘중복평가’ 논란",
									"해남군, 상반기 농민수당 지급 ‘가속’",
									"“신규 농업인 영농 정착 도와요”", "진안, 우렁이 친환경 농법 확대",
									"익산시, 농번기 일손 지원 확대 나서",
									"양파·마늘 등 수확시 작업비 지원",
									"여름철 재해 대책, 농작물 피해 예방한다",
									"잡지 못했니 ‘논잡초’…‘후기제초제’로 '방제'");

							var jurl_arr = new Array(
									"https://www.newsfarm.co.kr/news/articleView.html?idxno=50804",
									"https://www.newsfarm.co.kr/news/articleView.html?idxno=50816",
									"https://www.newsfarm.co.kr/news/articleView.html?idxno=50814",
									"https://www.newsfarm.co.kr/news/articleView.html?idxno=50818",
									"https://www.newsfarm.co.kr/news/articleView.html?idxno=50739",
									"http://www.nongupin.co.kr/news/articleView.html?idxno=65360",
									"http://www.newsfarm.co.kr/news/articleView.html?idxno=50735",
									"http://www.newsfarm.co.kr/news/articleView.html?idxno=50782");

							var i = 0;
							setInterval(function() {
								if (i == 8)
									i = 0;

								jumbotron.style.backgroundImage = "url(img/"
										+ img_arr[i] + ")";
								jtext.innerHTML = txt_arr[i];
								jurl.setAttribute('href', jurl_arr[i]);
								i++;
							}, 3000);

							var access = "${sessionScope.member.access}";
							$('#logout')
									.on(
											'click',
											function() {
												if (access == 'k') {
													var logout = window
															.open(
																	'https://developers.kakao.com/logout',
																	'_blank');
													setTimeout(
															function() {
																logout.close();
																location.href = "main.do";
															}, 2000);
												} else if (access == 'n') {
													var logout = window
															.open(
																	'https://nid.naver.com/nidlogin.logout',
																	'_blank');
													setTimeout(
															function() {
																logout.close();
																location.href = "main.do";
															}, 2000);
												} else if (access == 'g') {
													if (gauth.isSignedIn.get()) {
														gauth
																.signOut()
																.then(
																		function() {
																			location.href = "main.do";
																		});
													}
												}
											});
						});

		var naver_id_login = new naver_id_login("XsWuw1QRFltibzeqedSC",
				"http://goddaegeun.ml/CALLBACK2.html");
		var state = naver_id_login.getUniqState();
		naver_id_login.setButton("green", 3, 48);
		naver_id_login.setDomain("http://goddaegeun.ml");
		naver_id_login.setState(state);
		naver_id_login.setPopup();
		naver_id_login.init_naver_id_login();

		//<![CDATA[
		// 사용할 앱의 JavaScript 키를 설정해 주세요.
		Kakao.init('2c31ce0bfdf6ac450e55f852bdb19a2a');
		// 카카오 로그인 버튼을 생성합니다.
		Kakao.Auth.createLoginButton({
			container : '#kakao-login-btn',
			success : function(authObj) {
				//alert(JSON.stringify(authObj));
				Kakao.API.request({
					url : '/v1/user/me',
					success : function(res) {
						///////////////////////////////////////////////////////////////////////////////////////////////////////
						//console.log(res);

						var userID = res.id; //유저의 카카오톡 고유 id
						var userNickName = res.properties.nickname; //유저가 등록한 별명
						var src = res.properties.profile_image;
						var token = JSON.stringify(authObj.access_token);

						page_href('reLoginService.do?id=' + userID + "&name="
								+ encodeURI(userNickName) + "&profile_image="
								+ encodeURI(src) + "&access=k");
						///////////////////////////////////////////////////////////////////////////////////////////////////////
					},
					fail : function(error) {
					}
				});
			},
			fail : function(err) {
			}
		});

		function page_href(URL) {
			location.href = URL;
		}
		//]]>
	</script>
	<script src="https://apis.google.com/js/platform.js?onload=init" async
		defer></script>
</body>
	<script src="https://apis.google.com/js/platform.js?onload=init" async
		defer></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$('#search_box').select2({ // 초기화
				placeholder: "지역을 검색하세요",
				allowClear: true,
				"language": {
			        "noResults": function(){
			            return "해당지역이 없습니다";
			        }
			    },
			     escapeMarkup: function (markup) {
			         return markup;
			     }
			});
			
			$('#search_box').change(function() {
				var value = this.value;
				var value_sub = document.getElementById("search_box").options[document.getElementById("search_box").selectedIndex].text;
				location.href='chartService.do?locals='+value+"&name="+encodeURI(value_sub);
			});
		});
		
		var arr1 = [ 
			"서울",
			"홍천",
			"합천",
			"함양",
			"포항",
			"통영",
			"태백",
			"충주",
			"춘천",
			"추풍령",
			"청송군",
			"창원",
			"진주", /*정우형*/
			"제천",
			"정선군",
			"전주",
			"장흥",
			"장수",
			"임실",
			"인제",
			"의성",
			"의령군",
			"원주",
			"울진",
			"울산",
			"울릉도", /* 승경 */
			"영천",
			"영주",
			"영덕",
			"양산시",
			"안동",
			"순창군",
			"속초",
			"상주",
			"산청",
			"강릉",
			"부여",
			"봉화", /* 영윤 */
			"보은",
			"밀양",
			"문경",
			"동해",
			"동두천",
			"대전",
			"대구",
			"대관령",
			"남원",
			"금산",
			"구미",
			"경주시",
			"거창",
			"거제"
			];
	
		var arr2 = [
			"홍성",
			"파주",
			"청주",
			"천안",
			"정읍",
			"이천",
			"영광군",
			"양평",
			"서산",
			"부안"
			];
	
		var arr3 = [
			"제주",
			"성산일출봉",
			"고흥",
			"남해",
			"서귀포",
			"강진군",
			"순천",
			"광양시"
			];
	
		var arr4 = [
			"부산",
			"보령",
			"김해시",
			"군산"
			];
	
		var arr5 = [
			"진도군",
			"해남",
			"여수",
			"목포",
			"보성군",
			"완도",
			"고창군",
			"광주"
			];
		
		$('#search_box').append("<option value='${param.locals}'>${param.name}</option>");
		for(var i = 0; i < arr1.length; i++){
			if(arr1[i] != "${param.name}"){
				var option = $("<option value='1_"+((i<10)?"0":"")+i+"'>"+arr1[i]+"</option>");
				$('#search_box').append(option);
			}
		}
	
		for(var i = 0; i < arr2.length; i++){     
			if(arr2[i] != "${param.name}"){
				var option = $("<option value='2_"+((i<10)?"0":"")+i+"'>"+arr2[i]+"</option>");
				$('#search_box').append(option);
			}
		}
	
		for(var i = 0; i < arr3.length; i++){  
			if(arr3[i] != "${param.name}"){
				var option = $("<option value='3_"+((i<10)?"0":"")+i+"'>"+arr3[i]+"</option>");
				$('#search_box').append(option);
			}
		}
	
		for(var i = 0; i < arr4.length; i++){      
			if(arr4[i] != "${param.name}"){         
				var option = $("<option value='4_"+((i<10)?"0":"")+i+"'>"+arr4[i]+"</option>");
				$('#search_box').append(option);
			}
		}
	
		for(var i = 0; i < arr5.length; i++){  
			if(arr5[i] != "${param.name}"){
				var option = $("<option value='5_"+((i<10)?"0":"")+i+"'>"+arr5[i]+"</option>");
				$('#search_box').append(option);
			}
		}
	</script>
</html>