<%@page import="main.main.localDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="main.main.cropDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
</head>
<body>
<div id="piechart" style="width: 100%"></div>






<script type="text/javascript">
var height;
if (matchMedia("screen and (min-width: 1024px)").matches) {
	height = 400;
} else {
	height = 400;
}




<%String type = request.getParameter("type");%>
<%if(type.equals("1")){%>
google.charts.load('current', {'packages':['corechart']});
google.charts.setOnLoadCallback(drawVisualization);

function drawVisualization() {
  var data = google.visualization.arrayToDataTable([
    ['기간', 		'평균온도',	'난방선',	'하우스선(저)',	'적정선',	'하우스선(고)',	'냉방선'],
    <% ArrayList<localDTO> list = (ArrayList<localDTO>) request.getAttribute("local"); %>
    <% cropDTO crop = (cropDTO) request.getAttribute("crop"); %>
    <%for(localDTO dto : list){%>
    	['<%=dto.getC_time()%>',  <%=dto.getMid_temp()%>,	<%=crop.getMin_temp()-10%>, <%=crop.getMin_temp()-2%>, <%=crop.getMid_temp()%>, <%=crop.getMax_temp()+2%>, <%=crop.getMax_temp()+15%>],
    <%}%>
    ]);

  var options = {
    vAxis: {title: '온도(℃)'},
    hAxis: {title: '날짜(yy/mm/dd)'},
    seriesType: 'bars',
    series: {1: {type: 'line'}, 2: {type: 'line'}, 3: {type: 'line'}, 4: {type: 'line'}, 5: {type: 'line'}},
	'width' : '100%',
	'height' : height
  };

  var chart = new google.visualization.ComboChart(document.getElementById('piechart'));
  chart.draw(data, options);
}
<%} else if(type.equals("2")) {%>
google.charts.load('current', {'packages':['corechart']});
google.charts.setOnLoadCallback(drawVisualization);

function drawVisualization() {
  var data = google.visualization.arrayToDataTable([
    ['기간', 		'최고온도',	'난방선',	'하우스선(저)',	'적정선',	'하우스선(고)',	'냉방선'],
    <% ArrayList<localDTO> list = (ArrayList<localDTO>) request.getAttribute("local"); %>
    <% cropDTO crop = (cropDTO) request.getAttribute("crop"); %>
    <%for(localDTO dto : list){%>
    	['<%=dto.getC_time()%>',  <%=dto.getMax_temp()%>,	<%=crop.getMin_temp()-10%>, <%=crop.getMin_temp()-2%>, <%=crop.getMid_temp()%>, <%=crop.getMax_temp()+2%>, <%=crop.getMax_temp()+15%>],
    <%}%>
    ]);

  var options = {
    vAxis: {title: '온도(℃)'},
    hAxis: {title: '날짜(yy/mm/dd)'},
    seriesType: 'bars',
    series: {1: {type: 'line'}, 2: {type: 'line'}, 3: {type: 'line'}, 4: {type: 'line'}, 5: {type: 'line'}},
	'width' : '100%',
	'height' : height
  };

  var chart = new google.visualization.ComboChart(document.getElementById('piechart'));
  chart.draw(data, options);
}
<%} else if(type.equals("3")) {%>
google.charts.load('current', {'packages':['corechart']});
google.charts.setOnLoadCallback(drawVisualization);

function drawVisualization() {
  var data = google.visualization.arrayToDataTable([
    ['기간', 		'최저온도',	'난방선',	'하우스선(저)',	'적정선',	'하우스선(고)',	'냉방선'],
    <% ArrayList<localDTO> list = (ArrayList<localDTO>) request.getAttribute("local"); %>
    <% cropDTO crop = (cropDTO) request.getAttribute("crop"); %>
    <%for(localDTO dto : list){%>
    	['<%=dto.getC_time()%>',  <%=dto.getMin_temp()%>,	<%=crop.getMin_temp()-15%>, <%=crop.getMin_temp()-2%>, <%=crop.getMid_temp()%>, <%=crop.getMax_temp()+2%>, <%=crop.getMax_temp()+15%>],
    <%}%>
    ]);

  var options = {
    vAxis: {title: '온도(℃)'},
    hAxis: {title: '날짜(yy/mm/dd)'},
    seriesType: 'bars',
    series: {1: {type: 'line'}, 2: {type: 'line'}, 3: {type: 'line'}, 4: {type: 'line'}, 5: {type: 'line'}},
	'width' : '100%',
	'height' : height
  };

  var chart = new google.visualization.ComboChart(document.getElementById('piechart'));
  chart.draw(data, options);
}
<%} else if(type.equals("4")) {%>
google.charts.load('current', {'packages':['corechart']});
google.charts.setOnLoadCallback(drawVisualization);

function drawVisualization() {
  var data = google.visualization.arrayToDataTable([
    ['기간', 		'평균강수량',	'적정선',	'농수도 지출선'],
    <% ArrayList<localDTO> list = (ArrayList<localDTO>) request.getAttribute("local"); %>
    <% cropDTO crop = (cropDTO) request.getAttribute("crop"); %>
    <%for(localDTO dto : list){%>
    	['<%=dto.getC_time()%>',  <%=dto.getWater()%>,	<%=crop.getWater()%>, <%=crop.getWater()-15%>],
    <%}%>
    ]);

  var options = {
    vAxis: {title: '온도(℃)'},
    hAxis: {title: '날짜(yy/mm/dd)'},
    seriesType: 'bars',
    series: {1: {type: 'line'}, 2: {type: 'line'}},
	'width' : '100%',
	'height' : height
  };

  var chart = new google.visualization.ComboChart(document.getElementById('piechart'));
  chart.draw(data, options);
}
<%} else if(type.equals("5")) {%>
google.charts.load('current', {'packages':['corechart']});
google.charts.setOnLoadCallback(drawVisualization);

function drawVisualization() {
  var data = google.visualization.arrayToDataTable([
    ['기간', 		'평균ph',	'적정선',	'품질 영향선'],
    <% ArrayList<localDTO> list = (ArrayList<localDTO>) request.getAttribute("local"); %>
    <% cropDTO crop = (cropDTO) request.getAttribute("crop"); %>
    <%for(localDTO dto : list){%>
    	['<%=dto.getC_time()%>',  <%=dto.getPh()%>,	<%=crop.getPh()%>, <%=crop.getPh()-2%>],
    <%break;}%>
    ]);

  var options = {
    vAxis: {title: '온도(℃)'},
    hAxis: {title: '날짜(yy/mm/dd)'},
    seriesType: 'bars',
	'width' : '100%',
	'height' : height
  };

  var chart = new google.visualization.ComboChart(document.getElementById('piechart'));
  chart.draw(data, options);
}
<%}%>









$(window).resize(function() {
	if (matchMedia("screen and (min-width: 1024px)").matches) {
		height = 400;
		drawVisualization();
	} else {
		height = 400;
		drawVisualization();
	}
});
</script>
</body>
</html>