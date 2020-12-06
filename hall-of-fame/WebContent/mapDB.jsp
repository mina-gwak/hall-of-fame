<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.sql.*" %>

<%
Connection con;
Statement stmt;
ResultSet rs = null;
ArrayList<String> names = new ArrayList<String>();
ArrayList<String> kinds = new ArrayList<String>();
ArrayList<String> locationX = new ArrayList<String>();
ArrayList<String> locationY = new ArrayList<String>();

try {
	Class.forName("com.mysql.jdbc.Driver");
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/object_project?useSSL=false","root", "990711");
	
	stmt = con.createStatement();
	String sql = "select * from store";
	rs = stmt.executeQuery(sql);
	
	if(rs.next()) {
		do {
			names.add(rs.getString("name"));
			kinds.add(rs.getString("kind"));
			locationX.add(rs.getString("locationX"));
			locationY.add(rs.getString("locationY"));
		} while(rs.next());
	} else {
		out.print("결과가 없습니다.");
	}
	con.close();
} catch(SQLException e1) {
	out.print(e1);
} catch(Exception e) {
	out.print(e);
}

%>