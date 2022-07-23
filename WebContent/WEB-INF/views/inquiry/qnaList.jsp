<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, inquiry.model.vo.*, member.model.vo.*" %>
<%
	ArrayList<Qna> list = (ArrayList<Qna>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	Qna qna = new Qna();
	
// 	System.out.println(list);
// 	System.out.println(Rlist);
%>
<!DOCTYPE html>
<html>

<head>
  <!-- Basic -->
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <!-- Mobile Metas -->
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <!-- Site Metas -->
  <meta name="keywords" content="" />
  <meta name="description" content="" />
  <meta name="author" content="" />
  <link rel="shortcut icon" href="<%= request.getContextPath() %>/images/favicon.png" type="">

  <title>Inquiry List</title>

  <!-- bootstrap core css -->
  <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/bootstrap.css" />

  <!--owl slider stylesheet -->
  <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" />
  <!-- nice select  -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/css/nice-select.min.css" integrity="sha512-CruCP+TD3yXzlvvijET8wV5WxxEh5H8P4cmz0RFbKK6FlZ2sYl3AEsKlLPHbniXKSrDdFewhbmBK5skbdsASbQ==" crossorigin="anonymous" />
  <!-- font awesome style -->
  <link href="<%= request.getContextPath() %>/css/font-awesome.min.css" rel="stylesheet" />

  <!-- Custom styles for this template -->
  <link href="<%= request.getContextPath() %>/css/style.css" rel="stylesheet" />
  <!-- responsive style -->
  <link href="<%= request.getContextPath() %>/css/responsive.css" rel="stylesheet" />
  
  <!-- CSS-->
  <link rel="stylesheet" href="<%= request.getContextPath() %>/css/style_inquiry_list.css">
  <style>
    #qna {
    	background:#222831; color:#fff
   	};
   	
  	.paging button:hover {
   		background: #FFBE33;
   		color:#fff
   }
  </style> 

</head>

<body class="sub_page">

  <div class="hero_area">
    <div class="bg-box">
      <img src="<%= request.getContextPath() %>/images/hero-bg.jpg" alt="">
    </div>
    <!-- header section strats -->
    <%@ include file="../common/header.jsp" %>
    <!-- end header section -->
  </div>

  <!-- food section -->
  
<section class="food_section layout_padding">
  <div class="container">
      <div class="heading_container heading_center">
        <h2>
          Inquiry
        </h2>
      </div>
      
      <ul class="filters_menu">
        <li class="ibutton" id="faq" onclick="location.href='<%= request.getContextPath() %>/list.faq'">FAQ</li>
        <li class="ibutton" id="qna" onclick="location.href='<%= request.getContextPath() %>/list.qna'">Q&amp;A</li>
      </ul>

	<div class="navbar-area">
      <nav>
        <div id="horizontal_underline"></div>
        <a id="class" href="#">클래스 문의</a>
        <a id="refund" href="#">환불 및 취소</a>
        <a id="etc" href="#">기타</a>
      </nav>
   </div>
   
   <br><br>
   
      <!-- <div style="text-align: center;">자주 묻는 질문</div> -->
      <div class="faq">
        
        <!-- 사용할 부분 board list 시작-->
        <div class="board_list_wrap">
            <table class="board_list" id="listArea">

              <!-- button area -->
              <% if(loginMember != null) { %>
              <div class="btn-box">
                <input type="button" onclick="location.href='<%= request.getContextPath() %>/writeqna.bo'" value="작성하기">
              </div>
              <% } %>

                    <caption>QNA 목록</caption>
                    <thead>
                        <tr>
                        	<th>번호</th>
                            <th>분류</th>
                            <th>제목</th>
                            <th>작성자</th>
                            <th>작성일</th>
                            <th>조회수</th>
                        </tr>
                    </thead>   
                    <tbody>
                    	<% if(list.isEmpty()) { %>
                    	<tr id="noContent">
                            <td colspan="6">조회된 리스트가 없습니다.</td>
                        </tr>
                        <% } else { %>
                        	<% for(Qna q : list) { %>
							<tr>
								<td><%= q.getBoardId() %></td>
								<td><%= q.getCateName() %></td>
								<td><%= q.getBoardTitle() %></td>
								<td><%= q.getBoardWriter() %></td>
								<td><%= q.getModifyDate() %></td>
								<td><%= q.getBoardCount() %></td>
							</tr>								
                            <% } %>
                         <% } %>  
                    </tbody>    
            </table>
            
            <!-- 페이징 처리 부분-->
            <div class="paging">
              <!-- 맨 처음으로 -->
              <button class="btnOn" onclick="location.href='<%= request.getContextPath() %>/list.qna?currentPage=1'">&lt;&lt;</button>
              <!-- 이전 페이지로  -->
              <button class="btnOn" onclick="location.href='<%= request.getContextPath() %>/list.qna?currentPage=<%= pi.getCurrentPage()-1 %>'" id="beforeBtn">&lt;</button>
              <!-- 현재페이지, 페이지 번호 -->
              <% for(int p = pi.getStartPage(); p <= pi.getEndPage(); p++) { %>
              	<% if(p == pi.getCurrentPage()) { %>
              		<button id="choosen" disabled><%= p %></button>
              	<% } else { %>	
              		<button class="btnOn" onclick="location.href='<%= request.getContextPath() %>/list.qna?currentPage=<%= p %>'"><%= p %></button>
             	<% } %>
              <% } %>	
              <!-- 다음 페이지로  -->
              <button class="btnOn" onclick="location.href='<%= request.getContextPath() %>/list.qna?currentPage=<%= pi.getCurrentPage() +1 %>'" id="afterBtn">&gt;</button>
              <!-- 맨 마지막으로 -->
              <button class="btnOn" onclick="location.href='<%= request.getContextPath() %>/list.qna?currentPage=<%= pi.getMaxPage()%>'">&gt;&gt;</button>
            </div> 
          </div> 
        </div>
    </div>
      


</section>


  <!-- end food section -->

  <!-- footer section -->

   <%@ include file="../common/footer.jsp" %>

  <!-- footer section -->

  <!-- jQery -->
  <script src="<%= request.getContextPath() %>/js/jquery-3.4.1.min.js"></script>
  <!-- popper js -->
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous">
  </script>
  <!-- bootstrap js -->
  <script src="js/bootstrap.js"></script>
  <!-- owl slider -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js">
  </script>
  <!-- isotope js -->
  <script src="https://unpkg.com/isotope-layout@3.0.4/dist/isotope.pkgd.min.js"></script>
  <!-- nice select -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/js/jquery.nice-select.min.js"></script>
  <!-- custom js -->
  <script src="js/custom.js"></script>
  <!-- Google Map -->
  <scrip src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCh39n5U-4IoWpsVGUHWdqB6puEkhRLdmI&callback=myMap">
  </script>
  <!-- End Google Map -->

  <script>
    let horizontalUnderLine = document.getElementById('horizontal_underline');
    let horizontalMenus = document.querySelectorAll('nav a');

    horizontalMenus.forEach(menu=>menu.addEventListener("click", (e)=>horizontalndicator(e)));

    function horizontalndicator(e) {
      horizontalUnderLine.style.left = e.currentTarget.offsetLeft + "px";
      horizontalUnderLine.style.width = e.currentTarget.offsetWidth + "px";
      horizontalUnderLine.style.top = e.currentTarget.offsetTop +  e.currentTarget.offsetHeight + "px";
    }
    
    // 페이징 버튼 스크립트
    if(<%= pi.getCurrentPage()%> <= 1){
  		$('#beforeBtn').prop('disabled', true);
  	}
  	
  	if(<%= pi.getCurrentPage() %> >= <%= pi.getMaxPage() %>){
  		$('#afterBtn').prop('disabled', true);
  	}
  	
  	$('#choosen').css({"background-color":"#FFBE33", "color":"white"});
    
  	
  	// 회원만 게시글 열람가능하게 함
  	$(function(){
  		$('#listArea td').mouseenter(function(){
  			$(this).parent().css({'background':'#FFF9B0', 'cursor':'pointer'});	
  		}).mouseout(function(){
  			$(this).parent().css('background','none');	
  		}).click(function(){
  			var bId = $(this).parent().children().eq(0).text();
  			
  			if('<%= loginMember %>' != 'null') {
  				location.href = '<%= request.getContextPath() %>/detail.qna?bId=' + bId;
  			} else {
				alert('회원만 열람할 수 있는 게시글입니다.');
 			}
  		});
  	});
  	
  	
  	// 카테고리 필터(클래스 문의)
  	$(function(){
  		$('#class').click(function(){
  			var cateName = $('#class').text();
  			
  			$.ajax({
  				url: "selectCate.qna",
  				data: {cateName:cateName},
  				success: function(data){
  					console.log(data);
  					$selectTable = $('#listArea');
  					$selectTable.html('');
						
						var $menuTr = $('<tr>');
						var $bId = $('<th>').text("번호");
						var $cate = $('<th>').text("분류");
						var $title = $('<th>').text("제목");
						var $writer = $('<th>').text("작성자");
						var $date = $('<th>').text("작성일");
						var $count = $('<th>').text("조회수");
						
						$menuTr.append($bId);
						$menuTr.append($cate);
						$menuTr.append($title);
						$menuTr.append($writer);
						$menuTr.append($date);
						$menuTr.append($count);
						
						$selectTable.append($menuTr);
  					
					for(var i in data){ // data가 배열이므로 i는 배열의 인덱스
						var $tr = $('<tr>');
						var $bIdTd = $('<td>').text(data[i].boardId).css('width', '80px');
						var $cateTd = $('<td>').text(data[i].cateName).css('width', '184px');
						var $titleTd = $('<td>').text(data[i].boardTitle).css('width','349px');
						var $writerTd = $('<td>').text(data[i].boardWriter).css('width', '100px');
						var $dateTd = $('<td>').text(data[i].modifyDate).css('width', '143px');
						var $countTd = $('<td>').text(data[i].boardCount).css('width', '100px');
						
						$tr.append($bIdTd);
						$tr.append($cateTd);
						$tr.append($titleTd);
						$tr.append($writerTd);
						$tr.append($dateTd);
						$tr.append($countTd);
						
						$selectTable.append($tr);
	  				}
					
					$(function(){
				  		$('#listArea td').mouseenter(function(){
				  			$(this).parent().css({'background':'#FFF9B0', 'cursor':'pointer'});	
				  		}).mouseout(function(){
				  			$(this).parent().css('background','none');	
				  		}).click(function(){
				  			var bId = $(this).parent().children().eq(0).text();
				  			
				  			if('<%= loginMember %>' != 'null') {
				  				location.href = '<%= request.getContextPath() %>/detail.qna?bId=' + bId;
				  			} else {
								alert('회원만 열람할 수 있는 게시글입니다.');
				 			}
				  		});
				  	});
					
  				},
  				error: function(data){
  					console.log(data);
  				}
  			
  			});
  		});
  	});
  	
  	
 // 카테고리 필터(환불 및 취소)
  	$(function(){
  		$('#refund').click(function(){
  			var cateName = $('#refund').text();
  			console.log(cateName);
  			
  			$.ajax({
  				url: "selectCate.qna",
  				data: {cateName:cateName},
  				success: function(data){
  					console.log(data);
  					$selectTable = $('#listArea');
  					$selectTable.html('');
						
						var $menuTr = $('<tr>');
						var $bId = $('<th>').text("번호");
						var $cate = $('<th>').text("분류");
						var $title = $('<th>').text("제목");
						var $writer = $('<th>').text("작성자");
						var $date = $('<th>').text("작성일");
						var $count = $('<th>').text("조회수");
						
						$menuTr.append($bId);
						$menuTr.append($cate);
						$menuTr.append($title);
						$menuTr.append($writer);
						$menuTr.append($date);
						$menuTr.append($count);
						
						$selectTable.append($menuTr);
  					
					for(var i in data){ // data가 배열이므로 i는 배열의 인덱스
						var $tr = $('<tr>');
						var $bIdTd = $('<td>').text(data[i].boardId).css('width', '80px');
						var $cateTd = $('<td>').text(data[i].cateName).css('width', '184px');
						var $titleTd = $('<td>').text(data[i].boardTitle).css('width', '349px');
						var $writerTd = $('<td>').text(data[i].boardWriter).css('width', '100px');
						var $dateTd = $('<td>').text(data[i].modifyDate).css('width', '143px');
						var $countTd = $('<td>').text(data[i].boardCount).css('width', '100px');
						
						$tr.append($bIdTd);
						$tr.append($cateTd);
						$tr.append($titleTd);
						$tr.append($writerTd);
						$tr.append($dateTd);
						$tr.append($countTd);
						
						$selectTable.append($tr);
	  				}
					
					$(function(){
				  		$('#listArea td').mouseenter(function(){
				  			$(this).parent().css({'background':'#FFF9B0', 'cursor':'pointer'});	
				  		}).mouseout(function(){
				  			$(this).parent().css('background','none');	
				  		}).click(function(){
				  			var bId = $(this).parent().children().eq(0).text();
				  			
				  			if('<%= loginMember %>' != 'null') {
				  				location.href = '<%= request.getContextPath() %>/detail.qna?bId=' + bId;
				  			} else {
								alert('회원만 열람할 수 있는 게시글입니다.');
				 			}
				  		});
				  	});
					
  				},
  				error: function(data){
  					console.log(data);
  				}
  			
  			});
  		});
  	});
	
  	
 // 카테고리 필터(기타)
  	$(function(){
  		$('#etc').click(function(){
  			var cateName = $('#etc').text();
  			console.log(cateName);
  			
  			$.ajax({
  				url: "selectCate.qna",
  				data: {cateName:cateName},
  				success: function(data){
  					console.log(data);
  					$selectTable = $('#listArea');
  					$selectTable.html('');
						
						var $menuTr = $('<tr>');
						var $bId = $('<th>').text("번호");
						var $cate = $('<th>').text("분류");
						var $title = $('<th>').text("제목");
						var $writer = $('<th>').text("작성자");
						var $date = $('<th>').text("작성일");
						var $count = $('<th>').text("조회수");
						
						$menuTr.append($bId);
						$menuTr.append($cate);
						$menuTr.append($title);
						$menuTr.append($writer);
						$menuTr.append($date);
						$menuTr.append($count);
						
						$selectTable.append($menuTr);
  					
					for(var i in data){ // data가 배열이므로 i는 배열의 인덱스
						var $tr = $('<tr>');
						var $bIdTd = $('<td>').text(data[i].boardId).css('width', '80px');
						var $cateTd = $('<td>').text(data[i].cateName).css('width', '184px');
						var $titleTd = $('<td>').text(data[i].boardTitle).css('width', '349px');
						var $writerTd = $('<td>').text(data[i].boardWriter).css('width', '100px');
						var $dateTd = $('<td>').text(data[i].modifyDate).css('width', '143px');
						var $countTd = $('<td>').text(data[i].boardCount).css('width', '100px');
						
						$tr.append($bIdTd);
						$tr.append($cateTd);
						$tr.append($titleTd);
						$tr.append($writerTd);
						$tr.append($dateTd);
						$tr.append($countTd);
						
						$selectTable.append($tr);
	  				}
					
					$(function(){
				  		$('#listArea td').mouseenter(function(){
				  			$(this).parent().css({'background':'#FFF9B0', 'cursor':'pointer'});	
				  		}).mouseout(function(){
				  			$(this).parent().css('background','none');	
				  		}).click(function(){
				  			var bId = $(this).parent().children().eq(0).text();
				  			
				  			if('<%= loginMember %>' != 'null') {
				  				location.href = '<%= request.getContextPath() %>/detail.qna?bId=' + bId;
				  			} else {
								alert('회원만 열람할 수 있는 게시글입니다.');
				 			}
				  		});
				  	});
					
  				},
  				error: function(data){
  					console.log(data);
  				}
  			
  			});
  		});
  	});
 
  </script>

</body>

</html>