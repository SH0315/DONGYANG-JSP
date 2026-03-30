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
	String inid = request.getParameter("userID");
	String inpw = request.getParameter("userPW");
	
	if ( ("admin").equals(inid) && ("1234").equals(inpw) ){
		out.print("<h3>" + inid + "님 로그인성공(관리자권한)");
		} else {
			response.sendRedirect("login.jsp");
		}
%>
</body>
</html>