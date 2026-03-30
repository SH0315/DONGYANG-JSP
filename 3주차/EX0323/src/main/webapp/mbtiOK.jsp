<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>20232324 임상혁 MBTI 구현 과제</title>
</head>
<body>
	<%
	String mbti = request.getParameter("MBTI");
	
	if ("E".equals(mbti)){
		out.print("<h3> 당신은 외향형 입니다! 단체활동을 선호하고 생각을 표출하며 말하기를 선호하시는군요! ");
	} else {
		out.print("<h3> 당신은 내향형 입니다! 혼자하는 활동을 선호하고 내면에 담고 글쓰기를 선호하시는군요! ");
	}
	%>
</body>
</html>