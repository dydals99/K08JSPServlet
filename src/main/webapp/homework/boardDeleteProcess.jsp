<%@page import="ex.board.ExDAO"%>
<%@page import="ex.board.ExDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./ExIsLoggedIn.jsp"%>
<%
String num = request.getParameter("num");

ExDTO dto = new ExDTO();
ExDAO dao = new ExDAO(application);
dto = dao.selectView(num);

String sessionId = session.getAttribute("UserId").toString();

int delResult = 0;

if (sessionId.equals(dto.getId())) {
	
   dto.setNum(num);
   
   delResult = dao.deletePost(dto);
   
   dao.close();
   
    if (delResult == 1) {
      JSFunction.alertLocation("삭제되었습니다.", "boardList.jsp", out);
    }
    else {
      JSFunction.alertBack("삭제에 실패하였습니다.", out);
    }
   
}
else {
   /* 작성자 본인이 아니면 삭제할 수 없다. */
   JSFunction.alertBack("본인만 삭제할 수 있습니다.", out);
   return;
}
%>