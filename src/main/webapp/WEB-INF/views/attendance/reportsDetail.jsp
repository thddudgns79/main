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
				                <h4 class="card-title">휴가 상세정보</h4>
				              </div>
				              <div class="card-body">
				              	<!-- 페이지의 콘텐츠가 들어가야 할 부분 -->
				              	<div>신청 번호 : ${reportsVO.repId}</div>
						    	<div>신청인 : ${reportsVO.studentId}</div>
						    	<div>신청 날짜 : ${repDateStr}</div>
						    	<div>신청 유형 : ${reportsVO.repType}</div>
						    	<div>불참 시작 :${inTimeStr}</div>
						    	<div>불참 종료 : ${outTimeStr}</div>
						    	<div>사유 : ${reportsVO.reason}</div>
						    	<div>결재 상태 : ${reportsVO.repStatus}</div>
						    	<div>
						    		<c:forEach var="file" items="${fileList}">
						    			<img src='<c:url value="/attend/filedownload/${file.fileId}"/>'/>
						    		</c:forEach>
						    	</div>
							    	<c:if test="${isManager== 'Y'.charAt(0)}">
				    				<form action='<c:url value="/attend/reportsstatusupdate"/>' method="POST" class="form-inline">
							    		<input type="hidden" name="repId" value="${reportsVO.repId}"/>
							    		<input type="hidden" name="studentId" value="${reportsVO.studentId}"/>
							    		<input type="hidden" name="repDateStr" value="${repDateStr}"/> 
							    		<input type="hidden" name="repType" value="${reportsVO.repType}"/>
							  			<input type="hidden" name="inTimeStr" value="${inTimeStr}"/>
							    		<input type="hidden" name="outTimeStr" value="${outTimeStr}"/> 
							    		<input type="hidden" name="reason" value="${reportsVO.reason}"/>
							    		<input type="hidden" name="repStatus" value="${reportsVO.repStatus}"/>
							    		
							    	 	<select name="updateRepStatus" class="form-control mr-2">
							    			<c:if test ="${reportsVO.repStatus eq '승인'}">
							    				<option value="반려">반려</option>
							    			</c:if>
							    			<c:if test ="${reportsVO.repStatus eq '대기'}">
							    				<option value="승인">승인</option>
							    				<option value="반려">반려</option>
							    			</c:if>
							    			<c:if test ="${reportsVO.repStatus eq '반려'}">
							    				<option value="승인">승인</option>
							    			</c:if>
							    		</select> 
							    		<input type="submit" value="제출"/ class="form-control btn btn-sm btn-primary">
							    	</form>
					    		</c:if>
					    		<c:if test="${isManager == 'N'.charAt(0)}">
					    			<a href='<c:url value="/reports/cancle/${reportsVO.repId}"/>' class="btn btn-sm btn-primary">취소</a>
					    		</c:if>
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



