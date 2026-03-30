<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
  
<!DOCTYPE html>
<html>
<head>
	<title>실습 GET방식 내장객체 request</title>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		//requset로 데이터 읽기
		String inname = request.getParameter("name");
		if (inname == null){
			out.println("<h3>주소창에 ?name=이름 을 붙여보세요<./h3>");
		} else{
			out.println("<h3>" + inname + "님, 오늘 JSP수업에 오신걸 환영합니다.<h3>");
		}
			
		
	%>
</body>
</html>