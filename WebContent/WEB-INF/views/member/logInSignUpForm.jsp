<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="${pageContext.request.contextPath}/js/jquery-3.4.1.min.js"></script>
    <title>Document</title>

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
    <link href="${pageContext.request.contextPath}/css/style_signUp.css" rel="stylesheet">

<!-- mypage -->
 <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="${pageContext.request.contextPath}/css/font-awesome.min.css" rel="stylesheet" />
    
</head>
<body>
 <!-- header section strats -->
     <%@ include file="../common/header.jsp" %>
    <!-- end header section -->   
   <section class="infoP_section layout_padding maPageBox">
    <div class="form-structor">
    	<!-- login stars -->
        <div class="signup">
            <h2 class="form-title" id="signup"><span>or</span>Log in</h2>
           
            <div>
                <form action="<%= request.getContextPath() %>/login.me" method="post" id="loginForm" name="loginForm" onsubmit="return loginST();">
                    <table class="form-holder">
                        <tr>
                            <td><input type="text" class="input" placeholder="Id" name="loginId" id="loginId" /></td>
                        </tr>
                        <tr>    
                            <td><input type="password" class="input" placeholder="password" name="loginPwd" id="loginPwd"  /></td>
                        </tr>    
                        </table>
                    <button type="submit" class="submit-btn" id="loginBtn">Login</button>
                </form>
            </div>
           
        </div>
        <!-- login end -->
        <script>
        
        	// 로그인 입력확인
        	function loginST(){
        		var loginId = $('#loginId');
        		var loginPwd = $('#loginPwd');
        		
        		if(loginId.val().trim().length == 0){
        			alert('아이디를 입력하세요');
        			loginId.focus();
        			return false;
        		}
        		if(loginPwd.val().trim().length == 0){
        			alert('비밀번호를 입력하세요');
        			loginPwd.focus();
        			return false;
        		}
        		
        		
        		return true;
        	}
        </script>
        
        
        
        <!-- signUp stars -->
        	<div class="login slide-up">
		<div class="center">
			<h2 class="form-title" id="login"><span>or</span>Sign up</h2>
			
			
			
			<div class="form-holder">
				<form action="<%= request.getContextPath()%>/insert.me" method="post" id="signUpForm" name="signUpForm">
					<table id="signupForm">
		               <tr class="textForm">
		                  <td><label class="must">*</label></td>
		                  <td>
		                  	<input name="userId" type="text" id="userId" class="id" placeholder="ID" onfocus="this.placeholder=''" onblur="this.placeholder='ID'">
		                  	<div class="checkText checkId">영문,숫자 사용 및 4자리 이상 입력</div>
		                  </td>
		               </tr>
		               <tr class="textForm">
		                  <td><label class="must">*</label></td>
		                  <td>
		                  	<input name="userPwd" type="password" class="pw" placeholder="Password" onfocus="this.placeholder=''" onblur="this.placeholder='Password'">
		                 	<div class="checkText checkPwd">영문, 숫자 사용 및 8자리 이상 입력</div>
		                  </td>
		              </tr>
		              <tr class="textForm">
		                 <td><label class="must">*</label></td>
		                 <td>
		                 	<input name="userPwd2" type="password" class="pw" placeholder="Re-enter Password" onfocus="this.placeholder=''" onblur="this.placeholder='Re-enter Password'">
		               		<div class="checkText checkPwd2"></div>
		                 </td>
		               </tr>
		               <tr class="textForm">
		                  <td><label class="must">*</label></td>
		                  <td><input name="userName" type="text" class="name" placeholder="Name" onfocus="this.placeholder=''" onblur="this.placeholder='Name'"></td>
		               </tr>
		               <tr class="textForm">
		                  <td><label class="must">*</label></td>
		                  <td><input name="userEmail" type="email" class="email" placeholder="Email" onfocus="this.placeholder=''" onblur="this.placeholder='Email'"></td>
		                </tr> 
		               <tr>
		                 <td><label class="must">*</label></td>
		                 <td><input name="Phone" type="number" class="cellphoneNo" placeholder="Phone" onfocus="this.placeholder=''" onblur="this.placeholder='Phone'"></td>
		               </tr>
		               <!-- <tr class="textForm">
		                  <td></td>
		                 <td><input name="code" type="text" class="code" 
		                 		placeholder="Code" onfocus="this.placeholder=''" onblur="this.placeholder='Code'"></td>
		               </tr> -->
		        </table>
        		<button class="submit-btn" id="signUpBtn">Sign up</button>
			</form>		
			</div>
		</div>
	</div>
    	<!-- signUp end -->
    </div>
    </section>
   <!-- footer section -->
      <%@ include file="..//common/footer.jsp" %>
   <!-- footer section -->
    <script>
    	$(function(){
    		// 아이디 유효성 및 중복검사
    		var isUsable = false;
    		var isIdChecked = false;
    		
    		$('#userId').on('change paste keyup', function(){
    			isIdChecked = false;
    		});
    		
    		$('#userId').change(function(){
    			var userId = $('#userId');
    			var idLength = $(this).val().length;
				var idRule = /[^0-9a-zA-Z]/g;
				if(idLength < 4 && idRule.test($(this).val())){
					$(this).focus();
					$(this).siblings().html('영문,숫자사용/4글자 이상 입력해 주세요').attr({'style':'color:red'});
				} else if(idLength < 4) {
					$(this).focus();
					$(this).siblings().html('4글자 이상 입력해 주세요').attr({'style':'color:red'});
				} else if(idRule.test($(this).val())) {
					$(this).focus();
					$(this).siblings().html('사용할수 없는 문자가 포함되 있습니다.').attr({'style':'color:red'});
				} else {
					// 유효성 모두 통과시 중복체크 ajax
					$.ajax({
						url: '<%= request.getContextPath() %>/checkId.me',
						type: 'post',
						data: {userId:userId.val()},
						success: function(data){
							if(data == '0'){
								$('.checkId').html('사용 가능한 아이디 입니다.').attr({'style':'color:green'});
								isUsable = true;
								isIdChecked = true;
							} else if(data == '1'){
								$(this).focus();
								$('.checkId').html('중복된 아이디가 있습니다').attr({'style':'color:red'});
								isUsable = false;
					    		isIdChecked = false;
							}
						},
						error: function(data){
							console.log("ajax오류 정보 : " + data);
						}
					});
				}
    		});
    		
    		
    		// 비밀번호 유효성
    		$('input[name=userPwd]').change(function(){
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
    		$('input[name=userPwd2]').change(function(){
    			var realPwd = $('input[name=userPwd]').val();
    			if($(this).val() != realPwd){
    				$(this).focus();
    				$(this).siblings().html('비밀번호가 일치하지 않습니다.').attr({'style':'color:red'});
    			} else {
    				$(this).siblings().html('').attr({'style':'color:#ddd'});
    			}
    			console.log($('#signupForm input').val());
    		});
    		
    		// 하나라도 비면 에러메세지 + 아이디 중복일경우 막기
    		$('#signUpBtn').click(function(){
    			console.log($('input[name=userPwd]').val());
	    		if($('input[name=userId]').val() == "" || $('input[name=userPwd]').val() == "" || $('input[name=userPwd2]').val() == "" || $('input[name=userName]').val() == "" || $('input[name=Phone]').val() == "" || $('input[name=userPwd]').val() == ""){
	    			alert('내용을 모두 입력해 주세요');
	    			return false;
	    		} else{
	    			if(isUsable && isIdChecked){
	    				return true;
	    			} else{
	    				alert("아이디 중복확인을 해주세요");
	    				return false;
	    			}
	    		}
	    		
	    		return true;
    		});
    		
    	});
    </script>
    
    
    <script src="${pageContext.request.contextPath}/js/signUp.js"></script>
</body>
</html>