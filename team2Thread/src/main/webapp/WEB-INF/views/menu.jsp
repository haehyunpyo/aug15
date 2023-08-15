<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<link rel="stylesheet" href="./css/menu.css">

<div class="nav-menu">
<nav>
	<ul>
		<li onclick="link('')"><img alt="" src="./img/home.png" height="50px"></li>
		<li onclick="link('write')"><img alt="" src="./img/edit.png" onclick="./write" height="50px"></li>
		<li onclick="link('login')"><img alt="" src="./img/profile.png" height="50px"></li>
	</ul>
	<div class="loginment">
		<div>${sessionScope.mid}(${sessionScope.mname})님 반갑습니다</div>
		<form action="./logout" method="get">
			<button class="submit">로그아웃</button>
		</form>
 	</div>
</nav>
</div>

<div style="height: 50px; width: 100%;"></div>

<script>
	function link(url) {
		location.href = "./" + url;
	}
</script>
