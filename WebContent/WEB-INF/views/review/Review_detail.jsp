<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="review.model.vo.*, java.util.*"%>
<%
	ReviewBoard r = (ReviewBoard)request.getAttribute("review");
	ArrayList<Attachment> fileList = (ArrayList<Attachment>)request.getAttribute("fileList");
	
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
  <link rel="shortcut icon" href="<%=request.getContextPath() %>/images/favicon.png" type="">
 <link href="<%=request.getContextPath() %>/css/Review-detail.css" rel="stylesheet">


  <title> Dessert Kingdom </title>

  <!-- bootstrap core css -->
  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/bootstrap.css" />

  <!--owl slider stylesheet -->
  <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" />
  <!-- nice select  -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/css/nice-select.min.css" integrity="sha512-CruCP+TD3yXzlvvijET8wV5WxxEh5H8P4cmz0RFbKK6FlZ2sYl3AEsKlLPHbniXKSrDdFewhbmBK5skbdsASbQ==" crossorigin="anonymous" />
  <!-- font awesome style -->
  <link href="<%=request.getContextPath() %>/css/font-awesome.min.css" rel="stylesheet" />

  <!-- Custom styles for this template -->
  <link href="<%=request.getContextPath() %>/css/style.css" rel="stylesheet" />
  <!-- responsive style -->
  <link href="<%=request.getContextPath() %>/css/responsive.css" rel="stylesheet" />
<script src="<%=request.getContextPath() %>/js/jquery-3.4.1.min.js"></script>
</head>

<body class="sub_page">

  <div class="hero_area">
    <div class="bg-box">
      <img src="<%=request.getContextPath() %>/mages/hero-bg.jpg" alt="">
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
          Review
        </h2>
      </div>
      
      <!-- <div style="text-align: center;">자주 묻는 질문</div> -->

        
        <!-- 사용할 부분 board list 시작-->
          <div class="detail_outer">
            <br>
              <div class="table-area">
                <form action="<%= request.getContextPath() %>/ImgUpdateForm.th" id="detailForm" method="post">
                  <table>
                    <tr>
                    <!-- 글 번호 숨기기 -->
                    <input type="hidden" name="qId" value="">
                    
                      <td class="tr_title">제목</td>
                      <td class="td_content" colspan="5">
                        	<%= r.getBoardTitle()%>
                        <input type="hidden" name="title" value="<%= r.getBoardTitle() %>">	
                      </td>
                    </tr>
                    <tr>
                      <td class="tr_title">작성자</td>
                      <td class="td_content">
                          <input type="hidden" id="writer" name="qnaWriter" value="">
                          	<%= r.getBoardWriter() %>
                      </td>
                      
                      <td class="tr_title">조회수</td>
                      <td class="td_content">
                        <input type="hidden" id="count" name="faqCount" value="">
                        	<%= r.getBoardCount() %>
                      </td>
        
                      <td class="tr_title">작성일</td>
                      <td class="td_content">
                        <input type="hidden" id="date" name="faqDate" value="">
                        	<%= r.getModifyDate() %>
                      </td>
                    </tr>
<!--                     <tr> -->
<!--                       <td class="tr_title">수강클래스</td> -->
<!--                       <td class="td_content"> -->
<!--                         <input type="hidden" id="category" name="category" value=""> -->
<!--                         	<select name="category"> -->
<!--                           <option>-------</option> -->
<!--                           <option value="10">브라우니 만들기 클래스</option> -->
<!--                           <option value="20">에그타르트 만들기 클래스</option> -->
<!--                           <option value="30">사탕 만들기</option> -->
<!--                           <option value="40">초콜릿 만들기</option> -->
<!--                         </select> -->
<!--                       </td> -->
<!--                     </tr> -->
                    <!-- 추가한거 -->
                    <tr>
                    	<td >
                    		<div id="titleImgArea" align="center">
                    			<img id="titleImg" name="img"
                    				src="<%= request.getContextPath() %>/img_uploadFiles/<%= fileList.get(0).getChangeName() %>">
                    		</div>
                    	</td>
    						<% for(int i = 1; i < fileList.size(); i++){ %>
		    					<td style="border: none" colspan="4">
		    						<div class="detailImgArea" align="center">
										<img id="detailImg" class="detailImg" name="img2"
											src="<%= request.getContextPath() %>/img_uploadFiles/<%= fileList.get(i).getChangeName() %>">		    						
		    						</div>
		    					</td>
    						<% } %>
    					</tr>
                    <tr>
                      <td colspan="6">
                      	<textarea cols="70px" rows="15px" style="resize:none;" readonly name="content"> <%= r.getBoardContent() %></textarea>
                      	<input type="hidden" name="bId" value="<%= r.getBoardId() %>">
                      	
                      	</td>
                    </tr>
                  </table>
<!-- 					<table class="detailImgArea"> -->
<!--     					<tr> -->
<%--     						<% for(int i = 1; i < fileList.size(); i++){ %> --%>
<!-- 		    					<td> -->
<!-- 		    						<div class="detailImgArea"> -->
<!-- 										<img id="detailImg" class="detailImg" -->
<%-- 											src="<%= request.getContextPath() %>/img_uploadFiles/<%= fileList.get(i).getChangeName() %>">		    						 --%>
<!-- 		    						</div> -->
<!-- 		    					</td> -->
<%--     						<% } %> --%>
<!--     					</tr> -->
    					
<!--     					</table> -->


                    <!-- button area -->
                    <div class="btn-box">
                    <% if(r.getBoardWriter().equals(loginMember.getUserId()) && loginMember != null){ %>
<!--                         <input type="submit" id="updateBtn" value="수정" > -->
                        <input type="button" onclick="deleteBoard();" id="deleteBtn" value="삭제">
                    <% } %>    
                        <input type="button" onclick="location.href='<%= request.getContextPath() %>/list.th'" id="menuBtn" value="목록">
                    </div>
                    
                    <script>
                    	function deleteBoard(){
                    		if(confirm('삭제하시겠습니까?')){
                    			location.href="<%= request.getContextPath() %>/delete.th?bId=" + <%= r.getBoardId() %>;
                    		}
                    	}
                    
                    
                    </script>
                    
                    
                </form>
              </div>   
          </div>
    </div>
  </section>

  <!-- end about section -->

  <!-- footer section -->
  <%@ include file="../common/footer.jsp" %>
  <!-- footer section -->

  <!-- jQery -->

  <!-- popper js -->
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous">
  </script>
  <!-- bootstrap js -->
  <script src="<%=request.getContextPath() %>/js/bootstrap.js"></script>
  <!-- owl slider -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js">
  </script>
  <!-- isotope js -->
  <script src="https://unpkg.com/isotope-layout@3.0.4/dist/isotope.pkgd.min.js"></script>
  <!-- nice select -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/js/jquery.nice-select.min.js"></script>
  <!-- custom js -->
  <script src="<%=request.getContextPath() %>/js/custom.js"></script>
  <!-- Google Map -->
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCh39n5U-4IoWpsVGUHWdqB6puEkhRLdmI&callback=myMap">
  </script>
  <!-- End Google Map -->

</body>

</html>

</body>
</html>