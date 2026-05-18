<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.ArrayList, univ.BoardEntity, univ.BoardDatabase" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>데이터베이스 자바 빈즈 예제 : 테이블 board 조회</title>
</head>
<body>

<h2> 자바 빈즈 Board Database를 이용한 테이블 게시글 조회 프로그램 </h2>
<hr><center>
<h2>학생정보 조회</h2>

<jsp:useBean id="brddb" class="univ.BoardDatabase" scope="page" />
<%
	ArrayList<BoardEntity> list = brddb.getBoardList();
	int counter = list.size();
	if (counter > 0){
%>
    <table width=100% border=2 cellpadding=1>
    <tr>
       <td align=center><b>아이디</b></td>
       <td align=center><b>이름</b></td>
       <td align=center><b>비밀번호</b></td>
       <td align=center><b>제목</b></td>
       <td align=center><b>이메일</b></td>
       <td align=center><b>등록일</b></td>
       <td align=center><b>내용</b></td>
    </tr>
<%
	for (BoardEntity eachBrd : list){
%>
    <tr>
       <td align=center><%= eachBrd.getId() %></td>
       <td align=center><%= eachBrd.getName() %></td>
       <td align=center><%= eachBrd.getPasswd() %></td>
       <td align=center><%= eachBrd.getTitle() %></td>
       <td align=center><%= eachBrd.getEmail() %></td>
       <td align=center><%= eachBrd.getRegdate() %></td>
       <td align=center><%= eachBrd.getContent() %></td>
    </tr>
<%
	} 
}
%>
</table>
</center>

<p><hr>조회된 게시글의 수는 <%=counter%>개 입니다.
</body>
</html>