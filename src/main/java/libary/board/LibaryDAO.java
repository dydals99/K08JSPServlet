package libary.board;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.servlet.ServletContext;

import common.LibConnect;

public class LibaryDAO extends LibConnect{


	public LibaryDAO() {
		
	}
//	public LibaryDAO(ServletContext application) {
//		super(application);
//	}
	public int selectCount(Map<String, Object> map) {
		// 결과(게시물 수)를 담을 변수
		int totalCount = 0;
		
		String query = "SELECT COUNT(*) FROM LIBRARY ";
		
		if (map.get("searchWord") != null) {
			query += "WHERE " + map.get("searchField") + " " + " LIKE '%" + map.get("searchWord") + "%' ";
		}
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			rs.next();
			totalCount = rs.getInt(1);
		} catch (Exception e) {
			System.out.println("게시물 수를 구하는 중 예외 발생");
			e.printStackTrace();
		}
		return totalCount;
	}
	public List<LibaryDTO> selectList(Map<String, Object> map) {
		
		// List계열의 컬렉션을 생성한다. 이때 타입 매개변수는
		// BoardDTO객체로 설정한다.
		// 게시판 목록은 출력 순서가 보장되야 하므로 Set컬렉션은
		// 사용할 수 없고 List컬렉션을 사용해야한다.
		List<LibaryDTO> bbs = new Vector<LibaryDTO>();
		
		// 레코드 추출을 위한 select쿼리문 작성
		String query = "SELECT * FROM LIBRARY ";
		if (map.get("searchWord") != null) {
			query += "WHERE " + map.get("searchField") + " " + " LIKE '%" + map.get("searchWord") + "%' ";
		}
		query += "ORDER BY book_code DESC ";
		
		try {
			// 쿼리실행 및 결과값 반환
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			while (rs.next()) {
				LibaryDTO dto = new LibaryDTO();
				
				dto.setBook_code(rs.getString("book_code"));
				dto.setBook_genre(rs.getString("book_genre"));
				dto.setBook_title(rs.getString("book_title"));
				dto.setBook_author(rs.getString("book_author"));
				dto.setBook_Status(rs.getString("book_status"));
				
				// List컬렉션에 DTO객체를 추가한다.
				bbs.add(dto);
			}
			
		} 
		catch (Exception e) {
			System.out.println("게시물 조회 중 예외 발생");
			e.printStackTrace();
		}
		return bbs;
	}
	public int insertWrite(LibaryDTO dto) {
		int result = 0;
		
		try {
			//동적 쿼리문 작성
			String query = "INSERT INTO board (" 
				+	" book_code,book_genre,book_title,book_author,book_status) " 
				+	" VALUES ( "
				+	" ?, ?, ?, ?, ?) ";
			
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getBook_code());
			psmt.setString(2, dto.getBook_genre());
			psmt.setString(3, dto.getBook_title());
			psmt.setString(4, dto.getBook_author());
			psmt.setString(5, dto.getBook_Status());
			
			result = psmt.executeUpdate();
			
		}
		catch(Exception e) {
			System.out.println("게시물 입력 중 예외 발생");
			e.printStackTrace();
		}
		return result;
	}
}
