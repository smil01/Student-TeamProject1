var height;
if (matchMedia("screen and (min-width: 1024px)").matches) {
	height = 800;
} else {
	height = 400;
}

google.charts.load('current', {
	'packages' : [ 'corechart' ]
});
google.charts.setOnLoadCallback(drawChart);

function drawChart() {

	var data = google.visualization.arrayToDataTable([
			[ 'Task', 'Hours per Day' ], [ 'Work', 11 ], [ 'Eat', 2 ],
			[ 'Commute', 2 ], [ 'Watch TV', 2 ], [ 'Sleep', 7 ] ]);

	var options = {
		title : 'My Daily Activities',
		'legend' : 'center',
		'is3D' : true,
		'width' : '100%',
		'height' : height,
		backgroundColor : '#CFC3F8'
	};

	var chart = new google.visualization.PieChart(document
			.getElementById('piechart'));

	chart.draw(data, options);
}

$(window).resize(function() {
	if (matchMedia("screen and (min-width: 1024px)").matches) {
		height = 800;
		drawChart();
	} else {
		height = 400;
		drawChart();
	}
});