<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, univ.BoardEntity" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 기본 예제 : 게시 목록 표시</title>
</head>

<body>

<h2>게시판 목록 표시 프로그램</h2>
<hr>

<center>

<jsp:useBean id="brddb" class="univ.BoardDataBase" scope="page" />

<%
    ArrayList<BoardEntity> list = brddb.getBoardList();

    int counter = list.size();

    if(counter > 0) {
%>

    <table width="800" border="0" cellpadding="1" cellspacing="3">

        <tr>
            <th><font color="blue"><b>번호</b></font></th>
            <th><font color="blue"><b>제목</b></font></th>
            <th><font color="blue"><b>작성자</b></font></th>
            <th><font color="blue"><b>작성일</b></font></th>
            <th><font color="blue"><b>전자메일</b></font></th>
        </tr>

<%
        for(int row = 0; row < counter; row++) {

            BoardEntity brd = list.get(row);

            String color =
                (row % 2 == 0) ? "#FFFFCC" : "#FFFFFF";
%>

        <tr bgcolor="<%=color%>"
            onmouseover="this.style.backgroundColor='SkyBlue'"
            onmouseout="this.style.backgroundColor='<%=color%>'">

            <td align="center">
                <a href="editBoard.jsp?id=<%=brd.getId()%>">
                    <%=brd.getId()%>
                </a>
            </td>

            <td align="left"><%=brd.getTitle()%></td>
            <td align="center"><%=brd.getName()%></td>
            <td align="center"><%=brd.getRegdate()%></td>
            <td align="center"><%=brd.getEmail()%></td>

        </tr>

<%
        }
%>

    </table>

<%
    }
%>

<hr width="90%">

<p>조회된 게시판 목록 수가 <%=counter%>개 입니다.</p>

</center>

<hr>

<center>
    <form name="form" method="post" action="editBoard.jsp">
        <input type="submit" value="게시등록">
    </form>
</center>

</body>
</html>