<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="com.example.demo.dao.MoneyDAO"%>
<%@page import="com.example.demo.model.entity.Money"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가계부</title>
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
<style>
.top-container {
	display: flex;
}

/* Style for the left column (registmoney.jsp) */
.left-column {
	flex: 1;
	padding: 10px;
}

/* Style for the right column (list.jsp) */
.right-column {
	flex: 1;
	padding: 10px;
}

/* Style for the bottom section (lists.jsp) */
.bottom-section {
	padding: 10px;
	clear: both;
}
</style>
<body style="background-color: #eee;">
	<%@include file="/WEB-INF/view/include/nav.jsp"%>
	<div class="top-container">
		<div class="left-column">
			<%@include file="/WEB-INF/view/money/registmoney.jsp"%>
			<br>
		</div>
		<c:set var="userId" value="${loginUser.id }" />

		<div class="right-column">
			<br>
			<h3>
				&nbsp;&nbsp;<b>거래 목록</b>
			</h3>
			<br>
			<div class="order-1 p-2">
				<form action="/money/list" method="get">
					<label for="year">Year:</label>
					<input type="number" id="year" name="year" min="2019"
						value="${selectedYear}" class="form-control"
						style="width: 200px; height: 40px;" />
					<label for="month">Month:</label>
					<input type="number" id="month" name="month" min="1" max="12"
						value="${selectedMonth}" class="form-control"
						style="width: 200px; height: 40px;" />
					<input type="hidden" value="${loginUser.id }" readonly="readonly"
						name="userId">
					<br>
					<input type="submit" class="btn btn-primary mb-3" value="Filter">

				</form>
			</div>

		</div>
	</div>
	<div class="bottom-section"></div>
	<%@include file="/WEB-INF/view/money/lists.jsp"%>
	<br>

	
</body>
</html>