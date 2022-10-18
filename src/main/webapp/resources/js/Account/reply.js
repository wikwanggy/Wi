/**
 * 
 *//*

$(document).ready(function(){ // jquery 준비....
	// 함수 호출
	// detail.jsp가 시작되자마자 bno값을 가져올려면 $(document).ready 아래에 선언
	var bnoValue = $("input[name='bno']").val();
	
	// detail.jsp가 시작되자마자 댓글목록 리스트(list) 함수를 호출
	list(bnoValue);
	// 댓글 쓰기버튼을 클릭하면 
	$("#add").on("click",function(){
		// 댓글쓰기 버튼을 클릭했을 당시에 댓글내용을 가져올려면 $("add").on("click",function(){아래에 선언
		var replyValue = $("#reply").val();
		var idValue =$("input[name='id']").val();
		
		
		add({bno:bnoValue,reply:replyValue,id:idValue}); // 댓글쓰기를 하기위한 함수 호출	
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
	function list(bno){// list함수 선언시작
		
		// alert(bno);
		$.getJSON("/replies/"+bno+".json",function(data){ // "/replies/"+bno+".json"(주소) / function(data)(화면에 표시될 리스트를 위한 함수) 
		
			var str=""; // <li>를 저장할 변수 선언
			for(var i=0;i<data.length;i++){ // data.length는 데이타 길이에 맡게 반복
				str+="<div class='replyli'>"
				str+="<li><input type='hidden' name='id' id='id' value='${sessionScope.login.id}'>ID("+data[i].id+")</li>" //  data[i]데이터 길이만큼 id를 <li>태그안에 넣어 HTML에 표현
				str+="<li><textarea readonly class='replycontent'>"+data[i].reply+"</textarea></li>" // data[i]데이터 길이만큼 reply를 <li>태그안에 넣어 HTML에 표현
				str+="<li>댓글번호("+data[i].rno+")</li>"
				str=="<input type='hidden' id='replydate' name='replydate'>"
				str+="</div><br><br>"
			}
			$("#replyUL").html(str); // 위의 for문안에 표시할려고 적어놨는 문법을 replyUL이라는 아이디를 가진 태그에 표시
		});
		
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
*/
/**
 * 
 */
	
$(document).ready(function(){
	
	//댓글
	var bnoval=$("input[name='bno']").val();
	
	list(bnoval);
	
	$("#replywrt").on("click",function(){
		var replyval=$("#reply").val();
		var idval=$("input[name='sessionid']").val();
		
		if(replyval==''){
			alert("내용을 입력하세요.");
			return;
		}
		
		replywrt({bno:bnoval,reply:replyval,id:idval});
		
		console.log(replyval);
	})
	$("#chat").on("click",".remove",function(){
		var rno=$(this).data("rno");
		var result=confirm("삭제 후엔 복구할 수 없습니다. 정말 삭제하시겠습니까?");
		if(result){
			remove(rno);
		}
	})
	$("textarea.autosize").on('keydown keyup', function () {
		$(this).height(1).height( $(this).prop('scrollHeight')+12 );	
	})
	$('.text_box textarea').keyup(function() {
		var content = $(this).val();
		$('.text_box .count span').html(content.length);
		if (content.length > 300) {
			alert("최대 200자까지 입력 가능합니다.");
			$(this).val(content.substring(0, 300));
			$('.text_box .count span').html(300);
		}
	})
	$("#chat").on("click",".update",function(){
		var rno=$(this).data("rno");
		var reply=$('#replycontent'+rno).val();
		var id=$(this).data("id");
		if(reply==''){
			alert("내용을 입력하세요.");
			return;
		}
		modify({rno:rno,reply:reply,id:id});
	})
})
function replywrt(reply){
	console.log(reply);
	$.ajax({ //ajax (비동기식 처리)
		type:"post", // method방식(get, post, put, delete)
		url:"/replies/new", // controller의 value(url주소예시:/sample/getText)
		data:JSON.stringify(reply),
		contentType:"application/json; charset=utf-8",
		success:function(result){
			if(result=="success"){
				alert("댓글 성공");
				location.reload();
			}
		}
	})
}

function list(bno){
	//alert(bno)
	//↓type=get, data=JSON
	$.getJSON("/replies/"+bno+".json", function(data){
			var str="";
			var idval=$("input[name='sessionid']").val();
			/*var list=data.list;
			var pf=data.page;*/
			
			for(var i=0;i<data.length;i++){
				str+="<li class='li'>"
				str+=data[i].id+"<span> | </span>"
				
				if(data[i].id==idval||idval=='dnkrhkdrb'){
					
					str+="<div class='replycontent'>"+data[i].reply+"</div>"
				}else{
					str+="<pre><span class='replycontent'>"+data[i].reply+"</span></pre>"
				}
				str+="</li><br>"
			}
			$("#replyUL").html(str);
	})
	
}

function remove(rno){
	$.ajax({
		type:"delete",
		url:"/replies/remove/"+rno,
		success:function(result){
			if(result=="success"){
				//alert("삭제가 완료되었습니다.");
				location.reload();
			}
		}
	})
}
function modify(reply){
	console.log(reply);
	$.ajax({
		type:"put",
		url:"/replies/modify",
		data:JSON.stringify(reply),
		contentType:"application/json; charset=utf-8",
		success:function(result){
			if(result=="success"){
				location.reload();
			}
		}
	})
}

