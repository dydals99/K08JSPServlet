<%@page import="ex.board.MbDAO"%>
<%@page import="ex.board.MbDTO"%>
<%@page import="utils.JSFunction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//변수 id에 id값을 가져옴
String id = request.getParameter("id");
//dao객체생성
MbDAO dao = new MbDAO(application);

//dto 객체에 select쿼리를 id값을 매개변수로 넣어줌
MbDTO dto = dao.selectId(id); 

//자원해제
dao.close();

 
if(dto.getId() == null){
	
	JSFunction.alertClose("사용가능", out); 
	
}
else{
	
	JSFunction.alertClose("불가능", out);
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
function IdUse() {
	
	
	
}

</script>
<h3>아이디 중복확인</h3> 
	<form name="overlapFrm">
        <input type="text" size="20" value="<%=request.getParameter("id") %>">
        <input type="button" name="id" value="확인" onclick="IdUse();">
    </form>
</body>
</html>