/**
 * 
 */

var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
mapOption = { 
    center: new kakao.maps.LatLng(35.900000, 127.70000), // 지도의 중심좌표
    level: 12 // 지도의 확대 레벨
};

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다


// 주소
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
	"진주",
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
	"울릉도",
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
	"봉화",
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
	"광주",
	"경주시",
	"거창",
	"거제",
	"강릉"
	];

	//
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
	"부안",

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
	"군산",
	]; 

	var arr5 = [
	"진도군",
	"해남",
	"여수",
	"목포",
	"보성군",
	"완도",
	"고창군",
	"광주광역시"
	]; 



// 마커 배열
var list1 = [],
    list2 = [],
    list3 = [],
    list4 = [],
    list5 = [];

//마커생성
createList1();
createList2();
createList3();
createList4();
createList5();

// 마커이미지의 주소와, 크기, 옵션으로 마커 이미지를 생성하여 리턴하는 함수입니다
function createMarkerImage(src, imageSize, imageOption) {
    return new kakao.maps.MarkerImage(src, imageSize, imageOption);            
}

// 좌표와 마커이미지를 받아 마커를 생성하여 리턴하는 함수입니다
function createMarker(position, image) {
    var marker = new kakao.maps.Marker({
        position: position,
        image: image
    });
    
    return marker;  
}   

// 파파야
function createList1() {
    
    for (var i = 0; i < arr1.length; i++) {
    	
    	var geocoder = new kakao.maps.services.Geocoder();
    	geocoder.addressSearch(arr1[i], function(result, status){
    		if (status === kakao.maps.services.Status.OK) {
    			var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
    			
    			var imageSize = new kakao.maps.Size(20, 40);
    			var imageOption = {offset: new kakao.maps.Point(0, 50)};
    			
		        // 마커이미지와 마커를 생성합니다
		        var markerImage = createMarkerImage("http://192.168.0.21:8081/img/icon1.png", imageSize, imageOption),    
		            marker = createMarker(coords, markerImage);
		
		        // 생성된 마커를 커피숍 마커 배열에 추가합니다
		        list1.push(marker);
    		}
    	});
    }     
}


function setList1(map) {        
    for (var i = 0; i < list1.length; i++) {  
    	kakao.maps.event.addListener(list1[i], 'click', function() {
    		location.href="https://www.naver.com?test=" + i;
		});
    	
        list1[i].setMap(map);
    }        
}

// 올리브
function createList2() {
    for (var i = 0; i < arr2.length; i++) {
    	var geocoder = new kakao.maps.services.Geocoder();
    	geocoder.addressSearch(arr2[i], function(result, status){
    		if (status === kakao.maps.services.Status.OK) {
    			var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
    			
    			var imageSize = new kakao.maps.Size(20, 40);
    			var imageOption = {offset: new kakao.maps.Point(0, 48)};
    			
    	        // 마커이미지와 마커를 생성합니다
    	        var markerImage = createMarkerImage("http://192.168.0.21:8081/img/icon2.png", imageSize, imageOption),    
    	            marker = createMarker(coords, markerImage);
    	
    	        // 생성된 마커를 커피숍 마커 배열에 추가합니다
    	        list2.push(marker);
    		}
    	});    
    }
}


function setList2(map) {        
    for (var i = 0; i < list2.length; i++) {
    	kakao.maps.event.addListener(list2[i], 'click', function() {
    		location.href="https://www.naver.com?test=" + i;
		});
        list2[i].setMap(map);
    }        
}



// 패션후루츠
function createList3() {
    for (var i = 0; i < arr3.length; i++) {
    	var geocoder = new kakao.maps.services.Geocoder();
    	geocoder.addressSearch(arr3[i], function(result, status){
    		if (status === kakao.maps.services.Status.OK) {
    			var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

    			var imageSize = new kakao.maps.Size(40, 60);
    			var imageOption = {offset: new kakao.maps.Point(0, 58)};

    	        // 마커이미지와 마커를 생성합니다
    	        var markerImage = createMarkerImage("http://192.168.0.21:8081/img/icon3.png", imageSize, imageOption),   
    	            marker = createMarker(coords, markerImage);

    	        // 생성된 마커를 커피숍 마커 배열에 추가합니다
    	        list3.push(marker);
    		}
    	});   
    }
}


function setList3(map) {        
    for (var i = 0; i < list3.length; i++) { 
    	kakao.maps.event.addListener(list3[i], 'click', function() {
    		location.href="https://www.naver.com?test=" + i;
		});
        list3[i].setMap(map);
    }        
}

//패션후루츠
function createList4() {
    for (var i = 0; i < arr4.length; i++) {
    	var geocoder = new kakao.maps.services.Geocoder();
    	geocoder.addressSearch(arr4[i], function(result, status){
    		if (status === kakao.maps.services.Status.OK) {
    			var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

    			var imageSize = new kakao.maps.Size(40, 60);
    			var imageOption = {offset: new kakao.maps.Point(0, 58)};

    	        // 마커이미지와 마커를 생성합니다
    	        var markerImage = createMarkerImage("http://192.168.0.21:8081/img/icon4.png", imageSize, imageOption),   
    	            marker = createMarker(coords, markerImage);

    	        // 생성된 마커를 커피숍 마커 배열에 추가합니다
    	        list4.push(marker);
    		}
    	});   
    }
}


function setList4(map) {        
    for (var i = 0; i < list4.length; i++) { 
    	kakao.maps.event.addListener(list4[i], 'click', function() {
    		location.href="https://www.naver.com?test=" + i;
		});
        list4[i].setMap(map);
    }        
}

//패션후루츠
function createList5() {
    for (var i = 0; i < arr5.length; i++) {
    	var geocoder = new kakao.maps.services.Geocoder();
    	geocoder.addressSearch(arr5[i], function(result, status){
    		if (status === kakao.maps.services.Status.OK) {
    			var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

    			var imageSize = new kakao.maps.Size(40, 60);
    			var imageOption = {offset: new kakao.maps.Point(0, 58)};

    	        // 마커이미지와 마커를 생성합니다
    	        var markerImage = createMarkerImage("http://192.168.0.21:8081/img/icon5.png", imageSize, imageOption),   
    	            marker = createMarker(coords, markerImage);

    	        // 생성된 마커를 커피숍 마커 배열에 추가합니다
    	        list5.push(marker);
    		}
    	});   
    }
}


function setList5(map) {        
    for (var i = 0; i < list5.length; i++) { 
    	kakao.maps.event.addListener(list5[i], 'click', function() {
    		location.href="https://www.naver.com?test=" + i;
		});
        list5[i].setMap(map);
    }        
}

// 카테고리를 클릭했을 때 type에 따라 카테고리의 스타일과 지도에 표시되는 마커를 변경합니다
function changeMarker(type){
    var btn0 = document.getElementById('btn0');
    var btn1 = document.getElementById('btn1');
    var btn2 = document.getElementById('btn2');
    var btn3 = document.getElementById('btn3');
    var btn4 = document.getElementById('btn4');
    var btn5 = document.getElementById('btn5');
    
    
    // 커피숍 카테고리가 클릭됐을 때
    if (type === '0') {
        
        // 버튼 셀렉터 기능
    	btn0.className = 'menu_selected';
    	btn1.className = '';
        btn2.className = '';
        btn3.className = '';
        btn4.className = '';
        btn5.className = '';
        
        // 커피숍 마커들만 지도에 표시하도록 설정합니다
        setList1(map);
        setList2(map);
        setList3(map);
        setList4(map);
        setList5(map);
        
    } else if (type === '1') {
    
        // 버튼 셀렉터 기능
    	btn0.className = '';
    	btn1.className = 'menu_selected';
        btn2.className = '';
        btn3.className = '';
        btn4.className = '';
        btn5.className = '';
        
        // 커피숍 마커들만 지도에 표시하도록 설정합니다
        setList1(map);
        setList2(null);
        setList3(null);
        setList4(null);
        setList5(null);
        
    } else if (type === '2') { // 편의점 카테고리가 클릭됐을 때
    
        // 버튼 셀렉터 기능
    	btn0.className = '';
    	btn1.className = '';
        btn2.className = 'menu_selected';
        btn3.className = '';
        btn4.className = '';
        btn5.className = '';
        
        // 커피숍 마커들만 지도에 표시하도록 설정합니다
        setList1(null);
        setList2(map);
        setList3(null);
        setList4(null);
        setList5(null);
        
    } else if (type === '3') { // 주차장 카테고리가 클릭됐을 때
     
        // 버튼 셀렉터 기능
    	btn0.className = '';
    	btn1.className = '';
        btn2.className = '';
        btn3.className = 'menu_selected';
        btn4.className = '';
        btn5.className = '';
        
        // 커피숍 마커들만 지도에 표시하도록 설정합니다
        setList1(null);
        setList2(null);
        setList3(map);
        setList4(null);
        setList5(null);
    }  else if (type === '4') { // 주차장 카테고리가 클릭됐을 때
     
        // 버튼 셀렉터 기능
    	btn0.className = '';
    	btn1.className = '';
        btn2.className = '';
        btn3.className = '';
        btn4.className = 'menu_selected';
        btn5.className = '';
        
        // 커피숍 마커들만 지도에 표시하도록 설정합니다
        setList1(null);
        setList2(null);
        setList3(null);
        setList4(map);
        setList5(null);
    }  else if (type === '5') { // 주차장 카테고리가 클릭됐을 때
     
        // 버튼 셀렉터 기능
    	btn0.className = '';
    	btn1.className = '';
        btn2.className = '';
        btn3.className = '';
        btn4.className = '';
        btn5.className = 'menu_selected';
        
        // 커피숍 마커들만 지도에 표시하도록 설정합니다
        setList1(null);
        setList2(null);
        setList3(null);
        setList4(null);
        setList5(map);
    }    
}

/////////////////////////////////////////////////////////////////////////////////////
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