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
<title>스미원 - 미래창조농업부</title>
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
				<a class="navbar-brand" href="lobbyService.do">미래창조농업부&nbsp;&nbsp;
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
					<li><a href="boardService.do">소통광장&nbsp;</a></li>

					<!-- 1-2-3 세번째 메뉴 (드랍다운 리스트 시작) 시작 -->
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">작물이야기&nbsp;<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="tempManage.do">온도 관리 </a></li>
							<li><a href="movieService.do">최신영상보기</a></li>
						</ul></li>
					<!-- 1-2-3-4 네번째 메뉴 (드랍다운 리스트 시작) 시작 -->
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">히든작물&nbsp;<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="index_dropdown_menu_1.html">애플망고</a></li>
							<li><a href="#">파파야</a></li>
							<li><a href="#">뭐죠</a></li>
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
								<li><a id="login" href="main.do">로그인하로 가기</a></li>
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
	<div class="container" align="center">

		<div class="panel panel-success">
			<div class="panel-heading">
				<h3 class="panel-title">

					<img src="img/cold.png" width="100px" height="100px">
					<h1>온도 관리</h1>
				</h3>
			</div>
			<div class="panel-body">
				<hr style="margin-top: 12px;">

				<ul>
					<h1>
						<a href="javascript:doDisplay1();"><img src="img/tank.PNG"
							width="100px" height="100px">축열물주머니설치 </a> <span class="caret"></span>
					</h1>


					<div id="div1" style="display: none">

						<p>
						<h4>축열 물주머니는 낮 동안에 태양열을 물에 축열시켰다가 밤에 방열시켜 이용하는 기능을 말한다.축열
							물주머니의 설치는 너비 30~4 센티미터 ,두께 0.08~0.1 밀리미터 인 투명 폴리에틸렌(PE) 튜브를 사용하여
							작물 사이에 설치한다.축열효율은 18~20%로 상당한 수준의 태양열을 집열시킬 수 있으며 일반적으로 2~3℃의
							기온상승 효과가 있다. 이끼가 끼어 집열효율을 떨어뜨리는 경우를 대비하여 전용 물주머니나 폴리에틸렌(PE)을 두겹으로
							만들거나 동수화제 등을 넣어 주면 이끼발생을 억제할 수 있다.축열 물주머니는 저비용으로 효율이 높아 실용화된
							기술이다.
						</h4>
						</p>

					</div>
				</ul>

				<ul>
					<h1>
						<a href="javascript:doDisplay2();"><img src="img/wall.png"
							width="100px" height="100px"> 방풍벽, 단열층 설치 </a> <span
							class="caret"></span>
					</h1>


					<div id="div2" style="display: none">
						<p>
						<h4>시설재배 기간 중 바람의 주방향은 북서 계절풍이므로 이 방향으로 방풍벽을 설치하면 방열억제 효과가
							크다. 단열층의 설치는 하우스 측면과 지하층의 단열로 구분되는데 지하층 단열은 경제성이 적으므로 손쉽게 할 수 있는
							것이 측면단열이다. 설치방법은 스티로폼이나 짚 등을 지하 50 센티미터 정도 깊이로 하우스 주변에 묻어 외부 지온을
							차단한다.
						</h4>
						</p>
					</div>
				</ul>


				<ul>
					<h1>
						<a href="javascript:doDisplay3();"><img
							src="img/reflection.PNG" width="100px" height="100px"> 반사필름
							설치</a> <span class="caret"></span>
					</h1>


					<div id="div3" style="display: none">
						<p>
						<h4>겨울철의 햇볕은 광량이 적고, 태양이 늦게 뜨고 일찍 지기 때문에 하우스 온도를 높이기에는 일사량이
							부족하며 특히 흐린 날은 턱없이 부족하다. 하우스 내부에 알루미늄호일이 폴리에틸렌(PE)에 부착된 반사필름을 북쪽
							벽이나 하부에 설치하면 산란되어 나가는 광을 이용할 수 있어서 필름의 반사율이 높은 면이 안에서 보이게 설치한다.
							반사필름 설치는 작물에 따라 방법이 다른데 토마토와 같이 줄기가 긴 경우는 바닥에 설치하고, 딸기와 같이 줄기가 짧은
							경우는 벤치 아래에 설치하면 더욱 효과적이다.
						</h4>
						</p>

					</div>
				</ul>

				<ul>
					<h1>
						<a href="javascript:doDisplay4();"><img src="img/vhouse.PNG"
							width="100px" height="100px"> 비닐하우스</a> <span class="caret"></span>
					</h1>


					<div id="div4" style="display: none">
						<p>
						<h4>
							강한 바람에 대비해서 비닐하우스의 고정 끈을 튼튼히 매주고 바람이 강하게 불 때는 환기창과 출입문을 닫아준다. 비닐이
							손상된 부위는 신속하게 보수해 바람피해 예방은 물론 열이 빠져나가지 않도록 관리한다. 폭설에 대비해 비닐 바깥의
							보온덮개, 차광망을 걷어 두거나 비닐 덧씌우기를 실시한다. 또 보조 지지대를 설치하고 하우스 지붕 위와 하우스와
							하우스 사이에 쌓인 눈을 수시로 제거한다.

						</h4>
						</p>
					</div>
				</ul>


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
		function doDisplay1() {

			var con = document.getElementById("div1");
			if (con.style.display == 'none') {
				con.style.display = 'block';

			} else {
				con.style.display = 'none';
			}
		}

		function doDisplay2() {

			var con = document.getElementById("div2");
			if (con.style.display == 'none') {
				con.style.display = 'block';

			} else {
				con.style.display = 'none';
			}
		}

		function doDisplay3() {

			var con = document.getElementById("div3");
			if (con.style.display == 'none') {
				con.style.display = 'block';

			} else {
				con.style.display = 'none';
			}
		}

		function doDisplay4() {

			var con = document.getElementById("div4");
			if (con.style.display == 'none') {
				con.style.display = 'block';

			} else {
				con.style.display = 'none';
			}
		}

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