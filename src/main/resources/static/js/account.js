function showRegisterForm() {
	document.querySelector('#loginForm').classList.add('d-none');
	document.querySelector('#registerForm').classList.remove('d-none');
	document.querySelectorAll('.form-header')[0].classList.add('d-none');
	document.querySelectorAll('.form-header')[1].classList.remove('d-none');
}

function showLoginForm() {
	document.querySelector('#loginForm').classList.remove('d-none');
	document.querySelector('#registerForm').classList.add('d-none');
	document.querySelectorAll('.form-header')[0].classList.remove('d-none');
	document.querySelectorAll('.form-header')[1].classList.add('d-none');
}