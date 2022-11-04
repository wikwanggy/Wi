/**
 * 
 */
// detail.jsp를 실행하면
$(document).ready(function(){
	
	$(document).on("click",'.fileimg',function(e){
		e.preventDefault();
		$(this).css({'width':'1080px','height':'500px','left':'30','top':'30'});
		$('.fileimg').not($(this)).css({'width':'100','height':'75','left':'15','top':'15'});
//		"width=300, height=200, left=30, top=30,scrollbars=no,titlebar=no,status=no,resizable=no,fullscreen=no")
		
	})
//	function new(){
//		 window.open("test.asp","new", 
//		"width=300, height=200, left=30, top=30,scrollbars=no,titlebar=no,status=no,resizable=no,fullscreen=no")
//		}
  })


   
  