/**
 * 
 */

$(document).ready(function() {
	var pwrs = "";
$("#password").blur(function() {
		
		var pwreg =/^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,16}$/;
		
		if (pwreg.test(($("#password").val()))) {
			
			$("#passwordalert").remove();
			
			str = "<span id='passwordalert' class='span_js'>사용가능합니다 </span>"
			
			$("#pw_box").append(str);
			
			$("#passwordalert").css("color", "green").css("margin-left", "10px");
			
			pwrs = true;
		}else {
			
			$("#passwordalert").remove();
			
			str = "<span id='passwordalert' class='span_js'>대문자 +소문자+특수문자로 8자 이상, 20자 이하로 써주세요. </span>"
			
			$("#pw_box").append(str);
			
			$("#passwordalert").css("color", "red").css("margin-left", "10px");
			
			pwrs=false;
		}
	})
	$('#showPassword').on('click', function () {
		   $('input[name=password]').prop('type',"text");
		});
//필요한 데이터가 전부 입력되었다면 submit을 진행한다//

$("form").on("submit", function() {

	if(pwrs == true){
		alert("비밀번호가 변경되었습니다.");
	}else{
		alert("다시 확인해주세요.");
		return false;
	}

})
})