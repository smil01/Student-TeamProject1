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
		console.log(this.value); // 변화했을때 감지
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
	var option = $("<option value='1_"+i+"'>"+arr1[i]+"</option>");
	$('#search_box').append(option);
}

for(var i = 0; i < arr2.length; i++){                
	var option = $("<option value='2_"+i+"'>"+arr2[i]+"</option>");
	$('#search_box').append(option);
}

for(var i = 0; i < arr3.length; i++){                
	var option = $("<option value='3_"+i+"'>"+arr3[i]+"</option>");
	$('#search_box').append(option);
}

for(var i = 0; i < arr4.length; i++){                
	var option = $("<option value='4_"+i+"'>"+arr4[i]+"</option>");
	$('#search_box').append(option);
}

for(var i = 0; i < arr5.length; i++){                
	var option = $("<option value='5_"+i+"'>"+arr5[i]+"</option>");
	$('#search_box').append(option);
}

