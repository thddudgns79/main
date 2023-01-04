<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.js"></script> 
<script>
	 function writeReplyFun() {
		 $('#replyForm').css("display", "block");
	 }
</script>
</head>
<body>
	<div class="content">
		<div>댓글번호: ${board.boardId}</div>
		<div>댓글카테고리: ${board.boardCategory}</div>
		<div>댓글제목: ${board.boardTitle}</div>
		<div>댓글내용: ${board.boardContent}</div>
		<div>댓글날짜: ${board.createdDate}</div>
		<div>아이디: ${board.studentId}</div>
	</div>

	<table>
		<c:if test="${!empty board.replyList}">
			<tr>
				<td>댓글 번호</td>
				<td>댓글 내용</td>
				<td>댓글 날짜</td>
				<td>아이디</td>
			</tr>
			<c:forEach var="reply" items="${board.replyList}">
				<tr>
					<td>${reply.replyId}</td>
					<td>${reply.replyContent}</td>
					<td>${reply.createdDate}</td>
					<td>${reply.studentId}</td>
				</tr>
			</c:forEach>
		</c:if>
		<c:if test="${empty board.replyList}">
			<tr>
				<td>작성된 댓글이 없습니다.</td>
			</tr>
		</c:if>
	</table>
	
	<button type="button" onclick="writeReplyFun()">댓글작성</button>
	
	<div id="replyForm" style="display: none;">
		<form action="<c:url value='/reply/insert'/>" method=post enctype="multipart/form-data">
				<label for="replyContent">내용:</label>
				<textarea class="form-control" rows="5" id="replyContent" name="replyContent"></textarea>
  			<button type="submit">작성</button>
		</form>
	</div>
</body>
</html>