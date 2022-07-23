<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
<!-- bootstrap core css -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.css" />
<!--owl slider stylesheet -->
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" />
<!-- nice select  -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/css/nice-select.min.css" integrity="sha512-CruCP+TD3yXzlvvijET8wV5WxxEh5H8P4cmz0RFbKK6FlZ2sYl3AEsKlLPHbniXKSrDdFewhbmBK5skbdsASbQ==" crossorigin="anonymous" />
<!-- font awesome style -->
<link href="${pageContext.request.contextPath}/css/font-awesome.min.css" rel="stylesheet" />
<!-- Custom styles for this template -->
<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" />
<!-- responsive style -->
<link href="${pageContext.request.contextPath}/css/responsive.css" rel="stylesheet" />

<!-- mypage -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/myPage.css" />
 <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="${pageContext.request.contextPath}/css/font-awesome.min.css" rel="stylesheet" />
<script src="${pageContext.request.contextPath}/js/jquery-3.4.1.min.js"></script>
</head>
<style>
@import url("https://fonts.googleapis.com/css?family=Fira+Sans");
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap');
html, body {
	
}
.maPageBox{
	width: 600px;
	margin: 0 auto;
	
}
.form-structor {
  background-color: #222;
  border-radius: 15px;
  height: 750px;
  width: 600px;
  position: relative;
  overflow: hidden;
  box-shadow: 0 0 15px #555 ;
}
.form-structor::after {
  content: "";
  opacity: 0.8;
  position: absolute;
  top: 0;
  right: 0;
  bottom: 0;
  left: 0;
  background-repeat: no-repeat;
  background-position: left bottom;
  background-size: cover;
  background-image: url("https://imgur.com/5M2PcVY.jpg");
  
}
.form-structor .signup {
  position: absolute;
  top: 40%;
  left: 50%;
  -webkit-transform: translate(-50%, -50%);
  width: 65%;
  z-index: 5;
  -webkit-transition: all 0.3s ease;
}
.form-structor .signup.slide-up {
  top: 5%;
  -webkit-transform: translate(-50%, 0%);
  -webkit-transition: all 0.3s ease;
}
.form-structor .signup.slide-up .form-holder, .form-structor .signup.slide-up .submit-btn {
  opacity: 0;
  visibility: hidden;
}
.form-structor .signup.slide-up .form-title {
  font-size: 1em;
  cursor: pointer;
  font-weight: 500;
}
.form-structor .signup.slide-up .form-title span {
  margin-right: 5px;
  opacity: 1;
  visibility: visible;
  -webkit-transition: all 0.3s ease;
}
.form-structor .signup .form-title {
  color: #fff;
  font-size:45px;
  text-align: center;
  font-family: 'Noto Sans KR', cursive;
}
.form-structor .signup .form-title span {
  color: rgba(0, 0, 0, 0.4);
  opacity: 0;
  visibility: hidden;
  -webkit-transition: all 0.3s ease;
}
.form-structor .signup .form-holder {
  border-radius: 15px;
  overflow: hidden;
  margin-top: 50px;
  opacity: 1;
  visibility: visible;
  -webkit-transition: all 0.3s ease;
}

.form-structor .signup .form-holder .input {  /* 요건 인풋일때 */
  border: 0;
  box-shadow: none;
  display: block;
  line-height: 30px;
  border-bottom: 1px solid #eee;
  font-size: 12px;
  width:250px;
}
.form-structor .signup .form-holder .input:focus{
	outline: none;
	border: none;
}
.form-structor .signup .form-holder table{
	width:100%;
}
.form-structor .signup .form-holder tbody{
	width:100%;
}
.form-structor .signup .form-holder tr{
  border: 0;
  outline: none;
  box-shadow: none;
  display: block;
  height: 50px;
  line-height: 30px;
  padding: 8px 15px;
  border-bottom: 1px solid #eee;
  width: 100%;
  font-size: 12px;
  background-color: #fff;
  box-sizing: border-box;
}
.form-structor .signup .form-holder tr.hidden{
	display: none;
}
.form-structor .signup .form-holder tr th{
	box-sizing: border-box;
	width: 120px;
	text-align: center;
}
.form-structor .signup .form-holder tr td{
	box-sizing: border-box;
	width: 250px;
	text-align: left;
	
}
.form-structor .signup .form-holder .input:last-child {
  border-bottom: 0;
}
.form-structor .signup .form-holder .input::-webkit-input-placeholder {
  color: rgba(0, 0, 0, 0.4);
}
.form-structor .signup .submit-btn {
  background-color: rgba(0, 0, 0, 0.4);
  color: rgba(255, 255, 255, 0.7);
  border: 0;
  border-radius: 45px;
  display: block;
  margin: 30px auto;
  padding: 15px 45px;
  width: 100%;
  font-size: 13px;
  font-weight: bold;
  cursor: pointer;
  opacity: 1;
  visibility: visible;
  -webkit-transition: all 0.3s ease;
}
.form-structor .signup .submit-btn:hover {
  transition: all 0.3s ease;
	background: rgb(255, 190, 51);
  
}
.form-structor .checkPw {
  position: absolute;
  top: 20%;
  left: 0;
  right: 0;
  bottom: 0;
  background-color: #fff;
  z-index: 5;
  -webkit-transition: all 0.3s ease;
}
.form-structor .checkPw::before {
  content: "";
  position: absolute;
  left: 50%;
  top: -20px;
  -webkit-transform: translate(-50%, 0);
  background-color: #fff;
  width: 200%;
  height: 250px;
  border-radius: 50%;
  z-index: 4;
  -webkit-transition: all 0.3s ease;
}
.form-structor .checkPw .center {
  position: absolute;
  top: calc(50% - 10%);
  left: 50%;
  -webkit-transform: translate(-50%, -50%);
  width: 65%;
  z-index: 5;
  -webkit-transition: all 0.3s ease;
}
.form-structor .checkPw .center .form-title {
  color: #000;
  font-size: 1.7em;
  text-align: center;
  line-height: 25px;
  font-family: 'Noto Sans KR', cursive;
}
.form-structor .checkPw .center .form-title:hover{
	cursor: pointer;
	color: rgb(255, 190, 51);
}
.form-structor .checkPw .center .form-title span {
  color: rgba(0, 0, 0, 0.4);
  opacity: 0;
  visibility: hidden;
  -webkit-transition: all 0.3s ease;
}
.form-structor .checkPw .center .form-holder {
  border-radius: 15px;
  background-color: #fff;
  border: 1px solid #eee;
  overflow: hidden;
  margin-top: 50px;
  opacity: 1;
  visibility: visible;
  -webkit-transition: all 0.3s ease;
}
.form-structor .checkPw .center .form-holder .input {
  border: 0;checkPw
  outline: none;
  box-shadow: none;
  display: block;
  height: 50px;
  line-height: 30px;
  padding: 8px 15px;
  border-bottom: 1px solid #eee;
  width: 100%;
  font-size: 12px;
}
.form-structor .checkPw .center .form-holder .input:focus{
	outline: none;
}
.form-structor .checkPw .center .form-holder .input:last-child {
  border-bottom: 0;
}
.form-structor .checkPw .center .form-holder .input::-webkit-input-placeholder {
  color: rgba(0, 0, 0, 0.4);
}
.form-structor .checkPw .center .submit-btn {
  background-color: #ffbe33;
  color: rgb(255, 255, 255);
  border: 0;
  border-radius: 45px;
  display: block;
  margin: 15px auto;
  padding: 15px 45px;
  width: 100%;
  font-size: 13px;
  font-weight: bold;
  cursor: pointer;
  opacity: 1;
  visibility: visible;
  -webkit-transition: all 0.3s ease;
}
.form-structor .checkPw .center .submit-btn:hover {
  transition: all 0.3s ease;
  background: #E69C00;
}
.form-structor .checkPw.slide-up {
  top: 90%;
  -webkit-transition: all 0.3s ease;
}
.form-structor .checkPw.slide-up .center {
  top: 10%;
  -webkit-transform: translate(-50%, 0%);
  -webkit-transition: all 0.3s ease;
}
.form-structor .checkPw.slide-up .form-holder, .form-structor .checkPw.slide-up .submit-btn {
  opacity: 0;
  visibility: hidden;
  -webkit-transition: all 0.3s ease;
}
.form-structor .checkPw.slide-up .form-title {
	display: block;
	background: none;
	border:none;
	text-align: center;
	font-size: 1em;
	margin: 0 auto;
	padding: 0;
	cursor: pointer;
	-webkit-transition: all 0.3s ease;
  
}
.form-structor .hidden{
	display: none;
}
.form-structor .checkPw.slide-up .form-title span {
  margin-right: 5px;
  opacity: 1;
  visibility: visible;
  -webkit-transition: all 0.3s ease;
}
.form-structor .checkPw.slide-up .form-title:hover{
	color: rgb(255, 190, 51);
	
}

</style>
<body>
<!-- header section strats -->
<%@ include file="../common/header.jsp" %>
<!-- end header section -->	
    
   <section class="infoP_section layout_padding maPageBox">
   <div class="form-structor">
   <div class="signup">
      <h2 class="form-title" id="signup">Modify</h2>
       
      <div class="form-holder">
                  <form action="<%= request.getContextPath() %>/updateMember" method="post" onsubmit="return updateMember();">
            <table>
               <tr class="myPageInfo hidden">
                  <th>Id</th>
                  <td id="userNo"></td>
               </tr>
               <tr class="myPageInfo">
                  <th>Id</th>
                  <td><%= loginMember.getUserId() %>
                  <input type="hidden" id="userId" name="userId" value="<%= loginMember.getUserId() %>">
                  </td>
               </tr>
               <tr class="myPageInfo">
                  <th>Password</th>
                  <td><input type="password" id="newPwd" name="newPwd" class="input" placeholder="영어,숫자 포함 8글자 이상" />
                  <div id="passcheck" class="checkarea"></div>
                  </td>
                  
               </tr>
               <tr class="myPageInfo">
                  <th>PWD check</th>
                  <td><input type="password" id="userPwdC" name="userPwdC" class="input" placeholder="비밀번호 확인" />
                  <div id="passcheck2" class="checkarea"></div>
                  </td>
               </tr>
               <tr class="myPageInfo">
                  <th>Name</th>
                  <td><input type="text" id="userName" name="userName" value="<%= loginMember.getUserName() %>" class="input" placeholder="변경할 이름을 적어주세요" />
                  </td>
               </tr>
               <tr class="myPageInfo">
                  <th>Email</th>
                  <td><input type="email" id="userEmail" name="userEmail" value="<%= loginMember.getEmail() %>" class="input" placeholder="이메일을 입력해 주세요" />
                  </td>
               </tr>
               <tr class="myPageInfo">
                  <th>Phone</th>
                  <td><input type="text" id="Phone" name="Phone" value="<%= loginMember.getPhone() %>" class="input" placeholder="휴대폰 번호를 입력해 주세요" />
                  </td>
               </tr>
               <tr class="myPageInfo">
                  <th>One class</th>
                  <td id="Onclass"><%= loginMember.getOneclass() %></td>
               </tr>
            </table>
            <input type="submit" class="submit-btn" value="submit">
         </form>
      </div>
   </div>
   <div class="checkPw slide-up">
      <div class="center">
         <button class="form-title" id="Back">Back</button>
         <script>
         $(function(){
            $("#Back").click(function(){
               if(confirm('수정을 취소하시겠습니까?')){
                  window.history.go(-1);
               }
            });
         });
            
         
         // 회원정보 수정 입력 확인
           function updateMember(){
              var newPwd = $('#newPwd');
              var userPwdC = $('#userPwdC');
              var userName = $('#userName');
              var userEmail = $('#userEmail');
              var Phone = $('#Phone');
              
              if(newPwd.val().trim().length == 0){
                 alert('비밀번호를 입력하세요');
                 newPwd.focus();
                 return false;
              }
              if(userPwdC.val().trim().length == 0){
                 alert('비밀번호 확인을 입력하세요');
                 userPwdC.focus();
                 return false;
              }
              if(userName.val().trim().length == 0){
                 alert('이름을 입력하세요');
                 userName.focus();
                 return false;
              }
              if(userEmail.val().trim().length == 0){
                 alert('이메일을 입력하세요');
                 userEmail.focus();
                 return false;
              }
              if(Phone.val().trim().length == 0){
                 alert('휴대폰 번호를 입력하세요');
                 Phone.focus();
                 return false;
              }
              
              return true;
           }
         
         
         
           // 비밀번호 유효성
          $('#newPwd').change(function(){
             var pwLength = $(this).val().length;
             var pwRule1 = /[^0-9a-zA-Z]/g;
             var pwRule2 = /[0-9]/;
             var pwRule3 = /[a-zA-Z]/;
             if(pwLength < 8 && pwRule1.test($(this).val())){
                $(this).focus();
               $(this).siblings().html('영문대소문자,숫자 섞어서사용/8글자 이상 입력해 주세요').attr({'style':'color:red'});
             
             } else if(pwLength < 8){
                $(this).focus();
               $(this).siblings().html('8글자 이상 입력해 주세요').attr({'style':'color:red'});
             } else if(pwRule1.test($(this).val())){
                $(this).focus();
               $(this).siblings().html('사용할수 없는 문자가 포함되 있습니다.').attr({'style':'color:red'});
             } else if(!pwRule2.test($(this).val()) || !pwRule3.test($(this).val())){
                $(this).focus();
               $(this).siblings().html('영어와 숫자를 혼합해 작성해주세요.').attr({'style':'color:red'});
             } else {
               $(this).siblings().html('사용 가능한 비밀번호 입니다.').attr({'style':'color:green'});
             }
          });
          
          // 비밀번호 확인
          $('#userPwdC').change(function(){
             var realPwd = $('#newPwd').val();
             if($(this).val() != realPwd){
                $(this).focus();
                $(this).siblings().html('비밀번호가 일치하지 않습니다.').attr({'style':'color:red'});
             } else {
                $(this).siblings().html('').attr({'style':'color:#ddd'});
                $('#passcheck').html('');
             }
          });
         
        </script>
        
      </div>
   </div>
   </div>
</section>
<!-- footer section -->
<%@ include file="..//common/footer.jsp" %>
<!-- footer section -->
</body>

</html>