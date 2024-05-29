document.getElementById('button-decrement').addEventListener('click', function() {
	var quantityInput = document.getElementById('quantity-input');
	var currentValue = parseInt(quantityInput.value);
	if (currentValue > 1) {
		quantityInput.value = currentValue - 1;
	}
});

document.getElementById('button-increment').addEventListener('click', function() {
	var quantityInput = document.getElementById('quantity-input');
	var currentValue = parseInt(quantityInput.value);
	quantityInput.value = currentValue + 1;
});
