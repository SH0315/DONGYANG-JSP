<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String outerPath2= "./outerPage2.jsp";
	pageContext.setAttribute("pAttr", "동명왕");
	request.setAttribute("rAttr", "온조왕");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>본인이름, 학번, 2026.04.13</h3>
	<h3>액션 태그로 페이지 포함하기</h3>
	<jsp:include page = "./outerPage2.jsp"/>
	<jsp:include page = "<%= outerPath2 %>"></jsp:include >
</body>
</html>