<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 창입니다.</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
<script type="text/javascript">

function check(){
	//alert("!")
	let msg = document.getElementById("msg");
	let id = document.getElementById("id");
	let pw = document.getElementById("pw");
	
	//alert(id.value);
	//alert(id.value.length);
	if(id.value.length < 3){
		alert("아이디는 3글자 이상이여야 합니다.");
		msg.innerHTML = text;
		
		id.focus();
		return false;
	}
	if(pw.value.length < 3){
		alert("암호는 3글자 이상이여야 합니다.");
		pw.focus();
		return false;
	}

}

</script>
</head>
<body style="background-color: #fffbe6;">

<div class="lg-img">
		<img alt="" src="./img/Threads_logo.png" height="60px">
	</div>
	<br>
<%@ include file="menu.jsp"%>
<hr>
<h1>로그인</h1>
	<form action="./login" method="post" onsubmit="return check()">
	<input type="text" name="id" id="id" placeholder="아이디를 입력하세요" onchange="checkID()"><br>
	<input type="password" name="pw" id="pw" placeholder="패스워드를 입력하세요" ><br>
	<button type="submit" class="login">로그인하기</button>
	<span id="msg"></span>
	</form>

	<a href="./findID">아이디 찾기 | </a>
	<a href="findPW">비밀번호 찾기 | </a>
	<a href="./join">회원가입</a>
</body>
</html>