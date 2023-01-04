<%@page import="com.coderby.myapp.classes.service.StudentService"%>
<%@page import="java.util.List"%>
<%@page import="com.coderby.myapp.classes.model.StudentVO"%>
<%@page import="com.coderby.myapp.classes.service.IStudentService"%>
<%@page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="org.springframework.web.context.WebApplicationContext"%>
<%@page contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<fmt:setBundle basename="i18n/header" />

	<div class="container-fluid">
		<div class="row">
			
			<!-- 사이드바 -->
			<nav id="tmSidebar" class="tm-bg-black-transparent tm-sidebar">
				<button class="navbar-toggler" type="button" aria-label="Toggle navigation">
				<i class="fas fa-bars"></i>
				</button>
				<div class="tm-sidebar-sticky">
					<div class="tm-brand-box">
						<div class="tm-double-border-1">
							<div class="tm-double-border-2">
								<img src="img/logo3.png" style="width:100%; heigth:100%">
							</div>
						</div>
					</div>
					
					<c:if test="${not empty sessionScope.stdId}">
					<ul id="tmMainNav" class="nav flex-column text-uppercase text-right tm-main-nav">
						<li class="nav-item">
							<a href='<c:url value="/attend/today"/>'class="nav-link"> 
								<span class="d-inline-block mr-3">출결</span> 
								<span class="d-inline-block tm-white-rect"></span>
							</a>
						</li>
						<li class="nav-item">
							<a href='<c:url value="/student/logout"/>' class="nav-link"> 
								<span class="d-inline-block mr-3">로그아웃</span> 
								<span class="d-inline-block tm-white-rect"></span>
							</a>
						</li>
					</ul>
					</c:if>
					<ul class="nav flex-row tm-social-links">
						<li class="nav-item">
							<a href="https://facebook.com" class="nav-link tm-social-link"> 
								<i class="fab fa-facebook-f"></i>
							</a>
						</li>
						<li class="nav-item">
							<a href="https://twitter.com" class="nav-link tm-social-link"> 
								<i class="fab fa-twitter"></i>
							</a>
						</li>
						<li class="nav-item">
							<a href="https://dribbble.com" class="nav-link tm-social-link">
								 <i class="fab fa-dribbble"></i>
							</a>
						</li>
						<li class="nav-item">
							<a href="https://linkedin.com" class="nav-link tm-social-link"> 
								<i class="fab fa-linkedin-in"></i>
							</a>
						</li>
					</ul>
					<footer class="text-center text-white small">
						<p class="mb--0 mb-2">2023 오티아이 SpringProject </p>
					</footer>
				</div>
			</nav>