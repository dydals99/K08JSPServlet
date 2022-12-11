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
<script type="text/javascript">
function validateForm(form) {  
	if(form.id.value==""){
		alert("작성자를 입력하세요");
	   form.id.focus();
		return false;
	}
    if (form.pass.value == "") {
        alert("비밀번호를 입력하세요.");
        form.pass.focus();
        return false;
    }
    if (form.name.value == "") {
        alert("사용자명을 입력하세요.");
        form.name.focus();
        return false;
    }
}
</script>   
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
				  <h2 style="text-align: center; font-weight: bold ">회원가입</h2>
				  <div class="container mt-3 d-flex justify-content-center" 
				  	>
					  <form action="ExmembershipProcess.jsp"
					  	method="post" onsubmit="return validateForm(this);" name="member">
					    <div class="mb-3" >
					      <input type="text" class=" form-control"
					      	placeholder="아이디" name="id" style="width:300px;">
					    </div >
					    <div class="mb-3">
					      <input type="password" class="form-control" 
					      	placeholder="비밀번호" name="pass" style="width:300px;">
					    </div>
					    <div class="mb-3">
					      <input type="text" class="form-control" 
					      	placeholder="회원이름" name="name" style="width:300px;">
					    </div>
					    
					    <div class="mb-5">
					    <button type="submit" class="btn btn-primary" style=" width:300px;"
					     >회원가입</button>
					    <hr />
					    </div>
					  </form>
					</div>
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