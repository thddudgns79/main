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
						
							<!-- 로그인 form -->
							<div class="container">
								<div class="pg-opt">
									<div class="row">
										<div class="col-md-6">
											<c:if test="${empty sessionScope.stdId}">
												<h2 style="color:black;">로그인</h2>
											</c:if>
											<c:if test="${!empty sessionScope.stdId}">
												<h3 style="color:black;">환영합니다.</h3>
											</c:if>
										</div>
									</div>
								</div>
								<div class="content">
									<c:if test="${empty sessionScope.stdId}">
										<form action="<c:url value='/attend'/>" method="post" class="form-horizontal">
											<div class="form-group">
												<label class="control-label col-sm-2" for="id" style="color:black;">ID</label>
												<div class="col-sm-8">
													<input type="text" name="stdId" id="id" class="form-control" placeholder="ID" aria-describedby="basic-addon1">
												</div>
											</div>
											<div class="form-group">
												<label class="control-label col-sm-2" for="pw" style="color:black;">PW</label>
												<div class="col-sm-8">
													<input type="password" name="password" id="pw" class="form-control" placeholder="password" aria-describedby="basic-addon1">
												</div>
											</div>
											<div class="form-group">
												<div class="col-sm-8">
													<input type="submit" class="form-control" aria-describedby="basic-addon1">
												</div>
											</div>
										</form>
									</c:if>
								</div>
							</div>
							<!--  -->
					</div>
					</section>
				</div>
			</div>
		</div>
		
		<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
	</body>
</html>