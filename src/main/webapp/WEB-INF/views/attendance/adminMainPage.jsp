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
     	<h2>
     		${classId} 반의 ${yearParam}년 ${monthParam}월의 근태입니다.
     	</h2>
     	<form action='<c:url value="/attend/getAllAttend"/>' method="POST">
     		<select name="yearParam">
		    	<option <c:if test ="${yearParam eq '2013'}">selected="selected"</c:if> value="2013">2013</option>
		    	<option <c:if test ="${yearParam eq '2014'}">selected="selected"</c:if> value="2014">2014</option>
		    	<option <c:if test ="${yearParam eq '2015'}">selected="selected"</c:if> value="2015">2015</option>
		    	<option <c:if test ="${yearParam eq '2016'}">selected="selected"</c:if> value="2016">2016</option>
		    	<option <c:if test ="${yearParam eq '2017'}">selected="selected"</c:if> value="2017">2017</option>
		    	<option <c:if test ="${yearParam eq '2018'}">selected="selected"</c:if> value="2018">2018</option>
		    	<option <c:if test ="${yearParam eq '2019'}">selected="selected"</c:if> value="2019">2019</option>
		    	<option <c:if test ="${yearParam eq '2020'}">selected="selected"</c:if> value="2020">2020</option>
		    	<option <c:if test ="${yearParam eq '2021'}">selected="selected"</c:if> value="2021">2021</option>
	    		<option <c:if test ="${yearParam eq '2022'}">selected="selected"</c:if> value="2022">2022</option>
	    		<option <c:if test ="${yearParam eq '2023'}">selected="selected"</c:if> value="2023">2023</option>
	    	</select>
	    	
	    	<select name="monthParam">
	    		<option <c:if test ="${monthParam eq '1'}">selected="selected"</c:if> value="1">1</option>
	    		<option <c:if test ="${monthParam eq '2'}">selected="selected"</c:if> value="2">2</option>
	    		<option <c:if test ="${monthParam eq '3'}">selected="selected"</c:if> value="3">3</option>
	    		<option <c:if test ="${monthParam eq '4'}">selected="selected"</c:if> value="4">4</option>
	    		<option <c:if test ="${monthParam eq '5'}">selected="selected"</c:if> value="5">5</option>
	    		<option <c:if test ="${monthParam eq '6'}">selected="selected"</c:if> value="6">6</option>
	    		<option <c:if test ="${monthParam eq '7'}">selected="selected"</c:if> value="7">7</option>
	    		<option <c:if test ="${monthParam eq '8'}">selected="selected"</c:if> value="8">8</option>
	    		<option <c:if test ="${monthParam eq '9'}">selected="selected"</c:if> value="9">9</option>
	    		<option <c:if test ="${monthParam eq '10'}">selected="selected"</c:if> value="10">10</option>
	    		<option <c:if test ="${monthParam eq '11'}">selected="selected"</c:if> value="11">11</option>
	    		<option <c:if test ="${monthParam eq '12'}">selected="selected"</c:if> value="12">12</option>
	    	</select>
	    	<input type="submit" value="검색"/>
     	</form>

   		<c:forEach var="attendStat" items="${attendStatList}"> 
   				<div class="card mt-3" style="width: 350px">
			  <div class="card-body">
			    <h4 class="card-title"><a href='<c:url value="/attend/getStudentAttend/${attendStat.studentId}"/>'>${attendStat.studentId}</a></h4>
			    <hr/>
			    <p class="card-text">
				    <ul class="list-group list-group-horizontal">
					  <li class="list-group-item" style="width:25%; border: 0">지각</li>
					  <li class="list-group-item" style="width:25%; border: 0">결석</li>
					  <li class="list-group-item" style="width:25%; border: 0">출석</li>
					</ul>
					<ul class="list-group list-group-horizontal">
					  <li class="list-group-item" style="width:25%; border: 0">${attendStat.lateCount}회</li>
					  <li class="list-group-item" style="width:25%; border: 0">${attendStat.absenceCount}회</li>
					  <li class="list-group-item" style="width:25%; border: 0">${attendStat.attendCount}회</li>
					</ul>
			    </p>
			  </div>
		    </div>

   		</c:forEach>
     </body>
</html>