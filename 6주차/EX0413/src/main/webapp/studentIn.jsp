<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<html>
<head>
    <title>JSP 예제 : StudentBean 이용</title>
</head>
<body>

<form name="student" method="post" action="studentOut.jsp">
<table cellspacing="1" cellpadding="2">
    <tr bgcolor="yellow">
        <td align="center" colspan="2">학생 정보 입력</td>
    </tr>

    <tr>
        <td align="right">학생 아이디 :</td>
        <td><input type="text" name="id"></td>
    </tr>

    <tr>
        <td align="right">학생 이름 :</td>
        <td><input type="text" name="name"></td>
    </tr>

    <tr>
        <td align="right">학생 번호 :</td>
        <td><input type="text" name="snum"></td>
    </tr>

    <tr>
        <td align="right">태어난 해 :</td>
        <td>
            <select name="year">
                <option selected value="1990">1990</option>
                <option value="1991">1991</option>
                <option value="1992">1992</option>
                <option value="1993">1993</option>
                <option value="1994">1994</option>
                <option value="1995">1995</option>
                <option value="1996">1996</option>
            </select>
        </td>
    </tr>
    <tr>
    	<td align="rignt">암호 :</td>
    	<td><input type = "password" name = "pass"></td>	
    </tr>
    <tr>
    	<td align="rignt">전자메일 :</td>
    	<td><input type = "text" name = "email"></td>	
    </tr>
     <tr>
    	<td align="rignt">전자메일 :</td>
    	<td><input type = "submit" value = "입력완료">
    	<input type = "reset" value = "다시쓰기"></td>		
    </tr>
</table>
</form>

</body>
</html>