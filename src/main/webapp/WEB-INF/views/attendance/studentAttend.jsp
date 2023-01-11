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
				                <h4 class="card-title">${attendStat.studentId}님의 ${yearParam}년 ${monthParam}월의 근태</h4>
				              </div>
				              <div class="card-body">
				              	<!-- 페이지의 콘텐츠가 들어가야 할 부분 -->
								<form action='<c:url value="/attend/getStudentAttend"/>' method="POST">
						     		<select name="yearParam">
								    	<option <c:if test ="${yearParam eq '2013'}">selected="selected"</c:if> value="2013">2013</option>
								    	<option <c:if test ="${yearParam eq '2014'}">selected="selected"</c:if> value="2014">2014</option>
								    	<option <c:if test ="${yearParam eq '2015'}">selected="selected"</c:if> value="2015">2015</option>
								    	<option <c:if test ="${yearParam eq '2016'}">selected="selected"</c:if> value="2016">2016</option>
								    	<option <c:if test ="${yearParam eq '2017'}">selected="selected"</c:if> value="2017">2017</option>
								    	<option <c:if test ="${yearParam eq '2018'}">selected="selected"</c:if> value="2018">2018</option>
								    	<option <c:if test ="${yearParam eq '2019'}">selected="selected"</c:if> value="2019">2019</option>
								    	<option <c:if test ="${yearParam eq '2020'}">selected="selected"</c:if> value="2020">2020</option>
								    	<option <c:if test ="${yearParam eq '2021'}">selected="selected"</c:if> value="2021">2021</option>
							    		<option <c:if test ="${yearParam eq '2022'}">selected="selected"</c:if> value="2022">2022</option>
							    		<option <c:if test ="${yearParam eq '2023'}">selected="selected"</c:if> value="2023">2023</option>
							    	</select>
							    	
							    	<select name="monthParam">
							    		<option <c:if test ="${monthParam eq '1'}">selected="selected"</c:if> value="1">1</option>
							    		<option <c:if test ="${monthParam eq '2'}">selected="selected"</c:if> value="2">2</option>
							    		<option <c:if test ="${monthParam eq '3'}">selected="selected"</c:if> value="3">3</option>
							    		<option <c:if test ="${monthParam eq '4'}">selected="selected"</c:if> value="4">4</option>
							    		<option <c:if test ="${monthParam eq '5'}">selected="selected"</c:if> value="5">5</option>
							    		<option <c:if test ="${monthParam eq '6'}">selected="selected"</c:if> value="6">6</option>
							    		<option <c:if test ="${monthParam eq '7'}">selected="selected"</c:if> value="7">7</option>
							    		<option <c:if test ="${monthParam eq '8'}">selected="selected"</c:if> value="8">8</option>
							    		<option <c:if test ="${monthParam eq '9'}">selected="selected"</c:if> value="9">9</option>
							    		<option <c:if test ="${monthParam eq '10'}">selected="selected"</c:if> value="10">10</option>
							    		<option <c:if test ="${monthParam eq '11'}">selected="selected"</c:if> value="11">11</option>
							    		<option <c:if test ="${monthParam eq '12'}">selected="selected"</c:if> value="12">12</option>
							    	</select>
							    	<input type="submit" value="검색"/>
						     	</form>
						     	
						     	<div class="card mt-3" style="width: 350px">
								  <div class="card-body">
								  <h4 class="card-title">${yearParam}년 ${monthParam}월 근태 통계</h4>
								   <hr/>
								    <p class="card-text">
									    <ul class="list-group list-group-horizontal">
										  <li class="list-group-item" style="width:33%; border: 0">지각</li>
										  <li class="list-group-item" style="width:33%; border: 0">결석</li>
										  <li class="list-group-item" style="width:33%; border: 0">출석</li>
										</ul>
										<ul class="list-group list-group-horizontal">
										  <li class="list-group-item" style="width:33%; border: 0">${attendStat.lateCount}회</li>
										  <li class="list-group-item" style="width:33%; border: 0">${attendStat.absenceCount}회</li>
										  <li class="list-group-item" style="width:33%; border: 0">${attendStat.attendCount}회</li>
										</ul>
								    </p>
								  </div>
							    </div>
						     	
						
						     	<c:forEach var="attendanceVO" items="${attendanceVoList}">
						     		<div class="card mt-3" style="width: 350px">
									  <div class="card-body">
									    <h4 class="card-title"><fmt:formatDate value="${attendanceVO.attendanceDate}" pattern="yyyy-MM-dd"/></h4>
									    <hr/>
									    <p class="card-text">
										    <ul class="list-group list-group-horizontal">
											  <li class="list-group-item" style="width:33%; border: 0">IN</li>
											  <li class="list-group-item" style="width:33%; border: 0">OUT</li>
											  <li class="list-group-item" style="width:33%; border: 0">상태</li>
											</ul>
											<ul class="list-group list-group-horizontal">
											  <li class="list-group-item" style="width:33%; border: 0"><fmt:formatDate value="${attendanceVO.inTime}" pattern="HH:mm:ss"/></li>
											  <li class="list-group-item" style="width:33%; border: 0"><fmt:formatDate value="${attendanceVO.outTime}" pattern="HH:mm:ss"/></li>
											  <li class="list-group-item" style="width:33%; border: 0">${attendanceVO.status}</li>
											</ul>
											<c:if test="${isManager == 'Y'.charAt(0)}">
												<form action='<c:url value="/attend/updateAttendStatus"/>' method="POST">
													<input type="hidden" name="attendanceDate" value='<fmt:formatDate value="${attendanceVO.attendanceDate}" pattern="yyyy-MM-dd"/>'/>
													<input type="hidden" name="studentId" value="${attendanceVO.studentId}"/>
													<select name="updateStatus">
														<option value="지각">지각</option>
														<option value="결석">결석</option>
														<option value="출석">출석</option>
													</select>
													<input type="submit" value="변경"/>
												</form>
											</c:if>
									    </p>
									  </div>
								    </div>
						     	</c:forEach>
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



