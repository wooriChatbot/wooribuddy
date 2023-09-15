<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body style="background-color: #eee;">
	<%@include file="/WEB-INF/view/include/nav.jsp" %>
	<br><br>
	<div class="order-1 p-2">
		<h3>&nbsp;&nbsp;<b>공지사항 등록</b></h3>
		<form method="post" action="/board/regist"><br>
			<div class="p-2 g-col-6">
				<label>&nbsp;작성자: <input type="text" value="${loginUser.id }" class="form-control" readonly="readonly" name="userId"></label><br>
			</div>
			<div class="p-2 g-col-6">	
				<label>&nbsp;글제목: <input type="text" name="title" class="form-control" placeholder="제목을 입력하세요."></label><br>
			</div>
			<div class="p-2 g-col-6">
				<textarea rows="10" cols="50" class="form-control" name="content"
				 style="width: 600px; height: 400px;"></textarea><br> 
			</div>
			<div class="p-2 g-col-6">
				<input type="submit" class="btn btn-primary mb-3" value="등록">
				<a href="/"><input type="button" class="btn btn-primary mb-3" value="취소"></a>
			</div>
		</form>
	</div>
</body>
</html>