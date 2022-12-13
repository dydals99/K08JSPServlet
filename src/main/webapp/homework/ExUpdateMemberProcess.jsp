<%@page import="utils.JSFunction"%>
<%@page import="ex.board.MbDAO"%>
<%@page import="ex.board.MbDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String id = request.getParameter("id");
String pass = request.getParameter("pass");
String name = request.getParameter("name");
String date = request.getParameter("date");

MbDTO dto = new MbDTO();
dto.setId(id);
dto.setPass(pass);
dto.setName(name);

MbDAO dao = new MbDAO(application);

int affected = dao.updateMember(dto); 

dao.close();

if(affected == 1){
	
	JSFunction.alertLocation("회원정보수정완료", "boardList.jsp", out); 
}
else{
	JSFunction.alertBack("회원수정하기에 실패하였습니다.", out);
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>