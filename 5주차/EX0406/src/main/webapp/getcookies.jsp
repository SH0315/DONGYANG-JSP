<%@ page language="java" contentType="text/html; 
charset=EUC-KR" pageEncoding="EUC-KR"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>JSP 예제 : getcookies.jsp</title>
</head>
<body>
<h1>쿠키 조회 예제</h1>
<hr>

<%
    // 클라이언트가 보낸 모든 쿠키를 가져오기
    Cookie[] cookies = request.getCookies();
    
    // 쿠키가 없는 경우
    if (cookies == null) {
        out.println("쿠키가 없습니다.");
    } else {
        // 쿠키가 존재하는 경우, 각 쿠키의 이름과 값을 출력
        for (Cookie c : cookies) {
            out.println("쿠키 이름(name) : " + c.getName() + ", ");
            out.println("쿠키 값(value) : " + c.getValue() + "<br>");
        }
    }
%>

</body>
</html>