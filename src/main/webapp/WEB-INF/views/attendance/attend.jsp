<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<table>
		<tr>
			<td>DAY : </td>
			<td><fmt:formatDate pattern="yyyy년MM월dd" value="${attendVO.attendanceDate}"/> </td>
		</tr>
		<tr>
			<td>start : </td>
			<td><fmt:formatDate pattern="hh:mm:ss" value="${attendVO.inTime}"/> </td>
		</tr>
		<tr>
			<td>out : </td>
			<td><fmt:formatDate pattern="hh:mm:ss" value="${attendVO.outTime}"/> </td>
		</tr>
		<tr>
			<td>시간 차 : </td>
			<td>${result}</td>
		</tr>
	</table>

	<a href='<c:url value="/attend/in"/>'>출근</a>
	<a href='<c:url value="/attend/out"/>'>퇴근</a>
	
	<a href='<c:url value="/reports/write"/>'>휴가신청</a>
	
</body>
</html>