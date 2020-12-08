<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.sql.*" %>
<%
	String id = (String) session.getAttribute("id");
	boolean isLogin = ((id != null) ? true : false);
%>
<script>
$(document).ready(function() {
	console.log("<%=id%>");
	if (<%=isLogin%>) {
		$(".login-menu").empty();
		$(".login-menu").append("<li>"+"<%=id%>"+"님 어서오세요</li>");
		$(".login-menu").append("<li><a href='./logout.jsp' class='logout'>로그아웃</a></li>");
	}
});
</script>
<div class="wrapper">
	<header class="header">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<a href="./main.jsp"><p>띵예의 전당</p></a>
					<div class="menu-box">
					<button class="menu-icon"><span>메뉴</span></button>
						<div class="menu">
							<ul class="login-menu">
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
								<li><a href="./board.jsp">자유게시판</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</header>
	<div class="content">