<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setBundle basename="i18n/board"/>
<!DOCTYPE html>
<html>
	<jsp:include page="/WEB-INF/views/include/staticFiles.jsp"/>
	<body>
	<div id="bannerDiv" >
		<div id="bannerImg"></div>
		<div id="bannerBottom"></div>
	</div>
	
	<jsp:include page="/WEB-INF/views/include/header.jsp"/>

		<div class="tm-section-wrap2 bg-white ">
			<div class="container-fluid row">
				<div class="col-2"></div>
				<div class="my-5 ml-5">
					<a class="btn btn-outline-secondary mb-5" href="${pageContext.request.contextPath}/board/insert">게시글작성</a>
					<table>
						<tr>
							<td>게시판 번호</td>
							<td>카테고리</td>
							<td>게시글 제목</td>
							<td>게시글 내용</td>
							<td>작성 날짜</td>
							<td>학생 번호</td>
							<td>클래스 번호</td>
						</tr>
						<c:forEach var="board" items="${boardList}">
							<tr>
								<td><a href="${pageContext.request.contextPath}/board/detail/${board.boardId}">${board.boardId}</a></td>
								<td>${board.boardCategory}</td>
								<td>${board.boardTitle}</td>
								<td>${board.boardContent}</td>
								<td>${board.calculateTime}</td>
								<td>${board.studentId}</td>
								<td>${board.classId}</td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
		</div>

		<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
	</body>
</html>