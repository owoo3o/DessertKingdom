<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<% Member member = (Member)request.getAttribute("member"); %>
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

<style>
#leavebtn {
   width: 100px;
   height: 40px;
   border-radius: 45px;
   border: none;
   background: #ffbe30;
   color: #fff;
   margin-top: 10px;
   margin-left: 290px;
}

#leavebtn:hover {
   background: #e69c00;
}
</style>


</head>
<body>
   <!-- header section strats -->
     <%@ include file="../common/header.jsp" %>
    <!-- end header section -->   
   <section class="infoP_section layout_padding maPageBox">
      <div class="form-structor">
      <div class="signup">
         <h2 class="form-title" id="signup">My Page</h2>
         
         <div class="form-holder">
            <table>
               <tr class="myPageInfo hidden">
                  <th>Id</th>
                  <td id="userNo"></td>
               </tr>
               <tr class="myPageInfo">
                  <th>Id</th>
                  <td id="userId"><%= member.getUserId() %></td>
               </tr>
               <tr class="myPageInfo hidden">
                  <th>Password</th>
                  <td id="userPwd"></td>
               </tr>
               <tr class="myPageInfo">
                  <th>Name</th>
                  <td id="userName"><%= member.getUserName() %></td>
               </tr>
               <tr class="myPageInfo">
                  <th>Email</th>
                  <td id="userEmail"><%= member.getEmail() %></td>
               </tr>
               <tr class="myPageInfo">
                  <th>Phone</th>
                  <td id="Phone"><%= member.getPhone() %></td>
               </tr>
               <tr class="myPageInfo">
                  <th>One class</th>
                  <td id="Onclass"><%= member.getOneclass() %></td>
               </tr>
            </table>
            
            <input type="button" id="leavebtn" value="탈퇴하기" onclick="deleteMember();">
            
            
         </div>
      </div>
      <div class="checkPw slide-up" id="checkPw">
         <div class="center">
            <h2 class="form-title" id="Modify">Modify</h2>
            <h2 class="form-title" id="Back" style="display:none">Back</h2>
            <form action ="<%= request.getContextPath()%>/myUpdatePage" method="post"  onsubmit="return pwdCheck();">
            <div class="form-holder">
               <input type="password" class="input pwd1" placeholder="비밀번호 "  name="pwd1"/>
               <input type="password" class="input pwd2" placeholder="비밀번호 확인" name="pwd2" />
            </div>
            <button class="submit-btn" >Modify</button>
            </form>
            <script>
            function pwdCheck(){
                 var pwd1 = $('.pwd1').val();
                 var pwd2 = $('.pwd2').val();
                 
                 if(pwd1 != pwd2){
                    console.log(pwd1 + ", " + pwd2);
                  alert('비밀번호가 일치하지 않습니다.');
                    return false;
                 }
              }
            </script>
            
            <script>
		         // 탈퇴하기
		            function deleteMember(){
		             
		             if(window.confirm('정말 탈퇴하시겠습니까?')){
		                location.href = '<%= request.getContextPath() %>/deleteMember';
		             
		             }
		          }
            
            
            
            </script>
         </div>
      </div>
      </div>
   </section>
   <!-- footer section -->
      <%@ include file="..//common/footer.jsp" %>
   <!-- footer section -->
</body>

<script src="${pageContext.request.contextPath}/js/myPage.js"></script>
</html>