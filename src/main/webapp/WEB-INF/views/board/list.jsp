<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:setBundle basename="i18n/board" />

<!DOCTYPE html>
<html>
<jsp:include page="/WEB-INF/views/include/staticFiles.jsp" />
<jsp:include page="/WEB-INF/views/include/header.jsp" />
<body>
	<div class="wrapper ">
		<jsp:include page="/WEB-INF/views/include/list.jsp" />
		<div class="main-panel" id="main-panel">
			<div class="panel-header panel-header-sm"></div>
			<div class="content">
				<div class="row">
					<div class="col-md-12">
						<div class="card">
							<div class="card-header d-flex flex-row justify-content-between">
								<h4 class="card-title">Community</h4>
								<a class="btn btn-secondary"
									href="<c:url value='/board/insert'/>">게시글 작성</a>
							</div>
							<div class="card-body">
								학생 반 이름
							</div>
						</div>
					</div>
				</div>
				<div>
				날짜 검색 창
				
				</div>
				
				<!-- forEach문넣어야하는 div -->
				<div>
					<div class="table-responsive">
						<table class="table">
							<thead class=" text-primary">
								<th>Title</th>
								<th class="text-right">Writer</th>
								<th class="text-right">Date</th>
							</thead>
							<tbody>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<jsp:include page="/WEB-INF/views/include/footer.jsp" />
		</div>
	</div>
</body>
</html>