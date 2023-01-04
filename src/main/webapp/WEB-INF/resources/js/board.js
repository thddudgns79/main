 function showReplyList() {
	 $('#replyListTable').css("display", "block");
 }

 function replyInputBox(i) {
	 $('#replyForm'+ i).css("display", "block");
 }
 
 function writeReplyFun(i) {
	let rContent = $("#writeReply"+i).val()
	
	event.cancelBubble = true;
	
	$.ajax({
		type : 'POST',
		url : "/myapp/board/reply/insert",
		data : {reviewId: i, writeReply: rContent},
		error : function() {
			alert('통신실패!');
		},
		success : function(data) {
			if(data==0) {
				$('#checkModal').modal("show");
			} else {
				
			}
		}
	});
}