<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>인덱스 화면입니다.</h1>
	
	<span class="login"></span>
	<c:choose>
				<c:when test="${sessionScope.mname  eq null}">
				<form action="./login" method="post">
				<button class="login" type="submit">로그인</button>
				</form>
				</c:when>
				<c:otherwise>
				<li class="logout" onclick="link('myinfo')">${sessionScope.mname }(${sessionScope.mid })님 반갑습니다.</li>
				<form action="./logout" method="get">
				<button type="submit">로그아웃</button>
				</form>
				</c:otherwise>
	</c:choose>
</body>
</html>