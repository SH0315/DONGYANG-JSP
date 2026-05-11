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
			
			// SQL 실행
			String sql = "insert into student value(?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "dmr"); // ID 
			pstmt.setString(2, "1234");
			pstmt.setString(3, "동미래");
			pstmt.setInt(4, 2025);
			pstmt.setString(5, "20250002");
			pstmt.setString(6, "컴소과");
			pstmt.setString(7, "010");
			pstmt.setString(8, "1234-1234");
			pstmt.setString(9, "서울시 구로구");
			pstmt.setString(10, "dmr@dy.ac.kr");
			
			int rowCnt = pstmt.executeUpdate(); // 실행하라
			
			if (rowCnt == 1)
				out.println("<hr>학생 동미래 레코드 1개가 성공적으로 입력되었습니다.");
			else
				out.println("학생 레코드 삽입에 문제가 있습니다.");
			
			
			// 3. 연결 해제
			pstmt.close();
			conn.close();
			
		
		}catch(Exception e){
			
			out.println("DB 연결 에러");
			e.printStackTrace();
			out.println(e.getMessage());
		}
	%>
</body>
</html>