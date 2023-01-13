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
						<div class="card" style="padding-bottom: 50px;">
							<div class="card-header">
								<h4 style="font-size: 35px; text-align: center; font-weight: 900;">
								<i class="bi bi-person-hearts pr-2"></i>
								${attendStat.studentId}님의 ${yearParam}년 ${monthParam}월의 근태</h4>
							</div>
							<div class="card-body" style="padding-left:100px;" >
								<!-- 이번 달 근태 통계 -->
								<div class="content" style="font-size:30px;">
									<div class="row" >
										<div class="col-3"></div>
										<div class="col">
											<div class="mb-3" style="color:#F77925;"><i class="bi bi-emoji-heart-eyes-fill pr-2" ></i>출석</div>
											<div class="ml-4">${attendStat.attendCount}회</div>
										</div>
										<div class="col">
											<div class="mb-3" style="color:#F77925;"><i class="bi bi-emoji-neutral-fill pr-2"></i>지각</div>
											<div class="ml-4">${attendStat.lateCount}회</div>
										</div>
										<div class="col">
											<div class="mb-3" style="color:#F77925;"><i class="bi bi-emoji-angry-fill pr-2" ></i>결석</div>
											<div class="ml-4">${attendStat.absenceCount}회</div>
										</div>
										<div class="col-3"></div>
									</div>
								</div>
								
								
							</div>
						</div>
					</div>
				</div>
				<!-- 검색 바 -->
				<div>
					<form action='<c:url value="/attend/getStudentAttend"/>' method="POST" class="form-inline ml-4">
						<label for="yearParam" class="mr-2" style="font-size:25px;">연도</label> 
						<select name="yearParam" class="form-control mr-2" id="yearParam"  
						style="width:100px; height:50px;font-size:20px; background-color:white;">
							<option
								<c:if test ="${yearParam eq '2013'}">selected="selected"</c:if>
								value="2013">2013</option>
							<option
								<c:if test ="${yearParam eq '2014'}">selected="selected"</c:if>
								value="2014">2014</option>
							<option
								<c:if test ="${yearParam eq '2015'}">selected="selected"</c:if>
								value="2015">2015</option>
							<option
								<c:if test ="${yearParam eq '2016'}">selected="selected"</c:if>
								value="2016">2016</option>
							<option
								<c:if test ="${yearParam eq '2017'}">selected="selected"</c:if>
								value="2017">2017</option>
							<option
								<c:if test ="${yearParam eq '2018'}">selected="selected"</c:if>
								value="2018">2018</option>
							<option
								<c:if test ="${yearParam eq '2019'}">selected="selected"</c:if>
								value="2019">2019</option>
							<option
								<c:if test ="${yearParam eq '2020'}">selected="selected"</c:if>
								value="2020">2020</option>
							<option
								<c:if test ="${yearParam eq '2021'}">selected="selected"</c:if>
								value="2021">2021</option>
							<option
								<c:if test ="${yearParam eq '2022'}">selected="selected"</c:if>
								value="2022">2022</option>
							<option
								<c:if test ="${yearParam eq '2023'}">selected="selected"</c:if>
								value="2023">2023</option>
						</select> 
						<label for="monthParam" class="mr-2" style="font-size:25px;">월</label> 
						<select name="monthParam" class="form-control mr-5" id="monthParam"  
						style="width:50px; height:50px;font-size:20px; background-color:white;">
							<option
								<c:if test ="${monthParam eq '1'}">selected="selected"</c:if>
								value="1">1</option>
							<option
								<c:if test ="${monthParam eq '2'}">selected="selected"</c:if>
								value="2">2</option>
							<option
								<c:if test ="${monthParam eq '3'}">selected="selected"</c:if>
								value="3">3</option>
							<option
								<c:if test ="${monthParam eq '4'}">selected="selected"</c:if>
								value="4">4</option>
							<option
								<c:if test ="${monthParam eq '5'}">selected="selected"</c:if>
								value="5">5</option>
							<option
								<c:if test ="${monthParam eq '6'}">selected="selected"</c:if>
								value="6">6</option>
							<option
								<c:if test ="${monthParam eq '7'}">selected="selected"</c:if>
								value="7">7</option>
							<option
								<c:if test ="${monthParam eq '8'}">selected="selected"</c:if>
								value="8">8</option>
							<option
								<c:if test ="${monthParam eq '9'}">selected="selected"</c:if>
								value="9">9</option>
							<option
								<c:if test ="${monthParam eq '10'}">selected="selected"</c:if>
								value="10">10</option>
							<option
								<c:if test ="${monthParam eq '11'}">selected="selected"</c:if>
								value="11">11</option>
							<option
								<c:if test ="${monthParam eq '12'}">selected="selected"</c:if>
								value="12">12</option>
						</select> 
						<input type="submit" value="검색" class="btn btn-sm btn-primary" style="width:150px; height:40px; font-size:20px;"/>
					</form>
				</div>


				<!-- 일자 별 근태 카드 -->
				<div>
					<c:forEach var="attendanceVO" items="${attendanceVoList}">
						<div class="card m-4" style="width:30%; font-size:20px;; border-radius:30px; padding-bottom:20px;">
							<div class="card-body" style="font-size:20px;">
								<h4 class="card-title pl-3" style="color:#F77925;">
									<i class="bi bi-calendar-event pr-2"></i>
									<fmt:formatDate value="${attendanceVO.attendanceDate}" pattern="yyyy-MM-dd" />
								</h4>
								<hr />
								<div class="card-text">
								<ul class="list-group list-group-horizontal" style="font-size:23px;">
									<li class="list-group-item" style="width: 33%; border: 0"><i class="bi bi-clock pr-2"></i>IN</li>
									<li class="list-group-item" style="width: 33%; border: 0"><i class="bi bi-clock pr-2"></i>OUT</li>
									<li class="list-group-item" style="width: 33%; border: 0"><i class="bi bi-check-lg pr-2"></i>상태</li>
								</ul>
								<ul class="list-group list-group-horizontal" style="font-size:20px;">
									<li class="list-group-item" style="width: 33%; border: 0">
										<fmt:formatDate value="${attendanceVO.inTime}" pattern="HH:mm:ss" />
									</li>
									<li class="list-group-item" style="width: 33%; border: 0">
										<fmt:formatDate value="${attendanceVO.outTime}" pattern="HH:mm:ss" />
									</li>
									<li class="list-group-item" style="width: 33%; border: 0">
										${attendanceVO.status}
									</li>
								</ul>
								<c:if test="${isManager == 'Y'.charAt(0)}">
									<form action='<c:url value="/attend/updateAttendStatus"/>' method="POST" class="form-inline">
										<input type="hidden" name="attendanceDate" value='<fmt:formatDate value="${attendanceVO.attendanceDate}" pattern="yyyy-MM-dd"/>' />
										<input type="hidden" name="studentId" value="${attendanceVO.studentId}" /> 
										<select name="updateStatus" class="form-control mr-3 ml-4" style="width:100px; height:40px; text-align: center;">
											<option value="지각">지각</option>
											<option value="결석">결석</option>
											<option value="출석">출석</option>
										</select> 
										<input type="submit" value="변경" class="form-control btn btn-sm btn-primary" style="width:100px; height:40px;"/>
									</form>
								</c:if>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
			<jsp:include page="/WEB-INF/views/include/footer.jsp" />
		</div>
	</div>
</body>
</html>



