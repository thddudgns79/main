<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
    <head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
		<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	</head>

    <body>
    	<div>신청 번호 : ${reportsVO.repId}</div>
    	<div>신청인 : ${reportsVO.studentId}</div>
    	<div>신청 날짜 : ${repDateStr}</div>
    	<div>신청 유형 : ${reportsVO.repType}</div>
    	<div>불참 시작 :${inTimeStr}</div>
    	<div>불참 종료 : ${outTimeStr}</div>
    	<div>사유 : ${reportsVO.reason}</div>
    	<div>결재 상태 : ${reportsVO.repStatus}</div>
    	<div>
    		<c:forEach var="file" items="${fileList}">
    			<img src='<c:url value="/attend/filedownload/${file.fileId}"/>'/>
    		</c:forEach>
    	</div>
    	<form action='<c:url value="/attend/reportsstatusupdate"/>' method="POST">
    		<input type="hidden" name="repId" value="${reportsVO.repId}"/>
    		<input type="hidden" name="studentId" value="${reportsVO.studentId}"/>
    		<input type="hidden" name="repDateStr" value="${repDateStr}"/> 
    		<input type="hidden" name="repType" value="${reportsVO.repType}"/>
  			<input type="hidden" name="inTimeStr" value="${inTimeStr}"/>
    		<input type="hidden" name="outTimeStr" value="${outTimeStr}"/> 
    		<input type="hidden" name="reason" value="${reportsVO.reason}"/>
    		<input type="hidden" name="repStatus" value="${reportsVO.repStatus}"/>
    	 	<select name="updateRepStatus">
    			<c:if test ="${reportsVO.repStatus eq '승인'}">
    				<option value="반려">반려</option>
    			</c:if>
    			<c:if test ="${reportsVO.repStatus eq '대기'}">
    				<option value="승인">승인</option>
    				<option value="반려">반려</option>
    			</c:if>
    			<c:if test ="${reportsVO.repStatus eq '반려'}">
    				<option value="승인">승인</option>
    			</c:if>
    		</select> 
    		<input type="submit" value="제출"/>
    	</form>
    </body>
</html>