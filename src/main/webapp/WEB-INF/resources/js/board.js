//================================================================================================
//게시판 상세보기창 
function replyInputBox(i) {
	if($('#accordionbtn'+ i).children().hasClass("bi-caret-down-fill")) {
		$('#accordionbtn'+ i).children().removeClass('bi-caret-down-fill').addClass('bi-caret-up-fill');
	  } else {
		  $('#accordionbtn'+ i).children().removeClass('bi-caret-up-fill').addClass('bi-caret-down-fill');
	  }
	
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
 
 function writeReReplyFun(i, j, k) {
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
				let html = ' ';
				html += '<div id="reReplyOne' + i + '">';
				html += '<div class="d-flex justify-content-between">';
				html += '<div class="mx-2">';
				html += '<i class="bi bi-person-fill"></i>';
				html += '<strong>' + k + '</strong> &nbsp;';
				html += '<small class="bg-success rounded text-white">&nbsp;new&nbsp;</small>';
				html += '</div>';
				html += '<ul class="navbar-nav">';
				html += '<li class="nav-item dropdown" style="width: 30px; height: 30px;">';
				html += '<a class="nav-link" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">';
				html += '<i class="bi bi-three-dots-vertical"></i>';
				html += '</a>';
				html += ' <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">';
				html += '<a class="dropdown-item" onclick="updateReReplyInput(' + i + ')"><i class="now-ui-icons design-2_ruler-pencil">&nbsp;수정</i></a>';
				html += '<a class="dropdown-item" onclick="deleteReReplyFun(' + i+ ')"><i class="now-ui-icons ui-1_simple-remove">&nbsp;삭제</i></a>';
				html += '</div>';
				html += '</li>';
				html += '</ul>';
				html += '</div>';
				html += '<div class="ml-3 my-2" style="font-size: 15px;">' + rContent + '</div>';
				html += '</div>';
				html += '<hr/>';

				$("#reReplyWriteDiv" + i ).after(html);
				
				setTimeout(function() {
					  location.reload();
					}, 10000);
			}
		}
	});
}
 
 function updateReplyInput(i) {
	 $('#replyOne'+ i).hide();
	 
	 let html = '<form class="d-flex">';
	 html += '<input type="text" class="form-control" placeholder="댓글을 입력해주세요" id="updateReplyContent" name="updateReplyContent" style="width:400px; padding: 12px 25px; font-size: 15px;"/>';
	 html += '<button type="button" onclick="updateReplyFun(' + i + ')" class="btn btn-sm" style="background-color:#F96332; position:relative; left:-30px; height:45px; border-radius: 0px 30px 30px 0px / 0px 30px 30px 0px;"><b>수정</b></button>';
	 html += '</form>'
	 
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
 
 function updateReReplyInput(i) {
	 $('#reReplyOne'+ i).hide();
	 
	 let html = ' ';
	 html += '<div class="d-flex rows">';
	 html += '<input type="text" class="form-control" placeholder="댓글을 입력해주세요" id="updateReReplyContent" name="updateReplyContent" style="width:300px;"/>';
	 html += '<button class="btn btn-outline-warning" type="button" onclick="updateReReplyFun(' + i + ')">수정</button>';
	 html += '</div>'
		 
		 $('#reReplyOne'+ i).after(html);
 }
 
 function updateReReplyFun(i) {
	 let rContent = $("#updateReReplyContent").val();
	 
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
 
 function deleteReReplyFun(i) {
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
 //게시글 수정창
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