<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setBundle basename="i18n/board"/>
<!DOCTYPE html>
<html>
	<!-- 자바스크립트 -->
	<script>
		 function writeReplyFun() {
			 $('#replyForm').css("display", "block");
		 }
	</script>
	<jsp:include page="/WEB-INF/views/include/staticFiles.jsp"/>
	<body>
	<jsp:include page="/WEB-INF/views/include/header.jsp"/>

		<div role="main" class="ml-sm-auto col-12">
			<div class="parallax-window" data-parallax="scroll" data-image-src='<c:url value="/img/background.png"/>'>
				<div class="tm-section-wrap">
					<section id="intro" class="tm-section">
						<div class="tm-bg-white-transparent tm-intro">
							<h2 class="tm-section-title mb-5 text-uppercase tm-color-primary">
								게시판</h2>
							<p class="tm-color-gray">
								This box alpha 30 percent. Left sidebar is a sticky element. Right side Contents are scrolling up
								and down. This background has a parallax effect.</p>
							<p class="mb-0 tm-color-gray">
								Dream Pulse is a Bootstrap 4.3.1
								template designed for your websites. You can modify this layout
								as you like.</p>
						</div>
					</section>
				</div>
			</div>
		</div>
		
		
		<div class="tm-section-wrap bg-white">
			<div class="my-5 ml-5">
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
			</div>
		</div>
		<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
	</body>
</html>