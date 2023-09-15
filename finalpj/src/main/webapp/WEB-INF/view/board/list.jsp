<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body style="background-color: #eee;">
	<%@include file="/WEB-INF/view/include/nav.jsp"%>
	<br>
	<div class="order-1 p-2 container">
		<div class="container mt-4">
			<!-- 검색 폼 -->
			<form action="/board/search" method="GET">
				<div class="input-group mb-3" style="width: 300px; float: right;">
					<input type="text" class="form-control" placeholder="게시물 검색"
						name="keyword">
					<div class="input-group-append">
						<button class="btn btn-outline-secondary" type="submit">검색</button>
					</div>
				</div>
			</form>
		</div>
		<c:if test="${empty searchResults}">
			<h3>
				&nbsp;<b>공지사항</b>
			</h3>
			<br>
			<table class="table table-striped">
				<thead>
					<tr>
						<td>제목</td>
						<td>작성자</td>
					</tr>
				</thead>
				<c:forEach items="${pageInfo.content }" var="board">
					<tr>
						<td>
							<a href="/board/detail?boardNo=${board.boardNo }">${board.title}</a>
						</td>
						<td>${board.user.name }</td>

					</tr>

				</c:forEach>

			</table>
			<form action="/board/list" method="get">
				&nbsp;&nbsp;
				<input type="text" name="page" value="${pageInfo.number +1 }">
				/${pageInfo.totalPages }
				<input type="submit" class="btn btn-primary mb-3" value="이동">
			</form>
		</c:if>
		<c:if test="${!empty searchResults}">
			<div class="container mt-4">

				<!-- 검색 결과 -->
				<div class="row">
					<div class="col">
						<h3>검색 결과</h3>
						<table class="table table-striped">
							<thead>
								<tr>
									<th>제목</th>
									<th>내용</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="board" items="${searchResults}">
									<tr>
										<td>${board.title}</td>
										<td>${board.content}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
				<a href="/board/list" class="btn btn-primary">목록</a>
			</div>
		</c:if>
	</div>

</body>
</html>