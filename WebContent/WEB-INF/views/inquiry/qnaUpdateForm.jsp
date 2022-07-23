<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="inquiry.model.vo.Qna" %>
<%
	Qna q = (Qna)request.getAttribute("q");
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
  <link rel="stylesheet" href="<%= request.getContextPath() %>/css/style_inquiry_update.css"> 
  <style>
    #qna {background:#222831; color:#fff};
  </style>

  <!-- fonts -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Grape+Nuts&family=Noto+Sans+KR:wght@300&family=Titillium+Web&display=swap" rel="stylesheet">


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
        <li class="ibutton" id="faq">FAQ</li>
        <li class="ibutton" id="qna">Q&amp;A</li>
      </ul>
      <!-- <div style="text-align: center;">자주 묻는 질문</div> -->

        
        <!-- 사용할 부분 board list 시작-->
          <div class="detail_outer">
            <br>
            <div class="table-area">
              <form action="<%= request.getContextPath() %>/update.qna" method="post" id="detailForm">
                      <!-- 글 번호 숨기기 -->
                <table>
                  <header><h4 class="b_title">문의 작성</h4></header>
                    <tr>
                      
                      <td class="tr_title">제목</td>
                      <td class="td_content" colspan="5">
                        <input type="text" id="q_Title" name="qnaTitle" value="<%= q.getBoardTitle() %>">
                        <input type="hidden" name="bId" value="<%= q.getBoardId() %>">
                      </td>
                    </tr>
                    
                    <tr>
                      <td class="tr_title">작성자</td>
                      <td class="td_content">
                        <input type="text" id="q_writer" name="qnaWriter" value="<%= q.getBoardWriter() %>" readonly>
                      </td>
                      
                      <td class="tr_title">분류</td>
                      <td class="td_content">
                       <select name="category">
                          <option>-------</option>
                          <option value="10" <%= q.getCateName().equals("클래스 문의") ? "selected":"" %>>클래스 문의</option>
                          <option value="20" <%= q.getCateName().equals("환불 및 취소") ? "selected":"" %>>환불 및 취소</option>
                          <option value="30" <%= q.getCateName().equals("기타") ? "selected":"" %>>기타</option>
                        </select>
                      </td>
                    </tr>


                    <tr>
                      <td colspan="6"><textarea name="content" cols="70px" rows="15px" style="resize:none;"><%= q.getBaordContent() %></textarea></td>
                    </tr>
                  </table>

                    <!-- button area -->
                    <div class="btn-box">
                        <input type="submit" id="updateBtn" value="등록">
                        <input type="button" onclick="location.href='<%= request.getContextPath() %>/list.qna'" id="cancleBtn" value="취소">
                    </div>
                    
                    
                    
                </form>
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
  <!-- custom js -->
  <script src="js/custom.js"></script>
  <!-- Google Map -->
  <scrip src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCh39n5U-4IoWpsVGUHWdqB6puEkhRLdmI&callback=myMap">
  </script>
  <!-- End Google Map -->

  <!-- script -->




</body>

</html>