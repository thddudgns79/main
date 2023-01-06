//게시판 상세보기 
$().ready(function(){
	$("#accordionbtn").trigger("click");
});

function replyInputBox(i) {
	 $('#replyForm'+ i).css("display", "block");
	 
	 $.ajax({
			type : 'GET',
			url : "/myapp/board/rereply/list",
			data : {replyId: i},
			error : function() {
				alert('통신실패!');
			},
			success : function(data) {
				if(data==0) {
				} else {
					$("#reReplyListDiv" + i ).html(data);
				}
			}
		});
 }
 
 function writeReReplyFun(i, j) {
	let rContent = $("#writeReReply"+i).val();
	
	$.ajax({
		type : 'POST',
		url : "/myapp/board/rereply/insert",
		data : {replyId: i, boardId: j, replyContent: rContent},
		error : function() {
			alert('통신실패!');
		},
		success : function(data) {
			if(data==0) {
				alert("댓글작성에 실패하였습니다");
			} else {
				alert("댓글작성에 성공하였습니다!");
				
				let html = ' ';
				html += '<span class="text-danger">';
				html += '' + rContent;
				html += '<span>';
				
				$("#reReplyWriteDiv" + i ).after(html);
			}
		}
	});
}
 
 function updateReplyInput(i) {
	 $('#replyOne'+ i).hide();
	 
	 let html = ' ';
	 html += '<div class="d-flex rows">';
	 html += '<input type="text" class="form-control" placeholder="댓글을 입력해주세요" id="updateReplyContent" name="updateReplyContent" style="width:300px;"/>';
	 html += '<button class="btn btn-outline-warning" type="button" onclick="updateReplyFun(' + i + ')">수정</button>';
	 html += '</div>'
	 
	 $('#replyOne'+ i).after(html);
}
 
 function updateReplyFun(i) {
	 let rContent = $("#updateReplyContent").val();
	 
	 $.ajax({
			type : 'POST',
			url : "/myapp/board/reply/update",
			data : {replyId: i, replyContent: rContent},
			error : function() {
				alert('통신실패!');
			},
			success : function(data) {
				if(data==0) {
					alert("댓글 수정에 실패하였습니다");
				} else {
					location.reload();
				}
			}
		});
 }
 
 function deleteReplyFun(i) {
	 $.ajax({
			type : 'GET',
			url : "/myapp/board/reply/delete",
			data : {replyId: i},
			error : function() {
				alert('통신실패!');
			},
			success : function(data) {
				if(data==0){
					alert("댓글 삭제에 실패하였습니다.")
				} else {
					location.reload();
				}
			}
		});
 } 
 
 //================================================================================================
 //게시글 수정
 function deleteFileFun(i) {
	$.ajax({
		type : 'GET',
		url : "/myapp/board/file/delete",
		data : {fileId: i},
		error : function() {
			alert('통신실패!');
		},
		success : function(data) {
			if(data==0) {
				alert("사진 삭제에 실패하였습니다");
			} else if(data==1) {
				alert("사진 삭제에 완료하였습니다!");
				$("#bfileImg"+i).css("display", "none");
			}
		}
	});
}
 
 
 
 
 
 
 
 