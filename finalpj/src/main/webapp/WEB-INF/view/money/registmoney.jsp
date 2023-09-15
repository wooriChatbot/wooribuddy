<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가계부</title>

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
<script>
	$(function() {
		$("#date").datepicker({
			maxDate : 0
		});
	});

	function check_submit() {
		var moneyType = document.getElementById("moneyType");
		console.log();
		if (moneyType.value === "") {
			alert("수입/지출을 선택해주세요.");
			moneyType.focus();
			console.log();
			return false;
		}
	}
</script>
</head>
<body>
	<br>
	<h3>
		&nbsp;&nbsp;<b>가계부 등록</b>
	</h3>
	<div class="order-1 p-2">
		<form method="post" action="/money/regist"
			onsubmit="return check_submit();">
			<fieldset>
				<label><input type="hidden" value="${loginUser.id }"
						readonly="readonly" name="userId" required></label>
				<legend>
					<select class="form-select form-select-sm"
						aria-label=".form-select-sm example"
						style="width: 200px; height: 40px;" name="moneyType"
						id="moneyType" required>
						<option value="">수입/지출 선택</option>
						<option value="income">수입</option>
						<option value="expense">지출</option>
					</select>
				</legend>
				Date:
				<input type="text" id="date" name="days" class="form-control"
					style="width: 200px; height: 40px;" required>
				<label>금액: <input type="number" name="money" required
						class="form-control" style="width: 200px; height: 40px;"></label><br> 
						<label>분류: <select
						name="type" id="type" class="form-select form-select-sm"
						aria-label=".form-select-sm example"
						style="width: 200px; height: 40px;" required>
						<option value="">=== 선택 ===</option>
						<option value="company">회사</option>
						<option value="pin">용돈</option>
						<option value="alba">아르바이트</option>
						<option value="stock">주식</option>
						<option value="food">음식</option>
						<option value="hobby">취미활동</option>
						<option value="shopping">쇼핑</option>
						<option value="hospital">병원</option>
						<option value="traffic">교통</option>
						<option value="else">기타</option>
					</select>
				</label><br> <br>
				<input type="submit" class="btn btn-primary mb-3" value="OK"
					id="submit"">
				<a href="/"><input type="button" class="btn btn-primary mb-3"
						value="처음으로"></a>
			</fieldset>
		</form>

	</div>

</body>
</html>