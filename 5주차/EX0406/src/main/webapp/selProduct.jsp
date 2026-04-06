<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		session.setAttribute("username", request.getParameter("userid"));

	%>
	
	<h2>상품 선택</h2>
	<hr>
	<%= session.getAttribute("username")%> 님이 로그인한 상태입니다.
	<hr>
	<form action = "addCart.jsp" method="post">
		<select name ="product">
			<option>사과</option>
			<option>귤</option>
			<option>파인애플</option>
			<option>자몽</option>
			<option>레몬</option>
			<option>포도</option>
		</select>
		<input type = "submit" value = "추가">
	</form>
	<a href = "checkOut.jsp">계산</a>
</body>
</html>