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
			<td>클래스 번호</td>
			<td>담당 기관</td>
			<td>클래스 명</td>
			<td>이수 시간</td>
			<td>교육 시작일</td>
			<td>교육 종료일</td>
		</tr>
		<c:forEach var="class" items="${classList}">
			<tr>
				<td>${class.classId}</td>
				<td>${class.orgName}</td>
				<td>${class.className}</td>
				<td>${class.classHours}시간</td>
				<td>${class.classStartDate}</td>
				<td>${class.classEndDate}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>