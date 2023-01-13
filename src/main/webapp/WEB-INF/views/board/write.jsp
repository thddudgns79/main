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

<!-- 셀렉트class 스타일 -->
<style>
	#categoryType {
	    display: block;
	    padding: 0.375rem 2.25rem 0.375rem 0.75rem;
	    -moz-padding-start: calc(0.75rem - 3px);
	    /* font-size: 1rem; */
	    font-weight: 400;
	    line-height: 1.5;
	    /* color: #212529; */
	    background-color: #fff;
	    background-image: url(data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 16 16'%3e%3cpath fill='none' stroke='%23343a40' stroke-linecap='round' stroke-linejoin='round' stroke-width='2' d='M2 5l6 6 6-6'/%3e%3c/svg%3e);
	    background-repeat: no-repeat;
	    background-position: right 0.75rem center;
	    background-size: 16px 12px;
	    border: 1px solid #ced4da;
	    border-radius: 0.25rem;
	    transition: border-color .15s ease-in-out,box-shadow .15s ease-in-out;
	    -webkit-appearance: none;
	    -moz-appearance: none;
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
					<div class="col-md-12">
						<div class="card" style="padding-bottom:50px;">
							<div class="card-header">
								<h4 class="card-title" style="font-size:35px;">게시글 작성</h4>
							</div>
							<div class="card-body" >
								<div class="container">
									<form action="<c:url value='/board/insert'/>" onsubmit="return check()" method=post enctype="multipart/form-data">
										카테고리:
										<select id="categoryType" class="form-select" name="boardCategory">
										    <option value="all">--전체--</option>
										    <option value="qna">질문</option>
										    <option value="everything">자유주제</option>
										    <option value="study">스터디</option>
									  	</select>
										<div>
							    			<label for="boardTitle" class="form-label">제목:</label>
							   				<input type="text" class="form-control" id="boardTitle" placeholder="제목을 입력하세요" name="boardTitle">
									
											<label for="boardContent">내용:</label>
											<textarea class="form-control" rows="5" id="boardContent" name="boardContent"></textarea>
											
											<label for="bFile">파일: </label>
											<input type="file" class="form-control" id="bFile" name="bFile" multiple>
							  			</div>
							  			<button type="submit">제출</button>
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


