$(document).ready(function() {
	$("#re-password").change(function() {
		var pw = $("#password").val();
		if ($(this).val() != pw) {
			$(".warning").css("display", "block");
		} else {
			$(".warning").css("display", "none");
		}
	});
});