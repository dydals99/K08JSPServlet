<%@page import="model1.board.BoardDAO"%>
<%@page import="model1.board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="./IsLoggedIn.jsp" %>
<%
String title = request.getParameter("title");
String content = request.getParameter("content");

BoardDTO dto = new BoardDTO();
dto.setTitle(title);
dto.setContent(content);
dto.setId(session.getAttribute("UserId").toString());

BoardDAO dao = new BoardDAO(application);

//기존에 1개씩 입력하는 방식
//int iResult = dao.insertWrite(dto);

//더미데이터 100개를 한꺼번에 입력하는 방식
int iResult = 0 ;

for(int i = 1 ; i <= 100 ; i ++){
	
	//제목에 증가되는 변수 i를 붙여 1~100까지를 추가한다.
	dto.setTitle(title + "-" + i );
	//insert쿼리문 반복 실행
	iResult = dao.insertWrite(dto);
}






dao.close();

if(iResult == 1){
	response.sendRedirect("List.jsp");
}
else{
	JSFunction.alertBack("글쓰기에 실패하였습니다.", out);
}
%>
