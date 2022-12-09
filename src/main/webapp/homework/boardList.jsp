<%@page import="ex.board.ExDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="ex.board.ExDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
ExDAO dao = new ExDAO(application);

Map<String, Object> param = new HashMap<String, Object>();

String searchField = request.getParameter("searchField");
String searchWord = request.getParameter("searchWord");
if(searchWord != null){
	/* Map컬렉션에 컬럼명과 검색어를 추가한다.  */
	param.put("searchField",searchField);
	param.put("searchWord",searchWord);
}
//Map컬렉션을 인수로 게시물의 갯수를 카운트한다.
int totalCount = dao.selectCount(param);
//목록에 출력할 게시물을 추출하여 반환받는다.
List<ExDTO> boardLists = dao.selectList(param); 
//자원해제 
dao.close();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">    
</head>
<body>
<div class="container">
    <div class="row">
    	<!-- 상단부분 네비바 인클루드 -->
        <%@ include file="./inc/top.jsp" %>
    </div>
    <div class="row">
        <%@ include file="./inc/left.jsp" %>
        <div class="col-9 pt-3">
            <h3>게시판 목록 - <small>자유게시판</small></h3>

            <div class="row ">
                <!-- 검색부분 -->
                <form>
                    <div class="input-group ms-auto" style="width: 400px;">
                        <select name="searchField" class="form-control">
                            <option value="title">제목</option>
                            <option value="id">작성자</option>
                            <option value="content">내용</option>
                        </select>
                        <input type="text" name="searchWord" class="form-control" style="width: 150px;"/>
                        <div class="input-group-btn">
                            <button type="submit" class="btn btn-secondary">
                                <i class="bi bi-search" style='font-size:20px'></i>
                            </button>
                        </div>
                    </div>
                </form>
            </div>
            <div class="row mt-3 mx-1">
                <!-- 게시판리스트부분 -->
                <table class="table table-bordered table-hover table-striped">
                    <colgroup>
                        <col width="60px" />
                        <col width="*" />
                        <col width="120px" />
                        <col width="120px" />
                        <col width="80px" />
                    </colgroup>
                    <thead>
                        <tr style="background-color: rgb(133, 133, 133); " class="text-center text-white">
                            <th>번호</th>
                            <th>제목</th>
                            <th>작성자</th>
                            <th>작성일</th>
                            <th>조회수</th>
                        </tr>
                    </thead>
                    <tbody>
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
						    for (ExDTO dto : boardLists)
						    {
						    	//현재 출력할 게시물의 갯수에 따라 출력번화는 달라지므로
						    	//totalCount를 사용하여 가상번호를 부여한다.
						        virtualNum = totalCount--;   
						%>
						        <tr align="center">
						        	<!-- 게시물의 가상번호 -->
						            <td><%= virtualNum %></td>
						            <!-- 제목 -->  
						            <td align="left"> 
						                <a href="boardView.jsp?num=<%= dto.getNum() %>"><%= dto.getTitle() %></a> 
						            </td>
						            <!-- 작성자 아이디 -->
						            <td align="center"><%= dto.getId() %></td>
						            <!-- 작성일 -->
						            <td align="center"><%= dto.getPostdate() %></td>    
						             <!-- 조회수 -->           
						            <td align="center"><%= dto.getVisitcount() %></td>   
						        </tr>
						<%
						    }
						}
						%>
                      <%--   <%for(int i=1 ; i<=5 ; i++){ %>
                        <!-- 리스트반복 -->
                        <tr>
                            <td class="text-center"><%=i %></td>
                            <td class="text-left"><a href="boardView.html">제목</a></td>
                            <td class="text-center">작성자</td>
                            <td class="text-center">작성일</td>
                            <td class="text-center">조회수</td>
                            <td class="text-center"><i class="bi bi-pin-angle-fill" style="font-size:20px"></i></td>
                        </tr>
                        <% } %>  --%>
                    </tbody>
                </table>
            </div>
            <div class="row">
                <div class="col d-flex justify-content-end">
                    <!-- 각종 버튼 부분 -->
                    <button type="button" class="btn btn-primary" onclick="location.href='boardWrite.jsp';">글쓰기</button>
                    <button type="button" class="btn btn-warning" onclick="location.href='boardList.jsp';">리스트</button>
                </div>
            </div>
            <div class="row mt-3">
                <div class="col">
                    <!-- 페이지번호 부분 -->
                    <ul class="pagination justify-content-center">
                        <li class="page-item">
                            <a href="#" class="page-link"><i class='bi bi-skip-backward-fill'></i></a>
                        </li>
                        <li class="page-item">
                            <a href="#" class="page-link"><i class='bi bi-skip-start-fill'></i></a>
                        </li>
                        <li class="page-item"><a href="#" class="page-link">1</a></li>
                        <li class="page-item active"><a href="#" class="page-link">2</a></li>
                        <li class="page-item"><a href="#" class="page-link">3</a></li>
                        <li class="page-item"><a href="#" class="page-link">4</a></li>
                        <li class="page-item"><a href="#" class="page-link">5</a></li>
                        <li class="page-item">
                            <a href="#" class="page-link"><i class='bi bi-skip-end-fill'></i></a>
                        </li>
                        <li class="page-item">
                            <a href="#" class="page-link"><i class='bi bi-skip-forward-fill'></i></a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <div class="row border border-dark border-bottom-0 border-right-0 border-left-0"></div>
    <%@ include file="./inc/copy.jsp" %>
</div>
</body>
</html>