<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생정보 조회</title>
<style>
    table {
        border-collapse: collapse;
        width: 100%;
    }
    th, td {
        border: 1px solid black;
        padding: 8px;
        text-align: center;
    }
    th {
        background-color: #f2f2f2;
    }
</style>
</head>
<body>

<h2>학생정보 조회</h2>

<%
    int count = 0;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        String url = "jdbc:mysql://localhost:3306/univdb";
        Connection conn = DriverManager.getConnection(url, "root", "dongyang");

        String sql = "select * from student;";
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery(sql);
%>

<table>
    <tr>
        <th>아이디</th>
        <th>암호</th>
        <th>이름</th>
        <th>입학년도</th>
        <th>학번</th>
        <th>학과</th>
        <th>휴대폰1</th>
        <th>휴대폰2</th>
        <th>주소</th>
        <th>이메일</th>
    </tr>

<%
        while(rs.next()){
            count++;
%>
    <tr>
        <td><%= rs.getString(1) %></td>
        <td><%= rs.getString("passwd") %></td>
        <td><%= rs.getString(3) %></td>
        <td><%= rs.getInt(4) %></td>
        <td><%= rs.getString(5) %></td>
        <td><%= rs.getString(6) %></td>
        <td><%= rs.getString(7) %></td>
        <td><%= rs.getString(8) %></td>
        <td><%= rs.getString(9) %></td>
        <td><%= rs.getString("email") %></td>
    </tr>
<%
        }

        rs.close();
        stmt.close();
        conn.close();
%>
</table>

<p>조회된 학생 수가 <%= count %>명 입니다.</p>

<%
    } catch (Exception e){
        out.println("DB 연결 에러");
        e.printStackTrace();
    }
%>

</body>
</html>