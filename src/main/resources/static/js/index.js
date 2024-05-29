/**
 * 
 */
window.addEventListener('scroll', function() {
	var header = document.querySelector('.header-area');
	var main = document.querySelector('.main-area');
	var scrollPosition = window.scrollY;

	if (scrollPosition > 250) {
		header.classList.add('sticky-header');
		main.style.marginTop = '20px';
	} else {
		header.classList.remove('sticky-header');
		main.style.marginTop = '15px';
	}
});