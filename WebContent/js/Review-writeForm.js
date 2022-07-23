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