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
			<div class="content" style="padding-bottom: 180px;">
				<div class="row">
					<div class="col-md-12">
						<div class="card" style="padding-bottom: 50px; background-color:white;">
							<div class="card-header ml-5 d-flex flex-row justify-content-between">
								<h4 style="font-size: 35px;font-weight: 900;">휴가 상세정보</h4>
								<c:if test="${isManager== 'Y'.charAt(0)}">
									<form action='<c:url value="/attend/reportsstatusupdate"/>' method="POST" class="form-inline">
										<input type="hidden" name="repId" value="${reportsVO.repId}" />
										<input type="hidden" name="studentId" value="${reportsVO.studentId}" /> 
										<input type="hidden" name="repDateStr" value="${repDateStr}" /> 
										<input type="hidden" name="repType" value="${reportsVO.repType}" />
										<input type="hidden" name="inTimeStr" value="${inTimeStr}" />
										<input type="hidden" name="outTimeStr" value="${outTimeStr}" />
										<input type="hidden" name="reason" value="${reportsVO.reason}" />
										<input type="hidden" name="repStatus" value="${reportsVO.repStatus}" /> 
										<select name="updateRepStatus" class="form-control mr-5 ml-2" 
										style="background-color:#f96332; text-align:center; width:150px; height:50px; font-size:20px; color:white;" >
											<c:if test="${reportsVO.repStatus eq '승인'}">
												<option value="반려">반려</option>
											</c:if>
											<c:if test="${reportsVO.repStatus eq '대기'}">
												<option value="승인">승인</option>
												<option value="반려">반려</option>
											</c:if>
											<c:if test="${reportsVO.repStatus eq '반려'}">
												<option value="승인">승인</option>
											</c:if>
										</select> 
										<input type="submit" value="제출" class="form-control btn btn-sm btn-primary mr-3" 
										style="text-align:center;width:150px; height:50px;font-size:20px;  border: 2px solid #F77925; color:black; ">
									</form>
								</c:if>
								<c:if test="${isManager == 'N'.charAt(0) && reportsVO.repStatus == '대기'}">
									<a href='<c:url value="/reports/cancle/${reportsVO.repId}"/>' class="btn btn-sm btn-primary">취소</a>
								</c:if>
							</div>
							<div class="card-body">
								<!-- 페이지의 콘텐츠가 들어가야 할 부분 -->
								<div class="content" >
									<div class="row mx-5 my-3">
										<div class="col-2" >
											<div class="inname">신청 번호</div> 
											<div class="inin p-1 pl-3" style="width:50%;">${reportsVO.repId}</div>
										</div>
										<div class="col-2">	
											<div class="inname">신청인</div> 
											<div class="inin p-1" style="text-align: center;">${reportsVO.studentId}</div>
										</div>
									</div>
									
									<div class="row mx-5 my-3">
										<div class="col-3">
											<div class="inname">신청 날짜</div> 
											<div class="inin p-1" style="text-align: center;">${repDateStr}</div>
										</div>
									</div>
									
									<div class="row mx-5 my-3">
										<div class="col-4">
											<div class="inname">IN</div> 
											<div class="inin p-1 pl-3" >${inTimeStr}</div>
										</div>
										<div class="col-4">	
											<div class="inname" >OUT</div> 
											<div class="inin p-1 pl-3">${outTimeStr}</div>
										</div>
									</div>
									
									<div class="row mx-5 my-3">
										<div class="col-5">
											<div class="inname">신청 유형</div> 
											<div class="inin p-1" style="text-align: center; width:50%">${reportsVO.repType}</div>
										</div>
									</div>
									
									<div class="row mx-5 my-3">
										<div class="col">
											<div class="inname">사유</div> 
											<div class="inina p-1 pl-3"> ${reportsVO.reason} </div>
										</div>
									</div>
									
									<div class="row mx-5 my-3">
										<div class="col-2">
											<div class="inname" >결재 상태</div> 
											<div class="inin p-1" style="color:red;text-align: center;">${reportsVO.repStatus}</div>
										</div>
									</div>

									<c:forEach var="file" items="${reportsVO.fileList}">
										<div class="row mx-5 my-3">
											<div class="col inname">
												<a href='<c:url value="/attend/filedownload/${file.fileId}"/>'>
													<img src='<c:url value="/attend/filedownload/${file.fileId}"/>' />
												</a>
											</div>
											<div class="col"></div>
										</div>
									</c:forEach>
								</div>
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



