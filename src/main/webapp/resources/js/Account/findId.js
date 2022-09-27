/**
 * 
 */
$(document).ready(function(){
	$("#findId").submit(function() {
		event.preventDefault();
		
		var name = $("#name").val();
		var email = $("#email").val();
		var check = false;
		
		// 이름이 공백이라면 false
		if (name == "") {
			alert("이름을 입력해주세요");
			$("#name").focus();
		
		// email가 공백이라면 false
		} else if (email == "") {
			alert("email을 입력해주세요.");
			$("#email").focus();
		
		// 어느쪽에도 해당되지 않는다면 아래의 ajax를 실행한다.
		}else {
			
			$.getJSON("/Account/findId/"+encodeURIComponent(name)+"/"+email+".json",function(result){
				console.log(result.id)
				alert("찾으시는 id는"+result.id+"입니다 ")
			})
		}
		//return check;
	})

})