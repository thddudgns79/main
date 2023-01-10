<%@page contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="sidebar" data-color="yellow">
	<div class="logo">
		<a href='<c:url value="/"/>'> <img
			src="<c:url value="/img/songyoung.png"/>"
			style="width: 50%; margin: 0em 3.5em;">
		</a>
	</div>
	<div class="sidebar-wrapper" id="sidebar-wrapper">
		<ul class="nav">
			<li class="pt-3 ml-3 text-light font-weight-bold" style="width:50px; border-bottom: 1px solid rgba(255,255,255,0.5);" >출석 </li> 
			<!-- 학생 -->
			<c:if test="${isManager == 'N'.charAt(0)}">
				<li>
					<a href='<c:url value="/attend/today"/>'> 
						<i class="now-ui-icons design_app"></i>
						<p>출퇴근</p>
					</a>
				</li>
				
				<li>
					<a href='<c:url value="/attend/getStudentAttend/${stdId}"/>'> 
						<i class="now-ui-icons design_app"></i>
						<p>근태 조회</p>
					</a>
				</li>
			
				<li>
					<a href='<c:url value=""/>'> 
						<i class="now-ui-icons design_app"></i>
						<p>휴가 신청</p>
					</a>
				</li>
				
				<li>
					<a href='<c:url value="/attend/studentreportslist"/>'> 
						<i class="now-ui-icons design_app"></i>
						<p>휴가 목록</p>
					</a>
				</li>
			</c:if>
			
			<!-- 관리자 -->
			<c:if test="${isManager == 'Y'.charAt(0)}">
				<li>
					<a href='<c:url value="/class/classlistdefault"/>'> 
						<i class="now-ui-icons design_app"></i>
						<p>클래스 목록</p>
					</a>
				</li>
			
				<li>
					<a href='<c:url value="/attend/reportslist"/>'> 
						<i class="now-ui-icons design_app"></i>
						<p>휴가 결재</p>
					</a>
				</li>
			</c:if>
			
			<!-- 자료실/커뮤니티 -> session에 classId 존재해야함-->
			<c:if test="${classId != null}">
				<li>
					<a href='<c:url value="/attend/getAllAttend/${classId}"/>'> 
						<i class="now-ui-icons design_app"></i>
						<p>반 근태 조회</p>
					</a>
				</li>
				<li class="pt-3  ml-3 text-light font-weight-bold" style="width:65px; border-bottom: 1px solid rgba(255,255,255,0.5);">자료실</li>
				<li>
					<a href='<c:url value="/class/sectionlist"/>'>
						<i class="now-ui-icons design_bullet-list-67"></i>
						<p>수업 자료</p>
					</a>
				</li>
			</c:if>
			
			<li class="ml-3 pt-3  text-light font-weight-bold" style="width:65px; border-bottom: 1px solid rgba(255,255,255,0.5);">게시판</li>
			<li>
				<a href='<c:url value=""/>'>
					<i class="now-ui-icons design_bullet-list-67"></i>
					<p>공지 사항</p>
				</a>
			</li>
			<c:if test="${classId != null}">
				<li>
					<a href='<c:url value="/board/list"/>'>
						<i class="now-ui-icons design_bullet-list-67"></i>
						<p>커뮤니티</p>
					</a>
				</li>
			</c:if>
			<li>
				<a href='<c:url value=""/>'> 
					<i class="now-ui-icons design_bullet-list-67"></i>
					<p>Q&A</p>
				</a>
			</li>
		</ul>
	</div>
</div>


