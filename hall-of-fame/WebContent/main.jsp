<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>띵예의 전당</title>
<script src="./js/jquery-3.5.1.js"></script>
<link rel="stylesheet" href="./css/grid.min.css" />
<link rel="stylesheet" href="./css/main.css" />
<link rel="stylesheet" href="./css/base.css" />
<script src="./js/base.js"></script>
</head>
<body>
<div class="wrapper">
	<header class="header-img">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="menu-box">
						<button class="menu-icon"><span>메뉴</span></button>
						<div class="menu">
							<ul>
								<li><a href="./login.jsp">로그인</a></li>
								<li><a href="./register.jsp">회원가입</a></li>
							</ul>
							<ul>
								<li>식당 &amp; 카페 찾아보기</li>
								<ul>
									<li><a href="./menu.jsp">메뉴별</a></li>
									<li><a href="./price.jsp">가격대별</a></li>
									<li><a href="./clickver.jsp">지도로 보기</a></li>
									<li><a href="./roulette.jsp">룰렛 돌리기</a></li>
								</ul>
							</ul>
							<ul>
								<li><a href="#">자유게시판</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</header>
	<div class="content">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<h2 class="content-heading">
						&#39;오늘은 뭐 먹지&#63;&#39; 매번 고민하셨나요&#63;<br />
						띵예의 전당이 도와드릴게요	&#33;
					</h2>
				</div>
				<div class="col-12 col-lg-4">
					<a href="./menu.jsp" class="content-link">
						<img src="./images/menu.png" />
						<div class="content-desc">
							<h3>메뉴별로 찾아보기</h3>
							<p>
								메뉴별로 살펴보면서<br />
								먹고 싶은 걸 생각해보세요
							</p>
						</div>
					</a>
				</div>
				<div class="col-12 col-lg-4">
					<a href="./price.jsp" class="content-link">
						<img src="./images/price.png" />
						<div class="content-desc">
							<h3>가격대별로 찾아보기</h3>
							<p>
								원하는 가격대에 맞춰<br />
								식사 장소를 정해보아요
							</p>
						</div>
					</a>
				</div>
				<div class="col-12 col-lg-4">
					<a href="./clickver.jsp" class="content-link">
						<img src="./images/map.png" />
						<div class="content-desc">
							<h3>지도로 찾아보기</h3>
							<p>
								지도를 사용해<br />
								주변의 식당을 찾아보세요
							</p>
						</div>
					</a>				
				</div>
			</div>
		</div>
	<%@include file="./footer.jsp" %>