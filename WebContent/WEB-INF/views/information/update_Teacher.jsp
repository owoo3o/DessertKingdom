<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<link href="${pageContext.request.contextPath}/css/style_TeacherWrite.css" rel="stylesheet" />
	
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

  <section class="teacherWrite_section layout_padding">
    <div class="container">
    	<h4>Edit Teachers</h4>
  		
  		<div class="writeT_area">
			<form action="<%= request.getContextPath() %>/updateTeacher" method="post" encType="multipart/form-data">
				<table>
					<tr>
						<th>강사명</th>
						<td>
							<input type="text" size="20" name="teacher_Name" value="<%= request.getAttribute("nameT")%>">
						</td>	
						
						<td>
							<input type="hidden" name="boardId" value="<%= request.getAttribute("numT")%>"  >
						</td>	 
								
					</tr>
					<tr>
						<th>대표 이미지</th>
						<td colspan="3">
							<div id="teacher_Photo">
								<img id="teacherImg" width="350" height="200" src="<%= request.getContextPath() %>/teacher_upFiles">
								이미지크기 350*200
							</div>
						</td>
					</tr>
					<tr>
						<th rowSpan="2">강사 소개</th>
					</tr>
					<tr>
						<td colspan="3">
							<textarea name="teacher_Content" cols="60" rows="5" style="resize:none;" ><%= request.getAttribute("infoT")%></textarea>
						</td>
					</tr>
					<tr class="fileArea">
						<td colspan="3">
						<input type="file" id="pictureT" name="pictureT" onchange="LoadImg(this)">
						</td>
					</tr>
				</table>
				
				<br>
				
				<div align="center">
					<input type="submit" id="notice_InsertBtn" class="NwriteBtn" value="Submit">
					<input type="button" id="notice_CancelBtn" class="NwriteBtn" onclick="location.href='javascript:history.go(-1);'"  value="Cancel">
				</div>
			</form>
		</div>
    </div>
	</section>
	<script>
	$(function(){
		$(".fileArea").hide();
		$("#teacher_Photo>img").click(function(){
			$("#pictureT").click();
		});
	});
	
	function LoadImg(value){
		if(value.files){
			var reader = new FileReader();
			reader.onload = function(e){								
					$("#teacherImg").attr("src", e.target.result);
			}
			reader.readAsDataURL(value.files[0]);
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