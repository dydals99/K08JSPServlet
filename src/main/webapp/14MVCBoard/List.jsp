<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원제 게시판</title>
</head>
<body>
   
    <h2>파일 첨부형 게시판 - 현재 페이지 ${ map.pageNum } </h2>
    <form method="get">  
    <table border="1" width="90%">
    <tr>
        <td align="center">
            <select name="searchField"> 
                <option value="title">제목</option> 
                <option value="content">내용</option>
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
            <th width="*">제목</th>
            <th width="15%">작성자</th>
            <th width="10%">조회수</th>
            <th width="15%">작성일</th>
            <th width="8%">첨부</th>
        </tr>
	<c:choose>
		<c:when test="${ empty boardLists }">
		<!-- 게시물을 저장하고 있는 boardLists 컬렉션에 내용이 없다면
		아래 부분을 출력한다. -->
	        <tr>
	            <td colspan="6" align="center"> 
	                등록된 게시물이 없습니다^^*
	            </td>
	        </tr>
	    </c:when>
		<c:otherwise>
			<!-- 게시물이 있을 때 컬렉션에 저장된 목록의 갯수만큼 반복한다. -->
			<c:forEach items="${ boardLists }" var="row" varStatus="loop">
			<!-- 
			가상번호 계산하기 
			=> 전체게시물갯수 - (((페이지번호-1) * 페이지당 게시물수) + 해당루프에 index
			참고로 varStatus 속성의 index는 0부터 시작한다.
			
				전체게시물의 갯수가 5개이고 페이지의 2개씩만 출력한다면..
				1페이지의 첫번재 게시물 번호 : 5 - (((1-1) * 2) + 0) = 5		
				2페이지의 첫번재 게시물 번호 : 5 - (((1-1) * 2) + 0) = 3		
			-->
	        <tr align="center">
	        
	            <!-- 게시물의 가상번호 -->
	            <td>
	            	${ map.totalCount - (((map.pageNum-1) * map.pageSize)
	            		+ loop.index)}
	            </td>  
	            <!-- 제목 -->
	            <td align="left"> 
	            	<!-- 제목을 클릭할 경우 내용보기 페이지로 이동한다.  -->
	                <a href="../mvcboard/View.do?idx=${ row.idx }">
	                	${ row.title }</a> 
	            </td>
	            <!-- 작성자 아이디 -->
	            <td align="center">${ row.name }</td> 
	            <!-- 조회수 -->          
	            <td align="center">${ row.visitcount }</td>  
	            <!-- 작성일 --> 
	            <td align="center">${ row.postdate }</td>    
	            <td>
	            <!-- 첨부파일의 경우 필수사항이 아니므로 테이블생성시에도 nut null조건이
	            적용되어 있지않다. 따라서 첨부파일이 있을때만 다운도르 링크를 출력한다. -->
	            <c:if test="${ not empty row.ofile }">
	            	<a href="../mvcboard/download.do?ofile=${ row.ofile }&sfile=${ row.sfile }&idx=${ row.idx}">[Down]</a>
	            </c:if>
	            </td>
	        </tr>
	        </c:forEach>
		</c:otherwise>
	</c:choose>
    </table>
   
    <table border="1" width="90%">
        <tr align="center">
           <td>
           		<!-- 컨트롤러(서블릿)에서 클래스 호출을 통해 이미 페이지
           		번호가 문자열로 만들어져 있는 상태이므로 뷰(JSP)에서는
           		출력만 해주면된다. -->
           		${ map.pagingImg }
           </td>
            <td width="100"><button type="button" onclick="location.href='../mvcboard/write.do';">
            	글쓰기</button></td>
        </tr>
    </table>
</body>
</html>