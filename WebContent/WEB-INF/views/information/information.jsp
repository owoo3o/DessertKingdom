<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, information.model.vo.*"%>
<%
	ArrayList<Notice> listN = (ArrayList<Notice>)request.getAttribute("listN");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<Teacher> tList = (ArrayList<Teacher>)request.getAttribute("tList");
	ArrayList<Picture> pList = (ArrayList<Picture>)request.getAttribute("pList");
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
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style_Notice.css" />
	<script src="${pageContext.request.contextPath}/js/jquery-3.4.1.min.js"></script>
	<!-- bootstrap js -->
    <script src="js/bootstrap.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/js_Notice.js"></script>
	
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

  <!-- information section -->

  <section class="infoP_section layout_padding">
    <div class="container">
      <div class="heading_container heading_center">
        <h2>
         	Infomation
        </h2>
      </div>

      <ul class="infoP_menu">
        <li class="active">Notice</li>
        <li>Dessert Kingdom</li>
        <li>Map</li>
      </ul>

      <div class="infoP_content">
        <div class="infoP_contentBox">
        <!-- 공지사항 및 일정  -->
        	<div class="context_Notice infoView">
        		<div class="notice_con1">
        			<h3>
        				Notice
        				<% if(loginMember != null && loginMember.getManager().equals("Y")){ %>
        				<div class="noticeWrite" onclick='location.href="<%= request.getContextPath()%>/writeNoticePage"'>+</div>
        				<% } %>
        			</h3>
        			<form>
        				<input type="text" name="notice_Search" placeholder="검색어를 입력해주세요">
        				<input type="submit" value="SEARCH">
        			</form>
        			<table id="noticeTable">
        				<tbody>
        					<% if(listN.isEmpty()){ %>
        					<tr>
        						<th colspan="5" class="no_Notice">조회된 리스트가 없습니다.</th>
        					</tr> 
        					<% } else { %>
	        					<% for(Notice n : listN){ %>
        							<tr>
        								<td><%= n.getNoticeTitle() %></td>
        								<td><%= n.getCreateDate() %></td>
        								<td>No.<span><%= n.getNoticeNo() %></span></td>
        								<td><%= n.getNoticeWriter() %></td>
        								<td>조회수 <span><%= n.getNoticeCount() %></span></td>
        								<td style="display:none"><%= n.getBoardId() %></td>
        							</tr>
	        					<% } %>
        					<% } %>
        					
        				</tbody>
        			</table>
        			<!-- 페이징 -->
        			<div class="pagingArea" align="center">
						<!-- 맨 처음으로 -->
						<button onclick="location.href='<%= request.getContextPath()%>/information?nowPage=1'">&lt;&lt;</button>
						<!-- 이전 페이지로 -->
						<button id="beforeBtn" onclick="location.href='<%=request.getContextPath()%>/information?nowPage=<%= pi.getNowPage()-1%>'">&lt;</button>
						<script>
							if(<%= pi.getNowPage()%> <= 1){
								$("#beforeBtn").prop('disabled', true);
							}
						</script>
						
						<!-- 숫자 페이지로 -->
						<% for(int i = pi.getFirstPage(); i <= pi.getLastPage(); i++){ %>
							<%if(i == pi.getNowPage()){ %>
								<button id="choosen" ><%= i %></button>
							<% } else { %>
								<button id="numBtn" onclick="location.href='<%= request.getContextPath()%>/information?nowPage=<%= i%>'"><%= i %></button>
							<% } %>
						<% } %>
						
						<!-- 다음 페이지로 -->
						<button id="afterBtn" onclick="location.href='<%=request.getContextPath()%>/information?nowPage=<%= pi.getNowPage() + 1%>'">&gt;</button>
						<script>
							if(<%= pi.getNowPage() %> >= <%= pi.getMaxPage() %>){
								$('#afterBtn').prop('disabled', true);
							}
						</script>
						<!-- 맨 마지막으로 -->
						<button onclick="location.href='<%= request.getContextPath()%>/information?nowPage=<%= pi.getMaxPage()%>'">&gt;&gt;</button>
					</div>
        		</div>
        		<script>
        		$('#noticeTable td').click(function(){
        			var noticeNo = $(this).parent().children().eq(5).text();
        			location.href='<%= request.getContextPath() %>/noticeDetail?no=' + noticeNo;
        			console.log("text");
        		});
        		
        		</script>
        		
        		<!-- 
        		<div class="notice_con2">
        			<h3 class="hidden">Schedule</h3>
        			<div class="info-calendar clearfix">
				    
					    <div class="infocalendar-box">
					      <div class="cl-box infoclearfix">
					        <button type="button" title="prev" class="btn-cal prev">
					        </button>
					        <span class="cal-month">May</span>
					        <span class="cal-year">2022</span>
					        <button type="button" title="next" class="btn-cal next">
					        </button>
					      </div>
					      <table class="cal-table">
					        <thead>
					          <tr>
					            <th>SUN</th>
					            <th>MON</th>
					            <th>TUE</th>
					            <th>WED</th>
					            <th>THU</th>
					            <th>FRI</th>
					            <th>SAT</th>
					          </tr>
					        </thead>
					        <tbody class="cal-body"><tr><td class="day" data-date="1" data-fdate="2022.05.01">1</td><td class="day" data-date="2" data-fdate="2022.05.02">2</td><td class="day" data-date="3" data-fdate="2022.05.03">3</td><td class="day" data-date="4" data-fdate="2022.05.04">4</td><td class="day" data-date="5" data-fdate="2022.05.05">5</td><td class="day" data-date="6" data-fdate="2022.05.06">6</td><td class="day" data-date="7" data-fdate="2022.05.07">7</td></tr><tr><td class="day today" data-date="8" data-fdate="2022.05.08">8</td><td class="day" data-date="9" data-fdate="2022.05.09">9</td><td class="day" data-date="10" data-fdate="2022.05.10">10</td><td class="day" data-date="11" data-fdate="2022.05.11">11</td><td class="day" data-date="12" data-fdate="2022.05.12">12</td><td class="day" data-date="13" data-fdate="2022.05.13">13</td><td class="day" data-date="14" data-fdate="2022.05.14">14</td></tr><tr><td class="day" data-date="15" data-fdate="2022.05.15">15</td><td class="day" data-date="16" data-fdate="2022.05.16">16</td><td class="day" data-date="17" data-fdate="2022.05.17">17</td><td class="day" data-date="18" data-fdate="2022.05.18">18</td><td class="day" data-date="19" data-fdate="2022.05.19">19</td><td class="day" data-date="20" data-fdate="2022.05.20">20</td><td class="day" data-date="21" data-fdate="2022.05.21">21</td></tr><tr><td class="day" data-date="22" data-fdate="2022.05.22">22</td><td class="day" data-date="23" data-fdate="2022.05.23">23</td><td class="day" data-date="24" data-fdate="2022.05.24">24</td><td class="day" data-date="25" data-fdate="2022.05.25">25</td><td class="day" data-date="26" data-fdate="2022.05.26">26</td><td class="day" data-date="27" data-fdate="2022.05.27">27</td><td class="day" data-date="28" data-fdate="2022.05.28">28</td></tr><tr><td class="day" data-date="29" data-fdate="2022.05.29">29</td><td class="day" data-date="30" data-fdate="2022.05.30">30</td><td class="day" data-date="31" data-fdate="2022.05.31">31</td><td></td><td></td><td></td><td></td></tr><tr><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr></tbody>
					      </table>
					    </div>
					    <div class="clicked-date">
					      <div class="cal-day">Sunday</div>
					      <div class="cal-date">8</div>
					      <div class="event-what"></div>
					    </div>
				  </div>
        		</div>
        		 -->
        	
        	</div>
       	<!-- // 공지사항 및 일정 끝 -->
       	
       	<!-- 학원안내 및 강사소개 -->
        	<div class="context_Kingdom ">
        		<div class="kingdom_con1">
        			<h3>About Dessert Kingdom</h3>
        			<div class="kingdomWhat">
        				<div class="kingdomPhoto">
        				</div>
        				<h4>교육원 소개</h4>
        				<div class="kingdomText">
        					<p>
        					본 아카데미는 제과제빵사가 되길 희망하는 <br>
        					모든 청소년과 성인의 꿈을  <br>
        					이룰수 있도록 특화된 아카데미 입니다.<br>
        					<br>
        					제과제빵사가 되기 위한 실질적이고 전문화 된  <br>
        					교육 프로그램으로 해당진로의 적성검사에서  <br>
        					자격증 취득, 국내외 요리대회 참가,<br>
        					조리전공대학 진학에서부터 해외취업을 위한 컨설팅까지 <br>
        					체계적인 교육이 진행됩니다.
        					</p>
        					<strong>이런분들에게 추천합니다.</strong>
        					<p>
        					요리에 관심이있고 제과제빵의 꿈을가진 청소년<br>
       						새로운 진로를 고민하는 직장인<br>
        					은퇴후 또다른 인생설계를 시작하고 싶은 중,장년층
        					</p>
        				</div>
        			</div>
        		</div>
        		<div class="kingdom_con2">
        			<h3>
	        			Teacher<% if(loginMember != null && loginMember.getManager().equals("Y")){ %>
	        			<div class="teacherWrite" onclick='location.href="<%= request.getContextPath()%>/writeTeacherPage"'>+</div>
	        			<% } %>
        			</h3>
        			<div class="teacherBox">
		        			
		        		<% if(tList.isEmpty() || pList.isEmpty()){ %>
        					<span>등록된 정보가 없습니다.</span>
        				<% } else { %>
        					<% for(int i = 0; i < tList.size(); i++){  %>
        					<% Teacher t = tList.get(i); %>
        					<div class="teachersRap">
								<div class="teachers">
									<input type="hidden" id="teacherNo" value="<%= t.getBoardId()  %>">
									<% for(int j = 0; j < pList.size(); j++){ %>
									<% Picture p = pList.get(j); %>
										<% if( t.getBoardId() == p.getBoardId()){ %>
										<div class="teacherImg">
											<img src="<%= request.getContextPath() %>/teacher_upFiles/<%= p.getChangeName() %>" class="imgs" />
										</div>
										<% } %>
									<% } %>
									<strong><%= t.getTeacherName() %></strong>
									<p><%= t.getTeacherInfo() %></p>
									<% if(loginMember != null && loginMember.getManager().equals("Y")){ %>
									<!-- <span class="editBtn">S</span> -->
									<span class="delBtn">X</span>
									<% } %>
								</div>
							</div>
        					
	        				<% } %>
        				<% } %> 
        				
        				
        			</div>
        			<!-- 
        			<div class="teacherBox">
						<div class="teachersRap">
							<div class="teachers">
								<div class="teacherImg">
									<img src="#" width="100%" height="100%" />
								</div>
								<strong>강건강</strong>
								<p>강사소개하나! 어쩌구 저쩌구 쏼랄라라 블라블라 쿠킷쿠킷~~~~~</p>
							</div>
						</div>
						<div class="teachersRap">
							<div class="teachers">
								<div class="teacherImg">
									<img src="#" width="100%" height="100%" />
								</div>	
								<strong>남나눔</strong>
								<p>강사소개 어쩌구 저쩌구 쏼랄라라 블라블라 쿠킷쿠킷~~~강사소개 좀더길게써진거도 테스트 어떻게보이나 함 보기위해 길게씀 블라라라라~~~~~</p>
							</div>
						</div>
						<div class="teachersRap">
							<div class="teachers">
								<div class="teacherImg">
									<img src="#" width="100%" height="100%" />
								</div>
								<strong>도대담</strong>
								<p>강사소개 어쩌구 저쩌구 쏼랄라라 블라블라 쿠킷쿠킷~~~~~</p>
							</div>
						</div>
						<div class="teachersRap">
							<div class="teachers">
								<div class="teacherImg">
									<img src="#" width="100%" height="100%" />
								</div>
								<strong>라뭐시기</strong>
								<p>강사소개 어쩌구 저쩌구 쏼랄라라 블라블라 쿠킷쿠킷~~~~~</p>
							</div>
						</div>
					</div>
					 -->
					
					<div class="tc_arrow">
						<button type="button" class="tc_prev">
							<i class="fa fa-angle-left" aria-hidden="true"></i>
						</button>
						<button type="button" class="tc_next">
							<i class="fa fa-angle-right" aria-hidden="true"></i>
						</button>
					</div>
					<script>
					if(<%= tList.size() %> <= 3 ){
	                     $('.tc_arrow>button').prop('disabled', true);
	                  }
						
						$(function(){
							$(".delBtn").click(function(){
								var delT = confirm("정보를 삭제하시겠습니까?");
								if(delT){
									var numT = $(this).parent().children().eq(0).val();
									location.href='<%=request.getContextPath()%>/deleteTeacher?numT=' + numT;
								}
							});
							$(".editBtn").click(function(){
								var numT = $(this).parent().children().eq(0).val();
								var imgT = $(this).parent().children().eq(1).children().attr('src');
								var nameT = $(this).parent().children().eq(2).text();
								var infoT = $(this).parent().children().eq(3).text();
								location.href='<%=request.getContextPath()%>/updateTeacherPage?numT=' + numT + '&imgT=' + imgT + '&nameT=' + nameT + '&infoT=' +infoT; 
							});
						});
						
					</script>
					
        		</div>
	        	</div>
        <!-- // 학원안내 및 강사소개 끝 -->	
        
        <!-- 오시는길 및 지도 -->	
        	<div class="context_Map">
        <!-- // 오시는길 및 지도 끝 -->	
        		<div class="map_con1">
        			<h3>Contact</h3>
        			<table>
						<tbody>
							<tr>
								<th class="mapTh">주소</th>
								<td class="mapTd">서울시 강남구 역삼동 테헤란로14길 6</td>
								<th class="mapTh">전화</th>
								<td class="mapTd">02-0000-1111</td>
							</tr>
							<tr>
								<th>이메일</th>
								<td>misterCookie@cookieis.sweet</td>
								<th>상담시간</th>
								<td>AM 09:00 ~ PM 18:00</td>
							</tr>
							<tr>
								<th>교통편</th>
								<td colspan="3">2호선 강남역 1번출구 직진 200m<br>
									2호선 역삼역 3번출구 직진 100m<br>
									100번 버스 역삼역 하차 도보 5분 </td>
							</tr>
						</tbody>
					</table>
        		</div>
        		<div class="map_con2">
        			<h3>Map</h3>
        			<section class="mapbox">
					   <!-- 구글 지도 -->
					   <div id="map"></div>
						<script>
						  var map;
						  function initMap() { 
							var uluru = {lat: 37.498959, lng: 127.032915}//좌표 : 이곳이 궁금한가요
				
							map = new google.maps.Map(document.getElementById('map'), {
								center: {lat: 37.498959, lng: 127.032915},
								zoom: 18,
								fullscreenControl: true,
								zoomControl: true,
								zoomControlOptions:{
									position: google.maps.ControlPosition.RIGHT_TOP
								}
							});
				
							  var market = new google.maps.Marker({
								  position : uluru,
								  map:map,
								  title: "Desert Kingdom"
							  });
							  var infowindow = new google.maps.InfoWindow({
								  content: "Desert Kingdom 서울특별시 강남구 테헤란로14길 6 남도빌딩"
							  });
							  infowindow.open(map,market);
						  }
						</script>
						<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAgODwtIObiFlnZ_52XIX_cqflTL5M_CwQ&amp;callback=initMap" async="" defer=""></script>
						
					</section>
        		</div>
        	</div>
        </div>
      </div>
  
      
    </div>
  </section>

  <!-- end food section -->

  <!-- footer section -->
   <%@ include file="..//common/footer.jsp" %>
  <!-- footer section -->

  <!-- jQery -->
  <script src="js/jquery-3.4.1.min.js"></script>
  <!-- popper js -->
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous">
  </script>
  
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
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCh39n5U-4IoWpsVGUHWdqB6puEkhRLdmI&callback=myMap">
  </script>
  <!-- End Google Map -->

</body>

</html>