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
	    width: 105px;
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
									게시글 작성
									<i class="bi bi-pencil"></i>
								</h4>
							</div>
							<div class="card-body" >
								<div class="container">
									<form action="<c:url value='/board/insert'/>" onsubmit="return check()" method=post enctype="multipart/form-data">
										<label for="categoryType" style="font-size: 17px;">카테고리:</label>
										<select id="categoryType" class="form-select" name="boardCategory">
										    <option value="all">--전체--</option>
										    <option value="질문">질문</option>
										    <option value="자유주제">자유주제</option>
										    <option value="스터디">스터디</option>
									  	</select>
										<div style="font-size: 25px;">
							    			<label class="mt-4" for="boardTitle" class="form-label" style="font-size: 17px;">제목:</label>
							   				<input type="text" class="form-control" id="boardTitle" placeholder="제목을 입력하세요" name="boardTitle">
									
											<label class="mt-4" for="boardContent" style="font-size: 17px;">내용:</label>
											<textarea class="form-control" rows="5" id="boardContent" name="boardContent"></textarea>
											
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


