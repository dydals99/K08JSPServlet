<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<fieldset>
<!-- Error500.jsp?name='honggildong'&age=20     -->
<form action="Error500.jsp"method="POST">
당신의 10년후 나이는?
<br>
<label for="name">이름 :</label>
<input type="text" name="name" placeholder="당신의 이름을 입력하세요">
<label for="age">나이 :</label>
<input type="number" name="age" placeholder="현재나이를입력하세요">
<button type="submit">보내기</button>
</form>
</fieldset>
</body>
</html>