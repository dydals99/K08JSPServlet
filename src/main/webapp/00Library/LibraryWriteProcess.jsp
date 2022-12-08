<%@page import="utils.JSFunction"%>
<%@page import="libary.board.LibaryDAO"%>
<%@page import="libary.board.LibaryDTO"%>
<%@page import="model1.board.BoardDAO"%>
<%@page import="model1.board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 글쓰기 페이지에 오랫동안 머물러 세션이 삭제되는 경우가 
있으므로 글쓰기 처리 페이지에서도 반드시 로그인을 확인해야된다. -->
<%
//클라이언트가 작성한 폼값을 받는다.
String code = request.getParameter("book_code");
String genre = request.getParameter("book_genre");
String title = request.getParameter("book_title");
String author = request.getParameter("book_author");
String status = request.getParameter("book_status");

//폼값을 DTO객체에 저장한다.
LibaryDTO dto = new LibaryDTO();

dto.setBook_code(code);
dto.setBook_genre(genre);
dto.setBook_title(title);
dto.setBook_author(author);
dto.setBook_Status(status);

//DB연결을 위해 DAO객체를 생성한다.
LibaryDAO dao = new LibaryDAO();
//입력값이 저장된 DTO객체를 인수로 전달하여 insert쿼리문을 실행한다.
int iResult = dao.insertWrite(dto);
//자원해제
dao.close();

if(iResult == 1){
	//입력에 성공한 경우 리스트로 이동하여 새롭게 등록된 게시물을
	//확인한다.
	response.sendRedirect("LibraryList.jsp");
}
else{
	//실패했다면 재입력을 위해 글쓰기 페이지로 다시 돌아간다.
	JSFunction.alertBack("책추가에 실패했습니다...", out);
}
%>
