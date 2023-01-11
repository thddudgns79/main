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
		      	<!-- Navbar --> 
		      	<nav class="navbar navbar-expand-lg navbar-transparent  bg-primary  navbar-absolute">
				        <div class="container-fluid">
				          <div class="navbar-wrapper">
				            <div class="navbar-toggle">
				              <button type="button" class="navbar-toggler">
				                <span class="navbar-toggler-bar bar1"></span>
				                <span class="navbar-toggler-bar bar2"></span>
				                <span class="navbar-toggler-bar bar3"></span>
				              </button>
				            </div> 
				          </div>
				          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navigation" aria-controls="navigation-index" aria-expanded="false" aria-label="Toggle navigation">
				            <span class="navbar-toggler-bar navbar-kebab"></span>
				            <span class="navbar-toggler-bar navbar-kebab"></span>
				            <span class="navbar-toggler-bar navbar-kebab"></span>
				          </button>
				          <div class="collapse navbar-collapse justify-content-end" id="navigation">
				            <form>
					              <div class="input-group no-border">
					                <input type="text" value="" class="form-control" placeholder="Search..." style="left: -1.5px;">
					                <div class="input-group-append">
					                  <div class="input-group-text">
					                    <i class="now-ui-icons ui-1_zoom-bold"></i>
					                  </div>
					                </div>
					              </div>
				            </form>
				            <ul class="navbar-nav">
				              <li class="nav-item">
				                <a class="nav-link" href="#pablo">
				                  <i class="now-ui-icons media-2_sound-wave"></i>
				                  <p>
				                    <span class="d-lg-none d-md-block">Stats</span>
				                  </p>
				                </a>
				              </li>
				              <li class="nav-item dropdown">
				                <a class="nav-link dropdown-toggle" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				                  <i class="now-ui-icons location_world"></i>
				                  <p>
				                    <span class="d-lg-none d-md-block">Some Actions</span>
				                  </p>
				                </a>
				                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink">
				                  <a class="dropdown-item" href="#">Action</a>
				                  <a class="dropdown-item" href="#">Another action</a>
				                  <a class="dropdown-item" href="#">Something else here</a>
				                </div>
				              </li>
				              <li class="nav-item">
				                <a class="nav-link" href="#pablo">
				                  <i class="now-ui-icons users_single-02"></i>
				                  <p>
				                    <span class="d-lg-none d-md-block">Account</span>
				                  </p>
				                </a>
				              </li>
				            </ul>
				          </div>
				        </div>
		      	</nav>
		      	<!-- End Navbar -->
		      	<div class="panel-header panel-header-sm">
		      	</div>
		      	<div class="content">
				        <div class="row">
				          <div class="col-md-12">
				            <div class="card">
				              <div class="card-header d-flex flex-row justify-content-between">
				                <h4 class="card-title">클래스 목록</h4>
				              </div>
				              <div class="card-body">
				              	<!-- 페이지의 콘텐츠가 들어가야 할 부분 -->
				              	<form action='<c:url value="/class/classlist/1"/>' method="get">
								<select name="orgName">
									<option value="전체" <c:if test ="${orgName eq '전체'}">selected="selected"</c:if>>전체</option>
									<option value="KOREA SOFTWARE" <c:if test ="${orgName eq 'KOREA SOFTWARE'}">selected="selected"</c:if>>KOREA SOFTWARE</option>
									<option value="한국개발진흥원" <c:if test ="${orgName eq '한국개발진흥원'}">selected="selected"</c:if>>한국개발진흥원</option>
									<option value="삼성 멀티캠퍼스" <c:if test ="${orgName eq '삼성 멀티캠퍼스'}">selected="selected"</c:if>>삼성 멀티캠퍼스</option>
									<option value="한국방송통신대학교" <c:if test ="${orgName eq '한국방송통신대학교'}">selected="selected"</c:if>>한국방송통신대학교</option>
								</select>
								<input type="text" name="className" value="${className}"/>
								<input type="submit" value="검색"/>
								</form>
						
				                <div class="table-responsive">
				                	<table class="table">
				                		<thead class=" text-primary">
				                      		<th class="text-right">클래스 번호</th>
				                      		<th class="text-right">담당 기관 </th>
				                      		<th class="text-right">클래스 명</th>
				                      		<th class="text-right">이수 시간</th>
				                      		<th class="text-right">교육 시작일</th>
				                      		<th class="text-right">교육 종료일</th>
				                    	</thead>
				                    	<tbody>
											<c:forEach var="class" items="${classList}">
												<tr>
													<td class="text-right">${class.classId}</td>
													<td class="text-right">${class.orgName}</td>
													<td class="text-right"><a href='<c:url value="/attend/getAllAttend/${class.classId}"/>'>${class.className}</a></td>
													<td class="text-right">${class.classHours}시간</td>
													<td class="text-right">${class.classStartDate}</td>
													<td class="text-right">${class.classEndDate}</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
				                </div>
				                <ul class="pagination">
									<!-- Previous 시작 -->
									<li class="paginate_button page-item previous <c:if test='${pager.startPageNo eq 1}'>disabled</c:if>" id="dataTable_previous">
										<a href='<c:url value="/class/classlist/${pager.startPageNo-5}?orgName=${orgName}&className=${className}"/>' aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page-link">
											Previous
										</a>
									</li>
									<!-- Previous 끝 -->
									<!-- Page번호 시작 -->
									<c:forEach var="pNo" begin="${pager.startPageNo }" end="${pager.endPageNo }" step="1">
										<li class="paginate_button page-item  <c:if test='${pager.pageNo eq pNo}'>active</c:if>">
											<a href='<c:url value="/class/classlist/${pNo}?orgName=${orgName}&className=${className}"/>' aria-controls="dataTable" data-dt-idx="1" tabindex="0" class="page-link">
												${pNo}
											</a>
										</li>
									</c:forEach>
									<!-- Page번호 끝 -->
									<!-- Next 시작 -->
									<li class="paginate_button page-item next <c:if test='${pager.endPageNo>=pager.totalPageNo}'>disabled</c:if>" id="dataTable_next">
										<a href='<c:url value="/class/classlist/${pager.startPageNo+5}?orgName=${orgName}&className=${className}"/>' aria-controls="dataTable" data-dt-idx="7" tabindex="0" class="page-link">
											Next
										</a>
									</li>
									<!-- Next 끝 -->
								</ul>
				              </div>
				            </div>
				          </div>
				        </div>
			      </div>
			      <jsp:include page="/WEB-INF/views/include/footer.jsp" />
		    </div>
	</div>
</body>
</html>


