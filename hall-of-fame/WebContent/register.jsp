<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원가입</title>
<script src="./js/jquery-3.5.1.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<link rel="stylesheet" href="./css/base.css" />
<script src="./js/base.js"></script>
<link rel="stylesheet" href="./css/login.css" />
<script src="./js/register.js"></script>
</head>
<body>
<%@include file="./header.jsp" %>
<div class="container">
	<div class="row">
		<div class="col-12">
			<div class="register-content">
				<h1 class="register-title">회원가입</h1>
				<form class="register-form" action="registerDB.jsp" method="POST" onSubmit="return check(this);">
					<label for="id">아이디</label>
					<input id="id" type="text" name="id"/>  
					<label for="password">비밀번호</label>
					<input id="password" type="password" name="password" /> 
					<label for="rePassword">비밀번호 확인</label>
					<input id="rePassword" type="password" name="rePassword"/>
					<label for="nickname">닉네임</label>
					<input id="nickname" type="text" name="nickname"/>
					<label for="email">이메일</label>
					<input id="email" type="email" name="email"/>
					
					<button class="submit-btn" type="submit">REGISTER</button>				
				</form>
			</div>
		</div>
	</div>
</div>
<%@include file="./footer.jsp" %>