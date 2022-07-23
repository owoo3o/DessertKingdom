console.clear();

const loginBtn = document.getElementById('login');
const signupBtn = document.getElementById('signup');

loginBtn.addEventListener('click', (e) => {
   let parent = e.target.parentNode.parentNode;
   Array.from(e.target.parentNode.parentNode.classList).find((element) => {
      if(element !== "slide-up") {
         parent.classList.add('slide-up')
      }else{
         signupBtn.parentNode.classList.add('slide-up')
         parent.classList.remove('slide-up')
      }
   });
});


signupBtn.addEventListener('click', (e) => {
   let parent = e.target.parentNode;
   Array.from(e.target.parentNode.classList).find((element) => {
      if(element !== "slide-up") {
         parent.classList.add('slide-up')
      }else{
         loginBtn.parentNode.parentNode.classList.add('slide-up')
         parent.classList.remove('slide-up')
      }
   });
});



var id_text = document.getElementById('id_text');
var pwd_text = document.getElementById('pwd_text');
var id_click = document.getElementById('id_click');
var pwd_click = document.getElementById('pwd_click');

function click_key_event(){
	if(id_text.style.display == 'none'){
		id_text.style.display = "table-row"
		id_click.innerHTML = '영어 대/소문자 포함 4글자'
	}
};


// 아이디 중복 ajax
var isUsable = false;	// id 중복 시 false, 사용 가능 시 true
var isIdChecked = false; // id 중복 확인 여부

$('#joinUserId').on('change paste keyup', function(){
	isIdChecked = false;
});

$('#joinUserId').change(function(){
	var userId = $('#joinUserId');
	
	if(!userId || userId.val().length < 4){
		$('#idResult').text('아이디는 최소 4자리 이상이여야 합니다.').css({'color':'red', 'font-size':'10px'});
		userId.focus();
	} else {
		$.ajax({
			url: 'checkId.me',
			type: 'post',
			data: {inpuId:userId.val()},
			success: function(data){
				console.log(data);
				
				
			},
			error: function(data){
				console.log(data);
			}
		});
	}
});



