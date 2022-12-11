<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ExloginForm</title>
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
	   	<!-- 좌측부분 네비바 인클루드 -->
	       <%@ include file="./inc/left.jsp" %>
	       <div class="col-9 pt-3">
	            <div class="row ">
				  <span style="color:red; font-size:1.2em;">
				     <%=request.getAttribute("LoginErrMsg")== null ? "" : request.getAttribute("LoginErrMsg")%>
				  </span>
				  <%
				  if(session.getAttribute("UserId") == null){
				  %>
				  <script>
				  function validateForm(form){
				     if(!form.user_id.value){
				        alert("아이디를 입력하세요.");
				        form.user_id.focus();
				        return false;
				     }
				     if(form.user_pw.value==""){
				        alert("패스워드를 입력하세요");  
				        form.user_pw.focus();
				        return false;
				     }
				  }
				  </script>
				  <h2 style="text-align: center; font-weight: bold ">TJOEUN LOGIN</h2>
				  <div class="container mt-3 d-flex justify-content-center" >
					  <form action="ExLoginProcess.jsp" method="post" name="loginFrm"
					   	onsubmit="return validateForm(this);"  >
					    <div class="mb-2 mt-2" >
					      <input type="text" class=" form-control"
					      	placeholder="아이디" name="user_id" style="width:300px;">
					    </div >
					    <div class="mb-3">
					      <input type="password" class="form-control" 
					      	placeholder="비밀번호" name="user_pw" style="width:300px;">
					    </div>
					    <div class="mb-5">
					    <button type="submit" class="btn btn-primary" value="login" style=" width:300px;"
					     >login</button>
					    <hr />
					    </div>
					  </form>
					</div>
				  <%
				  }
				  else{
				  %>
				     <%=session.getAttribute("UserName")%>님, 환영합니다.
				     
				  <%
				  }
				  %>
	            </div>
		           <div class="row mt-3 mx-1">
		          
		           </div>
	       </div>
	   </div>
    <div class="row border border-dark border-bottom-0 border-right-0 border-left-0"></div>
    <!-- 하단 카피라이트 부분 네비바 인클루드 -->
    <%@ include file="./inc/copy.jsp" %>
</div>
</body>
</html>