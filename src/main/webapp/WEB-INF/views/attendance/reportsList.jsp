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
		      	<div class="content" style="padding-bottom: 180px;">
				        <div class="row">
				          <div class="col-md-12">
				            <div class="card" style="padding-bottom: 50px;">
				              <div class="card-header d-flex flex-row justify-content-between">
				                <h4 class="card-title" style="font-size:35px;">휴가 결재</h4>
				              </div>
				              <div class="card-body">
				              	<!-- 페이지의 콘텐츠가 들어가야 할 부분 -->
				              	<!-- classId, year, month, status, reqType -->
						    	<form action='<c:url value="/attend/reportslist/1"/>' method="GET" class="form-inline">
						    		<label for="yearParam" class="mr-2 ml-2" style="font-size:20px;">연도</label>
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
							    	
							    	<label for="monthParam" class="mr-2" style="font-size:20px;">월</label>
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
							    	
							    	<label for="classId" class="ml-5 mr-2" style="font-size:20px;">클래스 번호</label>
							    	<select name="classId" class="form-control mr-2" id="classId" style="width:80px; height:50px;font-size:20px;">
							    		<option value="전체">전체</option>
							    		<c:forEach var="classId" items="${classIdList}">
							    			<option <c:if test ="${selectedClassId != '전체' && selectedClassId eq classId}">selected="selected"</c:if> value="${classId}">${classId}</option>
							    		</c:forEach>
							    	</select>
							    	
							    	<label for="repType" class="mr-2" style="font-size:20px;">신청 유형</label>
							    	<select name="repType" class="form-control mr-2" id="repType" style="width:200px; height:50px;font-size:20px;">
							    		<option <c:if test ="${repType eq '전체'}">selected="selected"</c:if> value="전체">전체</option>
							    		<option <c:if test ="${repType eq '병가'}">selected="selected"</c:if> value="병가">병가</option>
							    		<option <c:if test ="${repType eq '경조사'}">selected="selected"</c:if> value="경조사">경조사</option>
							    		<option <c:if test ="${repType eq '예비군'}">selected="selected"</c:if> value="예비군">예비군</option>
							    		<option <c:if test ="${repType eq '조퇴'}">selected="selected"</c:if> value="조퇴">조퇴</option>
							    		<option <c:if test ="${repType eq '외출'}">selected="selected"</c:if> value="외출">외출</option>
							    		<option <c:if test ="${repType eq '지하철 연착'}">selected="selected"</c:if> value="지하철 연착">지하철 연착</option>
							    	</select>
							    	
							    	<label for="repStatus" class=" mr-2" style="font-size:20px;">상태</label>
							    	<select name="repStatus" class="form-control mr-2" id="repStatus" style="width:180px; height:50px;font-size:20px;">
							    		<option <c:if test ="${repStatus eq '전체'}">selected="selected"</c:if> value="전체">전체</option>
							    		<option <c:if test ="${repStatus eq '대기'}">selected="selected"</c:if> value="대기">대기</option>
							    		<option <c:if test ="${repStatus eq '승인'}">selected="selected"</c:if> value="승인">승인</option>
							    		<option <c:if test ="${repStatus eq '반려'}">selected="selected"</c:if> value="반려">반려</option>
							    	</select>
							    	
							    	<input type="submit" value="검색" class="btn btn-sm btn-primary ml-5" style="width:150px; height:40px; font-size:20px;"/>
						    	</form>
						    	
						    	<div class="table-responsive m-3 pr-4" style="font-size: 20px;">
							    	<table class="table table-hover" >
				                    	<thead class=" text-primary">
				                    		<tr class="colored">
					                      		<th class="clNumber">신청 번호</th>
								    			<th class="clName">신청인</th>
								    			<th class="clDay">휴가 날짜</th>
								    			<th>신청 유형</th>
								    			<th class="clStatus">상태</th>
							    			</tr>
				                    	</thead>
				                    	<tbody>
											<c:forEach var="report" items="${reportsList}">
								    			<tr class="classHover colored"  onclick='location.href="<c:url value='/attend/reportsdetail/${report.repId}'/>" '>
								    				<td>${report.repId}</td>
								    				<td>${report.studentId}</td>
								    				<td><fmt:formatDate value="${report.repDate}" pattern="yyyy.MM.dd"/></td>
								    				<td>${report.repType}</td>
								    				<td>${report.repStatus}</td>
								    			</tr>
							    			</c:forEach>
				                    	</tbody>
					                 </table>
				                 </div>
				                 
				                 <ul class="pagination d-flex justify-content-center mt-5">
									<!-- Previous 시작 -->
									<li class="paginate_button page-item previous <c:if test='${pager.startPageNo eq 1}'>disabled</c:if>" id="dataTable_previous">
										<a href='<c:url value="/attend/reportslist/${pager.startPageNo-5}?classId=${selectedClassId}&yearParam=${yearParam}&monthParam=${monthParam}&repType=${repType}&repStatus=${repStatus}"/>' aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page-link">
											Previous
										</a>
									</li>
									<!-- Previous 끝 -->
									<!-- Page번호 시작 -->
									<c:forEach var="pNo" begin="${pager.startPageNo }" end="${pager.endPageNo }" step="1">
										<li class="paginate_button page-item  <c:if test='${pager.pageNo eq pNo}'>active</c:if>">
											<a href='<c:url value="/attend/reportslist/${pNo}?classId=${selectedClassId}&yearParam=${yearParam}&monthParam=${monthParam}&repType=${repType}&repStatus=${repStatus}"/>' aria-controls="dataTable" data-dt-idx="1" tabindex="0" class="page-link">
												${pNo}
											</a>
										</li>
									</c:forEach>
									<!-- Page번호 끝 -->
									<!-- Next 시작 -->
									<li class="paginate_button page-item next <c:if test='${pager.endPageNo>=pager.totalPageNo}'>disabled</c:if>" id="dataTable_next">
										<a href='<c:url value="/attend/reportslist/${pager.startPageNo+5}?classId=${selectedClassId}&yearParam=${yearParam}&monthParam=${monthParam}&repType=${repType}&repStatus=${repStatus}"/>' aria-controls="dataTable" data-dt-idx="7" tabindex="0" class="page-link">
											Next
										</a>
									</li>
									<!-- Next 끝 -->
								</ul>
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

