function check(obj) {
	if (!obj.id.value || obj.id.value.trim().length == 0) {
		alert("아이디를 입력해주세요");
		obj.id.value = "";
		obj.id.focus();
			console.log("실행");
		return false;
	}
	if (!obj.password.value || obj.password.value.trim().length == 0) {
		alert("비밀번호를 입력해주세요");
		obj.password.value = "";
		obj.password.focus();
		return false;
	}
	if (!obj.rePassword.value || obj.rePassword.value.trim().length == 0) {
		alert("비밀번호를 다시 한 번 입력해주세요");
		obj.rePassword.value = "";
		obj.rePassword.focus();
		return false;
	}
	if (obj.password.value != obj.rePassword.value) {
		alert("비밀번호가 일치하지 않습니다");
		obj.password.value="";
		obj.rePassword.value="";
		obj.password.focus();
		return false;
	}
	if (!obj.nickname.value || obj.nickname.value.trim().length == 0) {
		alert("닉네임을 입력해주세요");
		obj.nickname.value = "";
		obj.nickname.focus();
		return false;
	}
	if (!obj.email.value || obj.email.value.trim().length == 0) {
		alert("이메일을 입력해주세요");
		obj.email.value = "";
		obj.email.focus();
		return false;
	}
	
	return true;
}

$(document).ready(function() {

});