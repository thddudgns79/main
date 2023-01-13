<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:setBundle basename="i18n/board" />

<!DOCTYPE html>
<html>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<jsp:include page="/WEB-INF/views/include/staticFiles.jsp" />
<jsp:include page="/WEB-INF/views/include/header.jsp" />
<script src="<c:url value='/js/board.js'/>"></script> 

<!-- 셀렉트태그 스타일 -->
<style>
	#categoryType {
	    display: block;
	    width: 120px;
	    padding: 0.375rem 2.25rem 0.375rem 0.75rem;
	    font-size: 15px;
	    color: grey;
	    line-height: 1.5;
	   	color: black;
	    background-color: white;
	    background-repeat: no-repeat;
	    background-position: right 0.75rem center;
	    background-size: 16px 12px;
	    border: 1px solid #E3E3E3;
	    border-radius: 30px;
	    appearance: none;
	}
</style>

<body>
	<div class="wrapper ">
		<jsp:include page="/WEB-INF/views/include/list.jsp" />
		<div class="main-panel" id="main-panel">
			<div class="panel-header panel-header-sm"></div>
			<div class="content " style="padding-bottom: 150px;">
				<div class="row">
					<div class="col-md-12 ml-5">
						<div class="card" style="padding-bottom:50px; width: 1200px;">
							<div class="card-header ml-5">
								<h4 style="font-size: 35px;font-weight: 900;">
									게시글 수정
									<i class="bi bi-pencil-square"></i>
								</h4>
							</div>
							<div class="card-body ml-5" >
								<div class="container">
									<form action="<c:url value='/board/insert'/>" onsubmit="return checkUpdate('${board.boardTitle}', '${board.boardContent}')" method=post enctype="multipart/form-data">
										<label for="categoryType" style="font-size: 17px;">카테고리:</label>
										<select id="categoryType" class="form-select" name="boardCategory">
										    <c:if test="${board.boardCategory=='질문'}">
										    	<option value="${board.boardCategory}" selected>질문</option>
											    <option value="community">커뮤니티</option>
											    <option value="study">스터디</option>
									    	</c:if>
									    	<c:if test="${board.boardCategory=='자유주제'}">
										    	<option value="${board.boardCategory}" selected>자유주제</option>
											    <option value="qna">질문</option>
											    <option value="study">스터디</option>
									    	</c:if>
									    	<c:if test="${board.boardCategory=='스터디'}">
										    	<option value="${board.boardCategory}" selected>스터디</option>
											    <option value="qna">질문</option>
											    <option value="community">커뮤니티</option>
									    	</c:if>
									  	</select>
										<div style="font-size: 25px;">
							    			<label class="mt-4" for="boardTitle" class="form-label" style="font-size: 17px;">제목:</label>
							   				<input type="text" class="form-control" id="boardTitle" placeholder="${board.boardTitle}" name="boardTitle">
									
											<label class="mt-4" for="boardContent" style="font-size: 17px;">내용:</label>
											<textarea class="form-control" rows="5" id="boardContent" placeholder="${board.boardContent}" name="boardContent"></textarea>
											
											<div class="my-3">
												<c:if test="${!empty board.bfileList}">
												<div class="mt-4" style="font-size: 17px; color:#9A9A9A;">첨부된 파일:</div>
												<c:forEach var="file" items="${board.bfileList}">
													<span id="bfileImg${file.fileId}" >
														<img src='<c:url value="/board/file/${file.fileId}"/>' class="img-thumbnail" style="position: relative; width:150px; height:150px">
														<!-- Button trigger modal -->
														<button type="button" class="btn btn-sm" data-bs-toggle="modal" data-bs-target="#deleteFileModal" style="position: relative; left:-50px; bottom: 53px; color: white; background: transparent;">
														  <i class="bi bi-x-square" ></i>
														</button>
													</span>
													<!-- Modal -->
													<div class="modal fade" id="deleteFileModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
													  <div class="modal-dialog">
													    <div class="modal-content">
													      <div class="modal-header">
													        <h1 class="modal-title fs-5" id="exampleModalLabel">삭제하시겠습니까?</h1>
													        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
													      </div>
													      <div class="modal-body text-muted" style="font-size: 15px;">
													        삭제를 원하신다면 '삭제'버튼을 눌러주세요.
													      </div>
													      <div class="modal-footer">
													        <button type="button" class="btn btn-primary btn-sm" onclick="deleteFileFun(${file.fileId})" style="border-radius: 30px;">삭제</button>
													        <button type="button" class="btn btn-secondary btn-sm ml-2" data-bs-dismiss="modal" style="border-radius: 30px;">취소</button>
													      </div>
													    </div>
													  </div>
													</div>
												</c:forEach>
												</c:if>
												<c:if test="${empty board.bfileList}">
													<div class="text-muted">첨부된 파일이 없습니다!</div>
												</c:if>
											</div>
											
											<label class="mt-4"  for="bFile" style="font-size: 17px;">파일: </label>
											<input type="file" class="form-control" id="bFile" name="bFile" multiple>
							  			</div>
							  			<button class="btn btn-lg mt-5" type="submit" style="background-color: #F96332; border-radius: 30px;">제출</button>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div>
				</div>
			</div>
			<jsp:include page="/WEB-INF/views/include/footer.jsp" />
		</div>
	</div>
</body>
</html>


