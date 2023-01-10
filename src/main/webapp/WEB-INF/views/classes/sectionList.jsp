<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setBundle basename="i18n/board"/>
<!DOCTYPE html>
<html>
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  	<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
  	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

	<jsp:include page="/WEB-INF/views/include/staticFiles.jsp"/>
	<body>
	<jsp:include page="/WEB-INF/views/include/header.jsp"/>
			<div class="accordion" id="accordionPanelsStayOpenExample">
			<div class="row">
				<c:forEach var="section" items="${sectionList}" varStatus="status">
					<div class="accordion-item mt-5 container-fluid" style="width:50%; margin-left:350px">
						<h2 class="accordion-header row" id="panelsStayOpen-headingOne">
							<div class="col-10 p-2">
								<form class="sectionTitleUpdateForm" action='<c:url value="/class/sectionupdatetitle"/>' 
								method="post" class="sectionTitleUpdateForm" style="font-size:20px">
									<span class="mr-3">섹션 ${status.index}.</span>
									<input type="text" name="sectionTitle" style="border:none; background: transparent;" 
										value="${section.sectionTitle}" <c:if test="${isManager == 'N'.charAt(0)}"> disabled="disabled"</c:if>/>
									<input type="hidden" name="sectionId" value="${section.sectionId}"/>
									<c:if test="${isManager == 'Y'.charAt(0)}">
										<input type="submit" class="btn btn-sm btn-info" value="수정"/>
										<a href='<c:url value="/class/sectiondelete/${section.sectionId}"/>' 
											class="btn btn-sm btn-info">
											삭제
										</a>
									</c:if>
								</form>
							</div> 
							<button class="accordion-button col-2" type="button" data-bs-toggle="collapse" 
								data-bs-target="#panelsStayOpen-collapse${status.index}"
								aria-expanded="true" aria-controls="panelsStayOpen-collapseOne"
								style="width:100px"> 
							</button>
						</h2>
						<div id="panelsStayOpen-collapse${status.index}" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingOne">
							<div class="accordion-body">
								<form action='<c:url value="/class/sectionupdatedescription"/>' method="post">
									<input type="hidden" name="sectionId" value="${section.sectionId}"/>
									<textarea rows="4" cols="50" name="sectionDescription" value="${section.sectionDescription}" 
										<c:if test="${isManager == 'N'.charAt(0)}"> disabled="disabled"</c:if>>
										${section.sectionDescription}
									</textarea>
									<c:if test="${isManager == 'Y'.charAt(0)}">
										<input type="submit" class="btn btn-sm btn-info" value="수정"/>
									</c:if>
								</form>
								<c:forEach var="file" items="${section.fileList}">
									<div class = "fileList">
										<a href='<c:url value="/class/filedownload/${file.fileId}"/>'>
											${file.fileName}
										</a>
										<c:if test="${isManager == 'Y'.charAt(0)}">
											<a href='<c:url value="/class/filedelete/${file.fileId}"/>' class="ml-3 btn btn-sm btn-info">
												삭제
											</a>
										</c:if>
									</div>
								</c:forEach>
								<c:if test="${isManager == 'Y'.charAt(0)}">
									<form action='<c:url value="/class/fileupload"/>' method="post" enctype="multipart/form-data">
										<input type="hidden" name="sectionId" value="${section.sectionId}"/>
										<input type="file" name="file"/>
										<input type="submit" value="전송" class="btn btn-sm btn-info"/>
									</form>
								</c:if>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
		<c:if test="${isManager == 'Y'.charAt(0)}">
			<form action='<c:url value="/class/sectioninsert"/>' method="post">
				<input type="text" name="sectionTitle"/>
				<input type="text" name="sectionDescription" placeholder="섹션 설명글 작성"/>
				<input type="submit" value="섹션 추가"/>
			</form>
		</c:if>

		<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
	</body>
</html>





