<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:setBundle basename="i18n/board" />

<!DOCTYPE html>
<html>
<jsp:include page="/WEB-INF/views/include/header.jsp" />

<body>
	<div class="wrapper ">
		<jsp:include page="/WEB-INF/views/include/list.jsp" />
		<div class="main-panel" id="main-panel">
		
			
			<div class="panel-header panel-header-lg">
				<video  autoplay loop controls muted>
					<source src="<c:url value='/video/school.mp4'/>" typd="video/mp4">
				</video>
			</div>
			<div class="content">
				<div class="row">
					<div class="card card-chart" >
						<div class="card-header">
							<h5 class="card-category">Global Sales</h5>
							<h4 class="card-title">Shipped Products</h4>
							<div class="dropdown">
								<button type="button"
									class="btn btn-round btn-outline-default dropdown-toggle btn-simple btn-icon no-caret"
									data-toggle="dropdown">
									<i class="now-ui-icons loader_gear"></i>
								</button>
								<div class="dropdown-menu dropdown-menu-right">
									<a class="dropdown-item" href="#">Action</a> <a
										class="dropdown-item" href="#">Another action</a> <a
										class="dropdown-item" href="#">Something else here</a> <a
										class="dropdown-item text-danger" href="#">Remove Data</a>
								</div>
							</div>
						</div>
						<div class="card-body">
							<div class="chart-area">
								<canvas id="lineChartExample"></canvas>
							</div>
						</div>
						<div class="card-footer">
							<div class="stats">
								<i class="now-ui-icons arrows-1_refresh-69"></i> Just Updated
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