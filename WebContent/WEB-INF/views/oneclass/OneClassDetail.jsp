<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="oneclass.model.vo.*, java.util.*"%>
<%
	OneClass b = (OneClass)request.getAttribute("board");
	ArrayList<Attachment> fileList = (ArrayList<Attachment>)request.getAttribute("fileList");

%>    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
  <!-- font awesome style -->
 <script src="https://kit.fontawesome.com/14a15b103b.js" crossorigin="anonymous"></script>



 <!-- CSS -->   
    <style>
* {
    margin: 0;
    padding: 0;
}

/* navbar */
.food_section .filters_menu li {
    width: 90px;
    padding: 7px 25px;
    cursor: pointer;
    border-radius: 25px;
    font-size: 20px;
    text-align: center;
}

/* table */
.detail_outer {
    text-align: center;
}

.table-area {
    display: inline-block;
}
tbody{
    width: 744px;
}

textarea {
    display: block;
    width: 912px;
    height: 300px;
    padding: 15px;
    box-sizing: border-box;
    border: 0;
    resize: none;
}

table {
    border-top: 2px solid black;;
    border-bottom: 2px solid black;
    border-collapse: collapse;
}

#detailForm tr {
    width: 744px;;
    border-top: 1px solid #ccc;
    height: 70px;
}

table tr {
    font-size: 14px;
}

table tr:first-child {
    font-size: 16px;
    border-bottom: 1px;
}

.tr_content {
    width: 200px;
}

.tr_content::before {
    content: "|";
    margin-right: 30px;
}

tbody>tr>td>div {
    border-bottom: 1px solid black;
    width: 60%;
    padding-bottom: 5px;
    margin-top: 6px;
}


/* Btn-area */
.food_section .btn-box {
    display: -webkit-box;
    display: -ms-flexbox;
    display: flex;
    -webkit-box-pack: center;
        -ms-flex-pack: center;
            justify-content: center;
    margin-top: 45px;
}
  
.food_section .btn-box input{
    display: inline-block;
    width: 110px;
    height: 44px;
    /* padding: 10px 55px; */
    background-color: #ffbe33;
    color: #ffffff;
    border-radius: 45px;
    -webkit-transition: all 0.3s;
    transition: all 0.3s;
    border: none;
    margin-left: 15px;
}   
  
.food_section .btn-box input:first-child {
    margin-left: 0;
}

.food_section .btn-box input:hover {
background-color: #e69c00;
}

/* 게시글 작성하기 form */
.detail_outer {
    width: 100%
}

textarea {
    display: block;
    width: 912px;
    height: 300px;
    padding: 15px;
    box-sizing: border-box;
    border: 0;
    resize: none;
} 

table {
    border-top: 2px solid black;;
    border-bottom: 2px solid black;
    border-collapse: collapse;
}

#detailForm tr {
    width: 744px;
    border-top: 1px solid #ccc;
    border-bottom: 1px solid #ccc;
    height: 70px;
}

table tr {
    font-size: 14px;
}

table tr:first-child {
    font-size: 16px;
    border-bottom: 1px;
}

.tr_title {
    width: 60px;
    margin-right: 30px;
    vertical-align: middle;
}


.td_content {
    width: 200px;
    vertical-align: middle;
}

.td_content input {
    border: none;
    border-bottom: 1px solid #999;
}

.td_content input:focus {
    outline: none;
}


#td_pwd input {
    border: none;
    border-bottom: 1px solid #999;
}

#q_Title {
    width: 60%;
}

#q_Date {
    width: 130px;
    text-align: center;
}

#qna_pwd {
    width: 130px;
}

#qna_lock {
    width: 14px;
    height: 14px;
    vertical-align: middle;
}

.td_content select:focus {
    outline: none;
}

.td_content select {
    border: none;
    border-bottom: 1px solid #999;
    width: 80px;
    text-align: center;
    vertical-align: middle;
}

.td_content::before {
    content: "|";
    margin-right: 30px;
    vertical-align: middle;
    color: #999;
}


tr {
    text-align: left;
}

textarea:focus {
    outline: none;
}

.b_title {
    font-family: 'Grape Nuts', cursive;
    font-family: 'Noto Sans KR', sans-serif;
    font-family: 'Titillium Web', sans-serif;
    margin-bottom: 15px;
    text-align: left;
}

#qna_pwd::-webkit-outer-spin-button,
#qna_pwd::-webkit-inner-spin-button {
    -webkit-appearance: none;
}

#tr_pwd,
#td_pwd {
    display: none;
}
/* 파일 업로드 */
#fileList{
	width:912px;
}

.file{
	font-size: 15px;
}

#fileNm{
	font-size: 14px;
}

#input.file-upload-button{
	background-color: #e69c00;
}

.fileBtn{
	background:#ffbe33;
	color: white;
    border-radius: 15px;
    border: hidden;
    width: 50px;
    height: 33px;
}
/* 그림 표시될 장소 */
#imageArea{
	width:912px;
}
    </style>
    
    <link href="<%= request.getContextPath() %>/css/style.css" rel="stylesheet">

</head>
<body>
  <!--header section starts  -->
    <%@ include file="../common/header.jsp" %>
    <!--header section end  -->
    
    <section class="food_section layout_padding">
        <div class="container">
          <div class="heading_container heading_center">
            <h2></h2>
          </div>
          
          <!-- <div style="text-align: center;">자주 묻는 질문</div> -->
    
            
            <!-- 사용할 부분 board list 시작-->
              <div class="detail_outer">
                <br>
                <div class="table-area">
                  <form action="" method="post" id="detailForm">
                    <table>
                      <header><h4 class="b_title">원데이 클래스</h4></header>
                      <tr>
                          <!-- 글 번호 숨기기 -->
                          <input type="hidden" name="bId" value="<%=b.getBoardId() %>">
    
                          <td class="tr_title">제목</td>
                          <td class="td_content" colspan="5">
                          	<%= b.getBoardTitle() %>
                          <!--   <input type="text" id="q_Title" name="faqTitle" value=""> -->
                          </td>
                        </tr>
                        
                        <tr>
                          <td class="tr_bCount">조회수</td>
                          <td class="td_content"><%= b.getBoardCount() %></td>
                          
                          <td class="tr_title">수강일</td>
                          <td class="td_content">
                            <%=b.getClassDate() %>
                            <!-- <input type="date" id="q_Date" name="faqDate" value=""> -->
                          </td>
                          <td class="tr_category">카테고리</td>
                          
                          <td class="td_content">
                          	<%=b.getClassCategory() %>
                            <!-- <select name="category">
                              <option>-------</option>
                              <option value="10">베이킹</option>
                              <option value="20">음료</option>
                              <option value="30">동양디저트</option>
                              <option value="40">기타</option>
                            </select> -->
                          </td>
                        </tr>
    					
    					<tr>
                          <td class="tr_title">강의번호</td>
                          <td class="td_content"><%=b.getClassId() %></td>
                          
                          <td class="tr_title">수강신청</td>
                          <td class="td_content">
                           <a href="">
                          	<i class="fa-solid fa-cart-arrow-down fa-2x"></i>
                          	</a>
                          </td>
                          <td class="tr_title">수강장소</td>
                          
                          <td class="td_content">
                            <!-- <select name="classroom">
                              <option>-------</option>
                              <option value="10">A</option>
                              <option value="20">B</option>
                              <option value="30">C</option>
                              <option value="40">D</option>
                              <option value="50">E</option>
                            </select> -->
                            <%=b.getClassroom() %>반
                          </td>
                        </tr>
                        
                        <tr>
            <td>대표<br>사진</td>
            <td colspan="4">
               <div id="titldImgArea" align="center">
               <a href="<%= request.getContextPath()%>/thumbnail_uploadFiles/<%= fileList.get(0).getChangeName()%>"
                        download="<%= fileList.get(0).getChangeName() %>"><!--겟 오리진 네임시 원래파일이름으로 다운  -->
                  <img id="titleImg" src="<%= request.getContextPath() %>/thumbnail_uploadFiles/<%= fileList.get(0).getChangeName() %>"><!-- 썸네일 0번째 바꾸닝름  -->
               </div>
            </td>
         </tr>
                        
                        <tr>
                          <td colspan="6">
                          	<p id="contentArea">
                  			<%= b.getBoardContent() %>
              				 </p>
               			</td>
                        </tr>
                      </table>

						<table class="detail">
							<tr>
								<%
									for (int i = 1; i < fileList.size(); i++) {
								%>
								<td>
									<div class="detailImgArea">
										<a href="<%=request.getContextPath()%>/thumbnail_uploadFiles/<%=fileList.get(i).getChangeName()%>"
											download="<%=fileList.get(i).getChangeName()%>"> <img
											id="detailImg" class="detailImg"
											src="<%=request.getContextPath()%>/thumbnail_uploadFiles/<%=fileList.get(i).getChangeName()%>">
									</div>
								</td>
								<%
									}
								%>
							</tr>
						</table>

						
                        <!-- button area -->
                        <div class="btn-box">
                            <%if(loginMember !=null && loginMember.getUserId().equals("admin")) { %>
<!--                             <input type="button" id="modifyBtn" value="수정"> -->
                            <input type="button" id="deleteBtn" value="삭제" onclick="deleteOneClass();">
                            <% } %> 
                            <input type="button" onclick="location.href='<%= request.getContextPath() %>/list.one'" id="cancleBtn" value="목록으로">
                        </div>
                        
                        
                        
                    </form>
                  </div>   
              </div>
        </div>
      </section>
      <script>
      function deleteOneClass() {
		var bool = confirm('정말 삭제하시겠습니까?');
		if(bool){
			location.href= '<%= request.getContextPath() %>/delete.one?no=' +<%= b.getBoardId()%>;
		}
	}
      </script>
<!-- footer section start-->
  <%@ include file="../common/footer.jsp" %>
  <!-- end footer section -->
</body>
</html>