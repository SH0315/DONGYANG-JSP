<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<%@ page import="java.util.Enumeration" %>
	
	<h2>취미와 가보고 싶은 국가 결과</h2>
	
	1. 취미:
	<%
		String [] hobbyArr = request.getParameterValues("hobby");
		if (hobbyArr != null){
			for (String eachdata : hobbyArr){
				out.println(eachdata + "");
			}
		}
		
		out.println("<p>");
	%>
	
	
	2. 여행하고 싶은 나라 : <%=request.getParameter("country") %>
</body>
</html>