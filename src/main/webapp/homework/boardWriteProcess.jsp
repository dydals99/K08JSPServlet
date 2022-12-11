<%@page import="utils.JSFunction"%>
<%@page import="ex.board.ExDAO"%>
<%@page import="ex.board.ExDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="./ExIsLoggedIn.jsp" %>
<%
//클라이언트가 작성한 폼값을 받는다.
String id = request.getParameter("id");
String title = request.getParameter("title");
String content = request.getParameter("content");

//폼값을 DTO객체에 저장한다.
ExDTO dto = new ExDTO();
dto.setTitle(title);
dto.setContent(content);
dto.setId(session.getAttribute("UserId").toString());

//DB연결을 위해 DAO객체를 생성한다.
ExDAO dao = new ExDAO(application);
int iResult = dao.insertWrite(dto); 
dao.close();

if(iResult == 1){
	response.sendRedirect("boardList.jsp");
}
else{
	//실패했다면 재입력을 위해 글쓰기 페이지로 다시 돌아간다.
	JSFunction.alertBack("글쓰기에 실패하였습니다.", out);
}
%>