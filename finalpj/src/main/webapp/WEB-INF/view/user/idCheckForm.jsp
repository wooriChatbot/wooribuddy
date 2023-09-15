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
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>idCheckForm.jsp</title>
</head>
<body>
	<div style="text-align: center">
	<h3>* 아이디 중복확인 *</h3>
    <form method="post" action="/user/idCheckpro" onsubmit="return blankCheck(this)">
    아이디 : <input type="text" name="id" maxlength="10" autofocus>
    <input type="submit" class="btn btn-primary mb-3" value="중복확인">
    </form>
    </div>
    
    <script>
    function blankCheck(f){
    	var id=f.id.value;
        id=id.trim();
        if(id.length<5){
        	alert("아이디는 5자 이상 입력해주십시오.");
            return false;
        }//if end
        return true;
    }//blankCheck() end
    </script>
 </body>
 </html>