console.clear();
window.onload = function(){
	
	const ModifyBtn = document.getElementById('Modify');
	const signupBtn = document.getElementById('signup');
	const backBtn = document.getElementById('Back');
	const checkPwBtn = document.getElementById('checkPw');
	
	
	ModifyBtn.addEventListener('click', (e) => {
		let parent = e.target.parentNode.parentNode;
		Array.from(e.target.parentNode.parentNode.classList).find((element) => {
			if(element !== "slide-up") {
				parent.classList.add('slide-up');
				ModifyBtn.classList.remove('hidden');
				backBtn.setAttribute('style','');
			}else{
				parent.classList.remove('slide-up');
				ModifyBtn.classList.add('hidden');
			}
			if(checkPwBtn.classList.contains('slide-up')){
				backBtn.addEventListener('click',function(){
					parent.classList.add('slide-up');
					ModifyBtn.classList.remove('hidden');
					backBtn.setAttribute('style','display:none');
				});
			}
		});
	});
	
}