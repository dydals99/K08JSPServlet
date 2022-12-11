<%@page import="utils.JSFunction"%>
<%@page import="ex.board.MbDAO"%>
<%@page import="ex.board.MbDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String id = request.getParameter("id");
String pass = request.getParameter("pass");
String name = request.getParameter("name");

MbDTO dto = new MbDTO();
dto.setId(id);
dto.setPass(pass);
dto.setName(name);

MbDAO dao = new MbDAO(application);

int iResult = dao.insertMember(dto); 
//자원해제
dao.close();
 
if(iResult == 1){
	JSFunction.alertLocation("회원가입 성공", "ExLoginForm.jsp", out); 
}
else{
	
	JSFunction.alertBack("회원가입에 실패하였습니다.", out);
}
%>