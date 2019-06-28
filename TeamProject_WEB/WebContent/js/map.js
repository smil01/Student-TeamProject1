/**
 * 
 */

var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
mapOption = { 
    center: new kakao.maps.LatLng(35.900000, 127.70000), // 지도의 중심좌표
    level: 12 // 지도의 확대 레벨
};

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다



// 커피숍 마커가 표시될 좌표 배열입니다
var coffeePositions = [ 
    new kakao.maps.LatLng(37.562365440779296, 126.98659903539634),
    new kakao.maps.LatLng(36.34375814464692, 127.38604909433008)
];

// 편의점 마커가 표시될 좌표 배열입니다
var storePositions = [
	new kakao.maps.LatLng(35.153754736373045, 126.85776546516522)
];

// 주차장 마커가 표시될 좌표 배열입니다
var carparkPositions = [
	new kakao.maps.LatLng(35.867578697240745, 128.60818562066567)
];    



var markerImageSrc = 'http://127.0.0.1:8081/img/test.png';  // 마커이미지의 주소입니다. 스프라이트 이미지 입니다

var coffeeMarkers = [], // 커피숍 마커 객체를 가지고 있을 배열입니다
    storeMarkers = [], // 편의점 마커 객체를 가지고 있을 배열입니다
    carparkMarkers = []; // 주차장 마커 객체를 가지고 있을 배열입니다

    
    
    
createCoffeeMarkers(); // 커피숍 마커를 생성하고 커피숍 마커 배열에 추가합니다
createStoreMarkers(); // 편의점 마커를 생성하고 편의점 마커 배열에 추가합니다
createCarparkMarkers(); // 주차장 마커를 생성하고 주차장 마커 배열에 추가합니다

//changeMarker('coffee'); // 지도에 커피숍 마커가 보이도록 설정합니다    




// 마커이미지의 주소와, 크기, 옵션으로 마커 이미지를 생성하여 리턴하는 함수입니다
function createMarkerImage(src, check) {
	var x = 0, y = 0,
		w = 0, h = 0;

	if(check==0){
		x = 15;
		y = 50;
		w = 36;
		h = 40;
	} else if(check==1) {
		x = 23;
		y = 56;
		w = 55;
		h = 59;
	}
	
	var imageSize = new kakao.maps.Size(w, h);
	var imageOption = {offset: new kakao.maps.Point(x, y)};

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

// 커피숍 마커를 생성하고 커피숍 마커 배열에 추가하는 함수입니다
function createCoffeeMarkers() {
    
    for (var i = 0; i < coffeePositions.length; i++) {  
        // 마커이미지와 마커를 생성합니다
        var markerImage = createMarkerImage("http://127.0.0.1:8081/img/icon1.png", 1),    
            marker = createMarker(coffeePositions[i], markerImage);

        // 생성된 마커를 커피숍 마커 배열에 추가합니다
        coffeeMarkers.push(marker);
    }     
}

// 커피숍 마커들의 지도 표시 여부를 설정하는 함수입니다
function setCoffeeMarkers(map) {        
    for (var i = 0; i < coffeeMarkers.length; i++) {  
    	kakao.maps.event.addListener(coffeeMarkers[i], 'click', function() {
    		location.href="https://www.naver.com?test=" + i;
		});
    	
        coffeeMarkers[i].setMap(map);
    }        
}

// 편의점 마커를 생성하고 편의점 마커 배열에 추가하는 함수입니다
function createStoreMarkers() {
    for (var i = 0; i < storePositions.length; i++) {
        // 마커이미지와 마커를 생성합니다
        var markerImage = createMarkerImage("http://127.0.0.1:8081/img/icon2.png", 0),    
            marker = createMarker(storePositions[i], markerImage);  

        // 생성된 마커를 편의점 마커 배열에 추가합니다
        storeMarkers.push(marker);    
    }        
}

// 편의점 마커들의 지도 표시 여부를 설정하는 함수입니다
function setStoreMarkers(map) {        
    for (var i = 0; i < storeMarkers.length; i++) {
    	kakao.maps.event.addListener(storeMarkers[i], 'click', function() {
    		location.href="https://www.naver.com?test=" + i;
		});
        storeMarkers[i].setMap(map);
    }        
}



// 주차장 마커를 생성하고 주차장 마커 배열에 추가하는 함수입니다
function createCarparkMarkers() {
    for (var i = 0; i < carparkPositions.length; i++) {
        // 마커이미지와 마커를 생성합니다
        var markerImage = createMarkerImage("http://127.0.0.1:8081/img/icon3.png", 1),    
            marker = createMarker(carparkPositions[i], markerImage);  

        // 생성된 마커를 주차장 마커 배열에 추가합니다
        carparkMarkers.push(marker);        
    }                
}

// 주차장 마커들의 지도 표시 여부를 설정하는 함수입니다
function setCarparkMarkers(map) {        
    for (var i = 0; i < carparkMarkers.length; i++) { 
    	kakao.maps.event.addListener(carparkMarkers[i], 'click', function() {
    		location.href="https://www.naver.com?test=" + i;
		});
        carparkMarkers[i].setMap(map);
    }        
}

changeMarker('all');


// 카테고리를 클릭했을 때 type에 따라 카테고리의 스타일과 지도에 표시되는 마커를 변경합니다
function changeMarker(type){
    
    var coffeeMenu = document.getElementById('coffeeMenu');
    var storeMenu = document.getElementById('storeMenu');
    var carparkMenu = document.getElementById('carparkMenu');
    var allMenu = document.getElementById('allMenu');
    
    // 커피숍 카테고리가 클릭됐을 때
    if (type === 'all') {
        
        // 버튼 셀렉터 기능
    	allMenu.className = 'menu_selected';
    	coffeeMenu.className = '';
        storeMenu.className = '';
        carparkMenu.className = '';
        
        // 커피숍 마커들만 지도에 표시하도록 설정합니다
        setCoffeeMarkers(map);
        setStoreMarkers(map);
        setCarparkMarkers(map);
        
    } else if (type === 'coffee') {
    
        // 버튼 셀렉터 기능
    	allMenu.className = '';
    	coffeeMenu.className = 'menu_selected';
        storeMenu.className = '';
        carparkMenu.className = '';
        
        // 커피숍 마커들만 지도에 표시하도록 설정합니다
        setCoffeeMarkers(map);
        setStoreMarkers(null);
        setCarparkMarkers(null);
        
    } else if (type === 'store') { // 편의점 카테고리가 클릭됐을 때
    
        // 버튼 셀렉터 기능
    	allMenu.className = '';
    	coffeeMenu.className = '';
        storeMenu.className = 'menu_selected';
        carparkMenu.className = '';
        
        // 편의점 마커들만 지도에 표시하도록 설정합니다
        setCoffeeMarkers(null);
        setStoreMarkers(map);
        setCarparkMarkers(null);
        
    } else if (type === 'carpark') { // 주차장 카테고리가 클릭됐을 때
     
        // 버튼 셀렉터 기능
    	allMenu.className = '';
    	coffeeMenu.className = '';
        storeMenu.className = '';
        carparkMenu.className = 'menu_selected';
        
        // 주차장 마커들만 지도에 표시하도록 설정합니다
        setCoffeeMarkers(null);
        setStoreMarkers(null);
        setCarparkMarkers(map);  
    }    
} 