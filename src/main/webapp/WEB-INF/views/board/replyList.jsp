<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- 자바스크립트 -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="<c:url value='/js/board.js'/>"></script>

<div>
	<c:forEach var="reReply" items="${reReplyList}">
		<hr/>
		<div id="reReplyOne${reReply.replyId}">
			<div class="d-flex rows">
				<span class="text-primary mr-2"><strong>${reReply.studentId}</strong></span>
				<span id="writedTime" class="text-muted"><small>${reReply.calculateTime}</small></span>
				<div class="ml-2">
					  <a role="button" data-bs-toggle="dropdown" aria-expanded="true">
							<i class="bi bi-three-dots-vertical"></i>
					  </a>
					  <ul class="dropdown-menu">
					    	<li><a class="dropdown-item" onclick="updateReReplyInput(${reReply.replyId})"><i class="bi bi-pencil-square"> 수정</i></a></li>
					    	<li><a class="dropdown-item" onclick="deleteReReplyFun(${reReply.replyId})"><i class="bi bi-trash-fill"> 삭제</i></a></li>
					  </ul>
				  </div>
			</div>
			<div>${reReply.replyContent}</div>
		</div>
	</c:forEach>
</div>

