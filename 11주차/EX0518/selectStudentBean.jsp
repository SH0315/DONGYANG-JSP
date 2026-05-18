<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.ArrayList, univ.StudentEntity, univ.StudentDatabase" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>데이터베이스 자바 빈즈 예제 : 테이블 student 조회</title>
</head>
<body>

<h2> 자바 빈즈 StudentDatabase를 이용한 테이블 student 조회 프로그램 </h2>
<hr><center>
<h2>학생정보 조회</h2>

<jsp:useBean id="studb" class="univ.StudentDatabase" scope="page" />
<%
	ArrayList<StudentEntity> list = studb.getStudentList();
	int counter = list.size();
	if (counter > 0){
%>
    <table width=100% border=2 cellpadding=1>
    <tr>
       <td align=center><b>아이디</b></td>
       <td align=center><b>암호</b></td>
       <td align=center><b>이름</b></td>
       <td align=center><b>입학년도</b></td>
       <td align=center><b>학번</b></td>
       <td align=center><b>학과</b></td>
       <td align=center><b>휴대폰1</b></td>
       <td align=center><b>휴대폰2</b></td>
       <td align=center><b>주소</b></td>
       <td align=center><b>이메일</b></td>
    </tr>
<%
	for (StudentEntity eachStu : list){
%>
    <tr>
       <td align=center><%= eachStu.getId() %></td>
       <td align=center><%= eachStu.getPasswd() %></td>
       <td align=center><%= eachStu.getName() %></td>
       <td align=center><%= eachStu.getYear() %></td>
       <td align=center><%= eachStu.getSnum() %></td>
       <td align=center><%= eachStu.getDepart() %></td>
       <td align=center><%= eachStu.getMobile1() %></td>
       <td align=center><%= eachStu.getMobile2() %></td>
       <td align=center><%= eachStu.getAddress() %></td>
       <td align=center><%= eachStu.getEmail() %></td>
    </tr>
<%
	} 
}
%>
</table>
</center>

<p><hr>조회된 학생 수가 <%=counter%>명 입니다.
</body>
</html>