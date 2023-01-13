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
				            <a class="navbar-brand" href="#">커뮤니티</a>
				          </div>
				          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navigation" aria-controls="navigation-index" aria-expanded="false" aria-label="Toggle navigation">
				            <span class="navbar-toggler-bar navbar-kebab"></span>
				            <span class="navbar-toggler-bar navbar-kebab"></span>
				            <span class="navbar-toggler-bar navbar-kebab"></span>
				          </button>
				          <div class="collapse navbar-collapse justify-content-end" id="navigation">
				            <form>
					              <div class="input-group no-border">
					                <input type="text" value="" class="form-control" placeholder="Search..." style="left: -2.0px;">
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
		      	<div class="content" style="padding-bottom: 360px;">
				        <div class="row">
				          <div class="col-md-12">
				            <div class="card">
				              <div class="card-header d-flex flex-row justify-content-between">
				                <h4 class="card-title"> Community</h4>
				                <a class="btn" href="<c:url value='/board/insert'/>" style="background-color: MediumSeaGreen">게시글 작성</a>
				              </div>
				              <div class="card-body">
				              	<div>
				              		<form action='<c:url value="/board/list/1"/>' method="get" class="form-inline">
				              			<div class="form-group mr-3 m-2">
					              			<label for="selectedCategory" class="mr-3" style="font-size:20px;">카테고리</label>
					              			<select name="selectedCategory" id="selectedCategory" class="form-control">
					              				<option value="전체" <c:if test ="${selectedCategory eq '전체'}">selected="selected"</c:if>>전체</option>
					              				<option value="질문" <c:if test ="${selectedCategory eq '질문'}">selected="selected"</c:if>>질문</option>
					              				<option value="자유주제" <c:if test ="${selectedCategory eq '자유주제'}">selected="selected"</c:if>>자유주제</option>
					              				<option value="스터디" <c:if test ="${selectedCategory eq '스터디'}">selected="selected"</c:if>>스터디</option>
					              			</select>
				              			</div>
				              			<div class="form-group mr-3 m-2">
				              				<label for="searchTitle" class="mr-3" style="font-size:20px;">글 제목 </label>
				              				<input type="text" name="searchTitle" id="searchTitle" value="${searchTitle}" class="form-control"/>
				              			</div>
				              			
				              			<div class="form-group mr-3 m-2">	
				              				<label for="searchStudentId" class="mr-3" style="font-size:20px;">작성자</label>
				              				<input type="text" name="searchStudentId" id="searchStudentId" value="${searchStudentId}" class="form-control"/>
				              			</div>
				              			
				              			<div class="form-group mr-3 m-2">
				              				<input type="submit" value="검색" class="form-control"/>
				              			</div>
				              			
				              		</form>
				              	</div>
				                <div class="table-responsive">
				                  <table id="boardListTable" class="table">
				                    	<thead class=" text-primary">
				                    		<tr>
				                    			<th class="text-left">BoardId</th>
				                    			<th class="text-right">Category</th>
					                      		<th class="text-right">Title</th>
					                      		<th class="text-right">Writer </th>
					                      		<th class="text-right">Date</th>
				                      		</tr>
				                    	</thead>
				                    	<tbody>
			                    		<c:forEach var="board" items="${boardList}">
					                       <tr onclick='location.href="<c:url value='/board/detail/${board.boardId}'/>" '>
					                         <td class="text-left">${board.boardId}</td>
					                       	 <td class="text-right">${board.boardCategory}</td>
					                         <td class="text-right"><h5>${board.boardTitle}</h5></td>
					                         <td class="text-right font-weight-bold" style="color:#204065;">${board.studentId}</td>
					                         <td class="text-right text-muted">${board.calculateTime}</td>
					                       </tr>
						                 </c:forEach>
				                    	</tbody>
				                  </table>
				                </div>
				              </div>
			              	  <!-- Pagination -->
					  		  <jsp:include page="/WEB-INF/views/include/pagination.jsp" />
				            </div>
				          </div>
				        </div>
			      </div>
			      <jsp:include page="/WEB-INF/views/include/footer.jsp" />
		    </div>
	</div>
</body>
</html>