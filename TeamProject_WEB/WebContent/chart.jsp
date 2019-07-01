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
#modallist {
	margin: 0px;
	font-size: 24px;
	text-align: center;
}

.modal-lg {
	width: 450px !important
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
<title>Tropic Trophy</title>
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
<!-- 맵 임포트 -->
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2c31ce0bfdf6ac450e55f852bdb19a2a&libraries=services,clusterer,drawing"></script>

<link href="css/select2.min.css" rel="stylesheet" />
<script src="js/select2.min.js"></script>

<link rel="stylesheet" href="css/chart.css">
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
							<li><a href="movieService.do">최신영상보기</a></li>
						</ul></li>
					<!-- 1-2-3-4 네번째 메뉴 (드랍다운 리스트 시작) 시작 -->
					<li class="dropdown  active"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">히든작물&nbsp;<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="mapService.do">지도기반분석</a></li>
							<li><a href="#">차트기반분석</a></li>
						</ul></li>
				</ul>
				<!-- 1-2-3 세번째 메뉴 끝-->
				<form action="#" class="navbar-form navbar-left">
					<div class="form-group">
						<input type="text" class="form-control" placeholder="검색어를 입력하세요.">
					</div>
				</form>

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
	<div class="container">
	
	<hr style="margin-top: 0px;">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<h3 class="panel-title">
					<span class="glyphicon glyphicon-signal"></span>&nbsp;&nbsp;히든작물
					차트로보기
				</h3>
			</div>
			<div class="panel-body">
				<div class="row">
					<div class="media">
						<div class="media-left">
							<a href="#"><img class="media-object"
								src="img/search_mark.png" id="title_img"></a>
						</div>
						<div class="media-body">
							<select class="js-example-basic-single" id="search_box"
								style="width: 250px"><!--  multiple="multiple" -->
							</select>
							<br>
							<h3 id="content1"></h3>
							<h4 id="content2"></h4>
						</div>
					</div>
					<div class="col-md-12" id="charts">
						<hr>
						<div class="btn-group btn-group-toggle" data-toggle="buttons">
							<label class="btn btn-primary active">
								<input type="radio" name="radio2" id="radio2_1" value="1" checked> 막대그래프
							</label>
<!-- 							<label class="btn btn-primary">
								<input type="radio" name="radio2" id="radio2_2" value="2"> 원형그래프
							</label> -->
						</div>
						
						<div class="btn-group btn-group-toggle" data-toggle="buttons">
							<label class="btn btn-danger active">
								<input type="radio" name="radio1" id="radio1_1" value="1" checked> 평균온도
							</label>
							<label class="btn btn-danger">
								<input type="radio" name="radio1" id="radio1_2" value="2"> 최고온도
							</label>
							<label class="btn btn-danger">
								<input type="radio" name="radio1" id="radio1_3" value="3"> 최저온도
							</label>
							<label class="btn btn-danger">
								<input type="radio" name="radio1" id="radio1_3" value="4"> 강수량
							</label>
							<label class="btn btn-danger">
								<input type="radio" name="radio1" id="radio1_3" value="5"> 토양
							</label>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 2 컨테이너 div라인 끝 -->
	<div class="container">
	<hr style="margin-top: 0px;" >
		<div class="panel panel-primary" id="chartDIV">
			<div class="panel-body" id="charts">
			 	<iframe id="chartFrame" style="width:100%;" width="98%"  frameborder="0" scrolling="no" onLoad="setIFrameHeight(this)"></iframe>
			</div>
		</div>
		<script type="text/javascript">function setIFrameHeight(obj){obj.height = obj.contentWindow.document.body.scrollHeight;}</script>
	</div>
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

	<script type="text/javascript">
		window.alert = function() {
		};

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
		$('div#modal').modal();
	<%session.removeAttribute("check");
			}%>
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
	<script type="text/javascript">
	var frame_src = "/setChart";
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
			
			if("${param.locals}" != ""){
				$('#search_box option[value="${param.locals}"]').attr('selected','selected');
				setTitle("${param.locals}");
			} else {
				setTitle("${param.locals}");
			}
	
			$('#search_box').change(function() {
				var value = this.value;
				setTitle(value);
			});
			
	        $("input[name='radio2']").change(function() {
	            if ($("input[name='radio2']:checked").val() == '1'){
	            	frame_src = "/setChart";
	            	var value = document.getElementById("search_box").value;
					setTitle(value);
	            }
	            else if ($("input[name='radio2']:checked").val() == '2'){
	            	frame_src = "/setChart";
					var value = document.getElementById("search_box").value;
					setTitle(value);
	            }
	        });
	        
	        $("input[name='radio1']").change(function() {
	        	var value = document.getElementById("search_box").value;
				setTitle(value);
	        });
		});
	
		function setTitle(value) {
			var img = document.getElementById("title_img");
			var content1 = document.getElementById("content1");
			var content2 = document.getElementById("content2");
			var value_sub = document.getElementById("search_box").options[document.getElementById("search_box").selectedIndex].text;
			var display = document.getElementById("chartDIV");
			var display2 = document.getElementById("charts");
			var frame = document.getElementById("chartFrame");
			
			if(value.charAt(0)==""){
				img.src = 'img/search_mark.png';
				content1.innerHTML = "히든작물 소개";
				content2.innerHTML = "&nbsp;지역검색이 필요합니다.";
				display.style.display="none";
				display2.style.display="none";
				frame.src = "";
			} else if(value.charAt(0)=="1"){
				img.src = 'img/icon1.png';
				content1.innerHTML = value_sub +"의 히든작물 소개";
				content2.innerHTML = "&nbsp;파파야(papaya, 학명：Carica papaya)는 파파야과, 파파야속의 상록 소고목이다. 그 과일도 파파야라고 한다. 목과, 파우파우, 마망, 트리 멜론 등으로 불리기도 한다.";
				display.style.display="";
				display2.style.display="";
				frame.src = frame_src+"?crop_code="+value.charAt(0)+"&local_code="+value.charAt(2)+value.charAt(3)+"&type="+$("input[name='radio1']:checked").val();
			} else if(value.charAt(0)=="2"){
				img.src = 'img/icon2.png';
				content1.innerHTML = value_sub +"의 히든작물 소개";
				content2.innerHTML = "&nbsp;물푸레나뭇과의 상록 교목. 높이 5∼10m. 잎은 긴 타원형이며 마주나고, 여름·가을에 황백색의 향기로운 꽃이 핌. 소아시아 원산으로 지중해 연안·에스파냐·이탈리아·프랑스·미국 등지에서 재배한다.";
				display.style.display="";
				display2.style.display="";
				frame.src = frame_src + "?crop_code="+value.charAt(0)+"&local_code="+value.charAt(2)+value.charAt(3)+"&type="+$("input[name='radio1']:checked").val();
			} else if(value.charAt(0)=="3"){
				img.src = 'img/icon3.png';
				content1.innerHTML = value_sub +"의 히든작물 소개";
				content2.innerHTML = "&nbsp;패션후르츠는 측막태좌목 시계꽃과에 속하며 아메리카의 아열대 지역이 원산지인 열대 과일입니다. 백가지 향과 맛이 난다하여 백향과라고도 불립니다.";
				display.style.display="";
				display2.style.display="";
				frame.src = frame_src + "?crop_code="+value.charAt(0)+"&local_code="+value.charAt(2)+value.charAt(3)+"&type="+$("input[name='radio1']:checked").val();
			} else if(value.charAt(0)=="4"){
				img.src = 'img/icon4.png';
				content1.innerHTML = value_sub +"의 히든작물 소개";
				content2.innerHTML = "&nbsp;열대지방에서 가장 중요하고 가장 널리 심고 있는 열매 중의 하나로 아시아 동부, 미얀마, 인도의 아삼 주가 원산지인 것으로 추정된다. ";
				display.style.display="";
				display2.style.display="";
				frame.src = frame_src + "?crop_code="+value.charAt(0)+"&local_code="+value.charAt(2)+value.charAt(3)+"&type="+$("input[name='radio1']:checked").val();
			} else if(value.charAt(0)=="5"){
				img.src = 'img/icon5.png';
				content1.innerHTML = value_sub +"의 히든작물 소개";
				content2.innerHTML = "&nbsp;속명의 Persea는 이집트의 단맛을 내는 수목의 옛 그리스명에서 유래. 약 150종이 있다. 높이는 5~20m 정도 자라는 상록 활엽 교목(喬木) 또는 소교목이다";
				display.style.display="";
				display2.style.display="";
				frame.src = frame_src + "?crop_code="+value.charAt(0)+"&local_code="+value.charAt(2)+value.charAt(3)+"&type="+$("input[name='radio1']:checked").val();
			}
		}
	
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
</body>
</html>