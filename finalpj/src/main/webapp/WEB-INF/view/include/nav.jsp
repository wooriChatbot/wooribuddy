
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
 <!-- Favicon-->
 <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
 <!-- Font Awesome icons (free version)-->
 <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
 <!-- Core theme CSS (includes Bootstrap)-->
 <link href="${pageContext.request.contextPath}/resources/css/styles.css" rel="stylesheet" />

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
 <style>
        *{
            font-family: 'Do Hyeon';
        }
           h1, h2, h3, h4, h5, h6 {
    		font-family: 'Do Hyeon'; /* Use a different font for testing */
		}
</style>
<nav class="navbar navbar-expand-lg bg-secondary text-uppercase "
	id="mainNav">
	<div class="container">
		<img src="/resources/image/woori.png" class="rounded float-start"
			alt="my image" width="80"> <a class="navbar-brand" href="/">Woori
			Buddy</a>
		<button
			class="navbar-toggler text-uppercase font-weight-bold bg-primary text-white rounded"
			type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarResponsive" aria-controls="navbarResponsive"
			aria-expanded="false" aria-label="Toggle navigation">
			Menu <i class="fas fa-bars"></i>
		</button>
		<div class="collapse navbar-collapse" id="navbarResponsive">
			<ul class="navbar-nav ms-auto">
			
				<li class="nav-item mx-0 mx-lg-1">
						<a class="nav-link py-3 px-0 px-lg-3 rounded" href="/">Home</a>
				</li>
			
				<li class="nav-item mx-0 mx-lg-1">
						<a class="nav-link py-3 px-0 px-lg-3 rounded" href="/board/list">Notice</a>
				</li>

				<c:if test="${loginUser.grade eq 'ADMIN'}">
					<li class="nav-item mx-0 mx-lg-1">
						<a class="nav-link py-3 px-0 px-lg-3 rounded" href="/board/regist">Board</a>
					</li>
				</c:if>
		
				
				<c:if test="${!empty loginUser }">
					<li class="nav-item mx-0 mx-lg-1">
						<a class="nav-link py-3 px-0 px-lg-3 rounded" href="/money/list">Money</a>
					</li>
				</c:if>
				
				<c:if test="${!empty loginUser }">
					<li class="nav-item mx-0 mx-lg-1">
						<a class="nav-link py-3 px-0 px-lg-3 rounded" href="/chatbot/chat">Chatbot</a>
					</li>
				</c:if>
				
				<c:if test="${empty loginUser }">
					<li class="nav-item mx-0 mx-lg-1">
						<c:if test="${empty loginUser }">
							<a class="nav-link py-3 px-0 px-lg-3 rounded" href="/user/login">login</a>
						</c:if>
					</li>
					<li class="nav-item mx-0 mx-lg-1">
						<c:if test="${empty loginUser }">
							<a class="nav-link py-3 px-0 px-lg-3 rounded" href="/user/join">Join</a>
						</c:if>
					</li>
				</c:if>
				<c:if test="${!empty loginUser }">
					<li class="nav-item mx-0 mx-lg-1">
						<c:if test="${!empty loginUser }">
							<a class="nav-link py-3 px-0 px-lg-3 rounded" href="/user/mypage">My
								page</a>

						</c:if>
					</li>
				</c:if>
				<c:if test="${!empty loginUser }">
					<li class="nav-item mx-0 mx-lg-1">
						<c:if test="${!empty loginUser }">
							<a class="nav-link py-3 px-0 px-lg-3 rounded" href="/user/logout">logout</a>

						</c:if>
					</li>
				</c:if>

			</ul>
		</div>
	</div>
</nav>