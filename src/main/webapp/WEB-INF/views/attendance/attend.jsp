<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table>
		<tr>
			<td>담당 기관</td>
			<td>클래스 명</td>
			<td>이수 시간</td>
			<td>교육 시작일</td>
			<td>교육 종료일</td>
		</tr>
			<tr>
				<td>${attendVO.attendanceDate}</td>
				<td>${attendVO.inTime}</td>
				<td>${attendVO.outTime}</td>
				<td>${attendVO.status}시간</td>
				<td>${attendVO.studentId}</td>
			</tr>
	</table>
</body>
</html>