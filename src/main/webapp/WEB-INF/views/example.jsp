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
			<div class="parallax-window" data-parallax="scroll" data-image-src="img/dream-pulse-header.jpg">
				<div class="tm-section-wrap">
					<section id="intro" class="tm-section">
						<div class="tm-bg-white-transparent tm-intro">
							<h2 class="tm-section-title mb-5 text-uppercase tm-color-primary">
								Introducing Dream Pulse</h2>
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