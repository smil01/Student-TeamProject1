<%@page import="main.member.socialDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<title>스미원 - 미래창조농업부 </title>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<meta name="google-signin-client_id" content="183312277531-653eugt70bdeqd1s2gb2u51fg3lev3gu.apps.googleusercontent.com">
<!-- 제이쿼리 임포트 -->
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<!-- 부트스트랩js 임포트 -->
<script src="js/bootstrap.js"></script>
<!-- 맵 임포트 -->
<link rel="stylesheet" href="css/map.css">
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2c31ce0bfdf6ac450e55f852bdb19a2a&libraries=services,clusterer,drawing"></script>
<fmt:requestEncoding value="UTF-8"/>
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
				<a class="navbar-brand" href="lobbyService.do">미래창조농업부&nbsp;&nbsp;      </a>
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
							<li><a href="mapService.do">지도기반분석</a></li>
							<li><a href="#">차트기반분석</a></li>
						</ul></li>	
				</ul>
				<!-- 1-2-3 세번째 메뉴 끝-->

				

				<!-- 1-2-4 네번째 검색창 시작 -->
				<form class="navbar-form navbar-left">
					<div class="form-group">
						<input type="text" class="form-control" placeholder="검색어를 입력하세요." id="search">
					</div>
				</form>
				<!-- 1-2-4 네번째 검색창 끝 -->

				<!-- 1-2-5 다섯번째 로그인 메뉴 시작 -->
				<c:if test="${sessionScope.member != null}">
				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false" style="padding: 7px;"><img
							class="img-circle" src="${sessionScope.member.src}" alt="프로필" height="36px"
							width="36px">&nbsp;${sessionScope.member.name}<span class="caret"></span></a>
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
		<div class="panel panel-success">
			<div class="panel-heading">
				<h3 class="panel-title">
					<span class="glyphicon glyphicon-map-marker"></span>&nbsp;&nbsp;히든작물 지도로보기 <sub>과일을 클릭하면 분석을 볼 수 있습니다.</sub>
				</h3>
			</div>
			<div class="panel-body">
				<div id="mapwrap"> 
				    <!-- 지도가 표시될 div -->
				    <div id="map"></div>
				    <!-- 지도 위에 표시될 마커 카테고리 -->
				    <div class="category">
				        <ul>
				            <li id="btn0" onclick="changeMarker('0')">
				            	<img class="mapIcon" src="img/icon0.png" width="60px" height="40px">
				               	 모든과일
				            </li>
				            <li id="btn1" onclick="changeMarker('1')">
				            	<img class="mapIcon" src="img/icon1.png" width="60px" height="40px">
				               	 파파야
				            </li>
				            <li id="btn2" onclick="changeMarker('2')">
				            	<img class="mapIcon" src="img/icon2.png" width="60px" height="40px">
				               	 올리브
				            </li>
				            <li id="btn3" onclick="changeMarker('3')">
				            	<img class="mapIcon" src="img/icon3.png" width="60px" height="40px">
				               	 패션후루츠
				            </li>
				            <li id="btn4" onclick="changeMarker('4')">
				            	<img class="mapIcon" src="img/icon4.png" width="60px" height="40px">
				               	 망고
				            </li>
				            <li id="btn5" onclick="changeMarker('5')">
				            	<img class="mapIcon" src="img/icon5.png" width="60px" height="40px">
				               	 아보카도
				            </li>
				        </ul>
				    </div>
				<div style="margin-top: 5px; float: left;">
					<button onclick="setOverlayMapTypeId('std')" class="btn btn-primary">기본지도 보기</button>
					<button onclick="setOverlayMapTypeId('traffic')" class="btn btn-success">교통정보 보기</button>
				</div>
				<div class="btn_div" style="margin-top: 5px; margin-left: 5px; float: left;">
					<button onclick="setOverlayMapTypeId('roadview')" class="btn btn-danger">로드뷰 도로정보 보기</button>
					<button onclick="setOverlayMapTypeId('terrain')" class="btn btn-warning">지형정보 보기</button>
				</div>
				<div class="btn_div2" style="margin-top: 5px; margin-left: 5px; float: left;">
					<button onclick="setOverlayMapTypeId('use_district')" class="btn btn-info">지적편집도 보기</button>
				</div>
				</div>
				<p id="result" style="margin-top: 5px; margin-bottom: 0px"></p>
				<p id="result2" style="margin-bottom: 0px"></p>
				<script type="text/javascript" src="js/map.js"></script>
			</div>
		</div>
		<!-- 두번째 라인 끝(유튜브 버튼 있는곳) -->
		<!-- 2-2 콘텐트 끝 -->
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
						<a href="introService.do" class="list-group-item">스미원 소개</a> <a href="boardService.do"
							class="list-group-item">소통광장</a>
					</div>
				</div>
				<div class="col-sm-3">
					<h4>SNS</h4>
					<div class="list-group">
						<a href="https://www.smhrd.or.kr/" class="list-group-item">유튜브</a> <a href="https://www.facebook.com/smhrd0317"
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
										<a href="#"><img class="media-object" src="${sessionScope.list[0].src}"
											height="120px" width="120px" style="border-radius: 3px;"></a>
										</c:if>
										<c:if test="${sessionScope.list[0] == null}">
										<a href="#"><img class="media-object" src="img/kakao_log.png"
											height="120px" width="120px" style="border-radius: 3px;"></a>
										</c:if>
									</div>
									<div class="media-body">
										<c:if test="${sessionScope.list[0] != null}">
										<h4 class="media-heading">
											카카오톡&nbsp;&nbsp;<c:if test="${sessionScope.member.token == 'k'}"><span class="badge">대표계정</span></c:if>&nbsp;<c:if test="${sessionScope.member.access == 'k'}"><span class="badge ">로그인中</span></c:if>
										</h4>
										회원번호: ${sessionScope.list[0].id}<br>
										닉네임 : ${sessionScope.list[0].name}<br>
										<c:if test="${sessionScope.member.token != 'k'}">
										<a class="btn btn-info" href="reLoginService2.do?_code=k">대표계정 설정</a>
										</c:if>
										<c:if test="${sessionScope.member.access == 'k'}">
										<a class="btn btn-danger" href="https://cs.kakao.com/helps?category=226&locale=ko&service=8">회원정보 수정</a>
										</c:if>
										</c:if>
										<c:if test="${sessionScope.list[0] == null}">
										<div class="button-get-started"><a id="kakao-login-btn"></a></div>
										</c:if>
									</div>
								</div>
								<hr>
								<div class="media">
								<c:if test="${sessionScope.list[1] != null}">
									<div class="media-left">
										<a href="#"><img class="media-object" src="${sessionScope.list[1].src}"
											height="120px" width="120px" style="border-radius: 3px;"></a>
									</div>
								</c:if>
								<c:if test="${sessionScope.list[1] == null}">
									<div class="media-left">
										<a href="#"><img class="media-object" src="img/naver_log.jpg"
											height="120px" width="120px" style="border-radius: 3px;"></a>
									</div>
								</c:if>
								<div class="media-body">
									<c:if test="${sessionScope.list[1] != null}">
									<h4 class="media-heading">
										네이버&nbsp;&nbsp;<c:if test="${sessionScope.member.token == 'n'}"><span class="badge">대표계정</span></c:if>&nbsp;<c:if test="${sessionScope.member.access == 'n'}"><span class="badge ">로그인中</span></c:if>
									</h4>
									회원번호: ${sessionScope.list[1].id}<br>
									닉네임 : ${sessionScope.list[1].name}<br>
									<c:if test="${sessionScope.member.token != 'n'}">
									<a class="btn btn-info" href="reLoginService2.do?_code=n">대표계정 설정</a>
									</c:if>
									<c:if test="${sessionScope.member.access == 'n'}">
									<a class="btn btn-danger" href="https://nid.naver.com/user2/help/myInfo.nhn?lang=ko_KR">회원정보 수정</a>
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
										<a href="#"><img class="media-object" src="${sessionScope.list[2].src}"
											height="120px" width="120px" style="border-radius: 3px;"></a>
									</div>
								</c:if>
								<c:if test="${sessionScope.list[2] == null}">
									<div class="media-left">
										<a href="#"><img class="media-object" src="img/google_log.jpg"
											height="120px" width="120px" style="border-radius: 3px;"></a>
									</div>
								</c:if>
								<div class="media-body">
									<c:if test="${sessionScope.list[2] != null}">
									<h4 class="media-heading">
										구글&nbsp;&nbsp;<c:if test="${sessionScope.member.token == 'g'}"><span class="badge">대표계정</span></c:if>&nbsp;<c:if test="${sessionScope.member.access == 'g'}"><span class="badge ">로그인中</span></c:if>
									</h4>
									회원번호: ${sessionScope.list[2].id}<br>
									닉네임 : ${sessionScope.list[2].name}<br>
									<c:if test="${sessionScope.member.token != 'g'}">
									<a class="btn btn-info" href="reLoginService2.do?_code=g">대표계정 설정</a>
									</c:if>
									<c:if test="${sessionScope.member.access == 'g'}">
									<a class="btn btn-danger" href="https://myaccount.google.com/personal-info">회원정보 수정</a>
									</c:if>
									</c:if>
									<c:if test="${sessionScope.list[2] == null}">
				                	<div class="google" align="left">							      
										<a onclick="">
											<img src="img/googleBtn.png" style="width: 222px; height: 48px; border-radius: 3px;">
										</a>
				                	</div>
									</c:if>
								</div>
								</div>
							</div>
						</div>
						<div align="center">
							<button data-dismiss="modal" class="btn btn-success"><h3 style="margin: 0px;">닫기</h3></button>
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
					<div class="modal-header">
						<h1>히든작물</h1>
					</div>
					<div class="modal-body" style="text-align: left;">
						<!-- 판넬 -->
						<div class="panel panel-success">
							<div class="panel-heading">
								<h3 class="panel-title">
									<span class="glyphicon glyphicon-zoom-in"></span>&nbsp;&nbsp;
									<a id="modal2-title"></a> <!-- 모달창 오기전에 ajax에서 값 셋팅한 부분 -->
								</h3>
							</div>
							<div class="panel-body">
								
							</div>
						</div>
						<div align="center">
							<button data-dismiss="modal" class="btn btn-success"><h3 style="margin: 0px;">닫기</h3></button>
						</div>
						<!-- 판넬 -->
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
		window.alert = function() {};

		function init() { // 시작하자 마자 커넥션
			console.log('init');
			gapi.load('auth2', function() { 
				console.log('auth2');
				window.gauth = gapi.auth2.init({
					client_id: '183312277531-653eugt70bdeqd1s2gb2u51fg3lev3gu.apps.googleusercontent.com'
				});
				gauth.then(function() {
					console.log('google auth success');
				}, function() {
					console.log('google auth fail');
				});
			});
		}
         $(document).ready(function(){
        	<%
        	 	String check = (String)session.getAttribute("check");
        	 	if(check != null){
        	 		%>$('div#modal').modal();<%
        	 		session.removeAttribute("check");
        	 	}
        	%>   		
    		
        	var access = "${sessionScope.member.access}";
            $('#logout').on('click', function(){
            	if(access == 'k'){
	            	var logout = window.open('https://developers.kakao.com/logout', '_blank');
	            	setTimeout(function() {
	            		  	logout.close();
	            		  	location.href="main.do";
	            	}, 2000);
            	} else if(access == 'n'){
	            	var logout = window.open('https://nid.naver.com/nidlogin.logout', '_blank');
	            	setTimeout(function() {
	            		  	logout.close();
	            		  	location.href="main.do";
	            	}, 2000);
            	} else if(access == 'g'){
            		if(gauth.isSignedIn.get()){
            			gauth.signOut().then(function() {
            				location.href="main.do";
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
     	Kakao.Auth
     			.createLoginButton({
     				container : '#kakao-login-btn',
     				success : function(authObj) {
     					//alert(JSON.stringify(authObj));
     					Kakao.API
     							.request({
     								url : '/v1/user/me',
     								success : function(res) {
     									///////////////////////////////////////////////////////////////////////////////////////////////////////
     									//console.log(res);

     									var userID = res.id; //유저의 카카오톡 고유 id
     									var userNickName = res.properties.nickname; //유저가 등록한 별명
     									var src = res.properties.profile_image;
     									var token = JSON.stringify(authObj.access_token);

     									page_href('reLoginService.do?id='+userID+"&name="+encodeURI(userNickName)+"&profile_image="+encodeURI(src)+"&access=k");
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
<script src="https://apis.google.com/js/platform.js?onload=init" async defer></script>
</body>
</html>