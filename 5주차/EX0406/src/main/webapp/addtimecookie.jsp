<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>JSP 예제 : addtimecookie.jsp</title>
</head>
<body>
<h1>현재 시각을 쿠키로 저장</h1>
<hr>
    String now = new Date().toString().replace(" ", "_");<br>
    Cookie cookie = new Cookie("lastconnect", now);<br>
    cookie.setMaxAge(10); // 초 단위: 10초<br>
    response.addCookie(cookie);<br>
<%
    // 현재 시각을 문자열로 가져오기 (공백을 _로 치환)
    String now = new Date().toString().replace(" ", "_");
    
    // "lastconnect"라는 이름으로 쿠키 생성, 값은 현재 시각
    Cookie cookie = new Cookie("lastconnect", now);
    
    // 쿠키 유효 시간을 10초로 설정
    cookie.setMaxAge(10); // 초 단위: 10초
    
    // 생성한 쿠키를 응답에 추가
    response.addCookie(cookie);
%>

<hr>
<a href="getcookies.jsp">쿠키 조회</a>
</body>
</html>