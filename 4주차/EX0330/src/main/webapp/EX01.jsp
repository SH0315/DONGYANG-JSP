<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<h3>내장객체 Scope(영역) 학번이름</h3>
		<%
			// 1 Page : 이 페이지를 벗어나면 사라짐
			pageContext.setAttribute("msg", "나만보는 메모");
		
			// 2 Request : 다음 페이지로 이동할때까지 살아있음
			request.setAttribute("msg", "전달하는 쪽지");
			
			// 3 Session : 브라우저를 닫기 전까지 어디서든 사용 가능 (로그인 ~ 로그아웃)
			session.setAttribute("msg", "로그인한 내 이름");
			
			// 4. Application : 이 사이트 접속자 모두가 공유함
			application.setAttribute("msg", "우리 사이트 전체 공지");
		%>
		
		<p>Page 데이터 : <%= pageContext.getAttribute("msg") %></p>
		<p>Request 데이터 : <%= request.getAttribute("msg") %></p>
		<p>Session 데이터 : <%= session.getAttribute("msg") %></p>
		<p>Application 데이터 : <%= application.getAttribute("msg") %></p>
		
		
		
		
</body>
</html>