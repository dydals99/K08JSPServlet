<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<table > 
    <tr>
        <td align="center">
        
        <% if (session.getAttribute("UserId") == null) { %>
			<a href="../homework/Exmembership.jsp"><i
					class='bi bi-person-plus-fill' style='font-size: 20px'></i>회원가입</a>
            <a href="../homework/ExLoginForm.jsp"><i
					class='bi bi-box-arrow-in-right' style='font-size: 20px'></i>로그인</a>
        <% 
        } 
        else { 
        %>
			<a href="../homework/ExUpdateMember.jsp"><i
					class='bi bi-person-lines-fill' style='font-size: 20px'></i>회원정보수정</a>
            <a href="../homework/ExLogout.jsp"><i
					class='bi bi-box-arrow-right' style='font-size: 20px'></i>로그아웃</a>
        <%
        } 
        %>
        </td>
    </tr>
</table>
