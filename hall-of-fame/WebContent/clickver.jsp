<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>가격별로 찾아보기</title>
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
						<p class="tag"># 전체</p>
						<p class="tag"># 한식</p>
						<p class="tag"># 분식</p>
						<p class="tag"># 일식</p>
						<p class="tag"># 양식</p>
						<p class="tag"># 중식</p>
						<p class="tag"># 패스트푸드</p>
						<p class="tag"># 호프 &amp; 술집</p>
						<p class="tag"># 카페 &amp; 디저트</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="container">
	<div class="row">
		<div class="col-12">
			<div id="map" style="width:80%;height:350px;"></div>

			<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e92502d0dbb26b74f4afb36c1ac22ca2"></script>
			<script>
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
			    mapOption = { 
			        center: new kakao.maps.LatLng(37.58018970350754, 126.92284684607607), // 지도의 중심좌표 - 명지대학교
			        level: 3 // 지도의 확대 레벨
			    };
			
			var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
			 
			// 마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다 
			var positions = [
			    {
			        content: '<div>가타쯔무리</div>', 
			        latlng: new kakao.maps.LatLng(37.583224180127644, 126.92343243449466)
			    },
			    {
			        content: '<div>진짜루</div>', 
			        latlng: new kakao.maps.LatLng(37.58324429984634, 126.92319749193584)
			    },
			    {
			        content: '<div>스시하나에</div>', 
			        latlng: new kakao.maps.LatLng(37.58148395893238, 126.92490881256664)
			    },
			    {
			        content: '<div>60계</div>', 
			        latlng: new kakao.maps.LatLng(37.579003713737926, 126.92450092093465)
			    },
			    {
			        content: '<div>발루토핀치</div>', 
			        latlng: new kakao.maps.LatLng(37.57906007828126, 126.92458294059296)
			    },
			    {
			        content: '<div>유월의살구나무</div>', 
			        latlng: new kakao.maps.LatLng(37.579032404145615, 126.92358106866443)
			    },
			    {
			        content: '<div>만득이네두루치기</div>', 
			        latlng: new kakao.maps.LatLng(37.57894689216673, 126.9237085160636)
			    },
			    {
			        content: '<div>쏘핫마라탕마라샹궈</div>', 
			        latlng: new kakao.maps.LatLng(37.57890601528947, 126.92319628781611)
			    },
			    {
			        content: '<div>모래네곱창</div>', 
			        latlng: new kakao.maps.LatLng(37.578422032471615, 126.92366093814245)
			    },
			    {
			        content: '<div>맥도날드</div>', 
			        latlng: new kakao.maps.LatLng(37.57996567397244, 126.92473486124526)
			    },
			    {
			        content: '<div>원당감자탕</div>', 
			        latlng: new kakao.maps.LatLng(37.58023624361663, 126.92516195981831)
			    },
			    {
			        content: '<div>하우디</div>', 
			        latlng: new kakao.maps.LatLng(37.58076777744613, 126.92507934933548)
			    },
			    {
			        content: '<div>장수촌</div>', 
			        latlng: new kakao.maps.LatLng(37.58067812688352, 126.92578984142305)
			    },
			    {
			        content: '<div>금정가든</div>', 
			        latlng: new kakao.maps.LatLng(37.57979941780232, 126.92540862919657)
			    }
			];
			
			//마커 이미지의 이미지 주소입니다
			var imageSrc = "./images/mapin.png";  
			    
			for (var i = 0; i < positions.length; i ++) {
			    
			    // 마커 이미지의 이미지 크기 입니다
			    var imageSize = new kakao.maps.Size(30, 33); 
			    
			    // 마커 이미지를 생성합니다    
			    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
			    
			    // 마커를 생성합니다
			    var marker = new kakao.maps.Marker({
			        map: map, // 마커를 표시할 지도
			        position: positions[i].latlng, // 마커를 표시할 위치
			        image : markerImage // 마커 이미지 
			    });
			
			
			    // 마커에 표시할 인포윈도우를 생성합니다 
			    var infowindow = new kakao.maps.InfoWindow({
			        content: positions[i].content // 인포윈도우에 표시할 내용
			    });
			
			    // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
			    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
			    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
			    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
			    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
			}
			
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

