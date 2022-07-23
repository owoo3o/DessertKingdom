<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "information.model.vo.Notice"%>
<%
	Notice notice = (Notice)request.getAttribute("notice");
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
 	<link rel="shortcut icon" href="${pageContext.request.contextPath}/images/favicon.png" type="">

    <title> Dessert Kingdom </title>

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
	<!-- notice css -->
	<script src="${pageContext.request.contextPath}/js/jquery-3.4.1.min.js"></script>
	<link href="${pageContext.request.contextPath}/css/detail_Notice.css" rel="stylesheet" />
	
</head>

<body class="sub_page">

  <div class="hero_area">
    <div class="bg-box">
      <img src="${pageContext.request.contextPath}/images/hero-bg.jpg" alt="">
    </div>
        <!-- header section strats -->
	     <%@ include file="../common/header.jsp" %>
	    <!-- end header section -->
  </div>

  <!-- notice write section -->

  <section class="noticeWrite_section layout_padding">
    <div class="container">
    	<h4>Notice</h4>
  		
  		<div class="writeN_area">
			<form action="<%= request.getContextPath() %>/updateNoticePage" method="post">
				<table>
					<tr class="hidden">
						<th>공지번호</th>
						<td>
							<input type="text" size="20" name="notice_No" value="<%= notice.getNoticeNo() %>" readonly>
						</td>	
						<th>게시글번호</th>
						<td>
							<input type="text" size="20" name="board_No" value="<%= notice.getBoardId() %>" readonly>
						</td>				
					</tr>
					<tr>
						<th>제목</th>
						<td colspan="3">
							<input type="text" size="50" name="notice_Title" value="<%= notice.getNoticeTitle() %>" readonly>
						</td>				
					</tr>
					<tr>
						<th>작성일</th>
						<td>
							<input type="date" name="NoticeW_op" value="<%= notice.getCreateDate() %>" readonly>
						</td>
						<th>조회수</th>
						<td>
							<input type="number" name="NoticeW_Views" value="<%= notice.getNoticeCount() %>" readonly>
						</td>
					</tr>
					<tr>
						<td colspan="4">
							<textarea name="notice_Content" cols="60" rows="15" style="resize:none;" readonly><%= notice.getNoticeContent() %> </textarea>
						</td>
					</tr>
				</table>
				
				<br>
				
				<div align="center">
				<% if(loginMember != null && loginMember.getManager().equals("Y")){ %>
					<input type="submit" id="notice_UpdateBtn" value="edit">
					<input type="button" id="notice_DeleteBtn" value="delete" onclick="deleteNotice();">
				<% } %>
					<input type="button" onclick="location.href='<%= request.getContextPath() %>/information'" id="notice_CancelBtn" value="back">
				</div>
			</form>
		</div>
    </div>
  </section>
  <script>
  	function deleteNotice(){
  		var deleteOk = confirm("공지사항을 삭제하시겠습니까?");
  		if(deleteOk){
  			var num = $('input[name=board_No]').val();
  			location.href='<%=request.getContextPath() %>/deleteNotice?board_No=' + num;
  		}
  	}
  	
  </script>

  <!-- end notice write section -->

    <!-- footer section -->
		<%@ include file="..//common/footer.jsp" %>
	<!-- footer section -->

  <!-- jQery -->
  <script src="js/jquery-3.4.1.min.js"></script>
  <!-- popper js -->
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous">
  </script>
  <!-- bootstrap js -->
  <script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
  <!-- owl slider -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js">
  </script>
  <!-- isotope js -->
  <script src="https://unpkg.com/isotope-layout@3.0.4/dist/isotope.pkgd.min.js"></script>
  <!-- nice select -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/js/jquery.nice-select.min.js"></script>
  <!-- custom js -->
  <script src="${pageContext.request.contextPath}/js/custom.js"></script>
  <!-- Google Map -->
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCh39n5U-4IoWpsVGUHWdqB6puEkhRLdmI&callback=myMap">
  </script>
  <!-- End Google Map -->

</body>

</html>