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
			<td>게시판 번호</td>
			<td>카테고리</td>
			<td>게시글 제목</td>
			<td>게시글 내용</td>
			<td>작성 날짜</td>
			<td>학생 번호</td>
			<td>클래스 번호</td>
		</tr>
		<c:forEach var="board" items="${boardList}">
			<tr>
				<td><a href="../board/detail/${board.boardId}">${board.boardId}</a></td>
				<td>${board.boardCategory}</td>
				<td>${board.boardTitle}</td>
				<td>${board.boardContent}</td>
				<td>${board.createdDate}</td>
				<td>${board.studentId}</td>
				<td>${board.classId}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>