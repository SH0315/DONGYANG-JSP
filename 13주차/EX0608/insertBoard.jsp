<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@page import = "univ.BoardEntity" %>
	<jsp:useBean id ="brd" class = "univ.BoardEntity" scope = "page"/>
	<jsp:useBean id ="brddb" class = "univ.BoardDataBase" scope = "page"/>
	<jsp:setProperty name="brd" property = "name"/>
	<jsp:setProperty name="brd" property = "title"/>
	<jsp:setProperty name="brd" property = "email"/>
	<jsp:setProperty name="brd" property = "content"/>
	<jsp:setProperty name="brd" property = "passwd"/>
	
	<%
		boolean success = brddb.insertDB(brd);
		
		if (success){
			out.println("<script>");
			// 괄호 안의 문자열 전체를 '' 로 감싸고 자바 변수 결합
			out.println("alert('입력성공 이름:" + brd.getName() +"');");
			
			//알림창 확인을 누른 후 목록 페이지로 수동 이동
			out.println("location.href = 'listBoard.jsp';");
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("alert('입력에 실패했습니다.');");
			out.println("history.back();");
			out.println("</script>");
		}
	%>
	

	
</body>
</html>