<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		try {
			
			// 1. Driver 로드
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			// 2. univDB 연결
			String url ="jdbc:mysql://localhost:3306/univdb";
			Connection conn = DriverManager.getConnection(url, "root", "dongyang");
			out.println("DB 연결 성공");
			out.println("<br>");
			
			// 3.이름 받아와서 조회하기 SELECT 문
			String selectname = request.getParameter("name");   // 값 받아오기
			
			Statement stmt = conn.createStatement();			 
			String sql = "select * from student where name = '" + selectname + "'"; 
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()){
				out.println(rs.getString(1) + ", " + rs.getString("passwd") + "," + rs.getString(3));
				out.println(rs.getInt(4) + ", " + rs.getString(5) + "," + rs.getString(6));
				out.println(rs.getString(7) + ", " + rs.getString(8) + "," + rs.getString(9));
				out.println(rs.getString("email"));
				out.println("<br>");
			}
			
			
			// 4. 연결 해제
			rs.close();
	        stmt.close();
	        conn.close();
		
		}catch(Exception e){
			
			out.println("DB 연결 에러");
			e.printStackTrace();
			out.println(e.getMessage());
		}
	%>
</body>
</html>