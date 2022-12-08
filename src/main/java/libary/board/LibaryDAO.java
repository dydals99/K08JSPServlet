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
		// 최근게시물을 상단에 노출하기 위해 내림차순으로 정렬한다.
		query += "ORDER BY book_code DESC ";
		
		try {
			// 쿼리실행 및 결과값 반환
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			// 2개 이상의 레코드가 반환될수 있으므로 while문을 사용
			// 갯수만큼 반복하게 된다.
			while (rs.next()) {
				// 하나의 레코드를 저장할 수 있는 DTO객체를 생성
				LibaryDTO dto = new LibaryDTO();
				
				// setter()를 이용해서 각 컬럼의 값을 저장
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
			//인파라미터가 있는 동적쿼리문으로 insert문 작성
			//게시물의 일련번호는 시퀀스를 통해 자동부여받고,
			//조회수의 경우에는 0을 입력한다.
			String query = "INSERT INTO board (" 
				+	" book_code,book_genre,book_title,book_author,book_status) " 
				+	" VALUES ( "
				+	" ?, ?, ?, ?, ?) ";
			//동적쿼리문 이므로 prepared객체를 통해 인파라미터를 채워준다.
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getBook_code());
			psmt.setString(2, dto.getBook_genre());
			psmt.setString(3, dto.getBook_title());
			psmt.setString(4, dto.getBook_author());
			psmt.setString(5, dto.getBook_Status());
			//insert를 실행하여 입력된 행의 갯수를 반환받는다.
			result = psmt.executeUpdate();
			
		}
		catch(Exception e) {
			System.out.println("게시물 입력 중 예외 발생");
			e.printStackTrace();
		}
		return result;
	}
}
