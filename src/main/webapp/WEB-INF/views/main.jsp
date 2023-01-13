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
					<div class="card mx-auto" style="width:70%; height: 270px; background-color: #EEEEEE;">
						<div class="card-header d-flex justify-content-between align-items-center" >
							<p class="font-weight-bold m-3" style="font-size: 30px;">
								<!-- 아이콘 -->
								<img src="<c:url value='/img/calendar.png'/>" width="80">
								<!-- yyyy-MM-dd  -->
								&nbsp;<%=sf.format(nowTime)%>
								<!-- 요일 -->
								<c:set var="now" value="<%=new java.util.Date() %>"/>
								<fmt:formatDate value="${now}" pattern="E" var="today" />
								(${today})
							</p>
							<div >
								<c:if test="${empty attendVO.inTime && isManager == 'N'.charAt(0)}">
									<a class="btn btn-lg mr-3" href='<c:url value="/attend/in"/>' style="background-color: #F96332; color:white;">출근</a>
								</c:if>
								<c:if test="${!empty attendVO.inTime && empty attendVO.outTime && isManager == 'N'.charAt(0)}">
									<a class="btn btn-lg mr-3" href='<c:url value="/attend/out"/>' style="background-color: #F96332; color:white;">퇴근</a>
								</c:if>
								<c:if test="${!empty attendVO.inTime && !empty attendVO.outTime }" />
							</div>
						</div>
						<div class="card-body p-0 pt-2">
							<c:if test="${isManager == 'N'.charAt(0)}">
								<div class="content">
									<div class="row d-flex justify-content-around">
										<div class="col-5 p-2" style="height:120px; font-size: 25px; background-color: white; border-radius: 6px; box-shadow: 0px 6px 10px 0px rgb(31 41 55 / 14%);">
											<div style="color:#F96332;">
												<i class="bi bi-stopwatch ml-2"></i>&nbsp;IN
											</div>
											<div class="d-flex justify-content-center" style="font-size: 35px;">
												<span class="font-weight-bold text-muted">
													<fmt:formatDate pattern="hh:mm:ss" value="${attendVO.inTime}" />
												</span>
											</div>
										</div>
										<div class="col-5 p-2" style="height:120px; font-size: 25px; background-color: white; border-radius: 6px; box-shadow: 0px 6px 10px 0px rgb(31 41 55 / 14%);">
											<div style="color:#F96332;">
												<i class="bi bi-stopwatch-fill ml-2"></i>&nbsp;OUT
											</div>
											<div class="d-flex justify-content-center" style="font-size: 35px;">
												<span class="font-weight-bold text-muted">
													<fmt:formatDate pattern="hh:mm:ss" value="${attendVO.outTime}" />
												</span>
											</div>
										</div>
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