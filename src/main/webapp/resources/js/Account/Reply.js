/**
 * 
 */

$(document).ready(function(){ // jquery 준비....
	// 함수 호출
	// detail.jsp가 시작되자마자 bno값을 가져올려면 $(document).ready 아래에 선언
	var rnoValue = $("input[name='rno']").val();
	
	// detail.jsp가 시작되자마자 댓글목록 리스트(list) 함수를 호출
	list(rnoValue);
	// 댓글 쓰기버튼을 클릭하면 
	$("#add").on("click",function(){
		// 댓글쓰기 버튼을 클릭했을 당시에 댓글내용을 가져올려면 $("add").on("click",function(){아래에 선언
		var replyValue = $("#reply").val();
		var idValue ="aaaa1234";
		var replydateValue=" ";
		
		add({rno:rnoValue,reply:replyValue,id:idValue,replydate:replydateValue}); // 댓글쓰기를 하기위한 함수 호출	
	})
	// 댓글 수정버튼을 클릭하면
	// 이미 존재하는 태그에 이벤트를 처리하고
	// 나중에 동적으로 생긱는 태그들에 대해서 파라미터 형식으로 지정(이벤트 델리게이트)
	$('#chat').on("click",".update",function(){
	// 댓글번호와 댓글내용을 수집해서 
		var rno = $(this).data("rno"); // this 현재 현재 선택된 rno 요소 의미
		var reply=$('#replycontent'+rno).val();
		
		// 댓글수정을 하기 위한 함수 호충(댓글번호, 댓글내용 )
		modify({rno:rno,reply:reply});
	})
	
	// 댓글 삭제버튼을 클릭하면
	$("#chat").on("click",".remove",function(){
		// 댓글번호를 수집해서
		var rno = $(this).data("rno");
		console.log(rno);
		// 댓글삭제를 하기 위한 함수 호출(댓글번호)
		remove(rno);
	})
	
	
})// jquery 끝....
// 함수선언
// 댓글을 삭제하기 위한 함수 선언
function remove(rno){
	console.log(rno);
	$.ajax({
		type :"delete",
		url:"/replies/remove/"+rno,
		success:function(result){
			if(result=="success"){
				alert("댓삭 성공")
			}
		}

	})
}



// 댓글을 수정하기 위한 함수 선언
function modify(reply){
	console.log(reply);
	$.ajax({ // ajax 준비...(비동기식으로 처리)
		
		type:"put", // method 방식 update이기에 put방식을 쓴다.  
		
		url:"/replies/modify",	
		
		data:JSON.stringify(reply),
		
		contentType:"application/json; charest=utf-8"
	})
}
	// add 함수 선언 끝 부분
	function list(rno){// list함수 선언시작
		
		// alert(bno);
		$.getJSON("/replies/"+rno+".json",function(data){ // "/replies/"+bno+".json"(주소) / function(data)(화면에 표시될 리스트를 위한 함수) 
		
			var str=""; // <li>를 저장할 변수 선언
			for(var i=0;i<data.length;i++){ 
				str+="<li>id : "+data[i].id+"</li>"
				str+="<li>rno : "+data[i].rno+"</li>"
				str+="<li><textarea id='replycontent"+data[i].rno+"'>"+data[i].reply+"</textarea></li>"
				str+="<li><input class='update' type='button' value='수정' data-rno="+data[i].rno+" data-reply="+data[i].reply+">"
				str+="</li>"
				str+="<li><input class='remove' type='button' value='삭제' data-rno="+data[i].rno+" data-reply="+data[i].reply+">"
				str+="</li>"
			}
			$("#replyUL").html(str); // 위의 for문안에 표시할려고 적어놨는 문법을 replyUL이라는 아이디를 가진 태그에 표시
		})
		
	}
	// list함수 선언 끝


// 함수 선언
// 댓글쓰기를 하기위한 함수 선언
function add(reply){  // add 함수 선언 시작부분
	
	$.ajax({ // ajax 준비...(비동기식으로 처리)
		
		type:"post",  // method 방식(get(sql문장select를 쓸때), post(sql문장insert를 쓸때), put(sql문장update를 쓸때), delete(sql문장delete를 쓸때))
		
		url:"/replies/new",	// RequestMapping(value="/board/detail" 의 밸류값과 같아야 한다.(즉 controller의 연결을 위해)
		
		data:JSON.stringify(reply),//public void rewrite(ReplyVo reply) 들어가는 곳에 들어갈 수 있다.
		// contentType : ajax -> controller로 데이터 전송시 타입
		// (contentType을 생략하며면 web Brower한테 위임)
		contentType:"application/json; charest=utf-8", // 기존 ajax는 {"id":"1234"}이런식이지만 이걸 쓰면 {id:1234}로 표시가능하다.
		
		success : function(result){
		
			if(result=="success"){ // 성공하면
		
				alert("댓글성공") // 댓글성공 표시
			}
		}
	})
} 