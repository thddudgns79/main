<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setBundle basename="i18n/board"/>
<!DOCTYPE html>
<html>
	<jsp:include page="/WEB-INF/views/include/staticFiles.jsp"/>
	<body>
	<jsp:include page="/WEB-INF/views/include/header.jsp"/>

		<div role="main" class="ml-sm-auto col-12">
			<div class="parallax-window" data-parallax="scroll" data-image-src='<c:url value="/img/background.png"/>'>
				<div class="tm-section-wrap">
					<section id="intro" class="tm-section">
						<div class="tm-bg-white-transparent tm-intro">
							<h2 class="tm-section-title mb-5 text-uppercase tm-color-primary">
								게시판</h2>
							<p class="tm-color-gray">
								This box alpha 30 percent. Left sidebar is a sticky element. Right side Contents are scrolling up
								and down. This background has a parallax effect.</p>
							<p class="mb-0 tm-color-gray">
								Dream Pulse is a Bootstrap 4.3.1
								template designed for your websites. You can modify this layout
								as you like.</p>
						</div>
					</section>
				</div>
			</div>
		</div>
		
		
		<div class="tm-section-wrap bg-white">
			
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
							<td>${board.createdDate}</td>
							<td>${board.studentId}</td>
							<td>${board.classId}</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>

		<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
	</body>
</html>