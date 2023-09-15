<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- bootstrap  -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl"
	crossorigin="anonymous">
<html>
<head>
<meta charset="UTF-8">
<title>Woori Buddy</title>

<!-- <h1>Woori Buddy</h1>  -->
<nav class="navbar navbar-expand-lg bg-secondary ">

	<div class="container-fluid">
		<img src="/resources/image/woori.png" class="rounded float-start"
			alt="my image" width="100"> <a class="navbar-brand" href="/"><h2>
				<b>Woori Buddy</b>
			</h2></a>

		<!-- <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" 
    		aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
    </button>
    
    <div class="collapse navbar-collapse" id="navbarSupportedContent">  -->

		<ul class="navbar-nav me-auto mb-2 mb-lg-0">
			<!-- <li class="nav-item">
        <c:if test="${empty loginUser }">
        <a class="nav-link active" aria-current="page" href="/">&nbsp;Home</a>
         </c:if>
        </li> -->       

			<li class="nav-item">
				<a class="navbar-brand"  aria-current="page" href="/board/list"><b>공지사항</b></a>
			</li>

			<li class="nav-item">
				<c:if test="${!empty loginUser }">
					<a class="nav-link active" aria-current="page" href="/money/list"><b>가계부작성</b></a>
				</c:if>
			</li>

			<li class="nav-item">
				<c:if test="${loginUser.grade eq 'ADMIN'}">
					<a class="nav-link active" aria-current="page" href="/board/regist"><b>게시글등록</b></a>
				</c:if>
			</li>

		</ul>

		<!-- login & logout 처리 -->
		<div>
			<c:if test="${empty loginUser }">

				<div class="col-auto">
					<a href="/user/login"><input type="button"
							class="btn btn-primary mb-3" value="로그인"></a> <a
						href="/user/join"><input type="button"
							class="btn btn-primary mb-3" value="회원가입"></a>
				</div>
			</c:if>
		</div>


		<c:if test="${!empty loginUser }">
			<div class="col-auto">
				<b> ${loginUser.name }님 환영합니다. </b> <a href="/user/mypage"
					style="text-decoration: none"><b>마이페이지</b></a> <a
					href="/user/logout"><input type="button"
						class="btn btn-primary mb-3" value="로그아웃"></a>
			</div>
		</c:if>

	</div>
</nav>
</head>
</html>