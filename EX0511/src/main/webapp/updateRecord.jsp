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
			String sql = "update student set depart = ? where name = ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "디자인과"); 
			pstmt.setString(2, "강지영");
			
			int rowCnt = pstmt.executeUpdate();
			if (rowCnt >= 1)
				out.println("<hr>학생 강지영 레코드 1개가 성공적으로 수정되었습니다.");
			else
				out.println("학생 레코드 수정에 문제가 있습니다.");
			
			
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
