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
			
		
			
			emailck= false;
				
		}).fail(function(data){// select된 결과가 없으면 fail로 인식
			
			if(emailRegex.test($("#email").val())){
				$("#emailalert").remove();
				
				
				emailrs = true;
		}else {
			
			$("#emailalert").remove();
	
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
    			 swal("success","인증번호를 발송하였습니다.","success");
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