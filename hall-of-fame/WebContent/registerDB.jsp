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
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	String nickname = request.getParameter("nickname");
	String email = request.getParameter("email");
	
	Connection con;
	PreparedStatement pstmt;
	
	try {
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/object_project?useSSL=false","root", "990711");
		
		String sql = "select userid, nickname, email from user";
		pstmt = con.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			if(rs.getString("userid").equals(id)) {
				out.println("<script>");
				out.println("alert('아이디가 중복되므로 다른 아이디를 입력해주세요')");
				out.println("location.href='register.jsp'");
				out.println("</script>");
			}
			if(rs.getString("nickname").equals(nickname)) {
				out.println("<script>");
				out.println("alert('닉네임이 중복되므로 다른 닉네임을 입력해주세요')");
				out.println("location.href='register.jsp'");
				out.println("</script>");
			}
			if(rs.getString("email").equals(email)) {
				out.println("<script>");
				out.println("alert('이메일이 중복되므로 다른 이메일을 입력해주세요')");
				out.println("location.href='register.jsp'");
				out.println("</script>");
			}
		}
		
		sql = "insert into user(userid, password, nickname, email) values('"+id+"','"+password+"','"+nickname+"','"+email+"')";
		pstmt = con.prepareStatement(sql);
		pstmt.executeUpdate();
		
	} catch(SQLException e1) {
		out.print(e1);
	} catch(Exception e) {
		out.print(e);
	}
%>
<script>
	var goLogin = confirm("회원가입이 완료되었습니다. 로그인 페이지로 이동하시겠습니까?");
	if (goLogin) location.href="login.jsp";
	else location.href="main.jsp";
</script>
</body>
</html>