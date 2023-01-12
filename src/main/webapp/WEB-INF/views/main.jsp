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
			<video autoplay loop controls muted style="width: 100%; height:100%;">
				<source src="<c:url value='/video/school.mp4'/>" type="video/mp4">
			</video>
			<div class="content" >
				<div class="row">
					<div class="card mx-auto p-3" style="width:70%;">
						<div class="card-header d-flex justify-content-between" >
							<p class="bi bi-calendar-check m-2" style="font-size: 30px;">
								&nbsp;<%=sf.format(nowTime)%>
							</p>
							<div >
								<c:if test="${empty attendVO.inTime && isManager == 'N'.charAt(0)}">
									<a style="none;" href='<c:url value="/attend/in"/>'>출근</a>
								</c:if>
								<c:if test="${!empty attendVO.inTime && empty attendVO.outTime && isManager == 'N'.charAt(0)}">
									<a style="none;" href='<c:url value="/attend/out"/>'>퇴근</a>
								</c:if>
								<c:if test="${!empty attendVO.inTime && !empty attendVO.outTime }" />
							</div>
						</div>
						<div class="card-body ">
							<c:if test="${isManager == 'N'.charAt(0)}">
								<div class="content">
									<div class="row">
										<div class="col-1"></div>
										<div class="col" style="font-size: 25px;">
											<div class="m-1">
												<i class="bi bi-alarm mb-1" ></i>&nbsp;&nbsp;IN
											</div>
											<div class="m-1 pl-3">
												<fmt:formatDate pattern="hh:mm:ss" value="${attendVO.inTime}" />
											</div>
										</div>
										<div class="col-1"></div>
										<div class="col" style="font-size: 25px;">
											<div class="m-1">
												<i class="bi bi-alarm mb-1"></i>&nbsp;&nbsp;OUT
											</div>
											<div class="m-1">
												<fmt:formatDate pattern="hh:mm:ss" value="${attendVO.outTime}" />
											</div>
										</div>
										<div class="col-1"></div>
									</div>
								</div>
							</c:if>
							<c:if test="${isManager == 'Y'.charAt(0)}">
								<p>당신은 관리자 입니다.</p>
							</c:if>
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