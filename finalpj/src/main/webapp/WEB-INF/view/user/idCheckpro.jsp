<%@page import="com.example.demo.dao.UserDAO"%>
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
           h1, h2, h3, h4, h5, h6{
    		font-family: 'Do Hyeon'; /* Use a different font for testing */
		}
</style>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>idCheckProc.jsp</title>
</head>
<body>
	<div style="text-align: center"></div>
	<h3>* 아이디 중복 확인 결과 *</h3>
<%
    //1) 사용가능한 아이디일 경우, 아이디 입력 폼에 넣기 위함
    String id=request.getParameter("id");
    UserDAO dao = new UserDAO();
    int cnt=dao.duplicateID(id);
    out.println("<p>입력 ID : <strong>" + id + "</stong></p>");
    if(cnt==0){
    	out.println("<p>사용 가능한 아이디입니다.</p>");
	out.println("<a href='javascript:apply(\"" + id + "\") 'class='btn btn-primary mb-3'>적용</a>");
%>

	<script>
    	function apply(id){
            //2) 중복확인 id를 부모창에 적용
            //부모창 opener
            opener.document.userInfo.id.value=id;
            window.close(); //창닫기
        }//apply () end
    </script>
 <%
 	}else{
    	out.println("<p style='color: red'>해당 아이디는 사용하실 수 없습니다.</p>");
    }//if end
 %>
 <hr>
 <a href="javascript:history.back()" class="btn btn-primary mb-3" >다시시도</a>
 &nbsp; &nbsp;
 <a href="javascript:window.close()" class="btn btn-primary mb-3" >창닫기</a>
 
 </body>
 </html>