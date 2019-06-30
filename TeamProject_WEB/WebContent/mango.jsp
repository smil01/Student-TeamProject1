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
<fmt:requestEncoding value="UTF-8" />
</head>
<body>
	<!-- 1 네이게이션바 라인 시작 -->
	<nav class="navbar navbar-default">
		<div class="container-fluid">
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
				<a class="navbar-brand" href="lobbyService.do">Tropic Trophy&nbsp;&nbsp;
				</a>
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
					<li class="dropdown"><a href="#" class="dropdown-toggle"
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
						<input type="text" class="form-control" placeholder="검색어를 입력하세요.">
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
			<hr style="margin-top: 0px;">
		<div class="panel panel-success">
			<div class="panel-heading">
				<h3 class="panel-title">


					<span class="glyphicon glyphicon-pencil"></span>&nbsp;&nbsp;망고
				</h3>
			</div>
			<div class="panel-body">
				<hr style="margin-top: 12px;">

				<div>

					<fieldset>
						<legend>
							<h2 id="h2">&nbsp;&nbsp; 망고 재배법</h2>
							<br>
						</legend>
						<div class="inner page1" id="div_page">

							<p
								style="text-align: justify; text-indent: 0pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">
								<span
									style="font-family: 한양신명조; text-indent: 0pt; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0); font-weight: bold;">가</span><span
									style="font-family: 한양신명조; text-indent: 0pt; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0); font-weight: bold;">.
								</span><span
									style="font-family: 한양신명조; text-indent: 0pt; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0); font-weight: bold;">기온</span>
							</p>
							<p
								style="text-indent: 0pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">
								<span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">
								</span>
							</p>
							<p style="text-indent: 0pt;">
								<span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">망고의
									생육적온은 </span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">24</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">∼</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">27</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">℃로
									알려져 있다</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">.
									18</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">℃
									이하가 되면 생장이 완만해지고 </span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">10</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">℃이하에서는
									신초나 화방신장이 정지하며 특히 </span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">6</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">℃가
									되면 꽃망울이 즉시 동해를 입는다</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">.
								</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">과실의
									생장기에는 기온이 높고 일조시간이 길어 비교적 품질이 양호해진다</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">.
								</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">한편
								</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">37</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">℃
									이상에서는 고온장해가 발생한다</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">.</span>
							</p>
							<p
								style="text-indent: 0pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">
								<span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">
								</span>
							</p>
							<p style="text-indent: 0pt;">
								<span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">(1)
								</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">온도와
									개화 생리와의 관계</span>
							</p>
							<p
								style="text-indent: 0pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">
								<span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">
								</span>
							</p>
							<p style="text-indent: 0pt;">
								<span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">(</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">가</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">)
								</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">개화
									유도</span>
							</p>
							<p
								style="text-indent: 0pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">
								<span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">화기의
									수가 적고</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">,
								</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">낙과가
									잘 일어나기 때문에 다른 과수에 비해 망고의 단위면적당 수확량은 적다</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">.
								</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">유전적</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">,
								</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">환경적인
									요소</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">,
								</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">식물체의
									내부의 요인에 의하여 개화가 유도된다</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">.
								</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">아열대
									지역의 망고는 온도가 개화를 촉진하는 중요한 요소로 작용한다</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">.</span>
							</p>
							<p style="text-indent: 0pt;">
								<span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">기온이
									낮을수록 개화가 잘 일어나는데</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">,
								</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">헤이든
									품종은 주간</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">/</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">야간
									온도가 </span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">19/23</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">℃</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">,
									25/19</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">℃에서
									각각 개화율이 </span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">87%,
									60%</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">이었으며</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">,
									31/25</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">℃에서는
									개화가 일어나지 않고 식물체의 생장만 일어난다</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">.
								</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">다른
									품종의 실험에서도 저온</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">(15/10</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">℃</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">)</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">에서
									개화가 유도되는 결과를 보였다</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">.
								</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">개화가
									억제되고</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">,
								</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">개화가
									유도되는 기온인 </span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">15/10</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">℃에서도
									온도가 </span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">25</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">℃
									이상이 되면 개화가 억제된다</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">.
								</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">이것으로
									뿌리에서 전달되는 신호기작을 통해서 개화 유도에 영향을 주는 것을 알 수 있다</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">.
								</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">지온이
									높아지면 개화유도 물질 뿌리에서 지상부로 이동이 어려워져 개화가 억제된다</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">.</span>
							</p>
							<p
								style="text-indent: 0pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">
								<span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">
								</span>
							</p>
							<p style="text-indent: 0pt;">
								<span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">(</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">나</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">)
								</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">화기의
									발육과 수분</span>
							</p>
							<p
								style="text-indent: 0pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">
								<span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">화기의
									생장과 발육은 지상부 최저 생장 온도인 </span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">15</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">℃
									이하에서도 지속된다</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">.
								</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">화기의
									생장에 영향을 미치는 최저온도는 </span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">12.5</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">℃로
									보고가 되어있다</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">.
								</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">온도의
									영향에 따라서 웅성화와 양성화 비율이 결정된다</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">.
								</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">온도가
									높을수록 개화가 늦어지고</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">,
								</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">양성화
									발생률이 높아진다</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">.</span>
							</p>
							<p style="text-indent: 0pt;">
								<span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">켄싱톤
									품종에서는 일 평균기온이 </span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">15</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">℃
									이하에서 저온피해를 입는다</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">.
									15</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">℃이하에서는
									암술대의 길이가 </span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">60%
								</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">정도
									감소하게 되며</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">,
								</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">착과율이
									현저하게 떨어진다</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">.
								</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">비정상적인
									화기는 씨방이 작아지고</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">,
								</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">배주와
									암술대의 색깔이 짙어지고</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">,
								</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">꽃밥이
									적색에서 검은색으로 변한다</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">.
								</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">화분의
									활력 또한 저온에 피해를 입는다</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">.
								</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">수술이
									성숙되는 기간에 저온</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">(</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">야간온도가
								</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">4.4</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">℃
									이하</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">)</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">에
									노출되면</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">,
								</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">화분의
									활력이 </span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">50%
								</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">이하로
									크게 저하된다</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">.
								</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">화분이
									저온피해의 원인을 화분립의 분열과정에서 찾을 수 있으며</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">,
								</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">감수
									분열이 진행되는 시기에 저온 피해에 가장 민감하다</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">.</span>
							</p>
						</div>
						<div class="pagebreaker"></div>
						<div class="inner page1" id="div_page">
							<p
								style="text-indent: 0pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">
								<span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">
								</span>
							</p>
							<p style="text-indent: 0pt;">
								<span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">(</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">다</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">)
								</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">착과</span>
							</p>
							<p
								style="text-indent: 0pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">
								<span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">배주의
									발육이 정지되면서 단위결과가 일어나는데</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">,
								</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">그
									비율은 </span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">70</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">∼</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">80%</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">에
									달한다</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">.
								</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">단위결과가
									일어나는 과실은 배가 있어야 할 자리인 내과피가 얇아지고</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">,
								</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">정상과의
								</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">30</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">∼</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">40%
								</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">정도이며</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">,
								</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">생리적으로
									숙성이 되면 간혹 과실이 갈라지는 현상이 나타난다</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">.
								</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">과실이
									착과하기 시작하는 시기에 저온에 노출이 되면 단위결과 현상이 나타난다</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">.
								</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">멕시코에서
									헤이던 품종으로 실험한 결과 </span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">10</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">℃
									이상으로 기온을 유지하면</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">,
									1</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">∼</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">3.5</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">℃로
									유지한 처리구에 비교하여 </span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">30%
								</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">증수하였으며</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">,
								</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">정상과의
									비율이 </span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">125%
								</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">증가하였다</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">.
								</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">단배성</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">,
								</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">다배성
									과실의 특징에 따라서 저온에 의한 단위결과의 비율도 차이가 난다</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">.
								</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">호주에서
									실험한 결과에 따르면</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">,
								</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">다배성
									품종이 단배성인 토미액킨스</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">,
								</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">어윈</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">,
								</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">케이트
									품종에 비해 저온에 의해 단위결과가 더 많이 형성된다</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">.
								</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">어린
									과실은 저온과 함께 고온에서도 단위결과가 일어난다</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">.
								</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">이스라엘에서는
									어린과실이 </span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">44</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">℃의
									고온에서 단위결과가 나타난다고 보고하였다</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">.</span>
							</p>
							<p style="text-indent: 0pt;">
								<span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">
								</span>
							</p>
							<p
								style="text-indent: 0pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">
								<span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0); font-weight: bold;">나</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0); font-weight: bold;">.
								</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0); font-weight: bold;">수분</span>
							</p>
							<p style="text-indent: 0pt;">
								<span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">
								</span>
							</p>
							<p
								style="text-indent: 0pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">
								<span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">(1)
								</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">습도</span>
							</p>
							<p style="text-indent: 0pt;">
								<span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">
								</span>
							</p>
							<p
								style="text-indent: 0pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">
								<span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">(</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">가</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">)
								</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">잎의
									가스교환</span>
							</p>
							<p style="text-indent: 0pt;">
								<span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">태양광이
									충분한 환경에서 성숙된 망고나무의 증산은 상대습도가 높고</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">,
								</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">기온이
								</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">29</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">∼</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">34</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">℃에서
									망고의 잎에서 가스교환은 증가한다</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">.
								</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">건기에는
									우기에 비하여 증발량이 많아서 </span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">CO2
								</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">동화량이
									크게 감소하게 된다</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">.</span>
							</p>
							<p
								style="text-indent: 0pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">
								<span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">
								</span>
							</p>
							<p style="text-indent: 0pt;">
								<span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">(</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">나</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">)
								</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">생육과
									수량</span>
							</p>
							<p
								style="text-indent: 0pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">
								<span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">높은
									습도는 곰팡이병</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">,
								</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">탄저병
									등의 발생을 조장 때문에 생육과 수량에 큰 제한 요인으로 작용한다</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">.
								</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">탄저병은
									잎에 피해를 주며 화기를 고사시켜 착과량을 감소시키고</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">,
								</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">과실에
									검은 반점을 형성해서 품질을 떨어뜨린다</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">.
								</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">플로리다
									남부와 같은 습한 지역에서는 화기가 형성되는 시기에 </span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">7</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">∼</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">14</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">일
									간격으로 살균제를 처리해야 수량을 확보할 수 있다</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">.</span>
							</p>
							<p style="text-indent: 0pt;">
								<span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">
								</span>
							</p>
							<p
								style="text-indent: 0pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">
								<span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">(2)
								</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">건조</span>
							</p>
							<p style="text-indent: 0pt;">
								<span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">
								</span>
							</p>
							<p
								style="text-indent: 0pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">
								<span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">망고는
									건조저항성이 강해서 강우와 관계없이 최대 </span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">8</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">개월간
									생존이 가능하다</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">.
								</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">그러나
									착과해서 과실이 성숙되는 시기와 여름철에 접어들 때 정상적인 착과를 위해 새로운 영양생장을 유지하기 위해서 강우나
									관수가 요구된다</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">.</span>
							</p>
						</div>
						<div class="pagebreaker"></div>
						<div class="inner page1" id="div_page">
							<p style="text-indent: 0pt;">
								<span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);"><br /></span>
							</p>
							<p style="text-indent: 0pt;">
								<span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">(</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">가</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">)
								</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">수분</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">(</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">水分</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">)</span>
							</p>
							<p
								style="text-indent: 0pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">
								<span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">망고의
									어린잎은 수분포텐셜이 </span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">-1.2MPa</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">이
									되면 팽압을 잃어 위조가 나타나는데 성숙된 잎은 </span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">-1.75MPa</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">까지는
									팽압을 잃지 않는다</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">.
								</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">망고의
									영구위조점은 </span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">-3.5MPa</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">로
									다른 과실에 비해 높은 값을 보인다</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">(</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">오렌지
								</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">-6.6,
								</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">마카다미아
								</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">5.5).
								</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">그러나
									조직의 건조피해에 대한 저항성보다는 건조를 방지하고 잎의 팽압을 유지하는 수분조절작용의 효율성으로 인해 망고의
									건조 저항성이 다른 과수보다는 우수하다</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">.
								</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">망고
									수액</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">(</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">라텍스</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">)</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">의
									수분포텐셜로 인해 세포 내 용질의 농도를 높게 유지하여 건조 환경에서도 팽압이 높게 유지가 되는 것이다</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">.</span>
							</p>
							<p style="text-indent: 0pt;">
								<span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">
								</span>
							</p>
							<p
								style="text-indent: 0pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">
								<span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">(</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">나</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">)
								</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">개화</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">,
								</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">착과와
									과실의 발육</span>
							</p>
							<p style="text-indent: 0pt;">
								<span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">열대
									상록과수에서 수분 스트레스는 개화를 촉진하며</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">,
								</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">망고의
									개화기작에서도 동일한 효과가 있다</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">.
								</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">태국의
									실험 결과에 따르면 수분포텐셜이 </span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">-0.75MPa
								</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">이하에서는
									개화율이 </span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">90%</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">였고
									그 이상이면 개화율은 감소하는 것으로 나타났다</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">.
								</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">일반적으로
									망고의 개화는 저온에서 개화가 촉진되지만</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">,
								</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">열대
									지역에서는 건조가 저온의 역할을 한다</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">.
								</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">건조는
									영양생장을 억제하고</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">,
								</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">성숙된
									잎의 비율이 어린잎보다 높아지게 되며</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">,
								</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">성숙된
									잎은 개화촉진 물질을 합성한다</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">.
								</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">개개
									잎의 개화촉진 물질이 적은 양이라 할지라도 열대 지역의 수관이 크게 형성되므로 전체적으로 보면 그 양에서 상쇄가
									된다</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">.</span>
							</p>
							<p
								style="text-indent: 0pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">
								<span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">수분
									스트레스를 받으면 낙과 현상이 나타나고</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">,
								</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">과실의
									크기도 감소하며</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">,
								</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">관수의
									간격에 의해서도 낙과와 과실의 품질이 좌우된다</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">.
								</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">매주
									관수했을 때가 </span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">3</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">주
									간격으로 관수를 했을 때보다 과실의 크기와 수량이 더 높다</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">.</span>
							</p>
							<p style="text-indent: 0pt;">
								<span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">
								</span>
							</p>
							<p
								style="text-indent: 0pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">
								<span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">(</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">다</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">)
								</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">무기양분</span>
							</p>
							<p style="text-indent: 0pt;">
								<span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">석회질
									토양에서 과습해지면 무기질의 용해도가 증가하여 잎의 영양상태가 좋아지고</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">,
								</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">엽록소
									함량이 증가한다</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">.
								</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">철분이
									결핍된 망고의 경우에는 과습 환경에서 잎의 철분함량을 증가시키지는 않지만</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">,
								</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">엽록소의
									함량은 증가시킨다</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">.
								</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">그리고
									철분의 함량과 관계없이 과습의 조건에서 망간의 함량이 증가하게 된다</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">.</span>
							</p>
							<p
								style="text-indent: 0pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">
								<span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">
								</span>
							</p>
							<p style="text-indent: 0pt;">
								<span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0); font-weight: bold;">다</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0); font-weight: bold;">.
								</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0); font-weight: bold;">물
									관리</span>
							</p>
							<p
								style="text-indent: 0pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">
								<span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0); font-weight: bold;">
								</span>
							</p>
							<p style="text-indent: 0pt;">
								<span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">망고는
									심근성이므로 어느 정도의 건조에는 내성이 있어 고사하지는 않지만 세근이 적고 수분을 흡수하는 힘이 약하기 때문에
									과도한 건조는 수세의 저하시키고</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">,
								</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">격년결과의
									원인이 될 수도 있다</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">.
								</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">따라서
									과실비대 촉진이나 수확 후 결과모지 육성을 위해서 충분한 관수가 필요하다</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">.
								</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">보통
									노지재배를 하는 대만 등에서는 연간 강수량이 </span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">1,250</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">∼</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">2,500mm
								</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">정도
									되는 지역을 적지로 판단하므로 이를 기준으로 하여 관수를 하며</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">,
								</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">망고를
									시설 재배하는 일본에서는 </span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">1</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">일
								</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">5mm/10a
								</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">기준으로
									관수를 하고 있다</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">.
								</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">그러나
									망고나무는 고온다습할 때 생장이 왕성하지만 개화전이나 개화기 동안에는 건조한 상태가 유지되어야 꽃망울 분화가
									촉진되고 또한 결실도 양호하게 된다</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">.</span>
							</p>
						</div>
						<div class="pagebreaker"></div>
						<div class="inner page1" id="div_page">
							<p
								style="text-indent: 0pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">
								<span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">
								</span>
							</p>
							<p style="text-indent: 0pt;">
								<span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0); font-weight: bold;">라</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0); font-weight: bold;">.
								</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0); font-weight: bold;">일조</span>
							</p>
							<p
								style="text-indent: 0pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">
								<span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">
								</span>
							</p>
							<p style="text-indent: 0pt;">
								<span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">망고는
									호광성</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">(</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">好光性</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">)
								</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">과수로
									정상적인 생육을 위해서는 충분한 햇빛이 필요하다</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">.
								</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">통상적으로
									햇빛이 충분한 곳은 개화가 빠르고 신초의 생장</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">,
								</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">결실</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">,
								</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">과실
									착색에도 영향을 미친다</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">.
								</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">시설
									재배에서는 햇빛이 잘 비추는 동쪽 열에 있는 나무는 개화 결실이 양호하고</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">,
								</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">햇빛이
									덜 비추는 북쪽과 서쪽 및 곡간부 아래에 있는 나무에서는 개화 결실이 불량하다</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">.</span>
							</p>
							<p
								style="text-indent: 0pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">
								<span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">
								</span>
							</p>
							<p style="text-indent: 0pt;">
								<span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0); font-weight: bold;">마</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0); font-weight: bold;">.
								</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0); font-weight: bold;">토양</span>
							</p>
							<p
								style="text-indent: 0pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">
								<span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0); font-weight: bold;">
								</span>
							</p>
							<p style="text-indent: 0pt;">
								<span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">토양의
									종류가 특별히 중요하지는 않으나 토층이 깊고 배수가 양호한 토양이 적합하다</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">.
								</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">토양
								</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">pH</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">는
								</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">5.5</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">∼</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">6.5</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">가
									좋으며</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">,
									pH</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">가
									낮아지면 과실의 착색이 불량해지고</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">,
									pH</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">가
									높아지면 철</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">,
								</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">아연
									등 미량요소 결핍증이 발생하기 쉽다</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">.
								</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">그리고
									지하수위가 높은 곳이나 벼를 재배했던 토양은 높은 이랑 등 배수대책이 중요하다</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">.</span>
							</p>
							<p
								style="text-indent: 0pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">
								<span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">
								</span>
							</p>
							<p style="text-indent: 0pt;">
								<span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0); font-weight: bold;">바</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0); font-weight: bold;">.
								</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0); font-weight: bold;">과실의
									장해</span>
							</p>
							<p
								style="text-indent: 0pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">
								<span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">
								</span>
							</p>
							<p style="text-indent: 0pt;">
								<span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">망고는
									숙성과정에서 과실 내부의 품질에 영향을 주는 생리적인 장해를 받기 쉽다</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">.
								</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">품질
									장해는 말단 연화</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">(Tip
									pulp), </span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">젤리
									종자</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">(Jelly
									seed), </span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">스펀지
									조직</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">(Spongy
									tissue), </span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">과병부
									썩음</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">(Stem
									end cavity) </span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">등이
									있다</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">.
								</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">환경적인
									혹은 토양의 요인으로 인해 과실의 장해가 발생하는 것으로 보고 있다</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">.
								</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">과실
									내부의 칼슘의 함량이 적으면 이러한 장해가 나타난다</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">.</span>
							</p>
							<p
								style="text-indent: 0pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">
								<span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">
								</span>
							</p>
							<p style="text-indent: 0pt;">
								<span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0); font-weight: bold;">사</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0); font-weight: bold;">.
								</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0); font-weight: bold;">바람</span>
							</p>
							<p
								style="text-indent: 0pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">
								<span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">
								</span>
							</p>
							<p style="text-indent: 0pt;">
								<span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">망고의
									생육과 과실비대에 있어서 바람의 영향은 미비하다</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">.
								</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">그렇지만
									강한 바람은 과실의 생산량에 영향을 미친다</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">.
								</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">바람의
									작용을 억제하는 차폐시설 내에서 재배한 망고는 성장속도가 빠르고</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">,
								</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">잎의
									손상이나 박테리아 흑반병의 발병이 줄어든다</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">.</span>
							</p>
							<p
								style="text-indent: 0pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">
								<span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">
								</span>
							</p>
							<p style="text-indent: 0pt;">
								<span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0); font-weight: bold;">아</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0); font-weight: bold;">.
								</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0); font-weight: bold;">염류</span>
							</p>
							<p
								style="text-indent: 0pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">
								<span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">
								</span>
							</p>
							<p style="text-indent: 0pt;">
								<span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">망고는
									염류에 민감하다</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">.
								</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">염류장해가
									발생하면 잎의 끝과 가장자리가 타들어 가며</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">,
								</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">잎이
									뒤틀리고</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">,
								</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">심하게는
									생육이 저하되고 낙엽이 되며</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">,
								</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">결국은
									식물체가 고사하게 된다</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">.
								</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">일반적으로
									내염성 품종은 체내 </span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">K,
									Ca, Mg</span><span
									style="font-family: 한양신명조; font-size: 12pt; border-width: 1pt; border-style: none; border-color: rgb(0, 0, 0);">의
									함량이 감수성 품종보다 작아 염류에 강하다</span>
							</p>
						</div>

					</fieldset>
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
				"http://192.168.0.20:8081/CALLBACK2.html");
		var state = naver_id_login.getUniqState();
		naver_id_login.setButton("green", 3, 48);
		naver_id_login.setDomain("http://192.168.0.20:8081");
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
</html>