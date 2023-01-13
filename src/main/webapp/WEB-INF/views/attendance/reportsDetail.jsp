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



