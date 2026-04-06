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
	
	<%! int count = 0; %>
		<%
			String oneProduct = request.getParameter("product");
		
			ArrayList<String> list = (ArrayList<String>)session.getAttribute("productlist");
			if (list == null){
				list = new ArrayList<String>();
				session.setAttribute("productlist", list);
			}
			
			list.add(oneProduct);
			count++;
		%>
		<script type ="text/javascript">
			alert("<%= oneProduct %>가 추가되었습니다!!");
			history.go(-1);
		</script>
		
</body>
</html>