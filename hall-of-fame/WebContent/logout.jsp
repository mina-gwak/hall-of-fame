<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>register에서 회원가입정보 받아오는 폼</title>
</head>
<body>
<% 
	session.invalidate();
%>
<script>
	alert("로그아웃되었습니다.");
	location.href="main.jsp";
</script>
</body>
</html>