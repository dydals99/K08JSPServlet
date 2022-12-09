package ex.board;

import javax.servlet.ServletContext;

import common.JDBConnect;

public class MbDAO extends JDBConnect{
	public MbDAO(ServletContext application) {
		
		super(application);
	}
	public int insertMember(MbDTO mdto) {
		int result = 0;
		
		try {
			String query = "insert into member "
					+ "(id, pass, name) "
					+ "values ('?','?','?')";
			
			psmt = con.prepareStatement(query);
			psmt.setString(1, mdto.getId());
			psmt.setString(2, mdto.getPass());
			psmt.setString(3, mdto.getName());
			
			result = psmt.executeUpdate();
			
		}
		catch(Exception e) {
			System.out.println("게시물 입력 중 예외 발생");
			e.printStackTrace();
		}
		return result;
	}
}
