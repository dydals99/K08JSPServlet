<%@page import="libary.board.LibaryDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="libary.board.LibaryDAO"%>
<%@page import="common.LibConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
LibaryDAO dao = new LibaryDAO(); 
/* LibaryDAO dao = new LibaryDAO(application); */

Map<String, Object> param = new HashMap<String, Object>();

String searchField = request.getParameter("searchField");
String searchWord = request.getParameter("searchWord");
if(searchWord != null){
	param.put("searchField",searchField);
	param.put("searchWord",searchWord);
}
int totalCount = dao.selectCount(param);
List<LibaryDTO> boardLists = dao.selectList(param);
dao.close();
%>
<%-- <% 
	String driver = application.getInitParameter("OracleDriver");
	String url = application.getInitParameter("OracleURL");
	String id = application.getInitParameter("OracleId");
	String pwd = application.getInitParameter("OraclePwd");
%>  --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 공통링크 -->
	<%-- <jsp:include page="../Common/Link.jsp" />   --%>
    
    <h2>목록 보기(List)</h2>
    <!-- 검색폼 -->
    <form method="get">  
    <!-- 게시물 목록 테이블(표) -->
    <table border="1" width="90%">
    <!-- 각 컬럼의 이름 -->
    <tr>
        <td align="center">
            <select name="searchField"> 
                <option value="book_title">제목</option> 
                <option value="book_code">내용</option>
                <option value="book_author">작가</option>
                <option value="book_status">상태</option>
            </select>
            <input type="text" name="searchWord" />
            <input type="submit" value="검색하기" />
        </td>
    </tr>   
    </table>
    </form>
    <table border="1" width="90%">
        <tr>
            <th width="10%">번호</th>
            <th width="10%">책 코드</th>
            <th width="15%">책 장르</th>
            <th width="50%">책 제목</th>
            <th width="10%">작 가</th>
            <th width="15%">책 상태</th>
        </tr>
		<!-- 목록의 내용 -->
<%
//컬렉션에 입력된 데이터가 없는지 확인한다.
if (boardLists.isEmpty()) {
%>
        <tr>
            <td colspan="5" align="center">
                등록된 게시물이 없습니다^^*
            </td>
        </tr>
<%
}
else {
	//출력할 게시물이 있는 경우에는 확장 for문으로 List 컬렉션에 
	//저장된 데이터의 갯수만큼 반복하여 출력한다.
    int virtualNum = 0; 
    for (LibaryDTO dto : boardLists)
    {
    	//현재 출력할 게시물의 갯수에 따라 출력번화는 달라지므로
    	//totalCount를 사용하여 가상번호를 부여한다.
        virtualNum = totalCount--;   
%>
        <tr align="center">
        	
            <td><%= virtualNum %></td>
            <!-- 책 코드 -->  
            <td align="center"><%= dto.getBook_code() %></td>
            <!-- 책 장르 -->
            <td align="center"><%= dto.getBook_genre() %></td>
            <!-- 책 제목 -->
            <td align="center"><%= dto.getBook_title() %></td>
            <!-- 작 가 -->           
            <td align="center"><%= dto.getBook_author() %></td>   
            <!-- 책 상태 -->
            <td align="center"><%= dto.getBook_Status() %></td>    
        </tr>
<%
    }
}
%>
    </table>
   
    <table border="1" width="90%">
        <tr align="right">
            <td><button type="button" onclick="location.href='LibraryWrite.jsp';">책추가
            
                </button></td>
        </tr>
    </table>
</body>
</html>