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
    $("#mailbtn").click(function(){
       if(emailrs==true){
    	   $.ajax({
    		 url:"/Account/emailkey",
    		 type:"POST",
    		 data:{
    			 email : $("#eamil").val()
    		 },
    		 success : function(result){
    			 swal("문자발송",result,"success");
    		 },
    	   })
    	   
       }else{
    	   swal("이메일이 중복되었거나 형식에 맞게 입력해주세요.",result,"error")
    	   return false;
       }
    })
 })