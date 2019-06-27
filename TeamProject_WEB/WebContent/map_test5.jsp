<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.customoverlay {position:relative;bottom:63px;border-radius:6px;border: 1px solid #ccc;border-bottom:2px solid #ddd;float:left;}
.customoverlay:nth-of-type(n) {border:0; box-shadow:0px 1px 2px #888;}
.customoverlay a {display:block;text-decoration:none;color:#000;text-align:center;border-radius:6px;font-size:14px;font-weight:bold;overflow:hidden;background: #d95050;background: #d95050 url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png) no-repeat right 14px center;}
.customoverlay .title {display:block;text-align:center;background:#fff;margin-right:35px;padding:10px 15px;font-size:14px;font-weight:bold;}
.customoverlay:after {content:'';position:absolute;margin-left:-12px;left:50%;bottom:-12px;width:22px;height:12px;background:url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
</style>
</head>
<body>
<div id="map" style="width: 700px; height: 800px;"></div>


<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2c31ce0bfdf6ac450e55f852bdb19a2a"></script>
<script>
////////////////////////////////////////////////////////////////////////////////지도생성영역 시작
var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
    mapOption = { 
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
//////////////////////////////////////////////////////////////////////////////// 지도생성영역 끝


////////////////////////////////////////////////////////////////////////////////마커준비영역 시작
// 마커 이미지 준비
var imageSrc = 'http://127.0.0.1:8081/img/test.png', // 마커이미지의 주소입니다    
    imageSize = new kakao.maps.Size(64, 69), // 마커이미지의 크기입니다
    imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

    var content = '<div class="customoverlay">' +
    '  <a href="https://map.kakao.com/link/map/11394059" target="_blank">' +
    '    <span class="title">구의야구공원</span>' +
    '  </a>' +
    '</div>';    
// 마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다 
var positions = [
    {
    	content: content, 
        latlng: new kakao.maps.LatLng(33.450705, 126.570677),
        img : new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption)
    },
    {
        content: content, 
        latlng: new kakao.maps.LatLng(33.450936, 126.569477),
        img : new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption)
    },
    {
        content: content, 
        latlng: new kakao.maps.LatLng(33.450879, 126.569940),
        img : new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption)
    },
    {
        content: content,
        latlng: new kakao.maps.LatLng(33.451393, 126.570738),
        img : new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption)
    }
];
////////////////////////////////////////////////////////////////////////////////마커준비영역 끝


////////////////////////////////////////////////////////////////////////////////마커표시 시작
for (var i = 0; i < positions.length; i ++) {
    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
        map: map, // 마커를 표시할 지도
        position: positions[i].latlng, // 마커의 위치
        image: positions[i].img
    });
    
    var customOverlay = new kakao.maps.CustomOverlay({
        map: map,
        position: positions[i].latlng,
        content: positions[i].content,
        yAnchor: 1 
    });
	
    // 준비한 마커와 인포윈도우를 이벤트에 등록
    kakao.maps.event.addListener(marker, 'click', makeOnclickListener(i));
}

// 클릭 메소드
function makeOnclickListener(i) {
    return function() {
    	location.href="https://www.naver.com?test=" + i;
    };
}

////////////////////////////////////////////////////////////////////////////////마커표시 끝
</script>
</body>
</html>