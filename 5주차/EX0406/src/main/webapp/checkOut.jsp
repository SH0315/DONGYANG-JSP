<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import = "java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%= session.getAttribute("username") %>님이 로그인한 상태입니다.
	<h2>계산</h2>
	선택한 상품 목록
	<hr>
	<%
		ArrayList<String> list = (ArrayList<String>)session.getAttribute("productlist");
		if (list == null){
			list = new ArrayList<String>();
			out.println("선택한 상품이 없습니다.");
		} else {
			for(String eachproduct : list){
				out.println(eachproduct + "<br>");
			}
		}
	%>
</body>
</html>