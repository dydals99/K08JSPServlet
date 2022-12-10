<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<table > 
    <tr>
        <td align="center">
        <!-- 로그인 여부에 따른 메뉴 변화 -->
        
        <% if (session.getAttribute("UserId") == null) { %>
			<a href="../homework/Exmembership.jsp"><i
					class='bi bi-person-plus-fill' style='font-size: 20px'></i>회원가입</a>
            <a href="../homework/ExLoginForm.jsp"><i
					class='bi bi-box-arrow-in-right' style='font-size: 20px'></i>로그인</a>
        <% 
        } 
        else { 
        	/* session영역에 저장된 속성값이 있다면 로그인 된
        	상태이므로 회원정보 및 로그아웃 버튼을 화면에 출력한다. */
        %>
			<a href="../homework/ExUpdateMemberView.jsp"><i
					class='bi bi-person-lines-fill' style='font-size: 20px'></i>회원정보수정</a>
            <a href="../homework/ExLogout.jsp"><i
					class='bi bi-box-arrow-right' style='font-size: 20px'></i>로그아웃</a>
        <%
        } 
        %>
	        
            <!-- &nbsp;&nbsp;&nbsp; 
            <a href="../09PagingBoard/ExList.jsp">게시판(페이징O)</a>   -->
           <!--  <a href="../homework/boardList.jsp">게시판(페이징X)</a>
             &nbsp;&nbsp;&nbsp;  -->
        
        </td>
    </tr>
</table>
