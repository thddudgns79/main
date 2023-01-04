<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<fmt:setBundle basename="i18n/board"/>
<!DOCTYPE html>
<html>
	<!-- 자바스크립트 -->
	<script src="<c:url value='/js/board.js'/>"></script>
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
					<div>게시글 번호: ${board.boardId}</div>
					<div>게시글 카테고리: ${board.boardCategory}</div>
					<div>게시글 제목: ${board.boardTitle}</div>
					<div>게시글 내용: ${board.boardContent}</div>
					<div>게시날짜: ${board.createdDate}</div>
					<div>아이디: ${board.studentId}</div>
					<div>
						<c:forEach var="file" items="${board.bfileList}">
							<img src='<c:url value="/board/file/${file.fileId}"/>' class="img-thumbnail" style="width:200px;">
						</c:forEach>
					</div>
				</div>
				
				<!-- 댓글 작성 -->				
				<form action="<c:url value='/board/reply/insert'/>" method=post class="d-flex" enctype="multipart/form-data">
      				<label class="font-weight-bold" for="replyContent"></label>
      				<input type="text" class="form-control" placeholder="댓글을 입력해주세요" id="replyContent" name="replyContent" style="width:300px;"/>
					<input type="hidden" name="boardId" value="${board.boardId}">
					<button type="submit" class="btn btn-warning btn-sm" style="height:35px;"><b>작성</b></button>
				</form>
				
				<!-- 댓글 목록 -->
				<c:if test="${!empty board.replyList}">
				<button type="button" onclick="showReplyList()">댓글${fn:length(board.replyList)}</button>
				<table id="replyListTable" style="display: none;">
						<tr>
							<td>댓글 번호</td>
							<td>댓글 내용</td>
							<td>댓글 날짜</td>
						</tr>
						<c:forEach var="reply" items="${board.replyList}">
							<tr>
								<td style="vertical-align: text-top;">${reply.replyId}</td>
								<td>
									${reply.replyContent}
									<div>
										<button type="button" onclick="replyInputBox(${reply.replyId})">답글</button>
										<!-- 답글작성 -->
										<div id="replyForm${reply.replyId}" style="display: none;">
											<form id="writeReplyForm" name="writeReplyForm" method="post" class="d-flex">
							      				<label class="font-weight-bold" for="writeReply${reply.replyId}"></label>
							      				<input type="text" class="form-control" placeholder="${pageContext.request.contextPath}답글을 입력해주세요" id="writeReply${reply.replyId}" name="writeReply"/>
												<button type="button" onclick="writeReplyFun(${reply.replyId})" class="btn btn-warning btn-sm" style="height:35px;"><b>작성</b></button>
											</form>
										</div>
									</div>
								</td>
								<td style="vertical-align: text-top;">${reply.createdDate}</td>
							</tr>
						</c:forEach>
				</table>
				</c:if>
				<c:if test="${empty board.replyList}">
					작성된 댓글이 없습니다.
				</c:if>
			
			</div>
		</div>
		<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
	</body>
</html>