<%@page import="ex.board.ExDAO"%>
<%@page import="ex.board.ExDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./ExIsLoggedIn.jsp"%>
<%
String num = request.getParameter("num");

ExDTO dto = new ExDTO();
ExDAO dao = new ExDAO(application);
//본인 확인을 위해 기존 게시물을 인출한다.
dto = dao.selectView(num);

/* session영역에 저장된 회원정보를 얻어온 후 String으로 변환한다.
영역에는 모든 값(객체)를 저장할 수 있도록 Object타입을 사용하므로
사용시 기존의 값으로 형변환해야 한다.*/
String sessionId = session.getAttribute("UserId").toString();

int delResult = 0;

//세션의 아이디와 게시물의 아이디가 일치하면 작성자 본인이므로..
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