package ex.board;

import java.util.List;
import java.util.Map;
import java.util.Vector;
import javax.servlet.ServletContext;
import common.JDBConnect;

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
		
		List<ExDTO> bbs = new Vector<ExDTO>();
		
		String query = "SELECT * FROM board ";
		if (map.get("searchWord") != null) {
			query += "WHERE " + map.get("searchField") + " " + " LIKE '%" + map.get("searchWord") + "%' ";
		}
		query += "ORDER BY num DESC ";
		
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			
			while (rs.next()) {
				
				ExDTO dto = new ExDTO();
				
				dto.setNum(rs.getString("num"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setPostdate(rs.getDate("postdate"));
				dto.setId(rs.getString("id"));
				dto.setVisitcount(rs.getString("visitcount"));
				dto.setRevisiondate(rs.getDate("revisiondate"));
				
				bbs.add(dto);
			}
			
		} 
		catch (Exception e) {
			System.out.println("게시물 조회 중 예외 발생");
			e.printStackTrace();
		}
		return bbs;
	}
	public int insertWrite(ExDTO dto) {
		int result = 0;
		
		try {
			String query = "INSERT INTO board (" 
				+	" num,title,content,id,visitcount) " 
				+	" VALUES ( "
				+	" seq_board_num.NEXTVAL, ?, ?, ?, 0) ";
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setString(3, dto.getId());
			result = psmt.executeUpdate();
			
		}
		catch(Exception e) {
			System.out.println("게시물 입력 중 예외 발생");
			e.printStackTrace();
		}
		return result;
	}
	public ExDTO selectView(String num) {
		ExDTO dto = new ExDTO();
		
		//멤버변수로 생성한 name컬럼을 가져오기위해 내부조인을 함 
		String query = "SELECT B.*, M.name "
				+ "     FROM board B "
				+ "     INNER join member M "
				+ "     ON B.id = M.id  "
				+ "     WHERE num = ? ";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, num);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				dto.setNum(rs.getString(1));
				dto.setTitle(rs.getString(2));
				dto.setContent(rs.getString("Content"));
				dto.setPostdate(rs.getDate("Postdate"));
				dto.setId(rs.getString("id"));
				dto.setVisitcount(rs.getString(6));
				dto.setName(rs.getString("name"));
				dto.setRevisiondate(rs.getDate("revisiondate"));
			}
		}
		catch(Exception e) {
			System.out.println("게시물 상세보기 중 예외발생");
			e.printStackTrace();
		}
		return dto;
	}
	public void updateVisitCount(String num) {
		
		String query = " UPDATE board SET "
				+ " visitcount=visitcount+1 "
				+ " WHERE num=? ";
		try {
			psmt= con.prepareStatement(query);
			psmt.setString(1, num);
			psmt.executeQuery();
		}
		catch(Exception e) {
			System.out.println("게시물 조회수 증가 중 예외발생");
			e.printStackTrace();
		}
	}
	public int updateEdit(ExDTO dto) {
		int result = 0;
		
		try {
			String query = "UPDATE board SET "
					+ "title = ?, content = ?, revisiondate = sysdate "
					+ "where num = ?";
			psmt = con.prepareStatement(query);
			
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setString(3, dto.getNum());
			//수정된 레코드의 갯수가 반환된다.
			result = psmt.executeUpdate();
		}
		catch(Exception e) {
			System.out.println("게시물 수정 중 예외발생");
			e.printStackTrace();
		}
		return result;
	}
	public int deletePost(ExDTO dto) {
		int result = 0;
		
		try {
			String query = "DELETE FROM board WHERE num = ? ";
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getNum());
			
			result = psmt.executeUpdate();
			
		}
		catch(Exception e) {
			System.out.println("게시물 삭제 중 예외발생");
			e.printStackTrace();
		}
		return result;
	}
	
}
