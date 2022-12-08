<%@page import="libary.board.LibaryDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<!-- JSP최상단에 인클루드 하여 로그인 정보가 없다면 즉시
로그인 페이지로 이동시킨다. -->
<%
LibaryDTO dto = new LibaryDTO();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원제 게시판</title>
<script type="text/javascript">
function validateForm(form) {  // 폼 내용 검증
    if (form.book_code.value == "") {
        alert("책코드를 입력하세요.");
        form.book_code.focus();
        return false;
    }
    if (form.book_genre.value == "") {
        alert("장르번호를 입력하세요(ex)01 ,02, 03)");
        form.book_genre.focus();
        return false;
    }
    if (form.book_title.value == "") {
        alert("책 제목을 입력해주세요.");
        form.book_title.focus();
        return false;
    }
    if (form.book_author.value == "") {
        alert("작가 이름을 입력해주세요.");
        form.book_author.focus();
        return false;
    }
    if (form.book_Status.value == "") {
        alert("책상태를 입력해주세요.");
        form.book_Status.focus();
        return false;
    }
}
</script>
</head>
<body>
<h2>회원제 게시판 - 글쓰기(Write)</h2>
<form name="writeFrm" method="post" action="LibraryWriteProcess.jsp"
      onsubmit="return validateForm(this);">
    <table border="1" width="90%">
        <tr>
            <td>책 코드</td>
            <td>
                <input type="text" name="book_code" style="width: 90%;" />
            </td>
        </tr>
        <tr>
            <td>책 장르</td>
            <td>
                <select name="book_genre" style="width: 91%;">
	                <option value="03">교육</option>	
	                <option value="02">판타지</option>	
	                <option value="01">무협</option>	
                </select>
                
            </td>
        </tr>
        <tr>
            <td>책 제목</td>
            <td>
                <input type="text" name="book_title" style="width: 90%;" />
            </td>
        </tr>
        <tr>
            <td>작 가</td>
            <td>
                <input type="text" name="book_author" style="width: 90%;" />
            </td>
        </tr>
        <tr>
            <td>책 상태</td>
            <td>
            	<input type="text" name="book_status" value="B101" style="width: 90%;"/>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <button type="submit">작성 완료</button>
                <button type="reset">다시 입력</button>
                <button type="button" onclick="location.href='LibraryList.jsp';">
                    목록 보기</button>
            </td>
        </tr>
    </table>
</form>
</body>
</html>
