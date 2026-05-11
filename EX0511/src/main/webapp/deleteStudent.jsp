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
			
			String inputName = request.getParameter("dname");
			
			String sql = "delete from student where name = ?;";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,inputName);
			int rowCnt = pstmt.executeUpdate();
			if (rowCnt == 1)
				out.println(inputName + "레코드 1개가 정상적으로 삭제되었습니다.");
			else
				out.println("학생 레코드 삭제에 문제가 있습니다.");
			
			
		
		}catch(Exception e){
			
			out.println("DB 연결 에러");
			e.printStackTrace();
			out.println(e.getMessage());
		}
	%>
</body>
</html>