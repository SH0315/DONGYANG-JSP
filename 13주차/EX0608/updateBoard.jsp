<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id ="brd" class = "univ.BoardEntity" scope = "page"/>
	<jsp:useBean id ="brddb" class = "univ.BoardDataBase" scope = "page"/>
	<jsp:setProperty name="brd" property = "name"/>
	<jsp:setProperty name="brd" property = "title"/>
	<jsp:setProperty name="brd" property = "email"/>
	<jsp:setProperty name="brd" property = "content"/>
	<jsp:setProperty name="brd" property = "passwd"/>
	
	<%
		// 수정 변경을 위해 데이터베이스 자바빈즈에 구현되 메소드 updateDB 실행전 콘솔에 출력
		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");
		int idNum = Integer.parseInt(id);
		brd.setId(idNum);
		
		if (!brddb.isPasswd(idNum, passwd)){
	%>
			<script/>alert('비밀번호가 다릅니다.'); history.go(-1);
	<%	
		}
		boolean success = brddb.updateDB(brd);
		if (success) {
			out.println("<script>");
			// 괄호 안의 문자열 전체를 적은 따음표 (' ')로 감싸고 자바 변수를 결합
			out.println("alert('수정성공 이름:" + brd.getName() + "');");
			// 알림창 확인을 누른 후 목록 페이지로 수동 이동
			out.println("location.href = 'listBoard.jsp';");
			out.println("</script>");
		} else {
			//실패했을때의 알림 처리
			out.println("<script>");
			out.println("alert('수정 변경에 실패했습니다');");
			out.println("history.back();");
			out.println("</script>");
		}
					
	
	%>
</body>
</html>