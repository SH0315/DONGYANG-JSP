package univ;

import java.sql.*; 
import java.util.*; 
import javax.sql.*; 
import javax.naming.*; 

//DBCP를 이용한 테이블 board 처리 데이터베이스 연동 자바빈즈 프로그램
public class BoardDataBase {

	// 데이터베이스 연결관련 변수 선언
	private Connection con = null;
	private PreparedStatement pstmt = null;
	
	// 데이터베이스 연결 관련 상수 선언
	private static final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
	private static final String DB_NAME = "univdb"; 
	private static final String JDBC_URL = "jdbc:mysql://localhost:3306/" + DB_NAME; 
	private static final String USER = "root";
	private static final String PASSWD = "dongyang";
	// 생성자 JDBC 드라이버 로드 메소드
	public BoardDataBase() {
		try {
			Class.forName(JDBC_DRIVER);
			System.out.println("driver class ok ");
		} catch (Exception e) {
			e.printStackTrace();
		}		
	}
	
	
	
	// 데이터베이스 연결 메소드 
	public void dbConnect() {
		try {
			con = DriverManager.getConnection(JDBC_URL, USER, PASSWD);			
		    System.out.println("univdb 연결 ok ");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	
	// 데이터베이스 연결 헤제 메소드 
	public void disconnect() {
		if(pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} 
		if(con != null) {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	
	
	// 게시판의 모든 레코드를 반환 메서드
	public ArrayList<BoardEntity> getBoardList() {	
		dbConnect();
		
		ArrayList<BoardEntity> list = new ArrayList<BoardEntity>();
		String SQL = "select * from board order by id desc;";
		try {
			pstmt = con.prepareStatement(SQL);
			ResultSet rs = pstmt.executeQuery();
			System.out.println("select sql 실행 ok");
			while (rs.next()) {
				BoardEntity brd = new BoardEntity();
				brd.setId(rs.getInt("id"));
				brd.setName(rs.getString("name"));
				brd.setPasswd(rs.getString("passwd"));
				brd.setTitle(rs.getString("title"));
				brd.setEmail(rs.getString("email"));
				brd.setRegdate(rs.getString("regdate"));
				brd.setContent(rs.getString("content"));
				
				list.add(brd);
			}
			rs.close();			
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		finally {
			disconnect();
		}
		return list;
	}

	

	// 주 키 id의 레코드를 반환하는 메서드
	public BoardEntity getBoard(int id) {
	    dbConnect();

	    BoardEntity brd = new BoardEntity();

	    String sql = "select * from board where id=?";

	    try {
	        pstmt = con.prepareStatement(sql);
	        pstmt.setInt(1, id);

	        ResultSet rs = pstmt.executeQuery();

	        if(rs.next()) {
	            brd.setId(rs.getInt("id"));
	            brd.setName(rs.getString("name"));
	            brd.setPasswd(rs.getString("passwd"));
	            brd.setTitle(rs.getString("title"));
	            brd.setEmail(rs.getString("email"));
	            brd.setRegdate(rs.getString("regdate"));
	            brd.setContent(rs.getString("content"));
	        }

	        rs.close();

	    } catch(Exception e) {
	        e.printStackTrace();
	        System.out.println("해당 ID의 레코드 추출 에러");
	    } finally {
	        disconnect();
	    }

	    return brd;
	}
		

	
	// 게시물 등록 메서드
	public boolean insertDB(BoardEntity board) {
			dbConnect();
			boolean success = false; 
			
			String sql = "insert into board(name, passwd, title, email, regdate, content) values(?,?,?,?,default,?)";
			try {
			 pstmt = con.prepareStatement(sql);
			 pstmt.setString(1,board.getName());
			 pstmt.setString(2,board.getPasswd());
			 pstmt.setString(3,board.getTitle());
			 pstmt.setString(4,board.getEmail());
			 pstmt.setString(5,board.getContent());
			 //실행하시오
			 pstmt.executeUpdate();
			 success = true;
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("insert err");
			} finally {
				//DB 연결 해제
				disconnect();
			}
			
			return success;
		
	}
	
	
	
	// 데이터 갱신을 위한 메서드
	public boolean updateDB(BoardEntity board) {
		dbConnect();
		boolean success = false; 
		
		String sql = "update board set name = ? , title = ? , email = ?, content = ? where id = ? ";
		try {
			pstmt = con.prepareStatement(sql);
			// ? (1부터 시작)에 대응하는 값을 가져와 SQL문 완성
			pstmt.setString(1, board.getName());
			pstmt.setString(2, board.getTitle());
			pstmt.setString(3, board.getEmail());
			pstmt.setString(4, board.getContent());
			pstmt.setInt(5, board.getId());
			
			pstmt.executeUpdate();
			success = true;
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("update err");
		} finally {
			disconnect();
		}
		
		return success;
	}
	
	
	
	// 게시물 삭제를 위한 메서드
	public boolean deleteDB(int id) {
		dbConnect();
		boolean success = false; 
		
		String sql = "delete from board where id = ?;";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, id);
			pstmt.executeUpdate();
			success = true;
			System.out.println("delete OK");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("delete ERROR");
		} finally {
			disconnect();
		}
		return success;
	}

	// 데이터베이스에서 인자인 id와 passwd가 일치하는지 검사하는  메서드
	public boolean isPasswd(int id, String passwd) {
		boolean success = false;
		dbConnect();
		String sql = "select passwd from board where id = ?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1,id);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			String dbPasswd = rs.getString(1);
			if (dbPasswd.equals(passwd)) {
				success = true;
				System.out.println("비밀번호 일치!");
				rs.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("비밀번호 불일치");
		} finally {
			disconnect();
		}
		return success;
	}
}