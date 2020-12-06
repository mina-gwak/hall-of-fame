<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>지도로 찾아보기</title>
<script src="./js/jquery-3.5.1.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<link rel="stylesheet" href="./css/base.css" />
<script src="./js/base.js"></script>
<link rel="stylesheet" href="./css/category.css" />
<script src="./js/category.js"></script>
</head>
<body>
<%@include file="./header.jsp" %>
<div class="category-nav">
	<div class="container">
		<div class="row">
			<div class="col-12">
				<div class="category-header">
					<h1 class="category-title">지도로 보기</h1>
					<div class="tag-list">
						<p class="tag selected"># 전체</p>
						<p class="tag"># 한식</p>
						<p class="tag"># 분식</p>
						<p class="tag"># 일식</p>
						<p class="tag"># 양식</p>
						<p class="tag"># 중식</p>
						<p class="tag"># 패스트푸드</p>
						<p class="tag"># 호프집</p>
						<p class="tag"># 디저트&카페</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<%@include file="./mapDB.jsp" %>
<%
	String name = "";
	String kind = "";
    String locationA = "";
    String locationB = "";
    for (int i = 0; i < names.size(); i++) {
    	if(i==0) {
    		name += "'"+names.get(i)+"'";
    		kind += "'"+kinds.get(i)+"'";
    		locationA += "'"+locationX.get(i)+"'";
    		locationB += "'"+locationY.get(i)+"'";
    	} else {
    		name += ",'"+names.get(i)+"'";
    		kind += ",'"+kinds.get(i)+"'";
    		locationA += ",'"+locationX.get(i)+"'";
    		locationB += ",'"+locationY.get(i)+"'";
		}
	}
%>
<script>
	var kinds = [<%=kind%>];
	var $tags = $(".tag");
</script>
<div class="container">
	<div class="row">
		<div class="col-12">
			<div id="map" style="width:80%;height:350px;"></div>

			<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e92502d0dbb26b74f4afb36c1ac22ca2"></script>
			<script>
			var names = [<%=name%>];
			var locationXs = [<%=locationA%>];
			var locationYs = [<%=locationB%>];
			var kinds = [<%=kind%>];
			var $tags = $(".tag");
			
    		var $tags = $(".tag");
    		var tagLocationXs = [];
    		var tagLocationYs = [];
    		var tagNames = [];
    		
    		$tags.each(function() {
    			$(this).click(function() {
    				tagLocationXs = [];
    	    		tagLocationYs = [];
    	    		tagNames = [];
    				var tag = $(this).text();
    				for (var i = 0; i < names.length; i++) {
    					if (tag == "# 전체") {
    						tagNames.push(names[i]);
    						tagLocationXs.push(locationXs[i]);
    						tagLocationYs.push(locationYs[i]);
    					}
    					else if (tag == "# "+kinds[i]) {
    						tagNames.push(names[i]);
    						tagLocationXs.push(locationXs[i]);
    						tagLocationYs.push(locationYs[i]);
    					}
    				}
    				changePositions();
    			});
    		});
			
			var positions = [];
			var markers = [];
			var marker;
			
			for (var i = 0; i < names.length; i++) {
				positions.push({
					content: "<div>"+names[i]+"</div>",
					latlng: new kakao.maps.LatLng(locationXs[i],locationYs[i])
				});
			}
			
			function changePositions() {
				positions = [];
				for (var i = 0; i < tagNames.length; i++) {
					positions.push({
						content: "<div>"+tagNames[i]+"</div>",
						latlng: new kakao.maps.LatLng(tagLocationXs[i],tagLocationYs[i])
					});
				}
				removeMarker();
			}
			
			function removeMarker() {
				for ( var i = 0; i < markers.length; i++ ) {
			        markers[i].setMap(null);
			    }   
			    markers = [];
			    showMarker();
			}
			
			
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
			    mapOption = { 
			        center: new kakao.maps.LatLng(37.58018970350754, 126.92284684607607), // 지도의 중심좌표 - 명지대학교
			        level: 3 // 지도의 확대 레벨
			    };
			
			var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
			
			function showMarker() {
				for (var i = 0; i < positions.length; i ++) {
					
					var imageSrc = "./images/mapin.png"; 
				    
				    // 마커 이미지의 이미지 크기 입니다
				    var imageSize = new kakao.maps.Size(30, 33); 
				    
				    // 마커 이미지를 생성합니다    
				    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
				    
				    // 마커를 생성합니다
				    marker = new kakao.maps.Marker({
				        map: map, // 마커를 표시할 지도
				        position: positions[i].latlng, // 마커를 표시할 위치
				        image : markerImage // 마커 이미지 
				    });
				    
					marker.setMap(map);
				
				    // 마커에 표시할 인포윈도우를 생성합니다 
				    infowindow = new kakao.maps.InfoWindow({
				        content: positions[i].content // 인포윈도우에 표시할 내용
				    });
				    
				    markers.push(marker);
				    
				
				    // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
				    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
				    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
				    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
				    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
				}	
				
			}
			
			showMarker();
			
			// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
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
			
			</script>
		</div>
	</div>
</div>
<%@include file="./footer.jsp" %>

