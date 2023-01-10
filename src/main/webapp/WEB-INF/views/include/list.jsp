<%@page contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="sidebar" data-color="orange">
			<!--
        Tip 1: You can change the color of the sidebar using: data-color="blue | green | orange | red | yellow"
    -->
			<div class="logo">
				<a href='<c:url value="/"/>'> <img
					src="<c:url value="/img/songyoung.png"/>"
					style="width: 50%; margin: 0em 3.5em;">
				</a>
			</div>
			<div class="sidebar-wrapper" id="sidebar-wrapper">
				<ul class="nav">
					<li class="mt-3 pt-3 ml-3 text-light font-weight-bold" style="width:50px; border-bottom: 1px solid rgba(255,255,255,0.5);" >출석 </li> 
					<li>
						<a href="./dashboard.html"> 
							<i class="now-ui-icons design_app"></i>
							<p>출석 버튼</p>
						</a>
					</li>
					<li>
						<a href="./dashboard.html"> 
							<i class="now-ui-icons design_app"></i>
							<p>출결 목록</p>
						</a>
					</li>
					<li>
						<a href="./dashboard.html"> 
							<i class="now-ui-icons design_app"></i>
							<p>휴가 신청</p>
						</a>
					</li>
					<li>
						<a href="./dashboard.html"> 
							<i class="now-ui-icons design_app"></i>
							<p>휴가 목록</p>
						</a>
					</li>
					<li class="mt-3 pt-3  ml-3 text-light font-weight-bold" style="width:65px; border-bottom: 1px solid rgba(255,255,255,0.5);">자료실</li>
					<li>
						<a href="#"> 
							<i class="now-ui-icons design_bullet-list-67"></i>
							<p>수업 자료</p>
						</a>
					</li>
					<li class="mt-3 ml-3 pt-3  text-light font-weight-bold" style="width:65px; border-bottom: 1px solid rgba(255,255,255,0.5);">게시판</li>
					<li>
						<a href="#"> 
							<i class="now-ui-icons design_bullet-list-67"></i>
							<p>공지 사항</p>
						</a>
					</li>
					<li>
						<a href="#"> 
							<i class="now-ui-icons design_bullet-list-67"></i>
							<p>커뮤니티</p>
						</a>
					</li>
					<li>
						<a href="#"> 
							<i class="now-ui-icons design_bullet-list-67"></i>
							<p>Q&A</p>
						</a>
					</li>
				</ul>
			</div>
		</div>