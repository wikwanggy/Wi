/**
 * 
 */
$(document).ready(function(){
	emailck="";
	emailrs="";

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
			alert("aa")
			if(emailRegex.test($("#email").val()==null)){
				$("#emailalert").remove();
				alert("bb")
				str="<span id='emailalert'>사용가능합니다.</span>"
				
				$("#emailbox").append(str);
				
				$("#emailalert").css("color", "green").css("margin-left", "10px");
				
				emailrs = true;
		}else {
			
			$("#emailalert").remove();
			str="<span id='emailalert'>이메일 형식에 맞게 입력해주세요.</span>"
			$("#emailbox").append(str);
			$("#emailalert").css("color", "red").css("margin-left", "10px");
			emailrs=false;
		}
		})
	})
    $("#mailbtn").click(function(){
    	var ev=$("#email").val();
    	
    	if(ev==""){
    		swal("실패","이메일입력","error");
    		$("#email").focus();
    	}else if(emailrs==true){
    		swal("실패","이메일없음","error");
    		$("#email").focus();
    	}else{
    	   $.ajax({
    		 url:"/Account/emailkey",
    		 type:"POST",
    		 data:{
    			 email : $("#email").val()
    		 },
    		 success : function(result){
    			 console.log("gdgdgd"+result);
    			 swal("success","인증번호를 발송하였습니다.","error");
    		 },
    	   })
    }
   $("#mailcheck").submit(function(){
	   var email =$("#email").val();
	   var mailkey=$("#mailkey").val();
	   var check = false;
	   
	   if (email==""){
		   swal("공백 발생!!","이메일을 입력해주세요","error");
		   $("#email").focus();
	   }else if(mailkey==""){
		   swal("공백 발생!!","인증번호를 입력해주세요.","error");
		   $("#mailkey").focus();
	   }else{
		   $.ajax({
			   type : "POST",
				url : "/Account/emailkeycheck",
				data : JSON.stringify ({email:email, mailkey:mailkey}),
				contentType : "application/json; charset=utf-8",
				async : false,
				success:function(result) {
					if(result == "success") {
						swal({
							title:"성공!!",
							text:"이메일 인증에 성공하셨습니다.",
							icon:"success",
							buttons:'확인'
						}).then(function(){
							location.href="/Account/login"
						})
						
					}
				},
				error:function() {
					swal("실패!!","이메일 인증에 실패하셨습니다.","error")
					check = false;
				}
		   })
	   }
	   return check;
   })
 })
})