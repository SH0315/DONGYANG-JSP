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

	
	<%
		// 삭제 처리 모듈
		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");
		int idNum = Integer.parseInt(id);
		if (!brddb.isPasswd(idNum, passwd)){
	%>
			<script/>alert('비밀번호가 다릅니다.'); history.go(-1);
	<%	
		}
		boolean success = brddb.deleteDB(idNum);
		if (success) {
			out.println("<script>");
			// 괄호 안의 문자열 전체를 적은 따음표 (' ')로 감싸고 자바 변수를 결합
			out.println("alert('삭제성공 id 번호:" + idNum + "');");
			// 알림창 확인을 누른 후 목록 페이지로 수동 이동
			out.println("location.href = 'listBoard.jsp';");
			out.println("</script>");
		} else {
			//실패했을때의 예외 처리
			out.println("<script>");
			out.println("alert('수정 변경에 실패했습니다');");
			out.println("history.back();");
			out.println("</script>");
		}
					
	
	%>
</body>
</html>