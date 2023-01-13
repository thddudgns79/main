<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:setBundle basename="i18n/board" />

<!DOCTYPE html>
<html>
<script src="<c:url value='/js/reports.js'/>"></script> 
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<jsp:include page="/WEB-INF/views/include/staticFiles.jsp" />
<jsp:include page="/WEB-INF/views/include/header.jsp" />
<body>
	<div class="wrapper ">
		<jsp:include page="/WEB-INF/views/include/list.jsp" />
		<div class="main-panel" id="main-panel">
			<div class="panel-header panel-header-sm"></div>
			<div class="content " style="padding-bottom: 150px;">
				<div class="row">
					<div class="col-md-12">
						<div class="card" style="padding-bottom:50px;">
							<div class="card-header">
								<h4 class="card-title" style="font-size:35px;">휴가 신청</h4>
							</div>
							<div class="card-body" >
								<div class="container">
									<form action="<c:url value='/reports/write'/>" onsubmit="return check()" method=post enctype="multipart/form-data">
										<div class="row px-0" >
											<div class="m-3 col">
												<label for="repDateStr" class="form-label" style="font-size:15px;">신청일</label>
												<input  type="date" class="form-control" id="repDateStr" placeholder="YYYY-MM-DD" name="repDateStr" 
													style="height:50px; font-size:25px;"> 
												<small id="dateMsg" style="color:red;"></small>
											</div>
											<div class="ml-2 my-2 col">
												<label for="inTimeStr" class="form-label" style="font-size:15px;">inTime</label> 
												<input type="text" class="form-control" id="inTimeStr" placeholder="HH:MM:SS" name="inTimeStr" 
													 style=" height:50px;  font-size:25px;"> 
												<small id="inMsg" style="color:red;"></small>
											</div>
											<div class="mr-2 my-2 col">
												<label for="outTimeStr" class="form-label" style="font-size:15px;">outTime</label> 
												<input type="text" class="form-control" id="outTimeStr" placeholder="HH:MM:SS" name="outTimeStr" 
												style="height:50px; font-size:25px;">
												 <small id="outMsg" style="color:red;"></small> 
											</div>
										</div>
										<div class="row m-3" style="width:50%;">
											<label for="outTime" class="form-label" style="font-size:15px;">휴가 신청 사유</label>
											<select id="repType" class="form-select m-1 col" name="repType" onchange="repFunction()" style="font-size:20px;">
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
											<label for="reason" style="font-size:15px;">사유</label>
											<textarea class="form-control" rows="5" id="reason" name="reason"  style="font-size:20px;"> </textarea>
											<small id="reasonMsg" style="color:red;"></small>
										</div>
										<div class="row m-3" >
											<!-- 히든으로 학생아이디 넣어주고  -->
											<label for="multiFile" style="font-size:15px;">파일: </label> 
											<input type="file" class="form-control" id="multiFile" name="multiFile" style="width:20%;" multiple>
											<small id="fileMsg" style="color:red;"></small>
										</div>
										<div class="row mt-5 d-flex justify-content-center">
											<input type="submit" value="제출" class="subButton">
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
	</div>
</body>
</html>


