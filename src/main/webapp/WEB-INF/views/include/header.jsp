<%@page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="org.springframework.web.context.WebApplicationContext"%>
<%@page contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setBundle basename="i18n/header" />

<head>
  <meta charset="utf-8" />
  <link rel="apple-touch-icon" sizes="76x76" href="<c:url value='/img/apple-icon.png'/>">
  <link rel="icon" type="image/png" href="<c:url value='/img/favicon.png'/>">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <title>
    Song Young HighSchool
  </title>
  <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
  <!--     Fonts and icons     -->
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.1/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
  <!-- CSS Files -->
  <link href="<c:url value='/css/bootstrap.min.css'/>" rel="stylesheet" />
  <link href="<c:url value='/css/now-ui-dashboard.css?v=1.5.0'/>" rel="stylesheet" />
  <!-- CSS Just for demo purpose, don't include it in your project -->
  <link href="<c:url value='/demo/demo.css'/>" rel="stylesheet" />
</head>


<!-- 	<div class="container-fluid"> -->
<!-- 		<div class="row"> -->
			
<!-- 			<!-- 사이드바 --> 
<!-- 			<nav id="tmSidebar" class="tm-bg-black-transparent tm-sidebar"> -->
<!-- 				<button class="navbar-toggler" type="button" aria-label="Toggle navigation"> -->
<!-- 				<i class="fas fa-bars"></i> -->
<!-- 				</button> -->
<!-- 				<div class="tm-sidebar-sticky"> -->
<!-- 					<div class="tm-brand-box"> -->
<!-- 						<div class="tm-double-border-1"> -->
<!-- 							<div class="tm-double-border-2"> -->
<%-- 								<img src='<c:url value="/img/songyoung.png"/>' style="width:70%; heigth:70%; padding: 5px 5px;"> --%>
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
					
<<<<<<< HEAD
<%-- 					<c:if test="${not empty sessionScope.stdId}"> --%>
<!-- 					<ul id="tmMainNav" class="nav flex-column text-uppercase text-right tm-main-nav"> -->
<!-- 						<li class="nav-item"> -->
<%-- 							<a href='<c:url value="/attend/today"/>'class="nav-link">  --%>
<!-- 								<span class="d-inline-block mr-3">출결</span>  -->
<!-- 								<span class="d-inline-block tm-white-rect"></span> -->
<!-- 							</a> -->
<!-- 						</li> -->
<!-- 						<li class="nav-item"> -->
<%-- 							<a href='<c:url value="/student/logout"/>' class="nav-link">  --%>
<!-- 								<span class="d-inline-block mr-3">로그아웃</span>  -->
<!-- 								<span class="d-inline-block tm-white-rect"></span> -->
<!-- 							</a> -->
<!-- 						</li> -->
<!-- 					</ul> -->
<%-- 					</c:if> --%>
<!-- 					<ul class="nav flex-row tm-social-links"> -->
<!-- 						<li class="nav-item"> -->
<!-- 							<a href="https://facebook.com" class="nav-link tm-social-link">  -->
<!-- 								<i class="fab fa-facebook-f"></i> -->
<!-- 							</a> -->
<!-- 						</li> -->
<!-- 						<li class="nav-item"> -->
<!-- 							<a href="https://twitter.com" class="nav-link tm-social-link">  -->
<!-- 								<i class="fab fa-twitter"></i> -->
<!-- 							</a> -->
<!-- 						</li> -->
<!-- 						<li class="nav-item"> -->
<!-- 							<a href="https://dribbble.com" class="nav-link tm-social-link"> -->
<!-- 								 <i class="fab fa-dribbble"></i> -->
<!-- 							</a> -->
<!-- 						</li> -->
<!-- 						<li class="nav-item"> -->
<!-- 							<a href="https://linkedin.com" class="nav-link tm-social-link">  -->
<!-- 								<i class="fab fa-linkedin-in"></i> -->
<!-- 							</a> -->
<!-- 						</li> -->
<!-- 					</ul> -->
<!-- 					<footer class="text-center text-white small"> -->
<!-- 						<p class="mb--0 mb-2">2023 오티아이 SpringProject </p> -->
<!-- 					</footer> -->
<!-- 				</div> -->
<!-- 			</nav> -->
=======
					<c:if test="${not empty sessionScope.stdId}">
					<ul id="tmMainNav" class="nav flex-column text-uppercase text-right tm-main-nav">
						<li class="nav-item">
							<a href='<c:url value="/attend/today"/>'class="nav-link"> 
								<span class="d-inline-block mr-3">출결</span> 
								<span class="d-inline-block tm-white-rect"></span>
							</a>
						</li>
						<li class="nav-item">
							<a href='<c:url value="/attend/getStudentAttend/${stdId}"/>' class="nav-link"> 
								<span class="d-inline-block mr-3">출결LIST</span> 
								<span class="d-inline-block tm-white-rect"></span>
							</a>
						</li>
						<li class="nav-item">
							<a href='<c:url value="/attend/studentreportslist"/>' class="nav-link"> 
								<span class="d-inline-block mr-3">휴가LIST</span> 
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
						<p class="mb-2">2023 오티아이 SpringProject </p>
					</footer>
				</div>
			</nav>
>>>>>>> branch 'master' of https://github.com/oti-project3/main.git
