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
 	<meta charset="utf-8">
 	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="<c:url value='/js/board.js'/>"></script>
</head>
<body>
	<div class="container">
		<form action="<c:url value='/board/update'/>" method=post enctype="multipart/form-data">
			카테고리:
			<select class="form-select" name="boardCategory">
		    	<c:if test="${board.boardCategory=='qna'}">
			    	<option value="${board.boardCategory}" selected>질문</option>
				    <option value="community">커뮤니티</option>
				    <option value="study">스터디</option>
		    	</c:if>
		    	<c:if test="${board.boardCategory=='community'}">
			    	<option value="${board.boardCategory}" selected>커뮤니티</option>
				    <option value="qna">질문</option>
				    <option value="study">스터디</option>
		    	</c:if>
		    	<c:if test="${board.boardCategory=='study'}">
			    	<option value="${board.boardCategory}" selected>스터디</option>
				    <option value="qna">질문</option>
				    <option value="community">커뮤니티</option>
		    	</c:if>
		  	</select>

			<div>
    			<label for="boardTitle" class="form-label">제목:</label>
   				<input type="text" class="form-control" id="boardTitle" name="boardTitle" placeholder="${board.boardTitle}" >
		
				<label for="boardContent">내용:</label>
				<textarea class="form-control" rows="5" id="boardContent" name="boardContent" placeholder="${board.boardContent}"></textarea>
			
				<div class="my-3">
					<c:if test="${!empty board.bfileList}">
					<div>첨부된 파일: </div>
					<c:forEach var="file" items="${board.bfileList}">
						<span id="bfileImg${file.fileId}" >
							<img src='<c:url value="/board/file/${file.fileId}"/>' class="img-thumbnail" style="position: relative; width:150px; height:150px">
							<a class="btn" onclick="deleteFileFun(${file.fileId})"
								 style="position: relative; left:-50px; bottom: 53px; color: white;">
								<i class="bi bi-x-square" ></i>
							</a>
						</span>
					</c:forEach>
					</c:if>
					<c:if test="${empty board.bfileList}">
						<div class="text-muted">첨부된 파일이 없습니다!</div>
					</c:if>
				</div>	
				<label for="bFile">파일: </label>
				<input type="file" class="form-control"  name="bFile" value="${board.bfileList}" multiple>
  			</div>

			<input type="hidden" name="boardId" value="${board.boardId}">
  			<button type="submit">제출</button>
		</form>
	</div>
</body>
</html>