<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 예제 : addcookie.jsp </title>
</head>
<body>
	<h1>쿠키 만들기 예제</h1>
	<hr>
	Cookie cookie = new Cookie ("user", "kang");
	cookie.setMaxAge ( 2 * 60 );
	response.addCookie(cookie);
	
	<%
		Cookie cookie = new Cookie ("user", "kang");
		cookie.setMaxAge (2 * 60);
		response.addCookie(cookie);
	%>
	
	<hr>
	<a href = addtimecookie.jsp>현재 접속 시각을 쿠키로 추가</a>
</body>
</html>