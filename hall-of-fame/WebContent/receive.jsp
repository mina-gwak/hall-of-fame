<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>register에서 회원가입정보 받아오는 폼</title>
</head>
<body>
<% 
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	String re_password = request.getParameter("re_password");
	String nickname = request.getParameter("nickname");
	String email = request.getParameter("email");
	
%>
<body>

<%-- 골뱅이 입력 안하면 다시 입력하라는 그런건 다 어디서 온거임 ㅋㅋ--%>
<div class="container">
	<div class="row">
		<div class="col-12">
			<div class="register-content">
				<h1 class="register-title">회원가입 정보</h1>
				<form class="register-form">
					<label for="id">아이디</label><%= id %>
					<label for="nickname">닉네임</label><%= nickname %>		
					<label for="email">이메일</label><%= email %>
				</form>
			</div>
		</div>
	</div>
</div>
<%@include file="./footer.jsp" %>
</body>
</html>