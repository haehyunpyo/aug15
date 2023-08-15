<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Comment</title>
<link rel="stylesheet" href="./css/comments.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script type="text/javascript">
		
		
	$(function(){
		
		$(".cno").hide();
		$(".bno").hide();
		
		
		let count = ${dto.commentcount }
		let btc = 0;
			
		$(".morebtn").click(function(){
			let cno = $(this).parent(".moreBox").siblings(".cno").text();
			let btc = 0;
			let bno = $(this).parent(".moreBox").siblings(".bno").text();
			//alert(bno);
			
			$.ajax({
				url: "./cmore", 
				type: "post",
				data: {bno: bno, btc: btc},
				dataType: "json",
				success: function(data){
					if(data == 0){
						alert("!c");
					}
				},
				error: function(){
					alert("에러가 발생했습니다" + error);
				}
			});
			
			
		});
		
		
		
	});
	
	$(function(){
		
		// 댓글삭제 (로그인여부확인, id일치여부확인)
		$(".cdel").click(function(){
			if(confirm("댓글을 삭제하시겠습니까?")){
				let cno = $(this).parent(".cbtns").siblings(".cno").text();
				let bno = $(this).parent(".cbtns").siblings(".bno").text();
				let comments = $(this).parent(".cbtns").parent(".commentBox");
				//alert(cno);
				//alert(comments);
 				//location.href="./cdel?bno=${dto.bno}&cno=" + cno;
 				
				$.ajax({
					url: "./cdelR", 
					type: "post",
					data: {bno: bno , cno: cno },
					dataType: "json",
					success: function(data){
						if(data.result == 1){
							comments.remove();
						} else {
							alert("문제생김");
						};
					},
					error: function(){
						alert("에러가 발생했습니다" + error);
					}
				});
			}
		});
		
		
		// 댓글수정 (로그인여부확인, id일치여부확인)
		$(".cedit").click(function(){
			//alert("!");
			const bno= ${dto.bno};
			const cno= $(this).parent(".cbtns").siblings(".cno").text();
			let content= $(this).parent(".cbtns").siblings(".cbody").text();
			let recommentBox= '<div class="recommentBox">';
			// 댓글수정 폼제출
			recommentBox += '<form action="./cedit" method="post">';
			recommentBox += '<textarea id="retextarea" name="recomment"> '+content+' </textarea>';
			recommentBox += '<input type="hidden" id="bno" name="bno" value=" '+bno+' ">';
			recommentBox += '<input type="hidden" id="cno" name="cno" value=" '+cno+' ">';
			recommentBox += '<button type="submit" id="recombtn">수정</button>';
			recommentBox += '</form>';
			
			recommentBox += '</div>';
			
			let commentDIV= $(this).parents(".commentBox");
			commentDIV.after(recommentBox);
			commentDIV.remove();
			
			// 댓글수정시 수정&삭제버튼, 댓글창, 더보기버튼 숨기기
			$(".cedit").remove();
			$(".cdel").remove();
			$(".ctextBox").remove();
			$(".morecomment").remove();
		
		});
		
		
		// 댓글좋아요
		let clikeimg = $(".cedit").siblings("img");
		
		$(clikeimg).click(function(){
			
			let clike = $(this).siblings(".clike"); // span)
			let cid = $(this).parent(".cbtns").siblings(".comHead").children(".cid").text();
			clike.text(Number(clike.text())+1);
			const bno= ${dto.bno};
			const cno= $(this).parent(".cbtns").siblings(".cno").text();
			
			//alert(bno);
			//alert(cno);
			
			$.ajax({
				url: "./clikeUp", 
				type: "post",
				data: {bno: bno , cno: cno},
				dataType: "json",
				success: function(data){
					if(data.result == 1){
						console.log(data.result);
					} else {
						alert("실패")
					}
				},
				error: function(){
					alert("에러가 발생했습니다" + error);
				}
			});
		});

	
		// 날짜표시

		
	
	});

	
</script>

</head>

<body style="background-color: #fffbe6;">
<%@ include file="menu.jsp"%>
   <h1>comment화면</h1>

	<div class="threadBox">
		<table>
			<tr>
				<td class="cid">${dto.m_id } </td>
				<td class="cdate">${dto.bdate }</td>
			</tr>
			<tr >
				<td class="c_cont">${dto.bcontent }</td>
			</tr>
			<tr>
				<td class="cimg">
					<img alt="" src="./img/like.png" height="20px">좋아요${dto.blike }개 
					<img alt="" src="./img/comment.png" height="20px">
					<span class="ccount">답글${dto.commentcount }개</span>
				</td>
			</tr>
		</table>
	</div>
<hr>

	<div class="commentArea">
		<c:choose>
			<c:when test="${fn:length(commentsList) gt 0}">
				<c:forEach items="${commentsList }" var="c">
					<div class="commentBox">
						<div class="comHead">
							<div class="cid">${c.m_id}</div>
							<span class="cDate">${c.c_date}</span>
						</div>
						<div class="cbody">${c.c_comment}</div>
						<div class="cno">${c.cno}</div>
						<div class="bno">${c.bno}</div>
						<div class="cbtns">
							<img alt="" src="./img/like.png" height="20px">
							<span class="clike">${c.c_like }</span>
							<button type="button" class="cedit">수정</button>
							<button type="button" class="cdel">삭제</button>
						</div>
						<div class="moreBox">
							<button type="button" class="morebtn">댓글더보기</button>
						</div>
					</div>
				</c:forEach>
			</c:when>
		</c:choose>
	</div>
	
	<!-- 댓글 입력창 항상 하단에 뜨도록 해보자 -->
	<c:if test="${sessionScope.mid ne null }">
		<form action="./comment" method="post" class="ctextBox">
			<textarea id="comtextarea" name="comment"></textarea>
			<button type="submit" class="cwrite">댓글쓰기</button>	
			<input type="hidden" name="bno" value="${dto.bno}">
		</form>
	</c:if>
</body>
</html>