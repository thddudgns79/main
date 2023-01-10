<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<fmt:setBundle basename="i18n/board"/>
<!DOCTYPE html>
<html>
	<!-- 자바스크립트 -->
  	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  	<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
  	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
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
				<div class="content my-3">
					<div>게시글 번호: ${board.boardId}</div>
					<div>게시글 카테고리: ${board.boardCategory}</div>
					<div>게시글 제목: ${board.boardTitle}</div>
					<div>게시글 내용: ${board.boardContent}</div>
					<div>게시날짜: ${board.calculateTime}</div>
					<div>아이디: ${board.studentId}</div>
					<div>
						<c:forEach var="file" items="${board.bfileList}">
							<img src='<c:url value="/board/file/${file.fileId}"/>' class="img-thumbnail" style="width:200px;">
						</c:forEach>
					</div>
				</div>
				
				<!-- 수정 / 삭제  / 돌아가기 -->
				<a class="btn btn-warning" href="${pageContext.request.contextPath}/board/update/${board.boardId}">수정</a>
				<a class="btn btn-warning" href="${pageContext.request.contextPath}/board/delete/${board.boardId}">삭제</a>
				<a class="btn btn-warning" href="${pageContext.request.contextPath}/board/list">돌아가기</a>
				
				<!-- 댓글 작성 -->				
				<form action="<c:url value='/board/reply/insert'/>" method=post class="d-flex my-3" enctype="multipart/form-data">
      				<label class="font-weight-bold" for="replyContent"></label>
      				<input type="text" class="form-control" placeholder="댓글을 입력해주세요" id="replyContent" name="replyContent" style="width:300px;"/>
					<input type="hidden" name="boardId" value="${board.boardId}">
					<button type="submit" class="btn btn-warning btn-sm" style="height:35px;"><b>작성</b></button>
				</form>
				
				
				<!-- 댓글목록 -->
				<c:if test="${!empty board.replyList}">
					<table id="replyListTable" class="table table-hover" style='width:700px;'>
						<thead>
							<tr>
								<th>댓글${fn:length(board.replyList)}</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="reply" items="${board.replyList}">
								<tr id="replyOne${reply.replyId}">
									<td>
										<span class="text-primary mr-2"><strong>${reply.studentId}</strong></span>
										<span class="text-muted"><small>${reply.calculateTime}</small></span>
										<div class="my-1">${reply.replyContent}</div>
											<!-- 답글작성 -->
											<div class="accordion" id="accordionExample" style="width:500px;">
												  <div class="accordion-item">
													    <h2 class="accordion-header" id="headingOne" >
														    <button id="accordionbtn" class="accordion-button" type="button" data-bs-toggle="collapse" 
														    			  data-bs-target="#replyListOpen${reply.replyId}" aria-expanded="false" aria-controls="replyListOpen${reply.replyId}" 
														    			  onclick="replyInputBox(${reply.replyId})" style="height:20px;">
													      		답글
													      	</button>
													    </h2>
												    </div>
												    <div id="replyListOpen${reply.replyId}" class="accordion-collapse collapse" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
													      <div class="accordion-body">
			      												<form id="writeReReplyForm" name="writeReReplyForm" class="d-flex">
												      				<label class="font-weight-bold" for="writeReReply${reply.replyId}"></label>
												      				<input type="text" class="form-control" placeholder="답글을 입력해주세요" id="writeReReply${reply.replyId}" name="writeReReply${reply.replyId}"/>
																	<button type="button" onclick="writeReReplyFun(${reply.replyId}, ${reply.boardId})" class="btn btn-warning btn-sm" style="height:35px;"><b>작성</b></button>
																</form>
																<!-- 답글 목록 -->
																<div id="reReplyListDiv${reply.replyId}"></div>
																<!-- 작성한 답글 추가 -->
																<div id="reReplyWriteDiv${reply.replyId}"></div>
													      </div>
											      	</div>
									      	</div>
									</td>
									<td style="vertical-align: text-top;">
										<div class="dropdown float-right">
											  <a role="button" data-bs-toggle="dropdown" aria-expanded="true">
													<i class="bi bi-three-dots-vertical"></i>
											  </a>
											  <ul class="dropdown-menu">
											    	<li><a class="dropdown-item" onclick="updateReplyInput(${reply.replyId})"><i class="bi bi-pencil-square"> 수정</i></a></li>
											    	<li><a class="dropdown-item" onclick="deleteReplyFun(${reply.replyId})"><i class="bi bi-trash-fill"> 삭제</i></a></li>
											  </ul>
											</div>
									</td>
								</tr>
							</c:forEach>
						</tbody>
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