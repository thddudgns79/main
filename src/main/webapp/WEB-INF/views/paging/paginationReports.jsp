<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
	#pagingDiv {
		  place-content: center; 
		  height: 50px; 
		}
		
	 #paginBtn { 
	 	  border: none; 
		  background-color: transparent; 
	 	  cursor: pointer; 
	 	} 
	
	.pagination1 {
	  display: flex;
	  flex-direction: row;
	  border-radius: 6px;
	  box-shadow: 0px 6px 10px 0px rgba(31, 41, 55, 0.14);
	  background-color: white;
	  position: relative;
	  width: 350px;
	  justify-content: center;
	  align-items: center;
	  color: gray;
	}
	.pagination__number-indicator {
	  position: absolute;
	  height: 2px;
	  background-color: #4338ca;
	  opacity: 0;
	  bottom: 38px;
	  transition: all 0.2s ease;
	}
	.pagination__number {
	  font-weight: 600;
	  font-size: 16px;
	  color: lightgray;
	}
	.pagination__number--active {
	  color: #111827;
	  position: relative;
	}
	.pagination__number, .pagination__arrow {
	  padding: 16px;
	}
	.pagination__arrow--right {
	  transform: scaleX(-1);
	}
	.pagination__arrow:hover .pagination__arrow-half:first-child {
	  transform: translateY(0.5px) rotate(-30deg);
	}
	.pagination__arrow:hover .pagination__arrow-half:last-child {
	  transform: translateY(-0.5px) rotate(30deg);
	}
	.pagination__arrow:active .pagination__arrow-half:first-child, .pagination__arrow--disabled .pagination__arrow-half:first-child {
	  transform: translateY(0) rotate(0);
	}
	.pagination__arrow:active .pagination__arrow-half:last-child, .pagination__arrow--disabled .pagination__arrow-half:last-child {
	  transform: translateY(0) rotate(0);
	}
	.pagination__arrow--disabled .pagination__arrow-half:last-child, .pagination__arrow--disabled .pagination__arrow-half:first-child {
	  opacity: 0.2;
	}
	.pagination__arrow--disabled {
	  pointer-events: none;
	}
	.pagination__arrow-half {
	  width: 9px;
	  height: 2px;
	  border-radius: 1px;
	  background-color: MediumSeaGreen;
	  display: inline-block;
	  position: absolute;
	  transform-origin: 0px;
	  opacity: 1;
	  transition: transform 0.1s ease-in-out, opacity 0.2s ease-in-out;
	}
	.pagination__arrow-half:first-child {
	  transform: translateY(0.5px) rotate(-45deg);
	}
	.pagination__arrow-half:last-child {
	  transform: translateY(-0.5px) rotate(45deg);
  	}
</style>

<div id="pagingDiv" class="d-flex justify-content-center mb-4">
	<div class="pagination1">
		  <span class="pagination__number-indicator"></span>
  	  	  	  
  	  	  	  <button type="button" onclick='location.href="<c:url value='/attend/reportslist/1?classId=${selectedClassId}&yearParam=${yearParam}&monthParam=${monthParam}&repType=${repType}&repStatus=${repStatus}'/>" '  id="paginBtn" style="padding: 16px 16px 16px 0px;">
				    <div class="d-flex">
					    <div class="pagination__arrow" style="padding: 0px;">
						    <span class="pagination__arrow-half"></span>
						    <span class="pagination__arrow-half"></span>
					    </div>
					    <div class="pagination__arrow" style="padding: 0px 0px 0px 4px;">
						    <span class="pagination__arrow-half"></span>
						    <span class="pagination__arrow-half"></span>
					    </div>
				    </div>
			   </button>

			  <c:if test="${pager.groupNo > 1}">
				  <button type="button" onclick='location.href="<c:url value='/attend/reportslist/${pager.startPageNo-5}?classId=${selectedClassId}&yearParam=${yearParam}&monthParam=${monthParam}&repType=${repType}&repStatus=${repStatus}'/>" '  id="paginBtn" class="pagination__arrow">
					    <span class="pagination__arrow-half" style="background-color: #204065;"></span>
					    <span class="pagination__arrow-half" style="background-color: #204065;"></span>
				  </button>
			  </c:if>
						  
			<c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}" step="1">
				<c:if test="${pager.pageNo != i}">
					<a href="<c:url value='/attend/reportslist/${i}?classId=${selectedClassId}&yearParam=${yearParam}&monthParam=${monthParam}&repType=${repType}&repStatus=${repStatus}'/>" id="paginBtn" class="pagination__number ">${i}</a>
				</c:if>
				<c:if test="${pager.pageNo == i}">
					<button id="paginBtn" class="pagination__number pagination__number--active">${i}</button>
				</c:if>
			</c:forEach>
			
			<c:if test="${pager.groupNo < pager.totalGroupNo}">
				  <button type="button" onclick='location.href="<c:url value='/attend/reportslist/${pager.startPageNo+5}?classId=${selectedClassId}&yearParam=${yearParam}&monthParam=${monthParam}&repType=${repType}&repStatus=${repStatus}'/>" '  id="paginBtn" class="pagination__arrow pagination__arrow--right">
				    <span class="pagination__arrow-half" style="background-color: #204065;"></span>
				    <span class="pagination__arrow-half" style="background-color: #204065;"></span>
				  </button>
			  </c:if>
			
			 <button type="button" onclick='location.href="<c:url value='/attend/reportslist/${pager.endPageNo}?classId=${selectedClassId}&yearParam=${yearParam}&monthParam=${monthParam}&repType=${repType}&repStatus=${repStatus}'/>" '   id="paginBtn" style="padding: 16px 0px 16px 16px;">
				    <div class="d-flex">
					    <div class="pagination__arrow pagination__arrow--right" style="padding: 0px 0px 0px 4px;">
						    <span class="pagination__arrow-half"></span>
						    <span class="pagination__arrow-half"></span>
					    </div>
					    <div class="pagination__arrow pagination__arrow--right" style="padding: 0px;">
						    <span class="pagination__arrow-half"></span>
						    <span class="pagination__arrow-half"></span>
					    </div>
				    </div>
			  </button>
	</div>
</div>

