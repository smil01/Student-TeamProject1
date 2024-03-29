/**
 * 
 */
function setModal(code, name) { // 마커가 실행되면 (과일번호, 지역번호)
	$.ajax({
		contentType: "application/x-www-form-urlencoded; charset=UTF-8", // 한글깨짐을 막기위해서 헤더셋팅
		url : "./setModal", // 통신할 호출위치
		type : "post",
		data : {"code" : code, "name" : name}, // 보낼 데이터
		success : function(data) { // setModal서블릿과 통신이 성공하면 setModal이 out.print로 찍은 값이 넘어옴
			//자바스크립트나 제이쿼리로 modal2창 내의 태그들에 값을 넣어줘야함
			var go_name;
			if(code == 1){
				$(".panel-title").html('<span class="glyphicon glyphicon-zoom-in"></span>&nbsp;&nbsp;' + arr1[name] + '의 히든작물 파파야 퀵분석<br>');
				$("#title2").html('<h4 style="margin-bottom: 0px">&nbsp;&nbsp;- 파파야 적합등급(최상5등급, 최하1등급)</h4>');
				go_name = arr1[name];
			} else if(code == 2) {
				$(".panel-title").html('<span class="glyphicon glyphicon-zoom-in"></span>&nbsp;&nbsp;' + arr2[name] + '의 히든작물 올리브 퀵분석<br>');
				$("#title2").html('<h4 style="margin-bottom: 0px">&nbsp;&nbsp;- 올리브 적합등급(최상5등급, 최하1등급)</h4>');
				go_name = arr2[name];
			} else if(code == 3) {
				$(".panel-title").html('<span class="glyphicon glyphicon-zoom-in"></span>&nbsp;&nbsp;' + arr3[name] + '의 히든작물 패션후루츠 퀵분석<br>');
				$("#title2").html('<h4 style="margin-bottom: 0px">&nbsp;&nbsp;- 패션후루츠 적합등급(최상5등급, 최하1등급)</h4>');
				go_name = arr3[name];
			} else if(code == 4) {
				$(".panel-title").html('<span class="glyphicon glyphicon-zoom-in"></span>&nbsp;&nbsp;' + arr4[name] + '의 히든작물 망고 퀵분석<br>');
				$("#title2").html('<h4 style="margin-bottom: 0px">&nbsp;&nbsp;- 망고 적합등급(최상5등급, 최하1등급)</h4>');
				go_name = arr4[name];
			} else if(code == 5) {
				$(".panel-title").html('<span class="glyphicon glyphicon-zoom-in"></span>&nbsp;&nbsp;' + arr5[name] + '의 히든작물 아보카도 퀵분석<br>');
				$("#title2").html('<h4 style="margin-bottom: 0px">&nbsp;&nbsp;- 아보카도 적합등급(최상5등급, 최하1등급)</h4>');
				go_name = arr5[name];
			}
			
			$("#min_temp").text('최저온도등급 : '+data.min_temp+'등급');
			$("#max_temp").text('최고온도등급 : '+data.max_temp+'등급');
			$("#avg_temp").text('평균온도등급 : '+data.avg_temp+'등급');
			$("#ph").text('토양등급 : '+data.ph+'등급');
			$("#chartGo").attr('href', 'chartService.do?locals='+data.crop_code+"_"+((data.local_code<10)?"0":"")+data.local_code+"&name="+encodeURI(go_name));

			$('div#modal2').modal(); // 모달창 열기
		},
		error : function(request, status, error) { // 실패 했을때
			console.log('통신실패 내용 : ' + error);
		}
	});
}

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
var gps1 = [ 
	new kakao.maps.LatLng(37.5764911645724, 126.97500429204324),
	new kakao.maps.LatLng(37.703474187115525, 127.88721726251191),
	new kakao.maps.LatLng(35.56806608459897, 128.16684348998552),
	new kakao.maps.LatLng(35.52430283139828, 127.72557808851892),
	new kakao.maps.LatLng(36.03500157307777, 129.34514750326662),
	new kakao.maps.LatLng(34.86238622068383, 128.43383809695902),
	new kakao.maps.LatLng(37.170153587926855, 128.98496299333527),
	new kakao.maps.LatLng(36.99488177227658, 127.92623217196731),
	new kakao.maps.LatLng(37.88866579523732, 127.7305122241157),
	new kakao.maps.LatLng(36.21754878599808, 127.99812287208158),
	new kakao.maps.LatLng(36.44886578779982, 129.05412546777904),
	new kakao.maps.LatLng(35.252704436959256, 128.67825853917898),
	new kakao.maps.LatLng(35.18690010710184, 128.10568465969348),
	new kakao.maps.LatLng(37.20479696701501, 128.28433431100078),
	new kakao.maps.LatLng(37.474869279638554, 128.7982592871364),
	new kakao.maps.LatLng(35.81818667581734, 127.20219043097529),
	new kakao.maps.LatLng(35.66094146871952, 127.35446298506946),
	new kakao.maps.LatLng(35.66950171044248, 127.53546094906983),
	new kakao.maps.LatLng(35.66557246946806, 127.34882870586267),
	new kakao.maps.LatLng(38.1240792352791, 128.15430463811322),
	new kakao.maps.LatLng(36.377953121690396, 128.7327350177848),
	new kakao.maps.LatLng(35.359196227090564, 128.29387137985944),
	new kakao.maps.LatLng(37.38304460724002, 127.97520094830826),
	new kakao.maps.LatLng(37.0355130908028, 129.38622438426344),
	new kakao.maps.LatLng(35.5780453998919, 129.3760835860738),
	new kakao.maps.LatLng(37.503858003674715, 130.85968345579337),
	new kakao.maps.LatLng(36.000053874556706, 129.00263170385944),
	new kakao.maps.LatLng(36.8444826458986, 128.6915500174843),
	new kakao.maps.LatLng(36.394298659627296, 129.38928721710326),
	new kakao.maps.LatLng(35.366142476737686, 129.1107643516283),
	new kakao.maps.LatLng(36.61196022711847, 128.8180696127509),
	new kakao.maps.LatLng(35.402873772965364, 127.20114810162298),
	new kakao.maps.LatLng(38.202658754925295, 128.54131548041795),
	new kakao.maps.LatLng(36.45816331552386, 128.21479766763068),
	new kakao.maps.LatLng(35.44548529850329, 127.9456338382955),
	new kakao.maps.LatLng(37.768497637230034, 128.8983129959275),
	new kakao.maps.LatLng(36.31669348133928, 126.96971108033996),
	new kakao.maps.LatLng(36.916749643756326, 128.7965560058283),
	new kakao.maps.LatLng(36.508279077695896, 127.7255007225786),
	new kakao.maps.LatLng(35.50327843605027, 128.7588815786863),
	new kakao.maps.LatLng(36.60845544489255, 128.17995472966322),
	new kakao.maps.LatLng(37.52869806538261, 129.03410938089993),
	new kakao.maps.LatLng(37.9325469501178, 127.04622759766029),
	new kakao.maps.LatLng(36.35352773699409, 127.39679249339889),
	new kakao.maps.LatLng(35.87344381833881, 128.60086385184374),
	new kakao.maps.LatLng(37.68796725266886, 128.6971065536915),
	new kakao.maps.LatLng(35.42771625229326, 127.41299024338772),
	new kakao.maps.LatLng(36.12594773661892, 127.487711473157),
	new kakao.maps.LatLng(36.13896271144829, 128.34814995205423),
	new kakao.maps.LatLng(35.85510808193732, 129.21113691313573),
	new kakao.maps.LatLng(35.703040730671255, 127.90659052888284),
	new kakao.maps.LatLng(34.87062887256776, 128.6294690151787)
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
	"부안"
	];
	var gps2 = [
		new kakao.maps.LatLng(36.614097305808954, 126.65875111528176),
		new kakao.maps.LatLng(37.76139110708618, 126.7828325507731),
		new kakao.maps.LatLng(36.641831063060934, 127.49165946536463),
		new kakao.maps.LatLng(36.8152299523119, 127.11404670172334),
		new kakao.maps.LatLng(35.57312010290437, 126.85385085489979),
		new kakao.maps.LatLng(37.27061892435014, 127.44232251853265),
		new kakao.maps.LatLng(35.31287373178837, 126.49751329182557),
		new kakao.maps.LatLng(37.50080717039513, 127.48891276278651),
		new kakao.maps.LatLng(36.78791543874477, 126.44968932631754),
		new kakao.maps.LatLng(35.73225772397123, 126.7320587048628)
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
	var gps3 = [
		new kakao.maps.LatLng(33.496047483105876, 126.55681404094825),
		new kakao.maps.LatLng(33.46117469649603, 126.90843769505094),
		new kakao.maps.LatLng(34.627965900746034, 127.27952154386965),
		new kakao.maps.LatLng(34.84657547650191, 127.88834931187971),
		new kakao.maps.LatLng(33.27142247049519, 126.51398825499413),
		new kakao.maps.LatLng(34.652289152938756, 126.76437925720295),
		new kakao.maps.LatLng(34.95326149422943, 127.48696947047753),
		new kakao.maps.LatLng(34.945903665645204, 127.6950049825787)
	];

	var arr4 = [
	"부산",
	"보령",
	"김해시",
	"군산"
	];
	var gps4 = [
		new kakao.maps.LatLng(35.16342031104764, 129.09427414037023),
		new kakao.maps.LatLng(36.33915337281735, 126.61682515236083),
		new kakao.maps.LatLng(35.25664593753409, 128.89697993871857),
		new kakao.maps.LatLng(35.97371809965286, 126.7002008693685)
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
	var gps5 = [
		new kakao.maps.LatLng(34.46852281024099, 126.25638436237496),
		new kakao.maps.LatLng(34.57051542838996, 126.60001242382612),
		new kakao.maps.LatLng(34.77824214752573, 127.65688910857631),
		new kakao.maps.LatLng(34.807402287585774, 126.404429172103),
		new kakao.maps.LatLng(34.779415177740475, 127.07376616288316),
		new kakao.maps.LatLng(34.34522567412016, 126.70194391091921),
		new kakao.maps.LatLng(35.43381848343666, 126.70010094946895),
		new kakao.maps.LatLng(35.1583655121762, 126.85424528046488)
	];
	
	
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
	mapOption = { 
	    center: new kakao.maps.LatLng(35.900000, 127.70000), // 지도의 중심좌표
	    level: 12 // 지도의 확대 레벨
	};

	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다


// 마커 배열
var list1 = new Array(),
    list2 = new Array(),
    list3 = new Array(),
    list4 = new Array(),
    list5 = new Array();

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
        image: image,
        clickable: true
    });
    
    return marker;  
}

//인포윈도우를 표시하는 클로저를 만드는 함수입니다 
function makeOverListener(map, marker, infowindow) {
    return function() {
        infowindow.open(map, marker);
    };
}

// 파파야
function createList1() {
    for (var i = 0; i < arr1.length; i++) {
    			var imageSize = new kakao.maps.Size(20, 40);
    			var imageOption = {offset: new kakao.maps.Point(0, 50)};
    			
		        // 마커이미지와 마커를 생성합니다
		        var markerImage = createMarkerImage("http://goddaegeun.ml/img/icon1.png", imageSize, imageOption),    
		            marker = createMarker(gps1[i], markerImage);
		
		        // 생성된 마커를 커피숍 마커 배열에 추가합니다
		        list1.push(marker);
    }     
}


function setList1(map) {        
    for (var i = 0; i < list1.length; i++) {  
        list1[i].setMap(map);
        
        var content = '<div><h5><a onclick="setModal(1, '+i+')">&nbsp;&nbsp;&nbsp;퀵분석 보러가기</a></h5></div>';
        var infowindow = new kakao.maps.InfoWindow({
            content: content,
            removable : true
        });
        
        kakao.maps.event.addListener(list1[i], 'click', makeOverListener(map, list1[i], infowindow));
    }        
}

// 올리브
function createList2() {
    for (var i = 0; i < arr1.length; i++) {
    			var imageSize = new kakao.maps.Size(20, 40);
    			var imageOption = {offset: new kakao.maps.Point(0, 48)};
    			
    	        // 마커이미지와 마커를 생성합니다
    	        var markerImage = createMarkerImage("http://goddaegeun.ml/img/icon2.png", imageSize, imageOption),    
    	            marker = createMarker(gps2[i], markerImage);
    	
    	        // 생성된 마커를 커피숍 마커 배열에 추가합니다
    	        list2.push(marker);
    }
}

function setList2(map) {        
    for (var i = 0; i < list2.length; i++) {
        list2[i].setMap(map);
        
        var content = '<div><h5><a onclick="setModal(2, '+i+')">&nbsp;&nbsp;&nbsp;&nbsp;퀵분석 보러가기</a></h5></div>';
        var infowindow = new kakao.maps.InfoWindow({
            content: content,
            removable : true
        });
        
        kakao.maps.event.addListener(list2[i], 'click', makeOverListener(map, list2[i], infowindow));
    }        
}



// 패션후루츠
function createList3() {
    for (var i = 0; i < arr1.length; i++) {
    			var imageSize = new kakao.maps.Size(40, 60);
    			var imageOption = {offset: new kakao.maps.Point(0, 58)};

    	        // 마커이미지와 마커를 생성합니다
    	        var markerImage = createMarkerImage("http://goddaegeun.ml/img/icon3.png", imageSize, imageOption),   
    	            marker = createMarker(gps3[i], markerImage);

    	        // 생성된 마커를 커피숍 마커 배열에 추가합니다
    	        list3.push(marker);
    }
}


function setList3(map) {        
    for (var i = 0; i < list3.length; i++) { 
        list3[i].setMap(map);
        
        var content = '<div><h5><a onclick="setModal(3, '+i+')">&nbsp;&nbsp;퀵분석 보러가기</a></h5></div>';
        var infowindow = new kakao.maps.InfoWindow({
            content: content,
            removable : true
        });
        
        kakao.maps.event.addListener(list3[i], 'click', makeOverListener(map, list3[i], infowindow));
    }        
}

//패션후루츠
function createList4() {
    for (var i = 0; i < arr1.length; i++) {
    			var imageSize = new kakao.maps.Size(40, 60);
    			var imageOption = {offset: new kakao.maps.Point(0, 58)};

    	        // 마커이미지와 마커를 생성합니다
    	        var markerImage = createMarkerImage("http://goddaegeun.ml/img/icon4.png", imageSize, imageOption),   
    	            marker = createMarker(gps4[i], markerImage);

    	        // 생성된 마커를 커피숍 마커 배열에 추가합니다
    	        list4.push(marker);
    }
}


function setList4(map) {        
    for (var i = 0; i < list4.length; i++) { 
        list4[i].setMap(map);
        
        var content = '<div><h5><a onclick="setModal(4, '+i+')">&nbsp;&nbsp;퀵분석 보러가기</a></h5></div>';
        var infowindow = new kakao.maps.InfoWindow({
            content: content,
            removable : true
        });
        
        kakao.maps.event.addListener(list4[i], 'click', makeOverListener(map, list4[i], infowindow));
    }        
}

//패션후루츠
function createList5() {
    for (var i = 0; i < arr1.length; i++) {
    			var imageSize = new kakao.maps.Size(40, 60);
    			var imageOption = {offset: new kakao.maps.Point(0, 58)};

    	        // 마커이미지와 마커를 생성합니다
    	        var markerImage = createMarkerImage("http://goddaegeun.ml/img/icon5.png", imageSize, imageOption),   
    	            marker = createMarker(gps5[i], markerImage);

    	        // 생성된 마커를 커피숍 마커 배열에 추가합니다
    	        list5.push(marker);
    }
}


function setList5(map) {        
    for (var i = 0; i < list5.length; i++) { 
    	list5[i].setMap(map);
        
        var content = '<div><h5><a onclick="setModal(5, '+i+')">&nbsp;&nbsp;퀵분석 보러가기</a></h5></div>';
        var infowindow = new kakao.maps.InfoWindow({
            content: content,
            removable : true
        });
        
        kakao.maps.event.addListener(list5[i], 'click', makeOverListener(map, list5[i], infowindow));
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
/////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////
kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
    
    // 클릭한 위도, 경도 정보를 가져옵니다 
    var latlng = mouseEvent.latLng;
    
    var message = '클릭한 위치 gps : ' + latlng.getLat() + ', '+ latlng.getLng();
    
    var resultDiv = document.getElementById('result'); 
    resultDiv.innerHTML = message; // gps
    
});
/////////////////////////////////////////////////////////////////////////////////////////////////////////
//주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();
// 지도를 클릭했을 때 클릭 위치 좌표에 대한 주소정보를 표시하도록 이벤트를 등록합니다
kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
    searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {
        if (status === kakao.maps.services.Status.OK) {
        	var content =  result[0].address.address_name;

            var resultDiv = document.getElementById('result2'); 
            resultDiv.innerHTML = '클릭한 위치 주소 : ' + content; // 주소
        }   
    });
});
function searchDetailAddrFromCoords(coords, callback) {
    // 좌표로 법정동 상세 주소 정보를 요청합니다
    geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
}
function searchAddrFromCoords(coords, callback) {
    // 좌표로 행정동 주소 정보를 요청합니다
    geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);         
}
