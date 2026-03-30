<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 예제 postrequest.jsp</title>
</head>
<body>
	<h2>메소드 post 방식에서 한글처리</h2><hr>
	<%
		String korname = request.getParameter("korname");
		String engname = request.getParameter("engname");  
	%>
	
	<p>한글 성명: <%= korname %></p>
	<p>영어 성명: <%= engname %></p>
</body>
</html>