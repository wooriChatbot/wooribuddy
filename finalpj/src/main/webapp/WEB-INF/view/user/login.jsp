<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
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

	<div class="container d-flex align-items-center flex-column">
		<form method="post" action="/user/login" class="row g-3">
			<div align="center">
				<br>
				<h2>로그인</h2>
				<c:if test="${!empty loginmsg }">
         ${loginmsg }
      </c:if>
				<table>
					<tr>
						<td id="title">&nbsp;아이디&nbsp;</td>
						<td>
							<div class="row g-3">
								<div class="col-auto">
									<input type="text" name="id" class="form-control"
										placeholder="ID 입력" required>
								</div>
						</td>
					</tr>

					<tr>

						<td id="title">&nbsp;비밀번호&nbsp;</td>
						<td>
							<input type="password" name="pw" class="form-control"
								placeholder="PW 입력" required>
						</td>
					</tr>
				</table>
				<br>
				<input type="submit" value="로그인" class="btn btn-primary mb-3">
			</div>
		</form>
	</div>

</body>
</html>