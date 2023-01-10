<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%
	Date nowTime = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyy년 MM월 dd일 ");
%>
<fmt:setBundle basename="i18n/board" />

<!DOCTYPE html>
<html>
<jsp:include page="/WEB-INF/views/include/staticFiles.jsp" />
<jsp:include page="/WEB-INF/views/include/header.jsp" />
<body>
	<div class="wrapper">
		<jsp:include page="/WEB-INF/views/include/list.jsp" />
		<div class="main-panel" id="main-panel">


			<div class="panel-header panel-header-lg">
				<video autoplay loop controls muted style="whidth: 100%">
					<source src="<c:url value='/video/school.mp4'/>" type="video/mp4">
				</video>
			</div>
			<div class="content">
				<div class="row">
					<div class="card mx-auto" style="width: 70%;">
						<div class="card-header">
							<p class="bi bi-calendar-check m-2">
								&nbsp;&nbsp;&nbsp;<%=sf.format(nowTime)%>
							</p>
						</div>
						<div class="card-body ">
							<div class="content">
								<div class="row">
									<p>
										<i class="bi bi-alarm mb-1"></i>&nbsp;&nbsp;IN
									</p>
									<p class="bi bi-alarm mt-1">
										<fmt:formatDate pattern="hh:mm:ss" value="${attendVO.inTime}" />
									</p>
								</div>
								<div class="row">
									<p class="bi bi-alarm mb-1">&nbsp;&nbsp;OUT</p>
									<p class="bi bi-alarm mt-1">
										<fmt:formatDate pattern="hh:mm:ss" value="${attendVO.outTime}" />
									</p>
								</div>
								<div class="row">
									<c:if test="${empty attendVO.inTime}">
										<a href='<c:url value="/attend/in"/>'>출근</a>
									</c:if>
									<c:if
										test="${!empty attendVO.inTime && empty attendVO.outTime}">
										<a href='<c:url value="/attend/out"/>'>퇴근</a>
									</c:if>
									<c:if
										test="${!empty attendVO.inTime && !empty attendVO.outTime }" />
								</div>
							</div>
						</div>
					</div>

				</div>
			</div>
			<jsp:include page="/WEB-INF/views/include/footer.jsp" />
		</div>
	</div>

	<jsp:include page="/WEB-INF/views/include/staticFiles.jsp" />
	</body>
</html>