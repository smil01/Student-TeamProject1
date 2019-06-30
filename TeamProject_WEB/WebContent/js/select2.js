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
	
	$('#search_box').change(function() {
		var value = this.value;
		var img = document.getElementById("title_img");
		var content = document.getElementById("content");
		
		if(value.charAt(0)==""){
			img.src = 'img/search_mark.png';
			content.innerHTML = "";
		} else if(value.charAt(0)=="1"){
			img.src = 'img/icon1.png';
			content.innerHTML = "&nbsp;파파야(papaya, 학명：Carica papaya)는 파파야과, 파파야속의 상록 소고목이다. 그 과일도 파파야라고 한다. 목과, 파우파우, 마망, 트리 멜론 등으로 불리기도 한다.";
		} else if(value.charAt(0)=="2"){
			img.src = 'img/icon2.png';
			content.innerHTML = "&nbsp;물푸레나뭇과의 상록 교목. 높이 5∼10m. 잎은 긴 타원형이며 마주나고, 여름·가을에 황백색의 향기로운 꽃이 핌. 소아시아 원산으로 지중해 연안·에스파냐·이탈리아·프랑스·미국 등지에서 재배한다.";
		} else if(value.charAt(0)=="3"){
			img.src = 'img/icon3.png';
			content.innerHTML = "&nbsp;패션후르츠는 측막태좌목 시계꽃과에 속하며 아메리카의 아열대 지역이 원산지인 열대 과일입니다. 백가지 향과 맛이 난다하여 백향과라고도 불립니다.";
		} else if(value.charAt(0)=="4"){
			img.src = 'img/icon4.png';
			content.innerHTML = "&nbsp;열대지방에서 가장 중요하고 가장 널리 심고 있는 열매 중의 하나로 아시아 동부, 미얀마, 인도의 아삼 주가 원산지인 것으로 추정된다. ";
		} else if(value.charAt(0)=="5"){
			img.src = 'img/icon5.png';
			content.innerHTML = "&nbsp;속명의 Persea는 이집트의 단맛을 내는 수목의 옛 그리스명에서 유래. 약 150종이 있다. 높이는 5~20m 정도 자라는 상록 활엽 교목(喬木) 또는 소교목이다";
		}
	});
									
	//$('#search_box option[value=1]').attr('selected','selected'); // 셋팅하기
});


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

for(var i = 0; i < arr1.length; i++){                
	var option = $("<option value='1_"+((i<10)?"0":"")+i+"'>"+arr1[i]+"</option>");
	$('#search_box').append(option);
}

for(var i = 0; i < arr2.length; i++){                
	var option = $("<option value='2_"+((i<10)?"0":"")+i+"'>"+arr2[i]+"</option>");
	$('#search_box').append(option);
}

for(var i = 0; i < arr3.length; i++){                
	var option = $("<option value='3_"+((i<10)?"0":"")+i+"'>"+arr3[i]+"</option>");
	$('#search_box').append(option);
}

for(var i = 0; i < arr4.length; i++){                
	var option = $("<option value='4_"+((i<10)?"0":"")+i+"'>"+arr4[i]+"</option>");
	$('#search_box').append(option);
}

for(var i = 0; i < arr5.length; i++){                
	var option = $("<option value='5_"+((i<10)?"0":"")+i+"'>"+arr5[i]+"</option>");
	$('#search_box').append(option);
}

