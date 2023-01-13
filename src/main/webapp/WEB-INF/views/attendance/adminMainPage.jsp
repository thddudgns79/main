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
		      	<div class="content" style="padding-bottom: 150px;">
				        <div class="row">
				          <div class="col-md-12">
				            <div class="card" style="padding-bottom: 50px;">
				              <div class="card-header d-flex flex-row justify-content-between">
				                <h4 class="card-title" style="font-size:35px;">${classId}반 ${yearParam}년 ${monthParam}월 근태 조회</h4>
				              </div>
				              <div class="card-body">
				              	<!-- 페이지의 콘텐츠가 들어가야 할 부분 -->
						     	<form action='<c:url value="/attend/getAllAttend"/>' method="POST" class="form-inline ml-4 my-2">
						     		<label for="yearParam" class="mr-2" style="font-size:20px;">연도</label>
							    	<select name="yearParam" class="form-control mr-2" id="yearParam" style="width:150px; height:50px;font-size:20px;">
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
							    	
							    	<label for="monthParam" class="mr-2"  style="font-size:20px;">월</label>
							    	<select name="monthParam" class="form-control mr-2" id="monthParam" style="width:50px; height:50px;font-size:20px;">
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
							    	<input type="submit" value="검색" class="btn btn-sm btn-primary ml-4" style="width:150px; height:40px; font-size:20px;"/>
						     	</form>
						
						   		<c:forEach var="attendStat" items="${attendStatList}"> 
					   				<div class="card m-4" style="width:30%;">
									  <div class="card-body">
									    <div class="std pb-3 pl-3" style="border-bottom: 1px solid grey;font-size:30px;">
									    	<a href='<c:url value="/attend/getStudentAttend/${attendStat.studentId}"/>'>${attendStat.studentId}</a>
									    </div>
									    <div class="card-text p-3" >
										    <ul class="list-group list-group-horizontal" style="font-size:23px;">
											  <li class="list-group-item" style="width:33%; border: 0">지각</li>
											  <li class="list-group-item" style="width:33%; border: 0">결석</li>
											  <li class="list-group-item" style="width:33%; border: 0">출석</li>
											</ul>
											<ul class="list-group list-group-horizontal" style="font-size:20px;">
											  <li class="list-group-item" style="width:33%; border: 0">${attendStat.lateCount}회</li>
											  <li class="list-group-item" style="width:33%; border: 0">${attendStat.absenceCount}회</li>
											  <li class="list-group-item" style="width:33%; border: 0">${attendStat.attendCount}회</li>
											</ul>
									    </div>
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


