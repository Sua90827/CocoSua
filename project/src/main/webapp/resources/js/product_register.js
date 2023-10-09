window.onload = () => {
	let registerMenuClass = document.querySelectorAll(".registerMenu");
	registerMenuClass[0].style.backgroundColor = "#eee";
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