<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정 스레드</title>
<link rel="stylesheet" href="./css/edit.css">
</head>
<body>
	<h1><img onclick="location.href='./thread'" alt="" src="./img/x.png">&nbsp;수정 스레드</h1>
	<hr>
	<form action="./edit" method="post" onsubmit="return check()">
		<div id="thread">
			<img alt="" src="./img/profile.png">
			<div id="m_id">${dto.m_id }</div>
			<div class="container">
				<textarea cols="50" rows="8" maxlength="500" name="bcontent"
				class="content" required="required" placeholder="스레드를 시작하세요...">${dto.bcontent }</textarea>
				<br><img alt="" src="./img/clip.png"><br>
			</div>
		<button type="submit" class="writebtn">게시</button>
		<input type="hidden" name="bno" value="${dto.bno }">
		</div>
	</form>
</body>
</html>