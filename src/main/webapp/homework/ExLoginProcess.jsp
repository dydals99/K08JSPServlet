<%@page import="utils.JSFunction"%>
<%@page import="ex.board.MbDTO"%>
<%@page import="membership.MemberDAO"%>
<%@page import="membership.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String userId = request.getParameter("user_id");
String userPwd = request.getParameter("user_pw");
String userName = request.getParameter("user_name");

String oracleDriver = application.getInitParameter("OracleDriver");
String oracleURL = application.getInitParameter("OracleURL");
String oracleId = application.getInitParameter("OracleId");
String oraclePwd = application.getInitParameter("OraclePwd");


MemberDAO dao = new MemberDAO(oracleDriver, oracleURL, oracleId, oraclePwd);
MemberDTO memberDTO = dao.getMemberDTO(userId, userPwd);
dao.close();

if(memberDTO.getId() != null){
	session.setAttribute("UserId", memberDTO.getId());
	session.setAttribute("UserPass", memberDTO.getPass());
	session.setAttribute("UserName", memberDTO.getName());
	JSFunction.alertLocation("환영합니다", "boardList.jsp", out); 
	
}
else{
	JSFunction.alertLocation("아이디/비밀번호를 잘못입력하셨습니다. " , "ExLoginForm.jsp" , out); 
}
%>
