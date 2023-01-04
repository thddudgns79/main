<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
</head>

<body>
	<!-- 섹션추가,수정 중복 타이틀 검색 시 나오는 모달 -->
	<div class="modal">
	</div>
		<div>
			<div class = "container-fluid">
				<c:forEach var="section" items="${sectionList}">
					<!-- section -->
					<div class = "row">
						<div class="col-1">${section.sectionId}</div>
						<div class="col-5">
							<form action='<c:url value="/class/sectionupdatetitle"/>' method="post">
								<input type="hidden" name="sectionId" value="${section.sectionId}"/>
								<input type="text" name="sectionTitle" value="${section.sectionTitle}"/>
								<input type="submit" value="적용"/>
							</form>
						</div>
						<div class="col-1"><a href='<c:url value="/class/sectiondelete/${section.sectionId}"/>'>섹션 삭제</a></div>
						<div class="col-5">
						</div>
					</div>
					<div class="row">
						<form action='<c:url value="/class/sectionupdatedescription"/>' method="post">
							<input type="hidden" name="sectionId" value="${section.sectionId}"/>
							<input type="text" name="sectionDescription" value="${section.sectionDescription}"/>
							<input type="submit" value="적용"/>
						</form>
					</div>
					<c:forEach var="file" items="${section.fileList}">
						<div class = "row fileList">
							<div class="col-9"><a href='<c:url value="/class/filedownload/${file.fileId}"/>'>${file.fileName}</a></div>
							<div class="col-3"><a href='<c:url value="/class/filedelete/${file.fileId}"/>'>파일 삭제</a></div>
						</div>
					</c:forEach>
					<div class="row">
						<div>
							<form action='<c:url value="/class/fileupload"/>' method="post" enctype="multipart/form-data">
								<input type="hidden" name="sectionId" value="${section.sectionId}"/>
								파일 선택 : <input type="file" name="file" />
								<input type="submit" value="전송"/>
							</form>
						</div>
					</div>
				</c:forEach>
			</div>
		<div>
		<form action='<c:url value="/class/sectioninsert"/>' method="post">
			<input type="text" name="sectionTitle"/>
			<input type="text" name="sectionDescription" placeholder="섹션 설명글 작성"/>
			<input type="submit" value="섹션 추가"/>
		</form>
	</div>
</div>
</body>
</html>