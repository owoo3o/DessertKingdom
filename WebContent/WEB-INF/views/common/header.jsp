<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.*" %>
<%
	Member loginMember = (Member)session.getAttribute("loginMember");
	// 로그인 유저가 있으면 로그인이 된 상태
%>
<!DOCTYPE html>
<html>
<head>
<style>
@import url('https://fonts.googleapis.com/css2?family=Jua&display=swap');
.sub_page .hero_area .bg-box {
    background: #FFD384;
}

.logOut{
	display: block;
	margin: 0 10px;
	color:#fff;
}

.logOut svg{
	height:18px;
}

.nav-link{
   cursor:pointer;
}

span {
	font-family: 'Jua', sans-serif;
}
</style>
  <title> Dessert Kingdom </title>
</head>
<body class="sub_page">

  <div class="hero_area">
    <div class="bg-box">
    </div>
    <!-- header section strats -->
    <header class="header_section">
      <div class="container">
        <nav class="navbar navbar-expand-lg custom_nav-container ">
          <a class="navbar-brand" href="<%= request.getContextPath()%>">
            <span>
              Dessert Kingdom
            </span>
          </a>

          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class=""> </span>
          </button>

          <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav  mx-auto ">
              <li class="nav-item">
                <a class="nav-link" href="<%= request.getContextPath()%>/information">Info </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href='<%= request.getContextPath()%>/list.one'>OneClass</a>
              </li>
              <li class="nav-item"  id="menu_wrap">
                <a class="nav-link" href='<%= request.getContextPath()%>/list.faq'>INQUIRY</a>
                  
              </li>
              <li class="nav-item">
                <a class="nav-link" onclick="location.href='<%= request.getContextPath() %>/list.th'">Review </a>

              </li>
            </ul>
            <div class="user_option">
            <% if(loginMember != null){ %>
              <a href="<%= request.getContextPath()%>/myPage" class="user_link" >
                <i class="fa fa-user" aria-hidden="true"></i>
              </a>
              <% } %>
              <a class="cart_link" href="#">
                <svg version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 456.029 456.029" style="enable-background:new 0 0 456.029 456.029;" xml:space="preserve">
                  <g>
                    <g>
                      <path d="M345.6,338.862c-29.184,0-53.248,23.552-53.248,53.248c0,29.184,23.552,53.248,53.248,53.248
                   c29.184,0,53.248-23.552,53.248-53.248C398.336,362.926,374.784,338.862,345.6,338.862z" />
                    </g>
                  </g>
                  <g>
                    <g>
                      <path d="M439.296,84.91c-1.024,0-2.56-0.512-4.096-0.512H112.64l-5.12-34.304C104.448,27.566,84.992,10.67,61.952,10.67H20.48
                   C9.216,10.67,0,19.886,0,31.15c0,11.264,9.216,20.48,20.48,20.48h41.472c2.56,0,4.608,2.048,5.12,4.608l31.744,216.064
                   c4.096,27.136,27.648,47.616,55.296,47.616h212.992c26.624,0,49.664-18.944,55.296-45.056l33.28-166.4
                   C457.728,97.71,450.56,86.958,439.296,84.91z" />
                    </g>
                  </g>
                  <g>
                    <g>
                      <path d="M215.04,389.55c-1.024-28.16-24.576-50.688-52.736-50.688c-29.696,1.536-52.224,26.112-51.2,55.296
                   c1.024,28.16,24.064,50.688,52.224,50.688h1.024C193.536,443.31,216.576,418.734,215.04,389.55z" />
                    </g>
                  
                </svg>
              </a>
               <% if(loginMember == null){ %>
              <a href="<%= request.getContextPath()%>/logInSignUp.me" class="order_online">
                Login/Sign up
              </a>
              <% } else { %>
					<a href="<%= request.getContextPath() %>/logout" class="logOut"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" fill="white" ><!--! Font Awesome Pro 6.1.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2022 Fonticons, Inc. --><path d="M160 416H96c-17.67 0-32-14.33-32-32V128c0-17.67 14.33-32 32-32h64c17.67 0 32-14.33 32-32S177.7 32 160 32H96C42.98 32 0 74.98 0 128v256c0 53.02 42.98 96 96 96h64c17.67 0 32-14.33 32-32S177.7 416 160 416zM502.6 233.4l-128-128c-12.51-12.51-32.76-12.49-45.25 0c-12.5 12.5-12.5 32.75 0 45.25L402.8 224H192C174.3 224 160 238.3 160 256s14.31 32 32 32h210.8l-73.38 73.38c-12.5 12.5-12.5 32.75 0 45.25s32.75 12.5 45.25 0l128-128C515.1 266.1 515.1 245.9 502.6 233.4z"/></svg></a>
               <% } %>
            </div>
          </div>
        </nav>
      </div>
    </header>
   
  </div> 
  <!-- end header section -->
  