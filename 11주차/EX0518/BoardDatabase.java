package univ;

import java.sql.*;
import java.util.ArrayList;
public class BoardDatabase {
	// 데이터베이스 연결 관련 상수 선언
	private static final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
	private static final String JDBC_URL = "jdbc:mysql://localhost:3306/univdb";
	private static final String USER = "root";
	private static final String PASSWD = "dongyang";
	
	//데이터베이스 연결 관련 변수 선언
	Connection con = null;
	private Statement stmt = null;
	
	//생성자 반드시 public
	public BoardDatabase () {
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
	public ArrayList<BoardEntity> getBoardList(){
		dbConnect(); 
		ArrayList<BoardEntity> list = new ArrayList<BoardEntity>();
		String sql = "select * from board";
		try {
			stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()) {
				BoardEntity brd = new BoardEntity();
				brd.setId(rs.getInt(1));
				brd.setName(rs.getString(2));
				brd.setPasswd(rs.getString(3));
				brd.setTitle(rs.getString(4));
				brd.setEmail(rs.getString(5));
				brd.setRegdate(rs.getString(6));
				brd.setContent(rs.getString(7));
			
				list.add(brd);
			}
			
			rs.close();
			dbDisconnect();
			System.out.println("SELECT 성공");
		} catch (Exception e) {
			System.out.println("SELECT 실패");
		}
		
		return list;
	}
	
}