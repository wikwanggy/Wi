/**
 * 
 */
$(function(){
		$("#findBtn").click(function(){
			$.ajax({
				url : "/Login/findpw",
				type : "POST",
				data : {
					id : $("#id").val(),
					email : $("#email").val()
				},
				success : function(result) {
					alert(result);
				},
			})
		});
	})