<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="person" class="javabean.PersonBean"></jsp:useBean>
	<jsp:setProperty property ="*" name="person"/>
	
	<h3>JavaBean PersonBean에 저장된 정보를 조회 출력</h3>
	이름 : <jsp:getProperty property = "name" name ="person"/><br>
	나이 : <jsp:getProperty property = "age" name ="person"/><br>
</body>
</html>