package ex.board;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.servlet.ServletContext;

import common.JDBConnect;

public class MbDAO extends JDBConnect {
	public MbDAO(ServletContext application) {

		super(application);
	}
	public MbDTO selectMember(String id) {
		MbDTO mbto = new MbDTO();
		
		try {
			String query = "select id,pass,name from member where id = ? " ;
			
			psmt = con.prepareStatement(query);
			psmt.setString(1,id);
			if(rs.next()) {
				//DTO 객체에 레코드를 저장한다.
				mbto.setId("id");
				mbto.setPass("pass");
				mbto.setName("name");
			}
					
		}
		catch(Exception e) {
			e.printStackTrace();
			System.out.println("회원정보 수정중 예외발생");
		}
		return mbto ;
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

		} catch (Exception e) {
			System.out.println("게시물 입력 중 예외 발생");
			e.printStackTrace();
		}
		return result;
	}
}
