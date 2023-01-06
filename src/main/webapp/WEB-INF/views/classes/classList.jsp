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
	<form action='<c:url value="/class/classlist"/>' method="get">
		<select name="orgName">
			<option value="전체" <c:if test ="${orgName eq '전체'}">selected="selected"</c:if>>전체</option>
			<option value="KOREA SOFTWARE" <c:if test ="${orgName eq 'KOREA SOFTWARE'}">selected="selected"</c:if>>KOREA SOFTWARE</option>
			<option value="한국개발진흥원" <c:if test ="${orgName eq '한국개발진흥원'}">selected="selected"</c:if>>한국개발진흥원</option>
			<option value="삼성 멀티캠퍼스" <c:if test ="${orgName eq '삼성 멀티캠퍼스'}">selected="selected"</c:if>>삼성 멀티캠퍼스</option>
			<option value="한국방송통신대학교" <c:if test ="${orgName eq '한국방송통신대학교'}">selected="selected"</c:if>>한국방송통신대학교</option>
		</select>
		<input type="text" name="className" value="${className}"/>
		<input type="submit" value="검색"/>
	</form>
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
				<td><a href='<c:url value="/attend/attend/${class.classId}"/>'>${class.className}</a></td>
				<td>${class.classHours}시간</td>
				<td>${class.classStartDate}</td>
				<td>${class.classEndDate}</td>
			</tr>
		</c:forEach>
		<tr>
			<td>
				<a href='<c:url value="/class/sectionlist"/>'>자료실</a>
			</td>	
			<td>
				<a href='<c:url value="/attend/reportslist"/>'>휴가 목록 조회</a>
			</td>	
		</tr>
	</table>
</body>
</html>