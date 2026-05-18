package univ;

import java.sql.*;
import java.util.ArrayList;
public class StudentDatabase {
	// 데이터베이스 연결 관련 상수 선언
	private static final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
	private static final String JDBC_URL = "jdbc:mysql://localhost:3306/univdb";
	private static final String USER = "root";
	private static final String PASSWD = "dongyang";
	
	//데이터베이스 연결 관련 변수 선언
	Connection con = null;
	private Statement stmt = null;
	
	//생성자 반드시 public
	public StudentDatabase () {
		// 1.JDBC 드라이버 로드
		try {
			Class.forName(JDBC_DRIVER);
			System.out.println("driver load ok..");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("driver load error..");
		}
	}

	
  //드라이브 연결 메소드
	public void dbConnect() {
		try {
			con = DriverManager.getConnection(JDBC_URL, USER, PASSWD);
			System.out.println("db 연결 성공");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	//데이터베이스 연결해제 메소드
	public void dbDisconnect() {
		if (stmt != null) {
			try {
				stmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
	
	}
		if ( con != null) {
			try {
				con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}	

    }

	}
	
	
	//데이터베이스 가져오기
	public ArrayList<StudentEntity> getStudentList(){
		dbConnect(); 
		ArrayList<StudentEntity> stuList = new ArrayList<StudentEntity>();
		String sql = "select * from student";
		try {
			stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()) {
				StudentEntity stu = new StudentEntity();
				stu.setId(rs.getString(1));
				stu.setPasswd(rs.getString(2));
				stu.setName(rs.getString(3));
				stu.setYear(rs.getInt(4));
				stu.setSnum(rs.getString(5));
				stu.setDepart(rs.getString(6));
				stu.setMobile1(rs.getString(7));
				stu.setMobile2(rs.getString(8));
				stu.setAddress(rs.getString(9));
				stu.setEmail(rs.getString(10));
				
				stuList.add(stu);
			}
			
			rs.close();
			dbDisconnect();
			System.out.println("SELECT 성공");
		} catch (Exception e) {
			System.out.println("SELECT 실패");
		}
		
		return stuList;
	}
	
}