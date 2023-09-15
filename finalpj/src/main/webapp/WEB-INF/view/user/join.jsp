<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
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
<script>

function check_pw(){

    var pw = document.getElementById('pw').value;
    var SC = ["!","@","#","$","%"];
    var check_SC = 0;

    if(pw.length < 6 || pw.length>16){
        window.alert('비밀번호는 6글자 이상, 16글자 이하만 이용 가능합니다.');
        document.getElementById('pw').value='';
    }
    for(var i=0;i<SC.length;i++){
        if(pw.indexOf(SC[i]) != -1){
            check_SC = 1;
        }
    }
    if(check_SC == 0){
        window.alert('!,@,#,$,% 의 특수문자가 들어가 있지 않습니다.')
        document.getElementById('pw').value='';
    }
    if(document.getElementById('pw').value !='' && document.getElementById('pwcheck').value!=''){
        if(document.getElementById('pw').value==document.getElementById('pwcheck').value){
            document.getElementById('check').innerHTML='비밀번호가 일치합니다.'
            document.getElementById('check').style.color='blue';
        }
        else{
            document.getElementById('check').innerHTML='비밀번호가 일치하지 않습니다.';
            document.getElementById('check').style.color='red';
            document.getElementById('pwcheck').value="";
            
        }
    }
}

function idCheck(){
    //새창 만들기
    window.open("/user/idCheckForm", "idwin", "width=400, height=350");
  }

function oninputPhone(target) {
    target.value = target.value
        .replace(/[^0-9]/g, '')
        .replace(/(^02.{0}|^01.{1}|[0-9]{3,4})([0-9]{3,4})([0-9]{4})/g, "$1-$2-$3");
}

</script>
<body style="background-color: #eee;">
	<%@include file="/WEB-INF/view/include/nav.jsp" %>
	<form action="/user/join" method="post" name="userInfo">
		<div align="center" >
			<br>
			<h2>회원가입</h2>
			<br>

			<table>
				<tr>
					<td id="title">
						<b style="color: red;">*</b>&nbsp;아이디&nbsp;
					</td>
					<td>
						<div class="row g-3">
							<div class="col-auto">
								<input type="text" name="id" maxlength="50" class="form-control"
									id="id" readonly="readonly" placeholder="ID 입력 하세요.">
							</div>
							<div class="col-auto">
								<button class="btn btn-primary mb-1" type="button"
									onclick=idCheck()>ID입력</button>
							</div>
						</div>
					</td>
				</tr>

				<tr>

					<td id="title">
						<b style="color: red;">*</b>&nbsp;비밀번호&nbsp;
					</td>
					<td>
						<input type="password" name="pw" id="pw" class="form-control"
							placeholder="PW 입력 하세요." maxlength="50" required>
					</td>
				</tr>

				<tr>
					<td id="title">
						<b style="color: red;">*</b>&nbsp;비밀번호 확인&nbsp;&nbsp;
					</td>
					<td>
						<input type="password" name="pwcheck" id="pwcheck"
							placeholder="PW 한번 더 입력 하세요." class="form-control" maxlength="50"
							onchange="check_pw()" required>
						<span id="check"></span>
					</td>
				</tr>

				<tr>
					<td id="title">
						<b style="color: red;">*</b>&nbsp;이름&nbsp;
					</td>
					<td>
						<input type="text" name="name" id="name" class="form-control"
							placeholder="이름을 입력하세요." maxlength="50" required>
					</td>
				</tr>

				<tr>
					<td id="title">
						<b style="color: red;">*</b>&nbsp;휴대전화&nbsp;
					</td>
					<td>
						<input type="text" name="phoneNo" id="phoneNo"
							class="form-control" placeholder="-없이 입력하세요" oninput="oninputPhone(this)" maxlength="13"
							required />
					</td>
				</tr>

				<tr>
					<td>
						<input type="hidden" type="text" name="grade" class="form-control"
							value="GUEST" id="grade" />
					</td>
				</tr>

			</table>
		</div>

		<br>
		<div align="center">
			<input type="submit" id="submit" class="btn btn-primary mb-3"
				value="회원가입">
			<input type="reset" onclick="alert('초기화 했습니다.')"
				class="btn btn-primary mb-3" value="다시 입력">
			<a href="/"><input type="button" class="btn btn-primary mb-3"
					value="처음으로"></a>
		</div>
	</form>
</body>
</html>