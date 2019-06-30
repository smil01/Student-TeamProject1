<%@page import="main.member.socialDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>f
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


					<span class="glyphicon glyphicon-pencil"></span>&nbsp;&nbsp;블루베리
				</h3>
			</div>
			<div class="panel-body">
				<hr style="margin-top: 12px;">

				<div>

					<fieldset>
						<legend>
							<h2 id="h2">&nbsp;&nbsp; 블루베리 재배법</h2>
							<br>
						</legend>
						<p>1. 재배 적지</p>
						<p>
							가. 기상조건<br> 온난한 기후조건과 적당한 강수량이 요구되고, 개화기의 서리의 피해가 큰 곳이나 강한
							바람이 많이 부는 곳은 부적합하다.<br> 나. 토양조건<br> 토심이 깊고 배수가 잘되는
							사질양토가 적합하다.<br> <br>2. 개원
						</p>

						가. 적지 선정<br>
						 기상조건 및 토양조건이 적합하고 관수가 가능한 곳<br> 
						 나. 원지의 준비<br>
						① 평탄화 작업 ②배수 대책 수립 ③ 유기물 시용<br> <br>
						 3. 묘목의 준비<br>
						가. 품종 선택<br> 
						① 성숙의 조만성<br>  ② 과실 수량 <br> ③ 과실 품질 <br> ④ 과실수확의 난이성<br>  ⑤ 내한성 및 <br> ⑥
						내병성을 고려하여 선택한다.<br> <br>
						 품종 선택에 있어 우선적으로 고려해야 될 점은 내한성이다. 블루베리의 내한성은 로우부쉬가 가장 강하고, 다음이 하이부쉬이며, 래비트아이 블루베리가 가장 약한데, 같은
						종 내에서도 품종에 따라 내한성이 다르다. 앞으로 시험재배를 하여 보아야 되겠지만, 중부지방에서는 반수고하이부쉬와
						하이부쉬가. 남부지방에서는 하이부쉬와 남부하이부쉬가, 그리고 제주에서는 남부하이부쉬와 래비트아이 블루베리가 각각 적합할
						것으로 생각된다.
						<br> <br> 
						<ul><li>lowbush blueberry : 대부분이 야생종을 재배하고
						있으며, 현재 미국과 카나다에서 품종육성 사업이 진행되고 있다.</li>
						<br><br><li>highbush blueberry :
						100개 이상의 품종이 육성·보급되고 있다. 하이부쉬 블루베리의 대표품종은 bluecrop이며, 이 품종이 1990년대
						중반까지 재배면적의 30% 정도를 차지하였고, jersey 품종도 20% 정도를 차지하였다. 주요 재배품종에는
						blueray, bluetta, weymouth, collins, croatan, rube 등이 있으며, 비교적 최근에
						육성된 품종으로는 elliot, patriot, spartan, duke, nelson, brigitta 등이 있다.</li>
						<br> <br>
						<li>half-high highbush blueberry : v. corymbosom × v. angustifolium의
						종간교배로 만들어진 품종들로 수고(樹高)가 하이부쉬 블루베리의 절반 이하로 내한성이 강하며, 저온요구도가 크다. 이에는
						northland, northblue, northsky, north country, st. cloud 등이 있다.</li>
						<br> <br>
						<li>southern highbush blueberry : 미국 남부에서 야생 v. darrowii camp를 육종 소재로
						이용하여 육성한 잡종 품종들인데 저온요구도가 작아 남부지역과 제주도에서 재배할 수 있는 품종들이다. 이에는
						sharpblue(표준품종), o`neal, georgiagem 등이 있다.</li>
						<br> <br>rabbiteye
						<li>blueberry : 20개 이상의 품종이 육성·보급되고 있다.
						<br> tifblue가 표준품종이고,
						climax도 많이 재배되고 있다. 주요 품종으로는 southland, woodard, brightwell,
						premier 등이 있다. 저온요구도가 대단히 작으며, 생육이 왕성하고, 토양적응성이 넓다.</li>
						</ul>
						<br> <br>
						
						나. 		묘목의 조건

						<p>
							① 무병묘이고, ② 폿트육묘한 2년생으로 높이가 30∼50㎝ 정도 되는 것.<br> <br> 4.
							재식<br> 가. 재식 구덩이<br> 직경 50∼60㎝, 깊이 40㎝ 정도의 구덩이를 파고 재식함.<br>
							나. 재식 시기<br> 가을 심기(온난한 곳)와 봄 심기(한냉한 곳)가 있다.<br> 다. 재식
							간격<br> 1.5∼2.0m(포기 사이)×2.5∼3.0m(줄 사이)<br> <br> 5.
							재식 후의 관리<br> 가. 유기물 멀칭<br> 우드칩 등으로 멀칭하면 토양수분 보존과 잡초발생을
							억제할 수 있다.<br> <br> 나. 관수<br> 블루베리는 건조에 악하므로 재식 후의
							봄가뭄의 피해를 입지 않도록 점적관수를 한다.<br> <br> 다. 잡초방제<br>
							제초제를 쓰지 않고 수제초나 기계제초를 한다.<br> <br> 6. 시비<br> 재식
							본수가 10a당 180주(1.8m×3.0m)이고 목표수량이 800∼1000㎏일 경우의 기비는 3월 중순경에 10a당
							질소, 인산 및 가리를 각각 4.5㎏(성분량) 정도 시용한다.<br> <br> 가. 추비<br>추비는
							여름과 가을에 2회 시용하는데, 여름 추비는 5월 중순 경에, 가을 추비는 8월 하순 경에 질소, 인산 및 가리를
							각각 2.2㎏씩 시용한다.
						</p>
				</div>
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