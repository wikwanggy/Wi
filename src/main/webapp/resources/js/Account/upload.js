/**
 * 
 */
$(document).ready(function() {
	// 함수 선언
	// 정규식을 이용하여 확장자 제한
	var reg = new RegExp("(.*?)\.(exe|zip|alz)$");
	// 최대 크기를 설정하여 그 이상이면 제한
	var maxSize=5242880; // 5MB
	//                  파일이름, 파일크기
	function checkExtension(filename, filesize){
		// 파일 크기 제한
		// 실제 파일의 크기 > 최대 크기
		if(filesize >= maxSize){
			alert("파일 사이즈 초과");
			return false;
		}
		// 확장자 제한
		// 실제파일명의 확장자와 정규식 비교
		// 정규식이면 
		if(reg.test(filename)){
			alert("해당 종류의 파일은 업로드 할 수 없습니다.");
			return false;
		}
		return true;
	}

   // 파일전송버튼을 클릭하면
   $("#uploadBtn").on("click", function() {
	
	  // alert("aaaaa");
      // 파일 업로드 관련 로직 처리
      // .jsp에 form태그를 대체(FormData함수)
      var formData = new FormData();

      var inputFile = $("input[name='uploadFile']");
      // console.log(inputFile);
      var files = inputFile[0].files;

      for (var i = 0; i < files.length; i++) {
    	  
    	  if(!checkExtension(files[i].name,files[i].size)){
    		  return false;
    	  }
    	  
    	  
         // .jsp의 파일선택을통해 선책한 파일들을 form태그에 추가
         formData.append("uploadFile", files[i]);
      }

      // ajax를 통해서 UploadController에 파일관련 데이터 전송
      $.ajax({
         type:"post",
         url:"/uploadAjaxAction",
         data:formData,
         contentType:false,
         processData:false,
         dataType : "json",
         success : function(result){
        	 
        	 
        	 var str="";
        	 var input="";
        	 $(result).each(function(i,obj){
        		 console.log(obj)
        		 console.log(obj.fileName)
        		
        		 input += "<input type='text' name='attach["+i+"].uploadPath' value='"+obj.uploadPath+"'><br>";
        		 input += "<input type='text' name='attach["+i+"].fileName' value='"+obj.fileName+"'><br>";
        		 input += "<input type='text' name='attach["+i+"].uuid' value='"+obj.uuid+"'><br>"; 
        		 input += "<input type='text' name='attach["+i+"].image' value='"+obj.image+"'><br>";
        		 
        		 // 만약 image결과가 true면
        		 if(obj.image){
        			 // 아래에 있는거 실행
        			 var filePath=encodeURIComponent(obj.uploadPath+"/s_"+obj.uuid+"_"+obj.fileName);
            		 console.log(filePath);
            		 str+="<li class='imgbox'><img src='/display?fileName="+filePath+"'></li>"
        		 }

        		 else{// 그렇지 않으면 
            		 // 다운로드 할 수 있도록 실행
        		 var filePath=encodeURIComponent(obj.uploadPath+"/"+obj.uuid+"_"+obj.fileName);
        		 console.log(filePath);
        		 str+="<li><a href='/download?fileName="+filePath+"'>"+obj.fileName+"</a></li>"
            	}
        	 })
        	 $("#uploadResult ul").html(str)
        	 $("#form").append(input).submit();
         }
      });

   }); 

});