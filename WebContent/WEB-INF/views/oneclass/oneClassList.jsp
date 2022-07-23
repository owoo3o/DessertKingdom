<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, oneclass.model.vo.*" %>
<%
	ArrayList<OneClass> bList =(ArrayList<OneClass>)request.getAttribute("bList");
	ArrayList<Attachment> fList = (ArrayList<Attachment>)request.getAttribute("fList");
	PageInfo pi =(PageInfo)request.getAttribute("pi");
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
  <link rel="shortcut icon" href="images/favicon.png" type="">
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
  <!--js link  -->
  <script src="js/jquery-3.4.1.min.js"></script>
  
  <script src="https://kit.fontawesome.com/14a15b103b.js" crossorigin="anonymous"></script>
  
  <!-- Style -->
	<style>
	   .wrapPagination {
      display: flex;
        justify-content: center;
   }
   #wrapWriteBtn {
      display: flex;
        justify-content: right;
   }
   
   #writeBtn{
   position: relative;
   float:right;
   position: relative;
    display: block;
    padding: 0.5rem 0.75rem;
    border-radius: 30px;
    line-height: 1.25;
    color: #ffffff;
    background-color: #FFD384;
    border: 1px solid #dee2e6;
   width: 100px;
   height: 50px;
}

#writeBtn:hover {
    z-index: 2;
    color: #fff;
    text-decoration: none;
    background-color: #ffaf1e;
    border-color: #dee2e6;
}

.btn-box{
   float:right;
   margin-right: 330px;   
}

.pagingArea button{
   border-radius: 15px; 
   background: #dddcdc;
   border: 1px solid darkgray;
   width: 40px;
   height: 40px;
   color: white;
   
}
.pagingArea hover {
    z-index: 2;
    color: #fff;
    text-decoration: none;
    background-color: #ffaf1e;
    border-color: #dee2e6;
}


.buttonArea{
   margin-right: 50px;
}



button:hover{cursor: pointer;}
#numBtn{background: #ffd384;}
#choosen{background: #ffba3ed9;}
	
	
	
	</style>

  <title> Feane </title>



</head>

<body class="sub_page">

  <div class="hero_area">
    <div class="bg-box">
      <img src="images/hero-bg.jpg" alt="">
    </div>
    
    <!--header section starts  -->
    <%@ include file="../common/header.jsp" %>
    <!--header section end  -->
  </div>

  <!-- food section -->

  <section class="food_section layout_padding-bottom">
    <div class="container" style="padding: 90px 0">
      <div class="heading_container heading_center">
        <h2>
          One Class
        </h2>
      </div>

      <ul class="filters_menu">
        <li class="active" data-filter="*">All</li>
        <li data-filter=".베이킹">베이킹</li>
        <li data-filter=".음료">음료</li>
        <li data-filter=".동양풍">동양풍</li>
        <li data-filter=".기타">기타</li>
      </ul>
		
         
      <div class="filters-content">
        <div class="row grid">
         
          <!--게시판 개별글 list form starts  -->
          <% if(bList.isEmpty() || fList.isEmpty()){%>
			등록된 사진이 없습니다.
		<% } else { %>	
		<% for(int i = 0; i< bList.size(); i++ ){ %>
				<% OneClass b = bList.get(i); %>
          
          
          
          <div class="col-sm-6 col-lg-4 all <%= b.getClassCategory() %>">
          
            <div class="box">
             <input type="hidden" class="hiddenVal" value="<%=b.getBoardId()%>"> <!--상세보기 할때 사용 click했을때 클릭한 게시물이 어떤 bId로 넘어가느냐 설정해주기위해 bId를 히든으로 만들었다  -->
              <div>
              	<% for(int j = 0; j < fList.size(); j++){ %>
						<% Attachment a = fList.get(j) ;%>
						<% if(b.getBoardId() == a.getBoardId()) { %>
							
						
					
                <div class="img-box">
                  <img src="<%= request.getContextPath()%>/thumbnail_uploadFiles/<%= a.getChangeName() %>" width="85%" alt="">
                </div>
                	<% } %>
                <%} %>
                <div class="detail-box">
                  <h5>
                    No.<%= b.getBoardId() %>      <%= b.getBoardTitle() %>
                  </h5>
                  <p>
                    <%= b.getBoardContent() %>
                  </p>
                  <div class="options">
                    <h6>
                      작성자: <%= b.getBoardWriter() %>
                    </h6>
                    <a class="fa-solid fa-cart-arrow-down">
                      <!-- <svg version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 456.029 456.029" style="enable-background:new 0 0 456.029 456.029;" xml:space="preserve"> -->
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
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                      </svg>
                    </a>
                  </div>
                </div>
              </div>
            </div>
          </div>
          	<% } %>
          <%} %>
         <!--게시판 개별글 list form end  -->
          
        </div>
      </div>
     <!--  <div class="btn-box">
        <a href="">
          View More
        </a>
      </div> -->
      <br><br>
     <%if(loginMember !=null && loginMember.getUserId().equals("admin")) { %>
      <div id="wrapWriteBtn">
      <form method="post" action="<%= request.getContextPath() %>/writeoneForm.one" >
             <input type="submit" value="글쓰기"  class="writeBtn" id="writeBtn">
       </div>         
       <% } %>       
              </form>
      
      
      
     
    </div>
  
	<!-- new Pagination  -->
	<!--페이징 처리 버튼  -->
		<div class="pagingArea" align="center">
		<!-- 맨 처음으로 -->
		<button onclick="location.href= '<%=request.getContextPath()%>/list.one?currentPage=1'">&lt;&lt;</button>
		<!-- 이전 페이지로 -->
		<button onclick="location.href='<%=request.getContextPath()%>/list.one?currentPage=<%= pi.getCurrentPage()-1%>'" id="beforeBtn">&lt;</button>
		<script>
			if(<%= pi.getCurrentPage() %> <=1){
				$('#beforeBtn').prop('disabled', true);
			}
		</script>
		<!-- 숫자 페이지로 -->
		<!-- 숫자페이지는 몇페이지가 있을지 몰라서 for문 돌릴꺼야 -->
		<% for(int p = pi.getStartPage(); p <= pi.getEndPage(); p++) { %>
			<%if(p ==pi.getCurrentPage()){ %>
			<button id="choosen" disabled><%= p %></button>
			<%} else{ %>
			<button id="numBtn" onclick="location.href='<%= request.getContextPath() %>/list.one?currentPage=<%= p %>'"><%= p %>
			<%} %>
		<% } %>
		<!-- 다음 페이지로 -->
		<button onclick="location.href='<%=request.getContextPath()%>/list.one?currentPage=<%= pi.getCurrentPage()+1%>'" id="afterBtn" >&gt;</button>
		<script>
		if(<%= pi.getCurrentPage() %> >=<%= pi.getMaxPage() %>){
				$('#afterBtn').prop('disabled', true);
			}
		</script>
		<!-- 맨 마지막으로 -->
		<button onclick="location.href= '<%=request.getContextPath()%>/list.one?currentPage=<%=pi.getMaxPage()%>'">&gt;&gt;</button>
		</div>
	</section>
  <!-- end food section -->

  <!-- footer section start-->
  <%@ include file="../common/footer.jsp" %>
  <!-- end footer section -->

  <!-- jQery -->
  <!-- <script src="js/jquery-3.4.1.min.js"></script> -->
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
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCh39n5U-4IoWpsVGUHWdqB6puEkhRLdmI&callback=myMap">
  </script>
  <!-- End Google Map -->
  <script>
  $(function() {
		$('.box').click(function() {
			var bId = $(this).children().eq(0).val();
			location.href = "<%= request.getContextPath() %>/detail.one?bId=" + bId;
		});
	});
  
  </script>
</body>

</html>