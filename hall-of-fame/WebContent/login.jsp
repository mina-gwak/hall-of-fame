<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>로그인</title>
<script src="./js/jquery-3.5.1.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<link rel="stylesheet" href="./css/base.css" />
<script src="./js/base.js"></script>
<link rel="stylesheet" href="./css/login.css" />
</head>
<body>
<%@include file="./header.jsp" %>

<div class="container">
	<div class="row">
		<div class="col-12">
			<div class="login-content">
				<h1 class="login-title">로그인</h1>
				<form class="login-form">
					<label for="id">아이디</label>
					<input id="id" type="text" />
					<label for="password">비밀번호</label>
					<input id="password" type="password" />
					<button class="submit-btn" type="submit">LOGIN</button>
					<a href="./register.jsp" class="sm-link">회원가입</a>					
				</form>
			</div>
		</div>
	</div>
</div>
<%@include file="./footer.jsp" %>