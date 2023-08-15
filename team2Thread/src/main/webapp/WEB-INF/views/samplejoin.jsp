<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script src="./js/jquery-3.7.0.min.js"></script>
<script type="text/javascript">
$(function(){
   $("#idCheck").click(function(){
      let id = $("#id").val();
      if(id == "" || id.length < 3) {
         $("#resultMSG").text("아이디는 세글자 이상이어야 합니다.");
      } else {
         $.ajax({
            url: "./checkID",
            type: "post",
            data: {"id" : id},
            dataType: "json",
            success: function(data){
               if(data.result == "1"){
                  $("#resultMSG").text("이미 등록된 아이디입니다.");
               } else {
                  $("#resultMSG").text("사용할 수 있는 아이디입니다.")
               }
            },
            error: fuction(request, status, error){
               $("#resultMSG").text("오류가 발생했습니다. 다시 시도해주십시오.")
            }
         });
      }
      return false;
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
               <input type="password" name="pw1"> <input type="password"
                  name="pw2">
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
               <input type="text" name="em">
            </div>
         </div>
         <div class="label-row">
            <div class="label-name">전화번호</div>
            <div class="label-in">
               <input type="text" name="ph">
            </div>
         </div>
         <hr>
         <div class="label-row lrbtn">
            <button type="submit">가입하기</button>
         </div>
      </form>
   </div>
</body>
</html>