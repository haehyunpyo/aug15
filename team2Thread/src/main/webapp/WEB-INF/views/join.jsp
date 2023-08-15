<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script src="./js/jquery-3.7.0.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#idCheck").click(function() {
			let id = $("#id").val();
			if (id == "" || id.length < 3) {
				$("#resultMSG").text("아이디는 세글자 이상이어야 합니다.");
			} else {
				$.ajax({
					url : "./checkID",
					type : "post",
					data : {
						"id" : id
					},
					dataType : "json",
					success : function(data) {
						if (data.result == "1") {
							$("#resultMSG").text("이미 등록된 아이디입니다.");
						} else {
							$("#resultMSG").text("사용할 수 있는 아이디입니다.")
						}
					},
					error : function(request, status, error) {
						$("#resultMSG").text("오류가 발생했습니다. 다시 시도해주십시오.")
					}
				});
			}
			return false;
		});
	});
	$(function() {
		$("#pwch2").keyup(function() {

			let pwch1 = $("#pwch1").val();
			let pwch2 = $("#pwch2").val();

			if (pwch1 == pwch2) {
				$("#pwout").text('비밀번호가 일치합니다.');
			} else {
				$("#pwout").text('비밀번호가 일치하지 않습니다.');
			}
		});
	});
	$(function() {
		$("#btn").click(function() {
			let em = $("#em").val();
			let emBack = $("#emBack").val();
			let ph = $("#ph1").val();
			em = em + "@" + emBack;
			
			// 수정된 부분: 숨겨진 입력 필드에 정확한 이메일 주소 설정
			$("#em").val(em);
			$("#ph").val(ph);

		});
	});
</script>
</head>
<body>
	<h1>회원가입</h1>
	<div class="join-div">
		<form action="./join" method="post">
			<hr>
			<div class="label-row">
				<div class="label-name">ID</div>
				<div class="label-in">
					<div>
						<input type="text" name="id" id="id">
						<button id="idCheck">중복검사</button>
					</div>
				</div>
			</div>
			<div class="label-row" style="height: 40px" id="resultForm">
				<div class="label-name"></div>
				<div class="label-in">
					<span id="resultMSG"></span>
				</div>
			</div>
			<div class="label-row">
				<div class="label-name">PW</div>
				<div class="label-in">
					<input type="password" name="pw1" id="pwch1"> <input
						type="password" name="pw2" id="pwch2"><br> <span
						id="pwout"></span>
				</div>
			</div>
			<div class="label-row">
				<div class="label-name">이 름</div>
				<div class="label-in">
					<input type="text" name="name">
				</div>
			</div>
			<div class="label-row">
				<div class="label-name">생년월일</div>
				<div class="label-in">
					<input type="date" name="birth">
				</div>
			</div>
			<div class="label-row">
				<div class="label-name">성별</div>
				<div class="label-in">
					<input type="radio" name="gender" id="m" value="1"> <label
						for="m">남자</label> <input type="radio" name="gender" id="f"
						value="0"> <label for="f">여자</label>
				</div>
			</div>
			<div class="label-row">
				<div class="label-name">주소</div>
				<div class="label-in">
					<input type="text" name="addr">
				</div>
			</div>
			<div class="label-row">
				<div class="label-name">Email</div>
				<div class="label-in">
					<input type="text" name="em" id="em" />@ <select name="emBack"
						id="emBack">
						<option value="">직접입력</option>
						<option value="gmail.com">gmail.com</option>
						<option value="yahoo.com">yahoo.com</option>
						<option value="naver.com">naver.com</option>
					</select>
				</div>
			</div>
			<input type="hidden" id="fe" name="fe" />
			<div class="label-row">
				<div class="label-name">Phone Number</div>
				<div class="label-in">
					<input type="text" id="ph1" placeholder="핸드폰번호를 입력해주세요" />
					<input type="hidden" name="ph" id="ph" />
				</div>
			</div>
			<!-- 분명히 {id=aaaa, pw1=aaaa, pw2=aaaa, name=aaaa, birth=2023-08-03, 
				gender=0, addr=aaaa, em=aaaa@, emBack=, fe=, ph=010-7890-7890} 
				맵에는 이렇게 들어가는데 데이터베이스에는 1078907890으로 들어갑니다. 수요일에 반드시 물어보자.-->
			<hr>
			<div class="label-row lrbtn">
				<button id="btn" type="submit">가입하기</button>
			</div>
		</form>
	</div>
</body>
</html>