<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setBundle basename="i18n/board"/>
<%
response.setStatus(200);
%>
<!DOCTYPE html>
<html>
	<head>
      <meta charset="UTF-8">
      <title>Insert title here</title>
      <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
      <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
      <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
   </head>
   
	<body>
		<div class="container">
			<div class="content">
				<div class="jumbotron">
					<h2 style="color:red;"><fmt:message key="${message}"/></h2>
					<p>
					 
						Failed URL : ${url}
						Exception : ${exception.message}
						<c:forEach items="${exception.stackTrace}" var="ste"> 
							${ste}
						</c:forEach>
					 
					 </p>
					 <p><a class="btn btn-primary btn-lg" href='<c:url value="/"/>' role="button">
					 	<fmt:message key="HOME"/>
					 </a></p>
				</div>
			</div>
		</div>
	</body>
</html>