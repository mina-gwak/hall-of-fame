<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>가격대별로 찾아보기</title>
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
					<h1 class="category-title">가격별</h1>
					<div class="tag-list">
						<p class="tag selected"># 전체</p>
						<p class="tag"># 5000원 이하</p>
						<p class="tag"># 5000원~10000원</p>
						<p class="tag"># 10000원~15000원</p>
						<p class="tag"># 15000원~20000원</p>
						<p class="tag"># 20000원~25000원</p>
						<p class="tag"># 25000원 이상</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="category-content">
	<div class="container">
		<div class="row">
		<%@include file="./categoryDB.jsp" %>
		</div>
	</div>
</div>
<div class="modal-wrapper">
<div class="modal fade bd-example-modal-lg" id="store-info" tabindex="99" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title"></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      <script>
      $(document).ready(function() {  
    	  <%
    	  String name = "";
    	  String kind = "";
    	  String callNum = "";
    	  String address = "";
    	  String locationA = "";
    	  String locationB = "";
    	  for (int i = 0; i < names.size(); i++) {
    		  if(i==0) {
    			  name += "'"+names.get(i)+"'";
    			  kind += "'"+kinds.get(i)+"'";
    			  callNum += "'"+callNums.get(i)+"'";
    			  address += "'"+addresses.get(i)+"'";
    			  locationA += "'"+locationX.get(i)+"'";
    			  locationB += "'"+locationY.get(i)+"'";
    		  }
    		  else {
    			  name += ",'"+names.get(i)+"'";
    			  kind += ",'"+kinds.get(i)+"'";
    			  callNum += ",'"+callNums.get(i)+"'";
    			  address += ",'"+addresses.get(i)+"'";
    			  locationA += ",'"+locationX.get(i)+"'";
    			  locationB += ",'"+locationY.get(i)+"'";
    		  }
    	  }
    	  %>
    	  
			var names = [<%=name%>];
			var kinds = [<%=kind%>];
			var callNums = [<%=callNum%>];
			var addresses = [<%=address%>];
			var locationXs = [<%=locationA%>];
			var locationYs = [<%=locationB%>];

    		$(".store-link").each(function(index) {
				num = index;
    			 $(this).click(function() {
    	  			$(".modal-title").text(names[index]);
    	  			$(".kind").text(kinds[index]);
    	  			$(".callNum").text(callNums[index]);
    	  			$(".address").text(addresses[index]);
    			 });
    	  	});
    			
   			var $tags = $(".tag");
       		var $stores = $(".store-link");
       		$tags.each(function() {
        		$(this).click(function() {
        			var tag = $(this).text();
        			$stores.each(function() {
            			var price = $(this).find(".store-price").text();
        				if (tag == "# 전체") {
       						$(this).parent().css("display", "block");
       					} else if (tag == "# 5000원 이하" && parseInt(price) < 5000) {
       						$(this).parent().css("display", "block");
       					} else if (tag == "# 5000원~10000원" && parseInt(price) >= 5000 && parseInt(price) < 10000) {
       						$(this).parent().css("display", "block");
       					} else if (tag == "# 10000원~15000원" && parseInt(price) >= 10000 && parseInt(price) < 15000) {
       						$(this).parent().css("display", "block");
       					} else if (tag == "# 15000원~20000원" && parseInt(price) >= 15000 && parseInt(price) < 20000) {
       						$(this).parent().css("display", "block");
       					} else if (tag == "# 20000원~25000원" && parseInt(price) >= 20000 && parseInt(price) < 25000) {
       						$(this).parent().css("display", "block");
       					} else if (tag == "# 25000원 이상" && parseInt(price) >= 25000) {
        					$(this).parent().css("display", "block");
        				} else {
        					$(this).parent().css("display", "none");
        				}
        			});
        		});
    		});
    		
    	});
      </script>
      	<dl>
      	  <dt>분류</dt>
      	  <dd class="kind"></dd>
      	  <dt>연락처</dt>
      	  <dd class="callNum"></dd>
      	  <dt>주소</dt>
      	  <dd class="address"></dd>
		</dl>
		<div id="map" style="width:80%;height:350px;"></div>

			<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e92502d0dbb26b74f4afb36c1ac22ca2"></script>
			<script>
				var names = [<%=name%>];
				var locationXs = [<%=locationA%>];
				var locationYs = [<%=locationB%>];
				
				var mapContainer = document.getElementById('map'),
			    mapOption = { 
			        center: new kakao.maps.LatLng(37.583224180127644, 126.92343243449466),
			        draggable: false,
			        level: 3
			    };
			
				var map = new kakao.maps.Map(mapContainer, mapOption);
				
				var positions = [];
				
				for (var i = 0; i < names.length; i++) {
					positions.push({
						content: "<div>"+names[i]+"</div>",
						latlng: new kakao.maps.LatLng(locationXs[i],locationYs[i])
					});
					var val = document.querySelector(".modal-title").innerText;
					if (val == names[i]) {
						marker.position = positions[i].latlng;
						infowindow.position = positions[i].latlng;
						infowindow.content = positions[i].content;
					}
				}
				
				var imageSrc = "./images/mapin.png";  
				    
				    var imageSize = new kakao.maps.Size(30, 33); 
		  
				    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
				 
				    var marker = new kakao.maps.Marker({
				        map: map,
				        position: positions[0].latlng,
				        image : markerImage
				    });
				
				    var infowindow = new kakao.maps.InfoWindow({
				    	position: positions[0].latlng,
				        content: positions[0].content
				    });
				      
				    infowindow.open(map, marker); 
				
				function checkDisplay() {
					var modal = document.querySelector(".modal").style.display;
					if (modal == "block") {
						relayout();
					}
				};
				
				var timer = setInterval(function() { checkModal(); }, 100);
				
				function checkModal() {
					for (var i = 0; i < names.length; i++) {
						var val = document.querySelector(".modal-title");
						if (val.innerText == names[i]) {
						    marker.setPosition(positions[i].latlng);
							infowindow.setPosition(positions[i].latlng);
						    infowindow.setContent(positions[i].content); 
						    map.setCenter(positions[i].latlng);

						    relayout();
						}
					}
				}
				
				function relayout() {
				    map.relayout();
				    var position = marker.getPosition;
				    marker.setMap(map);
				}
			</script>
      </div>
    </div>
  </div>
</div>
</div>