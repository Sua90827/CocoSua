const fileSelect = () => {
	document.getElementById('file').click();
}

const previewImage = (event) => {
	var input = event.target;
	var reader = new FileReader();

	reader.onload = function() {
		var imgElement = document.getElementById('preview');
		imgElement.src = reader.result;
	};

	reader.readAsDataURL(input.files[0]);

	document.getElementById('preview').style.display = 'block';
	document.getElementById('userImgFile').style.display = 'none';
}

const fileCancel = () => {
	document.getElementById('cancelButton').click();
	document.getElementById('preview').style.display = 'none';
	document.getElementById('userImgFile').style.display = 'block';
}