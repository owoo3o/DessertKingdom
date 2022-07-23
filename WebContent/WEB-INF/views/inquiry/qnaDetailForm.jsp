<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="inquiry.model.vo.Qna, inquiry.model.vo.Reply, java.util.ArrayList"%>
<%
	Qna qna = (Qna)request.getAttribute("qna");
	ArrayList<Reply> list = (ArrayList<Reply>)request.getAttribute("list");
// 	Member loginUser = (Member)request.getSession().getAttribute("loginUser");
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
  <!-- jQuery -->
  <script type="text/javascript" src="<%= request.getContextPath() %>/js/jquery-3.4.1.min.js"></script>	

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
   <link rel="stylesheet" href="<%= request.getContextPath() %>/css/style_inquiry_detail.css"> 
   <style>
    #qna{background:#222831; color:#fff};
   </style>

</head>

<body class="sub_page">

  <div class="hero_area">
    <div class="bg-box">
      <img src="<%= request.getContextPath() %>/mages/hero-bg.jpg" alt="">
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
      <!-- <div style="text-align: center;">자주 묻는 질문</div> -->

        
        <!-- 사용할 부분 board list 시작-->
          <div class="detail_outer">
            <br>
              <div class="table-area">
                <form action="<%= request.getContextPath() %>/qnaUpdateForm.qna" method="post" id="detailForm">
                    <!-- 글 번호 숨기기 -->
                    <input type="hidden" name="bId" value="<%= qna.getBoardId() %>">
                  <table>
                    <tr>
                    
                      <td class="tr_title">제목</td>
                      <td class="td_content" colspan="5">
                      <%= qna.getBoardTitle() %>
                        <input type="hidden" id="qnaTitle" name="qnaTitle" value="<%= qna.getBoardTitle() %>">
                      </td>
                    </tr>
                    <tr>
                      <td class="tr_title">작성자</td>
                      <td class="td_content">
                      <%= qna.getBoardWriter() %>
                      <input type="hidden" id="qnaWriter" name="qnaWriter" value=" <%= qna.getBoardWriter() %>">
                      </td>
                      
                      
                      
                      <td class="tr_title">조회수</td>
                      <td class="td_content">
                      <%= qna.getBoardCount() %>
                      </td>
        
                      <td class="tr_title">작성일</td>
                      <td class="td_content">
                      <%= qna.getCreateDate() %>
                      
                      
                      </td>
                    </tr>
                    <tr>
                      <td class="tr_title">분류</td>
                      <td class="td_content">
                      <%= qna.getCateName() %>
                        <input type="hidden" id="category" name="category" value="<%= qna.getCateName() %>">
                      </td>
                    </tr>
                    <tr>
                      <td colspan="6"><textarea name="content" cols="70px" rows="15px" style="resize:none;" readonly><%= qna.getBaordContent() %></textarea></td>
                    </tr>
                  </table>

                    <!-- button area -->
                    <div class="btn-box">
                    	<% if(loginMember != null && loginMember.getManager().equals("Y")) {%>
	                        <input type="submit" id="updateBtn" value="수정">
	                        <input type="button" onclick="deleteBoard();" id="deleteBtn" value="삭제">
                        <% } %>
                        <input type="button" onclick="location.href='<%= request.getContextPath() %>/list.qna'" id="menuBtn" value="목록">
                    </div>
                </form>
              </div>   
          </div>
    	
<!--     	댓글 작성 부분 -->

    	<div class ="replyArea">
    	
		<% if(loginMember.getManager().equals("Y")) { %>
			<div class="replyWriterArea">
					<div>답변 작성</div>
				<table>
					<tr>
						<td id="Replytd"><textarea rows='1' cols='20' id="replyContent"></textarea></td>
					</tr>
					<tr><td id="addRpTd"><button id="addReply">답변 등록</button></td></tr>
				</table>
			</div>
		<% } %> <br><br><br><br>
			<div id="replySelectArea">
<!-- 						<div>답글</div> -->
				<table id="replySelectTable">
					<% if(list != null && !list.isEmpty()) { %>
						<% for(int i = 0; i < list.size(); i++) { %>
							<tr>
								<td width="600px">Dessert Kingdom</td>
								<td><%= list.get(i).getModifyDate() %></td>
								<% if(loginMember != null && loginMember.getUserId().equals(list.get(i).getMemberId())) { %>
									<td>
										<button id="updateReply<%= i %>" class="updateReply">수정</button>
										<input type="hidden" id="rId<%= i %>" name="rId" value="<%= list.get(i).getReplyId() %>">
										<input type="hidden" id="bId<%= i %>" name="bId" value="<%= list.get(i).getBoardId() %>">
										<button id="sumbitBtn<%= i %>" class="sumbitBtn" style="display: none;">등록</button>
										<button id="deleteReply<%= i %>" class="deleteReply">삭제</button>
									</td>
								<% } %>
							</tr>
							<tr>
							<td colspan="3"><textarea class="rcontent" id="rcontent<%= i %>" readonly><%= list.get(i).getReplyContent() %></textarea></td>
							<td></td>
							<td></td>
							</tr>
								
						<% } %>
					<% } else { %>
						<% if(loginMember.getManager().equals("N")) { %>
						<tr><td>게시글 작성 후 1~2일 내에 답변 드립니다. <br>양해부탁드립니다.</td></tr>
						<% } %>
					<% } %>
				</table>
			</div>
		</div>
    
    </div>
    
  </section>

  <!-- end food section -->

	<script>
		function deleteBoard() {
			if(confirm('정말 삭제하시겠습니까?')) {
				location.href="<%= request.getContextPath() %>/delete.qna?bId=" + <%= qna.getBoardId() %>
			}
		}
		
		// 댓글 추가
		$(function(){
			$('#addReply').click(function(){
				var writer = '<%= loginMember.getUserId() %>';
				var bId = <%= qna.getBoardId() %>;
				var content = $('#replyContent').val();
				
				$.ajax({
					url: "insertReply.qna",
					type: 'post',
					data: {writer:writer, content:content, bId:bId},
					success: function(data){
						console.log(data);	
						$replyTable = $('#replySelectTable');
						$replyTable.html('');  // 이어서나오지 않게 비우기
						
							var $tr
						
						for(var i in data){ // data가 배열이므로 i는 배열의 인덱스
							var $tr = $('<tr>');
							var $writerTd = $('<td>').text(data[i].memberId).css('width', '100px');
							var $contentTd = $('<td><textarea class="rcontent" readonly>').text(data[i].replyContent);
							var $dateTd = $('<td>').text(data[i].modifyDate).css('width', '200px');
							var $btnTd = $('<td><button id="updateReply"+i>수정</a><a id="deleteReply"+i>삭제</button>');
							
							$tr.append($writerTd);
							$tr.append($contentTd);
							$tr.append($dateTd);
							$tr.append($btnTd);
							$replyTable.append($tr);
						}

						$('#replyContent').val('');
						
					},
					error: function(data){
					console.log(data);
					}
				});
			});
		});
	
		
		// 댓글 수정
		$(function(){
			$('.updateReply').click(function(){
// 				console.log($(this));
// 				console.log($(this).attr('id'));
// 				console.log($(this).attr('id').substring(11));
				var i = $(this).attr('id').substring(11);
				var rcontent = $('#rcontent' + i).text();
				console.log(rcontent);
					$('#rcontent' + i).removeAttr('readonly').focus();
					$('#sumbitBtn' + i).css('display', 'block');
					$('#updateReply' + i).css('display', 'none');
			});
		});
		
		// 등록 클릭
		$(function(){
			$('.sumbitBtn').click(function(){
				var i = $(this).attr('id').substring(9);
				var rId = $('#rId' + i).val()
				var bId = $('#bId' + i).val()
				var rcontent = $('#rcontent' + i).val();
				console.log(rcontent);
				
				$.ajax({
					url: "updateReply.qna",
					data: {rId:rId, bId:bId, rcontent:rcontent},
					success: function(data){
						console.log(data);	
						
						for(var i in data){ // data가 배열이므로 i는 배열의 인덱스
							var $tr = $('<tr>');
							var $writerTd = $('<td>').text(data[i].memberId).css('width', '100px');
							var $contentTd = $('<td><textarea class="rcontent" readonly></textarea>').text(data[i].replyContent).css('width', '800px');
							var $dateTd = $('<td>').text(data[i].modifyDate).css('width', '200px');
							var $btnTd = $('<td><button id="updateReply"+i>수정</a><a id="deleteReply"+i>삭제</button>');
							
							$tr.append($writerTd);
							$tr.append($contentTd);
							$tr.append($dateTd);
							$tr.append($btnTd);
							$replyTable.append($tr);
							
						$('#rcontent').attr('readonly');
						}
					},
					error: function(data){
						console.log(data);	
					}	
				
				})
			});
		});
		
		
		
		// 댓글 삭제		
		$(function(){
			$('.deleteReply').click(function(){
// 				console.log($(this));
// 				console.log($(this).attr('id'));
// 				console.log($(this).attr('id').substring(11));
				var i = $(this).attr('id').substring(11);
				var rId = $('#rId' + i).val();
				var bId = $('#bId' + i).val();
				console.log(bId);
				
				$.ajax({
					url: "deleteReply.qna",
					data: {rId:rId, bId:bId},
					success: function(data){
						console.log(data);	
						
							for(var i in data){ // data가 배열이므로 i는 배열의 인덱스
								var $tr = $('<tr>');
								var $writerTd = $('<td>').text(data[i].memberId).css('width', '100px');
								var $contentTd = $('<td><textarea class="rcontent" id="rcontent" readonly></textarea>').text(data[i].replyContent).css('width', '800px');
								var $dateTd = $('<td>').text(data[i].modifyDate).css('width', '200px');
								var $btnTd = $('<td><button id="updateReply"+i>수정</a><a id="deleteReply"+i>삭제</button>');
								
								$tr.append($writerTd);
								$tr.append($contentTd);
								$tr.append($dateTd);
								$tr.append($btnTd);
								$replyTable.append($tr);
							}
					},
					error: function(data){
					console.log(data);
					}
				});
			});
		});
	</script>





  <!-- footer section -->
<%@ include file="../common/footer.jsp" %>
  <!-- footer section -->

  <!-- jQery -->
  
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


</body>

</html>