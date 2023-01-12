<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- 자바스크립트 -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="<c:url value='/js/board.js'/>"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">

<div>
	<c:forEach var="reReply" items="${reReplyList}">
		<hr/>
		<div id="reReplyOne${reReply.replyId}">
			<div class="d-flex justify-content-between">
				<div class="mx-2">
					<i class="bi bi-person-fill"></i>
					<strong>${reReply.studentId}</strong> &nbsp;
					<small class="bg-warning rounded text-white">&nbsp;${reReply.calculateTime}&nbsp;</small>
				</div>
				<ul class="navbar-nav">
	              <li class="nav-item dropdown" style="width: 30px; height: 30px;">
	                <a class="nav-link" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
		                  	<i class="bi bi-three-dots-vertical"></i>
	                </a>
	                <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
		                  <a class="dropdown-item" onclick="updateReReplyInput(${reReply.replyId})"><i class="now-ui-icons design-2_ruler-pencil">&nbsp;수정</i></a>
		                  <a class="dropdown-item" onclick="deleteReReplyFun(${reReply.replyId})"><i class="now-ui-icons ui-1_simple-remove">&nbsp;삭제</i></a>
	                </div>
            	 </li>
				</ul>
			</div>
			<div class="ml-3 my-2" style="font-size: 15px;">${reReply.replyContent}</div>
		</div>
	</c:forEach>
	<hr/>
</div>

