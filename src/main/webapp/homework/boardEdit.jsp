<%@page import="utils.JSFunction"%>
<%@page import="ex.board.ExDTO"%>
<%@page import="ex.board.ExDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "./ExIsLoggedIn.jsp" %>
<%
String num = request.getParameter("num");

ExDAO dao = new ExDAO(application);

ExDTO dto = dao.selectView(num);

String sessionId = session.getAttribute("UserId").toString();

if(!sessionId.equals(dto.getId())){
	JSFunction.alertBack("작성자 본인만 수정할 수 있습니다.", out);
	return;
}
dao.close();
%>
<!DOCTYPE html>
<html>
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
<div class="container">
    <div class="row">
        <%@ include file="./inc/top.jsp" %>
    </div>
    <div class="row">
        <%@ include file="./inc/left.jsp" %>
        <div class="col-9 pt-3">
            <h3>게시판 내용보기 - <small>자유게시판</small></h3>
            <form name="writeFrm" method="post" action="boardEditProcess.jsp" 
            	onsubmit="return validateForm(this);">
			<input type="hid den" name="num" value="<%= dto.getNum()%>" /> 
            <table class="table table-bordered">
            <colgroup>
                <col width="20%"/>
                <col width="30%"/>
                <col width="20%"/>
                <col width="*"/>
            </colgroup>
            <tbody>
                <tr>
                    <th class="text-center" 
                        style="vertical-align:middle;">작성자</th>
                    <td>
                    <%= dto.getName() %>
                    </td>
                    <th class="text-center" 
                        style="vertical-align:middle;">작성일</th>
                   <td>
                   		<%= dto.getPostdate() %>
                   </td>
                </tr>
                <tr>
                   <!--  <th class="text-center" 
                        style="vertical-align:middle;">이메일</th>
                    <td>
                        whdydals0802@naver.com
                    </td> -->
                    <th class="text-center" 
                        style="vertical-align:middle;">조회수</th>
                    <td>
                    	<%= dto.getVisitcount() %>
                    </td>
                </tr>
                <tr>
                    <th class="text-center" 
                        style="vertical-align:middle;">제목</th>
                    <td colspan="3">
                    	<input type="text" name="title" value="<%= dto.getTitle() %>" />
                    </td>
                </tr>
                <tr>
                    <th class="text-center" 
                        style="vertical-align:middle;">내용</th>
                   	<td colspan="3" height="100">
						<textarea name="content" style="width:90%; height:100px"><%=dto.getContent() %></textarea>
           			</td> 
                </tr>
            </tbody>
            </table>
            <div class="row">
                <div class="col text-right mb-4">
                    <!-- 각종 버튼 부분 -->
                    <button type="submit" class="btn btn-danger">전송하기</button>
                    <button type="button" class="btn btn-warning"
                    	onclick="location.href='boardList.jsp';">리스트보기</button>
                    <button type="reset" class="btn btn-dark">Reset</button>
                </div>
            </div>
            </form> 
        </div>
    </div>
    <div class="row border border-dark border-bottom-0 border-right-0 border-left-0"></div>
    <%@ include file="./inc/copy.jsp" %>
</div>
</body>
</html>