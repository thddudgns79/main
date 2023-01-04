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
	
	<%-- <table>
		<tr>
			<td>섹션 번호</td>
			<td>섹션명</td>
		</tr>
		<c:forEach var="section" items="${sectionList}">
			<tr>
				<td>${section.sectionId}</td>
				<td>${section.sectionTitle}</td>
				<td><a href='<c:url value="/class/sectiondelete/${section.sectionId}"/>'>섹션 삭제</a></td>
				<td>
					<form action='<c:url value="/class/sectionupdate"/>' method="post">
						<input type="hidden" name="sectionId" value="${section.sectionId}"/>
						<input type="text" name="sectionTitle"/>
						<input type="submit" value="섹션 수정"/>
					</form>
				</td>
			</tr>
		</c:forEach>
			<tr>
				<td>
					<form action='<c:url value="/class/sectioninsert"/>' method="post">
						<input type="text" name="sectionTitle"/>
						<input type="submit" value="섹션 추가"/>
					</form>
				</td>
			</tr>
	</table> --%>
	
	<!-- <script>
		$(".fileListEventInvoker").click(getFileList);
		function getFileList() {
			var box = $(event.target);
			var sectionId = box.prev().text();
			console.log(sectionId);
			$.ajax({
				url: "${pageContext.request.contextPath}/class/filelist/" + sectionId,
				type: "get",
				success: function(data) {
					console.log(data);
					box.html(data);
				}
			});
		}
	</script> -->
</body>
</html>