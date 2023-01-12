<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:setBundle basename="i18n/board" />
<% pageContext.setAttribute("replaceChar", "\n"); %>

<!DOCTYPE html>
<html>
<jsp:include page="/WEB-INF/views/include/staticFiles.jsp" />
<jsp:include page="/WEB-INF/views/include/header.jsp" />
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="<c:url value='/js/board.js'/>"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">

<body>
	<div class="wrapper ">
		<jsp:include page="/WEB-INF/views/include/list.jsp" />
		    <div class="main-panel" id="main-panel">
		      	<!-- Navbar --> 
		      	<nav class="navbar navbar-expand-lg navbar-transparent  bg-primary  navbar-absolute">
				        <div class="container-fluid">
				          <div class="navbar-wrapper">
				            <div class="navbar-toggle">
				              <button type="button" class="navbar-toggler">
				                <span class="navbar-toggler-bar bar1"></span>
				                <span class="navbar-toggler-bar bar2"></span>
				                <span class="navbar-toggler-bar bar3"></span>
				              </button>
				            </div> 
				          </div>
				          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navigation" aria-controls="navigation-index" aria-expanded="false" aria-label="Toggle navigation">
				            <span class="navbar-toggler-bar navbar-kebab"></span>
				            <span class="navbar-toggler-bar navbar-kebab"></span>
				            <span class="navbar-toggler-bar navbar-kebab"></span>
				          </button>
				          <div class="collapse navbar-collapse justify-content-end" id="navigation">
				            <form>
					              <div class="input-group no-border">
					                <input type="text" value="" class="form-control" placeholder="Search..." style="left: -2.0px;">
					                <div class="input-group-append">
					                  <div class="input-group-text">
					                    <i class="now-ui-icons ui-1_zoom-bold"></i>
					                  </div>
					                </div>
					              </div>
				            </form>
				            <ul class="navbar-nav">
				              <li class="nav-item">
				                <a class="nav-link" href="#pablo">
				                  <i class="now-ui-icons media-2_sound-wave"></i>
				                  <p>
				                    <span class="d-lg-none d-md-block">Stats</span>
				                  </p>
				                </a>
				              </li>
				              <li class="nav-item dropdown">
				                <a class="nav-link dropdown-toggle" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				                  <i class="now-ui-icons location_world"></i>
				                  <p>
				                    <span class="d-lg-none d-md-block">Some Actions</span>
				                  </p>
				                </a>
				                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink">
				                  <a class="dropdown-item" href="#">Action</a>
				                  <a class="dropdown-item" href="#">Another action</a>
				                  <a class="dropdown-item" href="#">Something else here</a>
				                </div>
				              </li>
				              <li class="nav-item">
				                <a class="nav-link" href="#pablo">
				                  <i class="now-ui-icons users_single-02"></i>
				                  <p>
				                    <span class="d-lg-none d-md-block">Account</span>
				                  </p>
				                </a>
				              </li>
				            </ul>
				          </div>
				        </div>
		      	</nav>
		      	<!-- End Navbar -->
		      	<div class="panel-header panel-header-sm">
		      	</div>
		      	<div class="content">
				        <div class="row">
				          <div class="col-md-12">
				            <div class="card">
				              <div class="card-header d-flex flex-row justify-content-between">
				                <h1 class="card-title ml-3"> ${board.boardTitle}</h1>
				              </div>
				              <div class="card-body">
				                <div class="table-responsive">
				                  <table id="boardListTable" class="table">
				                    	<thead class=" text-primary">
				                      		<th class="d-flex">
				                      			<div class="text-muted ml-3">
					                      			<strong>[글쓴이] </strong>${board.studentId}
				                      			</div>
				                      			<div class="text-muted ml-5">
					                      			<strong>[작성일] </strong>${board.createdDate} <small class="ml-2 bg-warning rounded text-white">&nbsp;${board.calculateTime}&nbsp;</small>
				                      			</div>
			                      			</th>
				                    	</thead>
					                    	<tbody>
								                      <tr >
									                        <td class="text-left">
<%-- 									                        		<h5 class="mt-3">${board.boardContent}</h5> --%>
									                        		<h5 class="mt-3">${fn: replace(board.boardContent, replaceChar, "</br>") }</h5>
																	<c:forEach var="file" items="${board.bfileList}">
																			<img src='<c:url value="/board/file/${file.fileId}"/>' class="img-thumbnail" style="width:200px;">
																	</c:forEach>						
									                        </td>
								                      </tr>
							                       	  <tr>
							                       	  		<td>
																	<!-- 수정 / 삭제  / 돌아가기 -->
																	<div class="d-flex justify-content-end">
																		<a class="btn mx-1 h6" href="${pageContext.request.contextPath}/board/update/${board.boardId}" style="background-color: MediumSeaGreen; width: 80px; height: 40px;">수정</a>
																		<a class="btn mx-1 h6" href="${pageContext.request.contextPath}/board/delete/${board.boardId}" style="background-color: MediumSeaGreen; width: 80px; height: 40px;">삭제</a>
																		<a class="btn mx-1 h6" href="${pageContext.request.contextPath}/board/list" style=" background-color:MediumSeaGreen; width: 105px; height: 40px;">목록으로</a>			                        
																	</div>
																	<!-- 댓글 작성 -->				
																	<form action="<c:url value='/board/reply/insert'/>" method=post class="d-flex my-4" enctype="multipart/form-data">
													      				<label class="font-weight-bold" for="replyContent"></label>
													      				<input type="text" class="form-control" placeholder="댓글을 입력해주세요" id="replyContent" name="replyContent" style="width:300px;"/>
																		<input type="hidden" name="boardId" value="${board.boardId}">
																		<button type="submit" class="btn btn-warning btn-sm" style="height:35px;"><b>작성</b></button>
																	</form>
																	<!-- 작성된 댓글이 있을 경우의 목록 -->
																	<c:if test="${!empty board.replyList}">
																		<table id="replyListTable" class="table table-hover" style='width:500px;'>
																			<thead>
																				<tr>
																					<th>댓글${fn:length(board.replyList)}</th>
																				</tr>
																			</thead>
																			<tbody>
																				<c:forEach var="reply" items="${board.replyList}">
																					<tr id="replyOne${reply.replyId}">
																						<td>
																							<div class="d-flex justify-content-between">
																								<div class="mx-2">
																									ID  <strong>${reply.studentId}</strong> &nbsp;
																									<small class="bg-warning rounded text-white">&nbsp;${reply.calculateTime}&nbsp;</small>
																								</div>
																								<ul class="navbar-nav">
																					              <li class="nav-item dropdown" style="width: 30px; height: 30px;">
																						                <a class="nav-link" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"">
																							                  	<i class="bi bi-three-dots-vertical"></i>
																						                </a>
																						                <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
																							                  <a class="dropdown-item" onclick="updateReplyInput(${reply.replyId})"><i class="now-ui-icons design-2_ruler-pencil">&nbsp;수정</i></a>
																							                  <a class="dropdown-item" onclick="deleteReplyFun(${reply.replyId})"><i class="now-ui-icons ui-1_simple-remove">&nbsp;삭제</i></a>
																						                </div>
																					              </li>
																							</ul>
																							</div>
																							<div class="my-1">${reply.replyContent}</div>
																							<!-- 답글 작성 -->
																							<div class="accordion" id="accordionExample" style="width:300px;">
																								<div class="accordion-item">
																									<h2 class="accordion-header" id="headingOne" >
																										<button id="accordionbtn" class="accordion-button" type="button" data-bs-toggle="collapse" 
																											    data-bs-target="#replyListOpen${reply.replyId}" aria-expanded="true" aria-controls="replyListOpen${reply.replyId}" 
																											    onclick="replyInputBox(${reply.replyId})" style="height:20px;">답글</button>
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
																										<!-- 작성한 답글추가 -->
																										<div id="reReplyWriteDiv${reply.replyId}"></div>
																									</div>
																								</div>
																							</div>
																						</td>
																					</tr>
																				</c:forEach>
																			</tbody>
																		</table>
																	</c:if>
																	<!-- 작성된 댓글목록이 없을 경우! -->
																	<c:if test="${empty board.replyList}">
																		작성된 댓글이 없습니다.
																	</c:if>
							                       	  		</td>
							                          </tr>
					                    	</tbody>
				                  </table>
				                </div>
				              </div>
				            </div>
				          </div>
				        </div>
			      </div>
			      <jsp:include page="/WEB-INF/views/include/footer.jsp" />
		    </div>
	</div>
</body>
</html>