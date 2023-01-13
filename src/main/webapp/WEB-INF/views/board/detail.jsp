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
		      	<!-- End Navbar -->
		      	<div class="panel-header panel-header-sm">
		      	</div>
		      	<div class="content" style="padding-bottom: 110px;">
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
									                        		<h5 class="mt-3">${fn: replace(board.boardContent, replaceChar, "</br>") }</h5>
																	<c:forEach var="file" items="${board.bfileList}">
																		<div class="mt-5" style="width:300px; height:200px;">
																			<img src='<c:url value="/board/file/${file.fileId}"/>' class="img-thumbnail" style="width:100%;">
																		</div>
																	</c:forEach>						
									                        </td>
								                      </tr>
							                       	  <tr>
							                       	  		<td>
																	<!-- 수정 / 삭제  / 돌아가기 -->
																	<div class="d-flex justify-content-end">
																		<a class="btn btn-sm mx-1 h6" href="${pageContext.request.contextPath}/board/update/${board.boardId}" style="background-color: MediumSeaGreen;">수정</a>
																		<a class="btn btn-sm mx-1 h6" href="${pageContext.request.contextPath}/board/delete/${board.boardId}" style="background-color: MediumSeaGreen;">삭제</a>
																		<a class="btn btn-sm mx-1 h6" href="${pageContext.request.contextPath}/board/list" style=" background-color:MediumSeaGreen;">목록으로</a>			                        
																	</div>
																	<!-- 댓글개수 / 댓글작성창 -->
																	<div class="d-flex align-items-center mt-5 mb-3 ml-2">
																		<span class="mr-4 mb-0 h3 text-muted" >댓글 <small class="text-primary">${fn:length(board.replyList)}</small></span>
																		<form action="<c:url value='/board/reply/insert'/>" method=post class="d-flex">
														      				<label class="font-weight-bold" for="replyContent"></label>
														      				<input type="text" class="form-control" placeholder="댓글을 입력해주세요" id="replyContent" name="replyContent" style="width:400px; padding: 12px 25px; font-size: 15px;"/>
																			<input type="hidden" name="boardId" value="${board.boardId}">
																			<button type="submit" class="btn btn-sm" style="background-color:#F96332; position:relative; left:-30px; height:45px; border-radius: 0px 30px 30px 0px / 0px 30px 30px 0px;"><b>작성</b></button>
																		</form>
																	</div> 
																	<table id="replyListTable" class="table" style='width:800px;'>
																			<!-- 작성된 댓글이 있을 경우  -->
																			<c:if test="${!empty board.replyList}">
																				<c:forEach var="reply" items="${board.replyList}">
																					<tr>
																						<td>
																							<div id="replyOne${reply.replyId}">
																								<div class="d-flex justify-content-between">
																									<div class="mx-2">
																										<i class="bi bi-person-fill"></i>
																										<strong>${reply.studentId}</strong> &nbsp;
																										<small class="bg-warning rounded text-white">&nbsp;${reply.calculateTime}&nbsp;</small>
																									</div>
																									<ul class="navbar-nav">
																						              <li class="nav-item dropdown" style="width: 30px; height: 30px;">
																							                <a class="nav-link" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
																								                  	<i class="bi bi-three-dots-vertical"></i>
																							                </a>
																							                <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
																								                  <a class="dropdown-item" onclick="updateReplyInput(${reply.replyId})"><i class="now-ui-icons design-2_ruler-pencil">&nbsp;수정</i></a>
																								                  <a class="dropdown-item" onclick="deleteReplyFun(${reply.replyId})"><i class="now-ui-icons ui-1_simple-remove">&nbsp;삭제</i></a>
																							                </div>
																						              </li>
																								</ul>
																								</div>
																								<div class="ml-3 my-2" style="font-size: 15px;">${reply.replyContent}</div>
																								<!-- 답글 작성 -->
																								<div class="accordion" id="accordionExample" style="width:500px;">
																									<div id="accordionDiv" class="accordion-item" style="border: 0px">
																										<h2 class="accordion-header" id="headingOne" >
																											<button id="accordionbtn${reply.replyId}" class="btn btn-sm collapsed ml-3" type="button" data-bs-toggle="collapse"
																												    data-bs-target="#replyListOpen${reply.replyId}" aria-expanded="true" aria-controls="replyListOpen${reply.replyId}" 
																												    onclick="replyInputBox(${reply.replyId})" style="background-color:WhiteSmoke; color:SlateGray ; box-shadow: none; font-size: 13px; border-radius: 30px;">
																												    <i class="bi bi-caret-down-fill">답글</i>
																										    </button>
																										</h2>
																									</div>
																									<div id="replyListOpen${reply.replyId}" class="accordion-collapse collapse" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
																										<div class="accordion-body">
																											<!-- 답글작성창  -->
																											<form id="writeReReplyForm" name="writeReReplyForm" class="d-flex">
																							      				<label class="font-weight-bold" for="writeReReply${reply.replyId}"></label>
																							      				<input type="text" class="form-control" placeholder="답글을 입력해주세요" id="writeReReply${reply.replyId}" name="writeReReply${reply.replyId}" style="width:400px; padding: 12px 25px; font-size: 15px;"/>
																												<button type="button" onclick="writeReReplyFun(${reply.replyId}, ${reply.boardId}, '${reply.studentId}')"  class="btn btn-sm" style="background-color:#F96332; position:relative; left:-30px; height:45px; border-radius: 0px 30px 30px 0px / 0px 30px 30px 0px;"><b>작성</b></button>
																											</form>
																											<!-- 답글 목록 -->
																											<div id="reReplyListDiv${reply.replyId}"></div>
																											<!-- 작성한 답글추가 -->
																											<div id="reReplyWriteDiv${reply.replyId}"></div>
																										</div>
																									</div>
																								</div>
																							</div>
																						</td>
																					</tr>
																				</c:forEach>
																			</c:if>
																			<c:if test="${empty board.replyList}">
																				<tr>
																					<td>
																						작성된 댓글이 없습니다.
																					</td>
																				</tr>
																			</c:if>
																		</tbody>
																	</table>
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