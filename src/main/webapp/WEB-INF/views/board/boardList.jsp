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
			<div class="content" style="padding-bottom: 20s0px;">
				<div class="row">
					<div class="col-md-12">
						<div class="card" style="padding-bottom: 50px;">
							<div class="card-header d-flex flex-row justify-content-between">
								 <h4 style="font-size: 35px;font-weight: 900;">커뮤니티</h4>
								<a class="btn btn-primary m-2" href="<c:url value='/board/insert'/>"
									style="width:150px; height:40px; font-size:20px;">게시글 작성</a>
							</div>
							<div class="card-body">
								<div>
									<form action='<c:url value="/board/list/1"/>' method="get"
										class="form-inline">
										<div class="form-group mr-2 m-2">
											<label for="selectedCategory" class="mr-2" style="font-size: 20px;">카테고리</label> 
												<select name="selectedCategory" id="selectedCategory" class="form-control"  style="width:200px; height:50px;font-size:20px;">
												<option value="전체"
													<c:if test ="${selectedCategory eq '전체'}">selected="selected"</c:if>>전체</option>
												<option value="질문"
													<c:if test ="${selectedCategory eq '질문'}">selected="selected"</c:if>>질문</option>
												<option value="자유주제"
													<c:if test ="${selectedCategory eq '자유주제'}">selected="selected"</c:if>>자유주제</option>
												<option value="스터디"
													<c:if test="${selectedCategory eq '스터디'}">selected="selected"</c:if>>스터디</option>
											</select>
										</div>
										<div class="form-group mr-2 m-2">
											<label for="searchTitle" class="mr-2" style="font-size: 20px;">글 제목 </label> 
											<input type="text" name="searchTitle" id="searchTitle" value="${searchTitle}" class="form-control"  style="width:300px; height:50px;font-size:20px;" />
										</div>

										<div class="form-group mr-5 m-2">
											<label for="searchStudentId" class="mr-2" style="font-size: 20px;">작성자</label> 
											<input type="text" name="searchStudentId" id="searchStudentId" value="${searchStudentId}" class="form-control"  style="width:200px; height:50px;font-size:20px;"/>
										</div>

										<div class="form-group m-2 ">
											<input type="submit" value="검색" class="btn btn-primary" style="width:150px; height:45px; font-size:25px;"/>
										</div>
									</form>
								</div>
								
								<div class="table-responsive m-3 pr-4" style="font-size: 20px;text-align: center;">
									<table id="boardListTable" class="table">
										<thead class=" text-primary">
											<tr>
												<th >BoardId</th>
												<th>Category</th>
												<th>Title</th>
												<th>Writer</th>
												<th>Date</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="board" items="${boardList}">
												<tr onclick='location.href="<c:url value='/board/detail/${board.boardId}'/>" '>
													<td>${board.boardId}</td>
													<td>${board.boardCategory}</td>
													<td>${board.boardTitle}</td>
													<td>${board.studentId}</td>
													<td>${board.calculateTime}</td>
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