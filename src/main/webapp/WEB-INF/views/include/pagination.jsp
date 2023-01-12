<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
	#pagingDiv {
		  place-content: center;
		  height: 100%; 
		}
		
	 #paginBtn { 
	 	  border: none; 
		  background-color: transparent; 
	 	  cursor: pointer; 
	 	} 
	
	.pagination1 {
	  display: flex;
	  flex-direction: row;
	  padding: 24px;
	  border-radius: 6px;
	  box-shadow: 0px 4px 8px 0px rgba(31, 41, 55, 0.14);
	  background-color: #fff;
	  position: relative;
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
	  color: #d1d5db;
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
	  background-color: #4338ca;
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
		  
		  <c:if test="${pager.pageNo > 1}">
			  <button type="button" onclick='location.href="<c:url value='/board/list/1'/>" '  id="paginBtn" class="pagination__arrow">
				    <span class="pagination__arrow-half"></span>
				    <span class="pagination__arrow-half"></span>
			  </button>
		  </c:if>
					  
		<c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}" step="1">
			<c:if test="${pager.pageNo != i}">
				<a href="<c:url value='/board/list/${i}'/>" id="paginBtn" class="pagination__number ">${i}</a>
			</c:if>
			<c:if test="${pager.pageNo == i}">
				<button id="paginBtn" class="pagination__number pagination__number--active">${i}</button>
			</c:if>
		</c:forEach>
		
		<c:if test="${pager.pageNo != pager.endPageNo}">
			  <button type="button" onclick='location.href="<c:url value='/board/list/${pager.endPageNo}'/>" '  id="paginBtn" class="pagination__arrow pagination__arrow--right">
			    <span class="pagination__arrow-half"></span>
			    <span class="pagination__arrow-half"></span>
			  </button>
		  </c:if>
	</div>
</div>

