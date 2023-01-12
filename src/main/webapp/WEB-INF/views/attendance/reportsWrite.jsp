<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:setBundle basename="i18n/board" />

<!DOCTYPE html>
<html>
<<<<<<< HEAD
<script src="<c:url value='/js/reports.js'/>"></script> 
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
=======
>>>>>>> branch 'master' of https://github.com/oti-project3/main.git
<jsp:include page="/WEB-INF/views/include/staticFiles.jsp" />
<jsp:include page="/WEB-INF/views/include/header.jsp" />
<body>
	<div class="wrapper ">
		<jsp:include page="/WEB-INF/views/include/list.jsp" />
<<<<<<< HEAD
		<div class="main-panel" id="main-panel">
			<div class="panel-header panel-header-sm"></div>
			<div class="content " style="padding-bottom: 150px;">
				<div class="row">
					<div class="col-md-12">
						<div class="card" style="padding-bottom:100px;">
							<div class="card-header">
								<h4 style="padding-left:30px">휴가 신청</h4>
							</div>
							<div class="card-body p-3" >
								<div class="container">
									<form action="<c:url value='/reports/write'/>" onsubmit="return check()" method=post enctype="multipart/form-data">
										<div class="row">
											<div class="m-3 col">
												<label for="repDate" class="form-label">신청일</label> 
												<input style="width:80%;height:50px;" type="date" class="form-control" id="repDate" placeholder="20230105" name="repDate"> 
												<small id="dateMsg"></small>
											</div>
											<div class="ml-2 my-2 col">
												<label for="inTime" class="form-label">inTime</label> 
												<input type="text" class="form-control" id="inTime" placeholder="20230105" name="inTime" style="width:80%; height:50px;"> 
												<small id="inMsg"></small>
												<input type="hidden" id="">
											</div>
											<div class="mr-2 my-2 col">
												<label for="outTime" class="form-label">outTime</label> 
												<input type="text" class="form-control" id="outTime" placeholder="20230105" name="outTime" style="width:80%;height:50px;">
												 <small id="outMsg"></small> 
											</div>
										</div>
										<div class="row m-3" style="width:50%;">
											<label for="outTime" class="form-label">휴가 신청 사유</label>
											<select id="repType" class="form-select m-1 col" name="repType" onchange="repFunction()">
												<option style="width:30%;">--전체--</option>
												<option value="외출">외출</option>
												<option value="지하철 연착">지하철 연착</option>
												<option value="조퇴">조퇴</option>
												<option value="병가">병가</option>
												<option value="경조사">경조사</option>
												<option value="예비군">예비군</option>
											</select> 
											<small id="repMsg" style="color:red;"></small>
										</div>
										<div class="row m-5">
											<label for="reason">사유</label>
											<textarea class="form-control" rows="5" id="reason" name="reason" > </textarea>
										</div>
										<div class="row m-3" >
											<!-- 히든으로 학생아이디 넣어주고  -->
											<label for="multiFile">파일: </label> 
											<input type="file" class="form-control" id="multiFile" name="multiFile" style="width:20%;">
											<small id="fileMsg"></small>
										</div>
										<div class="row mt-5 d-flex justify-content-center">
											<input type="submit" value="제출" style="width:20%; text-align: center; height:35px;">
										</div>	 
									</form>
									<small style="color: red;">${message}</small>
								</div>
							</div>
							
						</div>
						
					</div>
				</div>
				<div>
				
				</div>
				
				
			</div>
			<jsp:include page="/WEB-INF/views/include/footer.jsp" />
		</div>
=======
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
				                <h4 class="card-title">휴가 신청</h4>
				              </div>
				              <div class="card-body">
				              	<!-- 페이지의 콘텐츠가 들어가야 할 부분 -->
				              	<div class="container">
									<form action="<c:url value='/vacation/insert'/>" method=post enctype="multipart/form-data">
										<select class="form-select" name="repType">
										    <option>--전체--</option>
										    <option value="qna">외출</option>
										    <option value="community">경조사</option>
										    <option value="study">조퇴</option>
									  	</select>
									  	<div>
									  		
									  	</div>
										<div>
							    			<label for="repDate" class="form-label">신청일</label>
							   				<input type="text" class="form-control" id="repDate" placeholder="20230105" name="repDate">
									
											<label for="inTime" class="form-label">inTime</label>
							   				<input type="text" class="form-control" id="inTime" placeholder="20230105" name="inTime">
							   				
							   				<label for="outTime" class="form-label">outTime</label>
							   				<input type="text" class="form-control" id="outTime" placeholder="20230105" name="outTime">
							   				
											<label for="reason">사유</label>
											<textarea class="form-control" rows="5" id="reason" name="reason"></textarea>
											
											<!-- 히든으로 학생아이디 넣어주고  -->
											<label for="rFile">파일: </label>
											<input type="file" class="form-control" id="rFile" name="rFile">
							  			</div>
							  			<button type="submit">제출</button>
									</form>
								</div>
				              </div>
				            </div>
				          </div>
				        </div>
			      </div>
			      <jsp:include page="/WEB-INF/views/include/footer.jsp" />
		    </div>
>>>>>>> branch 'master' of https://github.com/oti-project3/main.git
	</div>
</body>
</html>


