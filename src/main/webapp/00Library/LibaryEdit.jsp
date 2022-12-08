<%@page import="libary.board.LibaryDTO"%>
<%@page import="libary.board.LibaryDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//수정할 게시물의 책코드를(primary key)를 가져온다
String num = request.getParameter("book_code");
//DAO 객체 생성
LibaryDAO dao = new LibaryDAO();

//기존 게시물의 내용을 읽어온다.
LibaryDTO dto = dao.selectView("book_code");

//자원해제
dao.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function validateForm(form) {
	if(form.title.value == ""){
		alert("제목을 입력하세요.");
		form.title.focus();
		return false;
	}
	if(form.content.value==""){
		alert("내용을 입력하세요.");
		form.content.focus();
		return false;
	}
}
</script>
</head>
<body>
<jsp:include page="../Common/Link.jsp" />
<h2>회원제 게시판 - 수정하기(Edit)</h2>
<%-- <form name="writeFrm" method="post" action="EditProcess.jsp" 
		onsubmit="return validateForm(this);">
<!-- 
게시물의 일련번호를 서버로 전송하기 위해서 hidden타입의 input이
반드시 필요하다.
 -->	
<input type="hid den" name="num" value="<%= dto.getNum()%>" />
	<table border="1" width="90%">
		<tr>
			<td>제목</td>
			<td>
				<input type="text" name="title" style="width: 90%;"
					value="<%= dto.getTitle() %>" />
			</td>
		</tr>
		<tr>
			<td>내용</td>
			<td>
				<textarea name="content" style="width:90%; height:100px"><%=dto.getContent() %></textarea>
			</td>		
		</tr>
		<tr>
			<td colspan="2" align="center">
				<button type="submit">작성 완료</button>
				<button type="reset">다시 입력</button>
				<button type="button" onclick="location.href='List.jsp';">
					목록 보기</button>
			</td>
		</tr>
	</table>
</form> --%>
</body>
</html>