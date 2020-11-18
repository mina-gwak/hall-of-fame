<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>최종 띵예의전당 지도</title>
</head>
<body>
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
var imageSrc = "mapin.png";  
    
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
</body>
</html>

