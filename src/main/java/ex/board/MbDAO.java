package ex.board;


import javax.servlet.ServletContext;

import common.JDBConnect;

public class MbDAO extends JDBConnect {
	public MbDAO(ServletContext application) {

		super(application);
	}
	public MbDTO selectMember(String id) {

		MbDTO mbto = new MbDTO();
		String query = " SELECT id,pass,name "
				+ "	FROM member "
				+ " WHERE id = ? ";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			if (rs.next()) { // DTO 객체에 레코드를 저장한다.
				mbto.setId(rs.getString("id"));
				mbto.setPass(rs.getString("pass"));
				mbto.setName(rs.getString("name"));
			}
		} 
		catch (Exception e) {
			e.printStackTrace();
			System.out.println("회원정보 진입중 예외발생");
		}
		return mbto;
	}
	public int updateMember(MbDTO dto) {
		
		int result = 0;
		
		String query = " UPDATE member SET "
				+ " pass = ? ,name = ? ,revisiondate=sysdate "
				+ " WHERE id = ? ";
		try {
			psmt = con.prepareStatement(query);
			
			psmt.setString(1, dto.getPass());
			psmt.setString(2, dto.getName());
			psmt.setString(3, dto.getId());
			psmt.executeQuery();
			
			result = psmt.executeUpdate();
		}
		catch(Exception e) {
			
			System.out.println("회원정보 수정중 예외발생");
			e.printStackTrace();
		}
		return result;
	}
	public int insertMember(MbDTO mdto) {
		int result = 0;

		try {
			String query = "insert into member " + "(id, pass, name) " + "values (?,?,?)";

			psmt = con.prepareStatement(query);
			psmt.setString(1, mdto.getId());
			psmt.setString(2, mdto.getPass());
			psmt.setString(3, mdto.getName());

			result = psmt.executeUpdate();

			
		}
		catch (Exception e) {
			System.out.println("게시물 입력 중 예외 발생");
			e.printStackTrace();
		}
		return result;
	}
}
