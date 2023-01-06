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
		<form action="<c:url value='/vacation/insert'/>" method=post enctype="multipart/form-data">
			<select class="form-select" name="repType">
			    <option>--전체--</option>
			    <option value="qna">외출</option>
			    <option value="community">경조사</option>
			    <option value="study">조퇴</option>
		  	</select>
		  	<div>
		  		
		  	</div>
			<div>
    			<label for="repDate" class="form-label">신청일</label>
   				<input type="text" class="form-control" id="repDate" placeholder="20230105" name="repDate">
		
				<label for="inTime" class="form-label">inTime</label>
   				<input type="text" class="form-control" id="inTime" placeholder="20230105" name="inTime">
   				
   				<label for="outTime" class="form-label">outTime</label>
   				<input type="text" class="form-control" id="outTime" placeholder="20230105" name="outTime">
   				
				<label for="reason">사유</label>
				<textarea class="form-control" rows="5" id="reason" name="reason"></textarea>
				
				<!-- 히든으로 학생아이디 넣어주고  -->
				<label for="rFile">파일: </label>
				<input type="file" class="form-control" id="rFile" name="rFile">
  			</div>
  			<button type="submit">제출</button>
		</form>
	</div>
</body>
</html>