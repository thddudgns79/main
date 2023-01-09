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
							<!-- classId, year, month, status, reqType -->
					    	<form action='<c:url value="/attend/reportslist"/>' method="POST">
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
						    	
						    	<select name="classId">
						    		<option value="전체">전체</option>
						    		<c:forEach var="classId" items="${classIdList}">
						    			<option <c:if test ="${selectedClassId != '전체' && selectedClassId eq classId}">selected="selected"</c:if> value="${classId}">${classId}</option>
						    		</c:forEach>
						    	</select>
						    	
						    	<select name="repType">
						    		<option <c:if test ="${repType eq '전체'}">selected="selected"</c:if> value="전체">전체</option>
						    		<option <c:if test ="${repType eq '병가'}">selected="selected"</c:if> value="병가">병가</option>
						    		<option <c:if test ="${repType eq '경조사'}">selected="selected"</c:if> value="경조사">경조사</option>
						    		<option <c:if test ="${repType eq '예비군'}">selected="selected"</c:if> value="예비군">예비군</option>
						    		<option <c:if test ="${repType eq '조퇴'}">selected="selected"</c:if> value="조퇴">조퇴</option>
						    		<option <c:if test ="${repType eq '외출'}">selected="selected"</c:if> value="외출">외출</option>
						    		<option <c:if test ="${repType eq '지하철 연착'}">selected="selected"</c:if> value="지하철 연착">지하철 연착</option>
						    	</select>
						    	
						    	<select name="repStatus">
						    		<option <c:if test ="${repStatus eq '전체'}">selected="selected"</c:if> value="전체">전체</option>
						    		<option <c:if test ="${repStatus eq '대기'}">selected="selected"</c:if> value="대기">대기</option>
						    		<option <c:if test ="${repStatus eq '승인'}">selected="selected"</c:if> value="승인">승인</option>
						    		<option <c:if test ="${repStatus eq '반려'}">selected="selected"</c:if> value="반려">반려</option>
						    	</select>
						    	
						    	<input type="submit" value="검색"/>
					    	</form>
					    	
					    	<table>
					    		<tr>
					    			<td>신청 번호</td>
					    			<td>신청인</td>
					    			<td>휴가 날짜</td>
					    			<td>신청 유형</td>
					    			<td>상태</td>
					    		</tr>
					    		<c:forEach var="report" items="${reportsList}">
					    			<tr>
					    				<td>${report.repId}</td>
					    				<td><a href='<c:url value="/attend/reportsdetail/${report.repId}"/>'>${report.studentId}</a></td>
					    				<td><fmt:formatDate value="${report.repDate}" pattern="yyyy.MM.dd"/></td>
					    				<td>${report.repType}</td>
					    				<td>${report.repStatus}</td>
					    			</tr>
					    		</c:forEach>
					    	</table>
						</div>
					</section>
				</div>
			</div>
		</div>
		<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
	</body>
</html>

