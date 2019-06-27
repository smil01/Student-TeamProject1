<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.overlaybox {position:relative;width:360px;height:350px;background:url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/box_movie.png') no-repeat;padding:15px 10px;}
.overlaybox div, ul {overflow:hidden;margin:0;padding:0;}
.overlaybox li {list-style: none;}
.overlaybox .boxtitle {color:#fff;font-size:16px;font-weight:bold;background: url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png') no-repeat right 120px center;margin-bottom:8px;}
.overlaybox .first {position:relative;width:247px;height:136px;background: url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/thumb.png') no-repeat;margin-bottom:8px;}
.first .text {color:#fff;font-weight:bold;}
.first .triangle {position:absolute;width:48px;height:48px;top:0;left:0;background: url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/triangle.png') no-repeat; padding:6px;font-size:18px;}
.first .movietitle {position:absolute;width:100%;bottom:0;background:rgba(0,0,0,0.4);padding:7px 15px;font-size:14px;}
.overlaybox ul {width:247px;}
.overlaybox li {position:relative;margin-bottom:2px;background:#2b2d36;padding:5px 10px;color:#aaabaf;line-height: 1;}
.overlaybox li span {display:inline-block;}
.overlaybox li .number {font-size:16px;font-weight:bold;}
.overlaybox li .title {font-size:13px;}
.overlaybox ul .arrow {position:absolute;margin-top:8px;right:25px;width:5px;height:3px;background:url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/updown.png') no-repeat;} 
.overlaybox li .up {background-position:0 -40px;}
.overlaybox li .down {background-position:0 -60px;}
.overlaybox li .count {position:absolute;margin-top:5px;right:15px;font-size:10px;}
.overlaybox li:hover {color:#fff;background:#d24545;}
.overlaybox li:hover .up {background-position:0 0px;}
.overlaybox li:hover .down {background-position:0 -20px;}   
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
    
// 마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다 
var positions = [
    {
        content: '<div class="overlaybox">' +
        '    <div class="boxtitle">금주 영화순위</div>' +
        '    <div class="first">' +
        '        <div class="triangle text">1</div>' +
        '        <div class="movietitle text">드래곤 길들이기2</div>' +
        '    </div>' +
        '    <ul>' +
        '        <li class="up">' +
        '            <span class="number">2</span>' +
        '            <span class="title">명량</span>' +
        '            <span class="arrow up"></span>' +
        '            <span class="count">2</span>' +
        '        </li>' +
        '        <li>' +
        '            <span class="number">3</span>' +
        '            <span class="title">해적(바다로 간 산적)</span>' +
        '            <span class="arrow up"></span>' +
        '            <span class="count">6</span>' +
        '        </li>' +
        '        <li>' +
        '            <span class="number">4</span>' +
        '            <span class="title">해무</span>' +
        '            <span class="arrow up"></span>' +
        '            <span class="count">3</span>' +
        '        </li>' +
        '        <li>' +
        '            <span class="number">5</span>' +
        '            <span class="title">안녕, 헤이즐</span>' +
        '            <span class="arrow down"></span>' +
        '            <span class="count">1</span>' +
        '        </li>' +
        '    </ul>' +
        '</div>', 
        latlng: new kakao.maps.LatLng(33.450705, 126.570677),
        iwRemoveable : true,
        img : new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption)
    },
    {
        content: '<div>생태연못</div>', 
        latlng: new kakao.maps.LatLng(33.450936, 126.569477),
        iwRemoveable : true,
        img : new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption)
    },
    {
        content: '<div>텃밭</div>', 
        latlng: new kakao.maps.LatLng(33.450879, 126.569940),
        iwRemoveable : true,
        img : new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption)
    },
    {
        content: '<div>근린공원</div>',
        latlng: new kakao.maps.LatLng(33.451393, 126.570738),
        iwRemoveable : true,
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

    // 마커에 표시할 인포윈도우를 생성합니다 
    var infowindow = new kakao.maps.InfoWindow({
        content: positions[i].content, // 인포윈도우에 표시할 내용
        removable : positions[i].iwRemoveable // 모든 윈도우 창에 x 버튼 삽입
    });

	
    // 준비한 마커와 인포윈도우를 이벤트에 등록
    kakao.maps.event.addListener(marker, 'click', makeOnclickListener(i));
    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
}

// 클릭 메소드
function makeOnclickListener(i) {
    return function() {
    	location.href="https://www.naver.com?test=" + i;
    };
}

//인포윈도우를 표시하는 클로저를 만드는 함수입니다 
function makeOverListener(map, marker, infowindow) {
    return function() {
        infowindow.open(map, marker);
    };
}

// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
function makeOutListener(infowindow) {
    return function() {
        infowindow.close();
    };
}
////////////////////////////////////////////////////////////////////////////////마커표시 끝
</script>
</body>
</html>