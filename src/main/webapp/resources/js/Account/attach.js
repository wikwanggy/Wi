/**
 * 
 */
$(document).ready(function(){
	// detail.jsp가 시작되자마(ready이벤트)자 bno값 가져오기
	var bno=$("input[name='bno']").val();
	$.getJSON("/attachlist",{bno:bno},function(attachlist){
		console.log(attachlist);
		 var str="";
		$(attachlist).each(function(i,attach){
			// 만약 image결과가 true면
			if(attach.image){
				 var filePath=encodeURIComponent(attach.uploadPath+"/s_"+attach.uuid+"_"+attach.fileName);
				 console.log(filePath);
				 str+="<li><img src='/display?fileName="+filePath+"'></li>"
			}else{ // 그렇지 않으면
				 var filePath=encodeURIComponent(attach.uploadPath+"/"+attach.uuid+"_"+attach.fileName);
        		 console.log(filePath);
        		 str+="<li><a href='/download?fileName="+filePath+"'>"+attach.fileName+"</a></li>"
            	
			}
		})
		 $("#uploadResult ul").html(str)
	});
})