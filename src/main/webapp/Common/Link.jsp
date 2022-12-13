<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<table border="1" width="90%"> 
    <tr>
        <td align="center">
        <!-- 로그인 여부에 따른 메뉴 변화 -->
        <% if (session.getAttribute("UserId") == null) { %>
            <a href="../06Session/LoginForm.jsp">로그인</a>
        <% } else { 
        	/* session영역에 저장된 속성값이 있다면 로그인 된
        	상태이므로 회원정보 및 로그아웃 버튼을 화면에 출력한다. */
        %>
            <a href="../06Session/Logout.jsp">로그아웃</a>
        <% } %>
            <!-- 8장과 9장의 회원제 게시판 프로젝트에서 사용할 링크 -->
            &nbsp;&nbsp;&nbsp; 
            <a href="../08Board/List.jsp">게시판(페이징X)</a>
            &nbsp;&nbsp;&nbsp; 
            <a href="../09BoardPaging/List.jsp">게시판(페이징O)</a>
        </td>
    </tr>
</table>
