<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
	Date nowTime = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyy년 MM월 dd일 ");
%>
<fmt:setBundle basename="i18n/board"/>
<!DOCTYPE html>
<html>
	<jsp:include page="/WEB-INF/views/include/staticFiles.jsp"/>
	<body>
	<jsp:include page="/WEB-INF/views/include/header.jsp"/>

		<div role="main" class="ml-sm-auto col-12">
			<div class="parallax-window" data-parallax="scroll" data-image-src='<c:url value="/img/background.png"/>'>
				<div class="tm-section-wrap" >
					<section id="intro" class="tm-section">
						<div class="tm-section" style="background:white; color:black; width:50%; height: 300px;">
						
						
							<ul class="list-group" style="list-style: none;">
								<li  class="bi bi-calendar-check m-2" style="font-size:35px;">&nbsp;&nbsp;&nbsp;<%= sf.format(nowTime) %>	</li>
								<li> &nbsp;</li>
								<li class="bi bi-alarm mb-1" style="font-size:30px;">&nbsp;&nbsp;IN</li>
								<li class="bi bi-alarm mt-1" style="font-size:30px;">&nbsp;&nbsp;OUT</li>
							</ul>
							<ul class="list-group" style="list-style: none;">
								<li class="m-2"style="font-size:35px;"> &nbsp;</li>
								<li> &nbsp;</li>
								<li class="mb-1" style="font-size:30px;">
									<fmt:formatDate pattern="hh:mm:ss" value="${attendVO.inTime}" />
								</li>
								<li class="mt-1" style="font-size:30px;">
									<fmt:formatDate pattern="hh:mm:ss" value="${attendVO.inTime}" />
								</li>
							</ul>
							<c:if test="${empty attendVO.inTime}">
								<a href='<c:url value="/attend/in"/>'>출근</a>
							</c:if>
							<c:if test="${!empty attendVO.inTime && empty attendVO.outTime}" >
								<a href='<c:url value="/attend/out"/>'>퇴근</a>
							</c:if>
							<c:if test="${!empty attendVO.inTime && !empty attendVO.outTime }">
								
							</c:if>
							
						</div>
					</section>
				</div>
			</div>
		</div>
		
		
		<!-- 
		<div class="tm-section-wrap bg-white">
			<section id="about" class="row tm-section">
				<div class="col-xl-6">
					<div class="tm-section-half">
						<div>
							<i class="fas fa-6x fa-balance-scale mb-5 tm-section-icon"></i>
						</div>
						<h2 class="tm-section-title tm-color-primary mb-5">About Us</h2>
						<p class="mb-5">
							When first section is scrolled up, BG image will
							be disappeared with a parallax effect. Donec ac tempor tellus, a
							eleifend ligula. Fusce vitae sem sed purus euismod condimentum.
						</p>
						<p>Sed at orci non metus tristique suscipit vitae in nibh. Sed
							rutrum odio ac est hendrerit, at vestibulum felis condimentum.
						</p>
					</div>
				</div>
				<div class="col-xl-6">
					<div class="tm-section-half">
						<div>
							<i class="far fa-6x fa-building mb-5 tm-section-icon"></i>
						</div>
						<h2 class="tm-section-title tm-color-primary mb-5">
							Company Profile
						</h2>
						<p class="mb-5">
							You can use this template for your commercial
							websites or for your clients. You are NOT allowed to re-post this
							template as a downloadable ZIP file on your template collection
							sites. It is illegal.
						</p>
						<p>Suspendisse fermentum orci eget lorem euismod suscipit. Morbi
							condimentum odio metus, at finibus dolor sollicitudin quis.
							Curabitur eu congue erat.
						</p>
					</div>
				</div>
			</section>
		</div>  -->

		<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
	</body>
</html>
