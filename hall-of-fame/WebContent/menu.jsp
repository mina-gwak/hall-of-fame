<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>메뉴별로 찾아보기</title>
<script src="./js/jquery-3.5.1.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<link rel="stylesheet" href="./css/base.css" />
<script src="./js/base.js"></script>
<link rel="stylesheet" href="./css/category.css" />
<script src="./js/category.js"></script>
</head>
<body onload="startTimer();">
<%@include file="./header.jsp" %>
<div class="category-nav">
	<div class="container">
		<div class="row">
			<div class="col-12">
				<div class="category-header">
					<h1 class="category-title">메뉴별</h1>
					<div class="tag-list">
						<p class="tag selected"># 전체</p>
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
<div class="category-content">
	<div class="container">
		<div class="row">
			<div class="col-6 col-md-3">
				<a href="#" class="store-link" data-toggle="modal" data-target="#store-info">
					<div class="menu-store">
						<img src="./images/subway.png" alt="서브웨이" />
						<h2>서브웨이</h2>
					</div>
				</a>
			</div>
			<div class="col-6 col-md-3">
				<a href="#" class="store-link">
					<div class="menu-store">
						<img src="./images/subway.png" alt="서브웨이" />
						<h2>서브웨이</h2>
					</div>
				</a>
			</div>
			<div class="col-6 col-md-3">
				<a href="#" class="store-link">
					<div class="menu-store">
						<img src="./images/subway.png" alt="서브웨이" />
						<h2>서브웨이</h2>
					</div>
				</a>
			</div>
			<div class="col-6 col-md-3">
				<a href="#" class="store-link">
					<div class="menu-store">
						<img src="./images/subway.png" alt="서브웨이" />
						<h2>서브웨이</h2>
					</div>
				</a>
			</div>
			<div class="col-6 col-md-3">
				<a href="#" class="store-link">
					<div class="menu-store">
						<img src="./images/subway.png" alt="서브웨이" />
						<h2>서브웨이</h2>
					</div>
				</a>
			</div>
			<div class="col-6 col-md-3">
				<a href="#" class="store-link">
					<div class="menu-store">
						<img src="./images/subway.png" alt="서브웨이" />
						<h2>서브웨이</h2>
					</div>
				</a>
			</div>
		</div>
	</div>
</div>
<div class="modal-wrapper">
<div class="modal fade bd-example-modal-lg" id="store-info" tabindex="99" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">서브웨이</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      	<dl>
      	  <dt>분류</dt>
      	  <dd>패스트푸드</dd>
      	  <dt>연락처</dt>
      	  <dd>012-345-6789</dd>
      	  <dt>주소</dt>
      	  <dd>서대문구 거북골로 34</dd>
		</dl>
		<div id="map" style="width:80%;height:350px;"></div>

			<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e92502d0dbb26b74f4afb36c1ac22ca2"></script>
			<script>
				var mapContainer = document.getElementById('map'),
			    mapOption = { 
			        center: new kakao.maps.LatLng(37.583224180127644, 126.92343243449466), // 지도의 중심좌표 - 명지대학교
			        level: 3
			    };
			
				var map = new kakao.maps.Map(mapContainer, mapOption);
				
				var positions = [
				    {
				        content: '<div>가타쯔무리</div>', 
				        latlng: new kakao.maps.LatLng(37.583224180127644, 126.92343243449466)
				    }
				]
				
				var imageSrc = "./images/mapin.png";  
			    
				for (var i = 0; i < positions.length; i ++) {
				    
				    var imageSize = new kakao.maps.Size(30, 33); 
		  
				    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
				 
				    var marker = new kakao.maps.Marker({
				        map: map,
				        position: positions[i].latlng,
				        image : markerImage
				    });
				
				    var infowindow = new kakao.maps.InfoWindow({
				    	position: positions[i].latlng,
				        content: positions[i].content
				    });
				      
				    infowindow.open(map, marker); 
				
				}
				
				var isPause = true;
				var layout;
				
				function startTimer() {
					if (isPause) {
						layout = setInterval(function() { checkDisplay(); }, 100);
						isPause = false;
					}
				}
				
				function stopTimer() {
					clearInterval(layout);
					isPause = true;
				}
				
				function checkDisplay() {
					var modal = document.querySelector(".modal").style.display;
					if (modal == "block") {
						relayout();
					}
				};
				
				function relayout() {
				    map.relayout();
				    var position = marker.getPosition;
				    console.log(position);
				    map.setCenter(positions[0].latlng);
					stopTimer();
				}
			</script>
			<hr />
      		<h5>대표 메뉴</h5>
      		<img src="./images/subway.png" />
      		<p>서브웨이</p>
      </div>
    </div>
  </div>
</div>
</div>
<%@include file="./footer.jsp" %>