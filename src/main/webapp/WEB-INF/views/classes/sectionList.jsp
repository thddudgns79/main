<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:setBundle basename="i18n/board" />

<!DOCTYPE html>
<html>
<script src="<c:url value='/js/sectionList.js'/>"></script> 
<jsp:include page="/WEB-INF/views/include/staticFiles.jsp" />
<jsp:include page="/WEB-INF/views/include/header.jsp" />
<body>
	<div class="wrapper ">
		<jsp:include page="/WEB-INF/views/include/list.jsp" />
		<div class="main-panel" id="main-panel">
			<div class="panel-header panel-header-sm"></div>
			<div class="content" style="padding-bottom: 200px;">
				<div class="row">
					<div class="col-md-12">
						<div class="card" style="padding-bottom: 50px; width:70%;">
							<div class="card-header">
								<h4 class="card-title" style="font-size: 35px;">
								${classId}반 강의 자료실</h4>
							</div>
							<div class="card-body">
								<!-- 페이지의 콘텐츠가 들어가야 할 부분 -->
								<%-- <div class="m-3">
									<c:if test="${isManager == 'Y'.charAt(0)}">
										<form action='<c:url value="/class/sectioninsert"/>' method="post" onsubmit="return check()">
											<input type="text" class="mr-3" name="sectionTitle" id="sectionTitle"  placeholder="제목 작성" style="width:300px; height:50px;font-size:20px;"/> 
											<input type="text" class="mr-2" name="sectionDescription" id="sectionDescription" placeholder="섹션 설명글 작성"  style="width:300px; height:50px;font-size:20px;"/> 
											<input type="submit" value="섹션 추가" style="width:150px; height:40px;font-size:20px; border:none; background-color:mediumseagreen; color:white;" />
										</form>
										<small id="message" style="color:red; font-size:15px;"></small>
									</c:if>
								</div> --%>
								
								<div class="accordion" id="accordionPanelsStayOpenExample">
									<div class="row" >
										<c:forEach var="section" items="${sectionList}" varStatus="status">
											<div class="accordion-item container-fluid px-5" style="border:none;">
											
												<div class="accordion-header row" id="panelsStayOpen-headingOne" style="width:90%" >
													
														<div class="accordion-button btn" 
															data-bs-toggle="collapse"
															data-bs-target="#panelsStayOpen-collapse${status.index}"
															aria-expanded="true"
															aria-controls="panelsStayOpen-collapseOne"
															style="width:100%; background-color:whitesmoke;color:black">
															<form class="sectionTitleUpdateForm row" action='<c:url value="/class/sectionupdatetitle"/>' method="post" class="sectionTitleUpdateForm" 
															style="font-size: 25px; text-align:left; color:mediumseagreen;">
																<!-- 학생 -->
																<c:if test="${isManager == 'N'.charAt(0)}">	
																	<div class="col-8 p-2">
																		<span class="mr-3">섹션 ${status.index}.</span> 
																		<input type="text" name="sectionTitle" style="border:none; background: transparent; color:mediumseagreen;" disabled="disabled" value="${section.sectionTitle}">
																		<input type="hidden" name="sectionId" value="${section.sectionId}" />
																	</div >
																</c:if>
																<!-- 관리자 -->
																<c:if test="${isManager == 'Y'.charAt(0)}">	
																	<div class="col-8 p-2">
																		<span class="mr-3">섹션 ${status.index}.</span> 
																		<input type="text" name="sectionTitle" style="border:none; background: transparent; color:black;" value="${section.sectionTitle}">
																		<input type="hidden" name="sectionId" value="${section.sectionId}" />
																	</div >
																	<div class="col">
																		<input type="submit" class="btn btn-sm btn-grey" value="수정" style="width:100px; height:35px;font-size:20px;"/>
																		<form>
																			<button type="submit" class="btn btn-sm btn-grey"style="width:100px; height:35px;font-size:20px;" formaction='<c:url value="/class/sectiondelete/${section.sectionId}"/>'>삭제</button>
																		</form>
														
																	</div>
																</c:if>
															</form>
														</div>
													
												</div>
												
												<div id="panelsStayOpen-collapse${status.index}" class="accordion-collapse collapse"
													aria-labelledby="panelsStayOpen-headingOne">
													<div class="accordion-body" style="font-size:20px;">
														<form action='<c:url value="/class/sectionupdatedescription"/>' method="post">
															<input type="hidden" name="sectionId" value="${section.sectionId}" />
															<!-- 학생 -->
															<c:if test="${isManager == 'N'.charAt(0)}">
																<p class="p-2" style="width:70%; border:none; color:black;">
																	${section.sectionDescription}
																</p> 
															</c:if>
															<!-- 관리자 -->
															<c:if test="${isManager == 'Y'.charAt(0)}"> 
																<textarea  wrap="hard" class="form-control" rows="5" id="sectionDescription" name="sectionDescription">${section.sectionDescription}</textarea>	
															</c:if>
															
															
															
															<c:if test="${isManager == 'Y'.charAt(0)}">
																<input type="submit" class="btn btn-sm btn-grey" value="수정" />
															</c:if>
														</form>
														
														<c:forEach var="file" items="${section.fileList}">
															<div class="fileList">
																<a href='<c:url value="/class/filedownload/${file.fileId}"/>'> ${file.fileName} </a>
																<c:if test="${isManager == 'Y'.charAt(0)}">
																	<a href='<c:url value="/class/filedelete/${file.fileId}"/>' class="ml-3 btn btn-sm btn-grey"> 삭제 </a>
																</c:if>
															</div>
														</c:forEach>
														
														<c:if test="${isManager == 'Y'.charAt(0)}">
															<form action='<c:url value="/class/fileupload"/>' method="post" enctype="multipart/form-data">
																<input type="hidden" name="sectionId"  value="${section.sectionId}" /> 
																<input type="file" name="files" multiple/> 
																<input type="submit" value="전송" class="btn btn-sm btn-grey" />
															</form>
														</c:if>
														
														<c:if test="${isManager == 'Y'.charAt(0)}">
															<form action='<c:url value="/class/sectioninsert"/>' method="post">
																<input type="hidden" name="beforeSectionId" value="${section.sectionId}"/>
																<input type="text" class="mr-3" name="sectionTitle" id="sectionTitle"  placeholder="제목 작성" style="width:300px; height:50px;font-size:20px;"/> 
																<input type="text" class="mr-2" name="sectionDescription" id="sectionDescription" placeholder="섹션 설명글 작성"  style="width:300px; height:50px;font-size:20px;"/> 
																<input type="submit" value="섹션 추가" style="width:150px; height:40px;font-size:20px; border:none; background-color:mediumseagreen; color:white;" />
															</form>
															<small id="message" style="color:red; font-size:15px;"></small>
														</c:if>
														
													</div>
												</div>
												
											</div>
										</c:forEach>
									</div>
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

