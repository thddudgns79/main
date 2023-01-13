<%@ page contentType="text/html; charset=utf-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%
	Date nowTime = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyy년 MM월 dd일 ");
%>
<!-- FOOTER -->
<footer class="footer">
	<div class=" container-fluid ">
		<nav>
			<ul>
				<li><a href="#"><i class="bi bi-house-fill"></i> YONG SOUNG </a></li>
				<li><a href="https://github.com/oti-project3/main"><i class="bi bi-github "></i> Git Hub </a></li>
				<li> &nbsp;&nbsp;&nbsp;<%=sf.format(nowTime)%></li>
			</ul>
		</nav>
	</div>
</footer>