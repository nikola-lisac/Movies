$(document).ready(function(){
	$("#confirmpass").keyup(checkPasswordsMatch);
	
});

function checkPasswordsMatch(){
	var password = $("#password").val();
	var confirmpass = $("#confirmpass").val();
	
	if (password.length > 3 || confirmpass.length > 3) {

		if (password == confirmpass) {
			$("#matchpass").empty();
		} else {
			$("#matchpass").html("Passwords don't match");
			$("#matchpass").addClass("error");
		}
	}
}