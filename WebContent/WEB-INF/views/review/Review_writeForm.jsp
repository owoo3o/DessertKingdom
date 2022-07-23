<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="review.model.vo.*" %>
<%
	ReviewBoard r = (ReviewBoard)request.getAttribute("review");
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
  <link href="<%=request.getContextPath() %>/css/Review-writeForm.css" rel="stylesheet">


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

</head>

<body class="sub_page">

  <div class="hero_area">
    <div class="bg-box">
      <img src="<%=request.getContextPath() %>/images/hero-bg.jpg" alt="">
    </div>
    <!-- header section strats -->
   
   <%@ include file="../common/header.jsp" %>
   
    <!-- end header section -->
  </div>

  <!-- about section -->

  <section class="food_section layout_padding">
        <div class="container">
          <div class="heading_container heading_center">
            <h2></h2>
          </div>

            
            <!-- 사용할 부분 board list 시작-->
              <div class="detail_outer">
                <br>
                <div class="table-area">
                  <form action="<%= request.getContextPath() %>/insert.th" method="post" id="detailForm"  enctype="multipart/form-data">
                    <table >
                      <header><h4 class="b_title">글 작성하기</h4></header>
                      <tr>
                          <!-- 글 번호 숨기기 -->
<!--                           <input type="hidden" name="qId" value=""> -->
    
                          <td class="tr_title">제목</td>
                          <td class="td_content" colspan="5">
                            <input type="text" id="q_Title" name="title" value="">
                          </td>
                        </tr>
                        
<!--                         <tr> -->
<!--                           <td class="tr_title">작성자</td> -->
<%--                           <td class="td_content" id="writer"><%= r.getBoardTitle() %></td> --%>
                          
<!--                           <td class="tr_title">작성일</td> -->
<!--                           <td class="td_content"> -->
<!--                             <input type="date" id="q_Date" name="date" value=""> -->
<!--                           </td> -->
<!--                           <td class="tr_title">수강 클래스 </td> -->
                          
<!--                           <td class="td_content" id="oneclass"> -->
<!--                              		  마카롱 만들기 -->
<!--                           </td> -->
<!--                         </tr> -->
    
                        <tr>
                          <td colspan="6"><textarea cols="70px" rows="15px" style="resize:none;" name="content"></textarea></td>
                        </tr>
                        <!-- 사진 보이게할지 -->
                    <!--    <tr> 
                         	<td colspan="2" class="img"> 
                        		<div id="ImgArea1"> 
                         			<img id="contentImg1" width="130" height="130"> 
                         		</div> 
                         	</td> 
                         	<td colspan="2" class="img"> 
                         		<div id="ImgArea2"> 
                         			<img id="contentImg2" width="130" height="130"> 
                         		</div> 
                         	</td> 
                         	<td colspan="2" class="img"> 
                         		<div id="ImgArea3"> 
                        			<img id="contentImg3" width="130" height="130"> 
                         		</div> 
                         	</td> 
                         </tr> -->
                    	
                        
                      </table>
                      
                      <!-- 파일 첨부 -->
                      <table id="fileList">
                   <tr onMouseOver="fileList.clickedRowIndex=this.rowIndex">
                     <td class="file">File</td>
                     <td class="file"><input type=file name="fileNm" id="fileNm1"></td>
<!--                      <td class="file"><input type=file name="fileNm2" id="fileNm2"></td> -->
<!--                      <td class="file"><input type=file name="fileNm3" id="fileNm3"></td> -->
                     
                      <td class="file"><input type=button name="fileList_addRow" value=" 추가 " onClick="addRow()" class="fileBtn"></td> 
                     <td class="file"><input type=button name="fileList_delRow" value=" 삭제 " onClick="delRow()" class="fileBtn"></td> 
                   </tr>
                  
                 </table>
                      
                                          
                        <!-- button area -->
                        <div class="btn-box">
                            <input type="submit" id="updateBtn" value="등록">
                            <input type="button" id="cancleBtn" onclick="location.href='<%= request.getContextPath() %>/list.th'" value="취소">
                        </div>
                        
                        
                        
                    </form>
                  </div>   
              </div>
        </div>
      </section>

  <!-- end about section -->

  <!-- footer section -->
  
  <%@ include file="../common/footer.jsp" %>
  
  <!-- footer section -->


  <script src="<%=request.getContextPath() %>/js/Review-writeForm.js"></script>

  <!-- jQery -->
  <script src="<%=request.getContextPath() %>/js/jquery-3.4.1.min.js"></script>
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
