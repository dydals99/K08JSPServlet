package ex.board;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.servlet.ServletContext;

import common.JDBConnect;
import model1.board.BoardDTO;

public class ExDAO extends JDBConnect{
	
	public ExDAO(ServletContext application) {
		
		super(application);
	}
	public int selectCount(Map<String, Object> map) {
		// 결과(게시물 수)를 담을 변수
		int totalCount = 0;
		
		// 게시물 수를 얻어오는 쿼리문 작성
		String query = "SELECT COUNT(*) FROM board ";
		// 검색어가 있는 경우 where절을 추가하여 조건에 맞는 게시물만 추출한다.
		if (map.get("searchWord") != null) {
			query += "WHERE " + map.get("searchField") + " " + " LIKE '%" + map.get("searchWord") + "%' ";
		}
		try {
			// 정적쿼리문 실행을 위한 Statement객체 생성
			stmt = con.createStatement();
			// 쿼리문 실행 후 결과는 ResultSet으로 반환한다.
			rs = stmt.executeQuery(query);
			// 커서를 첫번째 행으로 이동하여 레코드를 읽는다.
			rs.next();
			// 첫번째 컬럼의 값을 가져와서 변수에 저장한다.
			totalCount = rs.getInt(1);
		} 
		catch (Exception e) {
			System.out.println("게시물 수를 구하는 중 예외 발생");
			e.printStackTrace();
		}
		return totalCount;
	}
	public List<ExDTO> selectList(Map<String, Object> map) {
		
		// List계열의 컬렉션을 생성한다. 이때 타입 매개변수는
		// BoardDTO객체로 설정한다.
		// 게시판 목록은 출력 순서가 보장되야 하므로 Set컬렉션은
		// 사용할 수 없고 List컬렉션을 사용해야한다.
		List<ExDTO> bbs = new Vector<ExDTO>();
		
		// 레코드 추출을 위한 select쿼리문 작성
		String query = "SELECT * FROM board ";
		if (map.get("searchWord") != null) {
			query += "WHERE " + map.get("searchField") + " " + " LIKE '%" + map.get("searchWord") + "%' ";
		}
		// 최근게시물을 상단에 노출하기 위해 내림차순으로 정렬한다.
		query += "ORDER BY num DESC ";
		
		try {
			// 쿼리실행 및 결과값 반환
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			// 2개 이상의 레코드가 반환될수 있으므로 while문을 사용
			// 갯수만큼 반복하게 된다.
			while (rs.next()) {
				// 하나의 레코드를 저장할 수 있는 DTO객체를 생성
				ExDTO dto = new ExDTO();
				
				// setter()를 이용해서 각 컬럼의 값을 저장
				dto.setNum(rs.getString("num"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setPostdate(rs.getDate("postdate"));
				dto.setId(rs.getString("id"));
				dto.setVisitcount(rs.getString("visitcount"));
				
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
}
