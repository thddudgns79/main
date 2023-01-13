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
		      	<div class="content" style="padding-bottom: 200px;">
				        <div class="row">
				          <div class="col-md-12">
				            <div class="card" style="padding-bottom: 50px;">
				              <div class="card-header ml-5 d-flex flex-row justify-content-between">
				               <h4 style="font-size: 35px;font-weight: 900;">클래스 목록</h4>
				              </div>
				              <div class="card-body">
				              	<!-- 페이지의 콘텐츠가 들어가야 할 부분 -->
				              	<form action='<c:url value="/class/classlist/1"/>' method="get" class="form-inline">
					              	<div class="form-group mr-3 m-2">
									  	<label for="orgName" class="mr-3" style="font-size:20px;">기관</label>
									  	<select name="orgName" class="form-control" id="orgName" style="width:300px; height:50px;font-size:20px;">
											<option value="전체" <c:if test ="${orgName eq '전체'}">selected="selected"</c:if>>전체</option>
											<option value="KOREA SOFTWARE" <c:if test ="${orgName eq 'KOREA SOFTWARE'}">selected="selected"</c:if>>KOREA SOFTWARE</option>
											<option value="한국개발진흥원" <c:if test ="${orgName eq '한국개발진흥원'}">selected="selected"</c:if>>한국개발진흥원</option>
											<option value="삼성 멀티캠퍼스" <c:if test ="${orgName eq '삼성 멀티캠퍼스'}">selected="selected"</c:if>>삼성 멀티캠퍼스</option>
											<option value="한국방송통신대학교" <c:if test ="${orgName eq '한국방송통신대학교'}">selected="selected"</c:if>>한국방송통신대학교</option>
										</select>
									</div>
					              	<div class="form-group mr-3 m-2">
									  <label for="className" class="mr-3 " style="font-size:20px;" >클래스 명</label>
									  <input type="text" name="className" value="${className}" class="form-control" id="className" style="width:300px; height:50px;font-size:20px;"/>
									</div>
									
									<input type="submit" value="검색" class="btn btn-sm btn-primary ml-4" style="width:150px; height:40px; font-size:20px;"/>
								</form>
						
				                <div class="table-responsive m-3 pr-4" style="font-size: 20px;" >
				                	<table class="table">
				                		<thead class=" text-primary">
				                			<tr>
					                      		<th class="claNumber">클래스 번호</th>
					                      		<th>담당 기관 </th>
					                      		<th>클래스 명</th>
					                      		<th>이수 시간</th>
					                      		<th>교육 시작일</th>
					                      		<th>교육 종료일</th>
				                      		</tr>
				                    	</thead>
				                    	<tbody>
											<c:forEach var="class" items="${classList}">
												<tr class="classHover colored" onclick='location.href="<c:url value='/attend/getAllAttend/${class.classId}'/>" '>
													<td>${class.classId}</td>
													<td>${class.orgName}</td>
													<td >${class.className}</td>
													<td>${class.classHours}시간</td>
													<td>${class.classStartDate}</td>
													<td>${class.classEndDate}</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
				                </div>
				                <ul class="pagination d-flex justify-content-center">
									<!-- Previous 시작 -->
									<li class="paginate_button page-item previous <c:if test='${pager.startPageNo eq 1}'>disabled</c:if>" id="dataTable_previous">
										<a href='<c:url value="/class/classlist/${pager.startPageNo-5}?orgName=${orgName}&className=${className}"/>' aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page-link">
											Previous
										</a>
									</li>
									<!-- Previous 끝 -->
									<!-- Page번호 시작 -->
									<c:forEach var="pNo" begin="${pager.startPageNo }" end="${pager.endPageNo }" step="1">
										<li class="paginate_button page-item  <c:if test='${pager.pageNo eq pNo}'>active</c:if>">
											<a href='<c:url value="/class/classlist/${pNo}?orgName=${orgName}&className=${className}"/>' aria-controls="dataTable" data-dt-idx="1" tabindex="0" class="page-link">
												${pNo}
											</a>
										</li>
									</c:forEach>
									<!-- Page번호 끝 -->
									<!-- Next 시작 -->
									<li class="paginate_button page-item next <c:if test='${pager.endPageNo>=pager.totalPageNo}'>disabled</c:if>" id="dataTable_next">
										<a href='<c:url value="/class/classlist/${pager.startPageNo+5}?orgName=${orgName}&className=${className}"/>' aria-controls="dataTable" data-dt-idx="7" tabindex="0" class="page-link">
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


