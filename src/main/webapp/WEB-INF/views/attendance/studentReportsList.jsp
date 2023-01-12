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
				                <h4 class="card-title">휴가 신청 목록</h4>
				              </div>
				              <div class="card-body">
				              	<!-- 페이지의 콘텐츠가 들어가야 할 부분 -->
				              	<!-- classId, year, month, status, reqType -->
						    	<form action='<c:url value="/attend/studentreportslist/1"/>' method="GET">
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
						    	<table class="table">
			                    	<thead class=" text-primary">
			                      		<th class="text-right">신청 번호</th>
						    			<th class="text-right">신청인</th>
						    			<th class="text-right">휴가 날짜</th>
						    			<th class="text-right">신청 유형</th>
						    			<th class="text-right">상태</th>
			                    	</thead>
			                    	<tbody>
										<c:forEach var="report" items="${reportsList}">
							    			<tr>
							    				<td class="text-right">${report.repId}</td>
							    				<td class="text-right"><a href='<c:url value="/attend/reportsdetail/${report.repId}"/>'>${report.studentId}</a></td>
							    				<td class="text-right"><fmt:formatDate value="${report.repDate}" pattern="yyyy.MM.dd"/></td>
							    				<td class="text-right">${report.repType}</td>
							    				<td class="text-right">${report.repStatus}</td>
							    			</tr>
						    			</c:forEach>
			                    	</tbody>
				                 </table>
				                 <ul class="pagination">
									<!-- Previous 시작 -->
									<li class="paginate_button page-item previous <c:if test='${pager.startPageNo eq 1}'>disabled</c:if>" id="dataTable_previous">
										<a href='<c:url value="/attend/studentreportslist/${pager.startPageNo-5}?yearParam=${yearParam}&monthParam=${monthParam}&repType=${repType}&repStatus=${repStatus}"/>' aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page-link">
											Previous
										</a>
									</li>
									<!-- Previous 끝 -->
									<!-- Page번호 시작 -->
									<c:forEach var="pNo" begin="${pager.startPageNo }" end="${pager.endPageNo }" step="1">
										<li class="paginate_button page-item  <c:if test='${pager.pageNo eq pNo}'>active</c:if>">
											<a href='<c:url value="/attend/studentreportslist/${pNo}?yearParam=${yearParam}&monthParam=${monthParam}&repType=${repType}&repStatus=${repStatus}"/>' aria-controls="dataTable" data-dt-idx="1" tabindex="0" class="page-link">
												${pNo}
											</a>
										</li>
									</c:forEach>
									<!-- Page번호 끝 -->
									<!-- Next 시작 -->
									<li class="paginate_button page-item next <c:if test='${pager.endPageNo>=pager.totalPageNo}'>disabled</c:if>" id="dataTable_next">
										<a href='<c:url value="/attend/studentreportslist/${pager.startPageNo+5}?yearParam=${yearParam}&monthParam=${monthParam}&repType=${repType}&repStatus=${repStatus}"/>' aria-controls="dataTable" data-dt-idx="7" tabindex="0" class="page-link">
											Next
										</a>
									</li>
									<!-- Next 끝 -->
								</ul>
						    	<a href='<c:url value="reports/write"/>'>휴가 신청</a>
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






