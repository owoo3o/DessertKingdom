<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    width: 100px;
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
                  <form action="<%= request.getContextPath() %>/insert.one" method="post" id="detailForm" enctype="multipart/form-data">
                    <table>
                      <header><h4 class="b_title">클래스 개설하기</h4></header>
                      <tr>
                          <!-- 글 번호 숨기기 -->
                          <input type="hidden" name="qId" value="">
    
                          <td class="tr_title">제목</td>
                          <td class="td_content" colspan="5">
                            <input type="text" id="q_Title" name="title" value="">
                          </td>
                        </tr>
                        
                        <tr>
                          <td class="tr_title">작성자</td>
                          <td class="td_content">admin</td>
                          
                          <td class="tr_title">수강일</td>
                          <td class="td_content">
                            <input type="date" id="q_Date" name="date" value="">
                          </td>
                          <td class="tr_title">카테고리</td>
                          
                          <td class="td_content">
                            <select name="category">
                              <option value="no">-------</option>
                              <option value="베이킹">베이킹</option>
                              <option value="음료">음료</option>
                              <option value="동양풍">동양풍</option>
                              <option value="기타">기타</option>
                            </select>
                          </td>
                        </tr>
    					
    					<tr>
                          <td class="tr_title">담당강사</td>
                          <td class="td_content">박춘희</td>
                          
                          <td class="tr_title">강의담기</td>
                          <td class="td_content">
                           <a href="">
               				<i class="fa-solid fa-cart-arrow-down fa-2x"></i>
              				</a>
                          </td>
                          <td class="tr_title">수강장소</td>
                          
                          <td class="td_content">
                            <select name="classroom">
                              <option value="nothing">-------</option>
                              <option value="A">A</option>
                              <option value="B">B</option>
                              <option value="C">C</option>
                              <option value="D">D</option>
                              <option value="E">E</option>
                            </select>
                          </td>
                        </tr>
                        
                        <tr>
                          <td colspan="6"><textarea cols="70px" rows="15px" style="resize:none;" name="content"></textarea></td>
                        </tr>
                      </table>
    					 <!-- 파일 첨부 -->
                      <table id="fileList">
 						<tr onMouseOver="fileList.clickedRowIndex=this.rowIndex">
							<td class="file">File</td>
							<td class="file"><input type=file name=fileNm id="fileNm"></td>
							<td class="file"><input type=button name=fileList_addRow value=" 추가 " onClick="addRow()" class="fileBtn"></td>
							<td class="file"><input type=button name=fileList_delRow value=" 삭제 " onClick="delRow()" class="fileBtn"></td>
					    </tr>
						
					  </table>
                        <!-- button area -->
                        <div class="btn-box">
                            <input type="submit" id="writeBtn" value="등록">
                            <input type="button" onclick="location.href='<%= request.getContextPath() %>/list.one'" id="cancleBtn" value="취소">
                        </div>
                        
                        
                        
                    </form>
                  </div>   
              </div>
        </div>
      </section>
       <!-- footer section start-->
  <%@ include file="../common/footer.jsp" %>
  <!-- end footer section -->
<script>
function addRow() {
	  var count = document.getElementById("fileList").rows.length;
	 if(count == 2){
	  alert("파일은 2개만 업로드 가능합니다.");
	  return;
	 }
	  var oRow = fileList.insertRow();
	  oRow.onmouseover=function(){fileList.clickedRowIndex=this.rowIndex};
	  var oCell1 = oRow.insertCell();
	  var oCell2 = oRow.insertCell();
	  var oCell3 = oRow.insertCell();
	  var oCell4 = oRow.insertCell();

	  oCell1.innerHTML = "File";  
	  oCell2.innerHTML = "<input type=file name=fileNm1>";
	  oCell3.innerHTML = "<input type=button value=\" 추가 \" onClick=\"addRow()\" class=\"fileBtn\">";
	  oCell4.innerHTML = "<input type=button value=\" 삭제 \" onClick=\"delRow()\" class=\"fileBtn\">";
	}
	function delRow() {
	  var count = document.getElementById("fileList").rows.length;
	  if( count == 1){
	   alert("마지막은 지울 수 없습니다.");
	   return;
	  }
	 fileList.deleteRow(fileList.clickedRowIndex);
	}
	// n수 많큼 행 추가
	function addRowCnt(){
	 //var ln = document.getElementById("fileList").rows.length;
	 var ln = 2; //n
	 for(i=0; i < ln; i++){
	  addRow();
	 }
	}

	// 모든 행 삭제
	function delRowAll(){
	 var ln = document.getElementById("fileList").rows.length;
	 for(i=0; i < ln; i++){
	  delRow();
	 }
	}

	var i = 0;
	if(i == 0) {
	   oCell2.innerHtml = "<input type=file name=fileNm1>";
	   i ++ 
	}else {
	   oCell2.innerHtml = "<input type=file name=fileNm2>";
	}
</script>
</body>
</html>