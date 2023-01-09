<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setBundle basename="i18n/board"/>
<!DOCTYPE html>
<html>
	<jsp:include page="/WEB-INF/views/include/staticFiles.jsp"/>
	<body>
	<jsp:include page="/WEB-INF/views/include/header.jsp"/>

		<div role="main" class="ml-sm-auto col-12">
			<div class="parallax-window" data-parallax="scroll" data-image-src="img/dream-pulse-header.jpg">
				<div class="tm-section-wrap">
					<section id="intro" class="tm-section">
						<div class="tm-bg-white-transparent tm-intro">
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
						    	<c:if test="isManager == 'Y'">
			    				<form action='<c:url value="/attend/reportsstatusupdate"/>' method="POST">
						    		<input type="hidden" name="repId" value="${reportsVO.repId}"/>
						    		<input type="hidden" name="studentId" value="${reportsVO.studentId}"/>
						    		<input type="hidden" name="repDateStr" value="${repDateStr}"/> 
						    		<input type="hidden" name="repType" value="${reportsVO.repType}"/>
						  			<input type="hidden" name="inTimeStr" value="${inTimeStr}"/>
						    		<input type="hidden" name="outTimeStr" value="${outTimeStr}"/> 
						    		<input type="hidden" name="reason" value="${reportsVO.reason}"/>
						    		<input type="hidden" name="repStatus" value="${reportsVO.repStatus}"/>
						    		
						    	 	<select name="updateRepStatus">
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
						    		<input type="submit" value="제출"/>
						    	</form>
				    		</c:if>
				    		<a href='<c:url value="/reports/cancle/${reportsVO.repId}"/>'>취소</a>
						</div>
					</section>
				</div>
			</div>
		</div>
		<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
	</body>
</html>
