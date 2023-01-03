<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <meta charset="utf-8">
 <meta name="viewport" content="width=device-width, initial-scale=1">
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<div class="container">
		<form action="<c:url value='/board/insert'/>" method=post enctype="multipart/form-data">
			<select class="form-select mt-3" name="boardCategory">
			    <option value="qna">질문</option>
			    <option value="community">커뮤니티</option>
			    <option value="study">스터디</option>
		  	</select>
			
			<div>
    			<label for="boardTitle" class="form-label">제목:</label>
   				<input type="text" class="form-control" id="boardTitle" placeholder="제목을 입력하세요" name="boardTitle">
		
				<label for="boardContent">내용:</label>
				<textarea class="form-control" rows="5" id="boardContent" name="boardContent"></textarea>
  			</div>
  			<button type="submit">제출</button>
		</form>
	</div>
</body>
</html>