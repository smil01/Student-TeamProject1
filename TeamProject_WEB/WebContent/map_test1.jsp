<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.0.0.js"></script>
<fmt:requestEncoding value="UTF-8" />
<title>Insert title here</title>
</head>
<body>
	<div id="map" style="width: 700px; height: 800px;"></div>
	<p>
		<button onclick="setOverlayMapTypeId('std')">기본지도 보기</button>
		<button onclick="setOverlayMapTypeId('traffic')">교통정보 보기</button>
		<button onclick="setOverlayMapTypeId('roadview')">로드뷰 도로정보 보기</button>
		<button onclick="setOverlayMapTypeId('terrain')">지형정보 보기</button>
		<button onclick="setOverlayMapTypeId('use_district')">지적편집도
			보기</button>
	</p>
	<p id="result"></p>


	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2c31ce0bfdf6ac450e55f852bdb19a2a&libraries=services,clusterer,drawing"></script>

	<script type="text/javascript">
		var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
		var options = { //지도를 생성할 때 필요한 기본 옵션
			center : new kakao.maps.LatLng(35.900000, 127.70000), //지도의 중심좌표.
			level : 12
		//지도의 레벨(확대, 축소 정도)
		};

		var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴

		
		
		
		
		
		
		//// 기본1. 다중 마커
		var points = [
		    new kakao.maps.LatLng(37.562365440779296, 126.98659903539634),
		    new kakao.maps.LatLng(36.34375814464692, 127.38604909433008),
		    new kakao.maps.LatLng(35.153754736373045, 126.85776546516522),
		    new kakao.maps.LatLng(35.867578697240745, 128.60818562066567),
		    new kakao.maps.LatLng(35.172934344898906, 129.07766059147028)
		]; 

		// 이미지 마커 준비
		var imageSrc = 'http://127.0.0.1:8081/img/test.png', // 마커이미지의 주소입니다    
	    imageSize = new kakao.maps.Size(64, 69), // 마커이미지의 크기입니다
	    imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
	    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);
		
		var marker;
		for (var i = 0; i < points.length; i++) {
		    // 배열의 좌표들이 잘 보이게 마커를 지도에 추가합니다
		    marker = new kakao.maps.Marker({
		    	position : points[i],
		    	image: markerImage // 마커이미지 설정 
		    });
		    marker.setMap(map);
		}
		
		//// 기본2. 클릭한 위치 gps 추출 지도에 클릭 이벤트를 등록합니다
		// 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
		kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
		    
		    // 클릭한 위도, 경도 정보를 가져옵니다 
		    var latlng = mouseEvent.latLng;
		    
		    var message = '클릭한 위치 gps : ' + latlng.getLat() + ', '+ latlng.getLng();
		    
		    var resultDiv = document.getElementById('result'); 
		    resultDiv.innerHTML = message;
		    
		});
		
		//// 옵션1. 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
		var mapTypeControl = new kakao.maps.MapTypeControl();
		// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
		// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
		map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

		//// 옵션1. 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
		var zoomControl = new kakao.maps.ZoomControl();
		map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

		//// 옵션2. 지도에 추가된 지도타입정보를 가지고 있을 변수입니다
		var currentTypeId;
		// 버튼이 클릭되면 호출되는 함수입니다
		function setOverlayMapTypeId(maptype) {
			var changeMaptype;

			// maptype에 따라 지도에 추가할 지도타입을 결정합니다
			if (maptype === 'std') {

				// 교통정보 지도타입
				changeMaptype = kakao.maps.MapTypeId.ROADMAP;

			} else if (maptype === 'traffic') {

				// 교통정보 지도타입
				changeMaptype = kakao.maps.MapTypeId.TRAFFIC;

			} else if (maptype === 'roadview') {

				// 로드뷰 도로정보 지도타입
				changeMaptype = kakao.maps.MapTypeId.ROADVIEW;

			} else if (maptype === 'terrain') {

				// 지형정보 지도타입
				changeMaptype = kakao.maps.MapTypeId.TERRAIN;

			} else if (maptype === 'use_district') {

				// 지적편집도 지도타입
				changeMaptype = kakao.maps.MapTypeId.USE_DISTRICT;
			}

			// 이미 등록된 지도 타입이 있으면 제거합니다
			if (currentTypeId) {
				map.removeOverlayMapTypeId(currentTypeId);
			}

			// maptype에 해당하는 지도타입을 지도에 추가합니다
			map.addOverlayMapTypeId(changeMaptype);

			// 지도에 추가된 타입정보를 갱신합니다
			currentTypeId = changeMaptype;
		}
	</script>
</body>
</html>