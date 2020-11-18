<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세페이지에 삽입할 지도</title>
</head>
<body>


<div id="daumRoughmapContainer1605697088698" class="root_daum_roughmap root_daum_roughmap_landing"></div>

<script charset="UTF-8" class="daum_roughmap_loader_script" src="https://ssl.daumcdn.net/dmaps/map_js_init/roughmapLoader.js"></script>

<script charset="UTF-8">
	new daum.roughmap.Lander({
		"timestamp" : "1605697088698",
		"key" : "23zog",
		"mapWidth" : "640",
		"mapHeight" : "360"
	}).render();
</script>

</body>
</html>