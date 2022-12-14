<%@page import="utils.ListPage"%>
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
	param.put("searchField",searchField);
	param.put("searchWord",searchWord);
}
int totalCount = dao.selectCount(param);

int pageSize = Integer.parseInt(application.getInitParameter("POSTS_PER_PAGE"));
int blockPage = Integer.parseInt(application.getInitParameter("PAGES_PER_BLOCK"));
int totalPage = (int)Math.ceil((double)totalCount / pageSize);

int pageNum = 1;
String pageTemp = request.getParameter("pageNum");
if (pageTemp != null && !pageTemp.equals(""))
   pageNum = Integer.parseInt(pageTemp);

int start = (pageNum - 1) * pageSize + 1;
int end = pageNum * pageSize;
param.put("start", start);
param.put("end", end);
 
List<ExDTO> boardLists = dao.selectListPage(param); 

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
    	<!-- ???????????? ????????? ???????????? -->
        <%@ include file="./inc/top.jsp" %>
    </div>
    <div class="row">
        <%@ include file="./inc/left.jsp" %>
        <div class="col-9 pt-3">
            <h3>????????? ?????? - <small>???????????????</small></h3>

            <div class="row ">
                <!-- ???????????? -->
                <form>
                    <div class="input-group ms-auto" style="width: 400px;">
                        <select name="searchField" class="form-control">
                            <option value="title">??????</option>
                            <option value="id">?????????</option>
                            <option value="content">??????</option>
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
                <!-- ???????????????????????? -->
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
                            <th>??????</th>
                            <th>??????</th>
                            <th>?????????</th>
                            <th>?????????</th>
                            <th>?????????</th>
                        </tr>
                    </thead>
                    <tbody>
						<%
						//???????????? ????????? ???????????? ????????? ????????????.
						if (boardLists.isEmpty()) {
						%>
						        <tr>
						            <td colspan="5" align="center">
						                ????????? ???????????? ????????????^^*
						            </td>
						        </tr>
						<%
						}
						else {
						    int virtualNum = 0; 
						    for (ExDTO dto : boardLists)
						    {
						        virtualNum = totalCount--;   
						%>
						        <tr align="center">
						        	<!-- ???????????? ???????????? -->
						            <td><%= virtualNum %></td>
						            <!-- ?????? -->  
						            <td align="left"> 
						                <a href="boardView.jsp?num=<%= dto.getNum() %>"><%= dto.getTitle() %></a> 
						            </td>
						            <!-- ????????? ????????? -->
						            <td align="center"><%= dto.getId() %></td>
						            <!-- ????????? -->
						            <td align="center"><%= dto.getPostdate() %></td>    
						             <!-- ????????? -->           
						            <td align="center"><%= dto.getVisitcount() %></td>   
						        </tr>
						<%
						    }
						}
						%>
                    </tbody>
                </table>
            </div>
            <div class="row">
                <div class="col d-flex justify-content-end">
                    <!-- ?????? ?????? ?????? -->
                    <button type="button" class="btn btn-primary" onclick="location.href='boardWrite.jsp';">?????????</button>
                    <button type="button" class="btn btn-warning" onclick="location.href='boardList.jsp';">?????????</button>
                </div>
            </div>
				 <div class="col d-flex justify-content-center">
	              <%System.out.println("????????????="+request.getRequestURI()); %>
	              <%= ListPage.pagingStr(totalCount, pageSize, blockPage,  
	                    pageNum, request.getRequestURI()) %>
	            </div>
        </div>
    </div>
    <div class="row border border-dark border-bottom-0 border-right-0 border-left-0"></div>
    <%@ include file="./inc/copy.jsp" %>
</div>
</body>
</html>