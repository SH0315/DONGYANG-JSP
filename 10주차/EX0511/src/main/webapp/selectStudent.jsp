<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생 조회</title>
<style>
    table {
        border-collapse: collapse;
        width: 90%;
        margin: 20px auto;
    }
    th, td {
        border: 1px solid #333;
        padding: 8px 12px;
        text-align: left;
    }
    th {
        background-color: #4CAF50;
        color: white;
    }
    tr:nth-child(even) {background-color: #f2f2f2;}
    tr:hover {background-color: #ddd;}
    .result-header {
        background-color: #FFC107;
        text-align: center;
        font-weight: bold;
    }
</style>
</head>
<body>
<%
try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    String url ="jdbc:mysql://localhost:3306/univdb";
    Connection conn = DriverManager.getConnection(url, "root", "dongyang");
    out.println("DB 연결 성공<br>");
    
    String selectname = request.getParameter("name");   // 값 받아오기
    
    PreparedStatement pstmt;
    if (selectname == null || selectname.trim().equals("")){
        String sql = "select * from student";
        pstmt = conn.prepareStatement(sql);
    } else{
        String sql = "select * from student where name = ?";
        pstmt= conn.prepareStatement(sql);
        pstmt.setString(1, selectname);
    }
    ResultSet rs = pstmt.executeQuery();
%>

<table>
    <tr class="result-header">
        <td colspan="10">
<%
    if (selectname == null || selectname.trim().equals("")) {
        out.print("전체 학생 조회 결과");
    } else {
        out.print("학생 '" + selectname + "' 조회 결과");
    }
%>
        </td>
    </tr>
    <tr>
        <th>ID</th>
        <th>비밀번호</th>
        <th>이름</th>
        <th>학년</th>
        <th>학번</th>
        <th>학과</th>
        <th>휴대폰</th>
        <th>전화</th>
        <th>주소</th>
        <th>이메일</th>
    </tr>
<%
    while(rs.next()){
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
    pstmt.close();
    conn.close();
}catch(Exception e){
	e.printStackTrace();
}
 
    
%>
</table>

</body>
</html>