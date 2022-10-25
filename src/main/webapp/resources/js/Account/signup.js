/**
 * 
 */
$(document).ready(function() {
	// 변수 선언
	var str = "";
	// id 정규식의 result의 값을 저장할 변수선언
	var idrs = "";
	// pw 정규식의 result의 값을 저장할 변수선언
	var pwrs = "";
	// pwcheck 정규식의 result의 값을 저장할 변수선언
	var pwcheckrs = "";
	// name 정규식의 result의 값을 저장할 변수선언
	var namers = "";
	
	var idck= "";
	var emailck="";
	
	var emailrs="";
	// id길이 체크
	$("#id").on("blur", function() {

		// id 정규식
		var idRegex = /^[a-z]+[a-z0-9-_]{5,20}$/g;
		// jsp에 id값을 id로 가진 태그의 밸류를 id로 지정
		var id = $("#id").val();
		// ajax 시작
		$.getJSON("/Account/Signup/idcheck/" + id + ".json", function(data) {
			// select된 결과가 있으면 success로 인식
			console.log(data)

			$("#idalert").remove();
			// str = html요소 span으로 사용중입니다.
			str = "<span id='idalert'class='span_js'>사용중입니다</span>"
			// idbox에 str을 띄워라
			$("#id_box").append(str);
			// 컬러는 레드색상에 마진은 왼쪽으로 10px만
			$("#idalert").css("color", "red").css("margin-left", "10px");
			// 사용중이 아니라면
			 idck= false;
		}).fail(function(data) {
			// 만약에 #id의 내용이 정규식에 맞다면 아래를 실행해라
			if (idRegex.test($("#id").val())) {

				$("#idalert").remove();
				// str = html요소 span으로 사용중입니다.
				str = "<span id='idalert' class='span_js'>사용 가능 합니다</span>"
				// idbox에 str을 띄워라
				$("#id_box").append(str);
				// 컬러는 그린색상에 마진은 왼쪽으로 10px만
				$("#idalert").css("color", "green").css("margin-left", "10px");
				// idrs= true다
				idrs = true;
			} else {// 정규식에 맞지 않다면 아래를 실행해라

				$("#idalert").remove();
				// 정규식에 맞는 내용을 str에 저장
				str = "<span id='idalert' class='span_js'>아이디는 5자 이상, 20자 이하로 써주세요.</span>"
				// 저장한 str을 #idbox에 띄워라
				$("#id_box").append(str);
				// 색상은 레드색상에 마진은 왼쪽으로 10px만
				$("#idalert").css("color", "red").css("margin-left", "10px");
				// idrs=false다
				idrs = false;
			}
		})
	})
	// 비밀번호 길이 체크
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
			
			str = "<span id='passwordalert' class='span_js'>비밀번호는 8자 이상, 20자 이하로 써주세요. </span>"
			
			$("#pw_box").append(str);
			
			$("#passwordalert").css("color", "red").css("margin-left", "10px");
			
			pwrs=false;
		}
	})
	
	// 비밀번호 일치 확인
	$("#pwcheck").blur(function() {
		
		var password = $("#password").val();
		
		var password2 = $("#pwcheck").val();
		
		if (password != password2) {
			
			$("#pwcheckalert").remove();
			
			str = "<span id='pwcheckalert' class='span_js'>비밀번호가 일치하지 않습니다. </span>"
			
			$("#pwcheck_box").append(str);
			
			$("#pwcheckalert").css("color", "red").css("margin-left", "10px");
			
			pwcheckrs =false;
		} else {
			
			$("#pwcheckalert").remove();
			
			str = "<span id='pwcheckalert' class='span_js'>  비밀번호가 일치합니다.</span>"
			
			$("#pwcheck_box").append(str);
			
			$("#pwcheckalert").css("color", "green").css("margin-left", "10px");
				
			pwcheckrs = true;
		}
	})
	// name
	$("#name").blur(function(){
		
		
		var nameRegex =  /^[가-힣]{2,5}$/;
		
		if(nameRegex.test($("#name").val())){
			
			$("#namealert").remove();
			
			str="<span id='namealert' class='span_js'>사용가능합니다.</span>"
			
			$("#name_box").append(str);
			
			$("#namealert").css("color", "green").css("margin-left", "10px");
			
			namers = true;
		}else{
			
			$("#namealert").remove();
			
			str="<span id='namealert' class='span_js'>이름 형식에 맞게 입력해주세요.</span>"
			
			$("#name_box").append(str);
			
			$("#namealert").css("color", "red").css("margin-left", "10px");
			
			namers=false;
		}
	})
	// email
	$("#email").blur(function(){

		var emailRegex = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
		var email=$("#email").val();
		
		$.getJSON("/Account/Signup/emailcheck/"+email+".json",function(data){
			// select된 결과가 있으면 success로 인식
			console.log(data)
			$("#emailalert").remove();
			
			str = "<span id='emailalert'> 사용중입니다 </span>"
			
			$("#emailbox").append(str);
			
			$("#emailalert").css("color", "red").css("margin-left", "10px");
			
			emailck= false;
				
		}).fail(function(data){// select된 결과가 없으면 fail로 인식
			if(emailRegex.test($("#email").val())){
				$("#emailalert").remove();
				
				str="<span id='emailalert'>사용가능합니다.</span>"
				
				$("#emailbox").append(str);
				
				$("#emailalert").css("color", "green").css("margin-left", "10px");
				
				emailrs = true;
		} else {
			
			$("#emailalert").remove();
			str="<span id='emailalert'>이메일 형식에 맞게 입력해주세요.</span>"
			$("#emailbox").append(str);
			$("#emailalert").css("color", "red").css("margin-left", "10px");
			emailrs=false;
		}
		})
	})
	// 필요한 데이터가 전부 입력되었다면 submit을 진행한다//
	
	$("form").on("submit", function() {

		if(idrs == true && pwrs == true && pwcheckrs == true && namers == true && emailrs == true){
			alert("회원가입을 축하합니다.");
		}else if(idck == false){
			alert("ID가 중복되었습니다.")
		}else if(emailck == false){
			alert("Email이 중복되었습니다.")
		}else{
			alert("다시 확인해주세요.");
			return false;
		}
	
	})
	
})