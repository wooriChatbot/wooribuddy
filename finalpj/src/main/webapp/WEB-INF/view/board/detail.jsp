<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
</head>
<body style="background-color: #eee;">
	<%@include file="/WEB-INF/view/include/nav.jsp"%>
	<br>
	<br>
	<h3>
		&nbsp;&nbsp;<b>공지사항</b>
	</h3>
	<div class="order-1 p-2">
		<form method="post" action="/board/update">
			<c:if test="${loginUser.grade eq 'ADMIN'}">
				<c:if test="${loginUser.id!=board.user.id  }">
					<div class="p-2 g-col-6">
						<label>&nbsp;작성자: <input type="text"
								value="${board.user.id}" class="form-control"
								disabled="disabled" name="userId"></label><br>
					</div>
					<input type="hidden" name="boardNo" value="${board.boardNo }"
						disabled="disabled">
					<input type="hidden" class="form-control"
						value="${board.user.name }" disabled="disabled">
					<div class="p-2 g-col-6">
						<label>&nbsp;글제목: <input type="text" class="form-control"
								name="title" value="${board.title }" disabled="disabled"></label>
						<br>
					</div>
					<div class="p-2 g-col-6">
						<textarea rows="10" cols="100" class="form-control" name="content"
							disabled="disabled">${board.content }</textarea>
						<br>
					</div>
				</c:if>
				<c:if test="${loginUser.id==board.user.id }">
					<div class="p-2 g-col-6">
						<label>&nbsp;작성자: <input type="text"
								value="${board.user.id }" class="form-control"
								readonly="readonly" name="userId"></label><br>
					</div>
					<input type="hidden" name="boardNo" value="${board.boardNo }"
						readonly="readonly">

					<input type="hidden" class="form-control"
						value="${board.user.name }" readonly="readonly">

					<div class="p-2 g-col-6">
						<label>&nbsp;글제목: <input type="text" class="form-control"
								name="title" value="${board.title }"></label> <br>
					</div>
					<div class="p-2 g-col-6">
						<textarea rows="10" cols="100" class="form-control" name="content"
						style="width: 600px; height: 400px;">${board.content }</textarea>
						<br>
					</div>
					<div class="p-2 g-col-6">
						<input type="submit" class="btn btn-primary mb-3" value="수정">
						<a href="/board/delete?boardNo=${board.boardNo }"><input
								type="button" class="btn btn-primary mb-3" value="삭제"></a>
					</div>
				</c:if>
			</c:if>
			<c:if test="${loginUser.grade ne 'ADMIN' }">
				<div class="p-2 g-col-6">
					<label>&nbsp;작성자: <input type="text"
							value="${board.user.id}" class="form-control" disabled="disabled"
							name="userId"></label><br>
				</div>
				<input type="hidden" name="boardNo" class="form-control"
					value="${board.boardNo }" readonly="readonly" disabled="disabled">

				<input type="hidden" class="form-control"
					value="${board.user.name }" disabled="disabled">

				<div class="p-2 g-col-6">
					<label>&nbsp;글제목: <input type="text" class="form-control"
							name="title" value="${board.title }" disabled="disabled"></label>
					<br>
				</div>
				<div class="p-2 g-col-6">
					<textarea rows="10" cols="100" class="form-control" name="content"
						style="width: 600px; height: 400px;" disabled="disabled">${board.content }</textarea>
					<br>
				</div>
			</c:if>
		</form>

	</div>
</body>
</html>