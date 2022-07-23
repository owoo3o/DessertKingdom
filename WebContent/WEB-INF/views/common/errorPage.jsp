<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String msg = (String)request.getAttribute("msg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
		
		body {
		  background-color: #ffe566;
		}
		
		.container {
		  width: 80%;
		  height: 60%;
		  position: absolute;
		  top: 50%;
		  left: 50%;
		  transform: translate(-50%, -50%);
		}
		
		.caption {
		  position: relative;
		  display: flex;
		  align-items: center;
		  justify-content: center;
		}
		
		.head-text {
		  font-family: "Satisfy", cursive;
		  color: #232731;
		  font-size: 60px;
		  position: relative;
		  left: 30px;
		}
		
		.hat-cont {
		  width: 75px;
		  height: 75px;
		  position: relative;
		  transform: rotate(-30deg);
		  top: -15px;
		  animation: hat 1s infinite forwards;
		}
		
		.hat {
		  width: 40px;
		  height: 30px;
		  border: 2px solid black;
		  border-top: none;
		  position: absolute;
		  bottom: 0px;
		  left: 15px;
		}
		.hat:after {
		  width: 40px;
		  content: "";
		  display: inline-block;
		  border: 1px solid black;
		  position: absolute;
		  bottom: 7px;
		  left: 0px;
		}
		
		.line, .lines:before, .lines:after, .lines {
		  width: 0px;
		  height: 6px;
		  border: 1px solid black;
		  position: absolute;
		}
		
		.lines {
		  top: 50px;
		  left: 45%;
		}
		.lines:after {
		  content: "";
		  top: -1px;
		  left: 10px;
		}
		.lines:before {
		  content: "";
		  top: -1px;
		  right: 10px;
		}
		
		.hat-base, .left, .left-opp {
		  height: 30px;
		  width: 15px;
		  position: absolute;
		}
		
		.left, .left-opp {
		  border-bottom-left-radius: 30px;
		  border-top-left-radius: 30px;
		  border: 2px solid black;
		  border-right: none;
		  top: 13px;
		  z-index: 2;
		  background: #ffe566;
		}
		
		.left-opp {
		  transform: rotate(180deg);
		  right: 5px;
		}
		
		.top {
		  height: 20px;
		  width: 40px;
		  position: absolute;
		  border-top-right-radius: 30px;
		  border-top-left-radius: 30px;
		  left: 14px;
		  border: 2px solid black;
		  border-bottom: none;
		}
		
		.pan-wrapper {
		  transform: scale(0.6);
		  position: relative;
		  left: 20%;
		}
		
		.center {
		  width: 300px;
		  height: 300px;
		  border-radius: 50%;
		  background-color: #8a8f99;
		  position: relative;
		  z-index: 2;
		  border: 1px solid black;
		}
		.center .sub-center {
		  width: 270px;
		  height: 270px;
		  border-radius: 50%;
		  background-color: #232731;
		  position: absolute;
		  top: 0px;
		  left: 0px;
		  bottom: 0px;
		  right: 0px;
		  margin: auto;
		}
		
		.handle {
		  width: 40px;
		  height: 150px;
		  position: absolute;
		  left: 263px;
		  top: 280px;
		  transform: rotate(-35deg);
		  background: #232731;
		  z-index: 2;
		  border-radius: 2px;
		}
		
		.handle-sub {
		  width: 25px;
		  height: 50px;
		  content: "";
		  display: inline-block;
		  position: absolute;
		  left: 220px;
		  top: 260px;
		  transform: rotate(-38deg);
		  background: #8a8f99;
		}
		
		.egg {
		  width: 130px;
		  height: 130px;
		  background: white;
		  border-radius: 50%;
		  position: absolute;
		  top: 0px;
		  left: 0px;
		  right: 0px;
		  bottom: 0px;
		  margin: auto;
		  animation: egg 2s ease-in infinite forwards;
		}
		
		.yolk {
		  position: absolute;
		  top: 0;
		  right: 0;
		  bottom: 0;
		  left: 0;
		  margin: auto;
		  background-color: #f9d010;
		  width: 50%;
		  height: 50%;
		  border-radius: 50%;
		  box-shadow: inset #f9d010 0 0 0 4px, inset rgba(255, 255, 255, 0.3) 2px 2px 4px 6px, inset #f9d010 2px 2px 4px 16px, inset rgba(255, 255, 255, 0.3) -2px -2px 12px 12px, rgba(0, 0, 0, 0.05) 0 0 2px 2px;
		}
		
/* 		.text, .center::before, .center::after { */
/* 		  font-size: 240px; */
/* 		  font-family: "Satisfy", cursive; */
/* 		  position: absolute; */
/* 		  top: 20%; */
/* 		  color: #232731; */
/* 		} */
		
/* 		.center::after { */
/* 		  content: "4"; */
/* 		  right: -150px; */
/* 		} */
		
/* 		.center::before { */
/* 		  content: "4"; */
/* 		  left: -150px; */
/* 		} */
		
		@keyframes egg {
		  0%, 100% {
		    transform: scale(1);
		  }
		  50% {
		    transform: scale(1.2);
		  }
		}
		@keyframes hat {
		  0%, 100% {
		    transform: rotate(-30deg);
		  }
		  50% {
		    transform: rotate(-25deg);
		  }
		}
		@media only screen and (min-width: 1000px) {
		  .pan-wrapper {
		    left: 22%;
		  }
		}
		
		.errorBtn {
			text-align: center;
			padding: 20px;
			margin-top: 50px; 
		}
		
		.errorBtn button {
			height: 44px;
			width: 150px;
			background-color: #FFBE33;
			border-radius: 50px;
			border: none;
		 	font-size: 16px;
		 	color: #FFF;
		 	cursor: pointer;
		}
		
		.errorBtn button:hover {
			background-color: #e69c00;
			transition : all .3s;
		}
		
		#main {
			margin-left: 30px;
		}

		#before {
			margin-left: 0;
		}
		
		.msg-area {
			font-size: 25px;
			color: black;
			margin-left: 20px;
		}

</style>

</head>
<body>
	

	<div class="container">
	  <div class="caption">
	    <div class="hat-cont">
	      <div class="lines"></div>
	      <div class="hat"></div>
	      <div class="left"></div>
	      <div class="top"></div>
	      <div class="left-opp"></div>
	    </div>
	    <div class="msg-area"><%= msg %></div>
	   
	  </div>
	  <div class="head">
	    <div class="pan-wrapper">
	      <div class="center">
	        <div class="sub-center">
	          <div class="egg">
	            <div class="yolk"></div>
	          </div>
	        </div>
	      </div>
	      <div class="handle"></div>
	      <div class="handle-sub"></div>
	    </div>
	  </div>
	  <div class="errorBtn">
	   <button id="before" onclick="history.back()">이전 페이지</button>
	   <button id="main" onclick="location.href='<%= request.getContextPath() %>'">홈으로 돌아가기</button>
	 </div>	
	</div>


</body>
</html>