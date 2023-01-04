<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<table>
	<c:forEach var="file" items="${fileList}">
		<tr>
			<td>
				<a href='<c:url value="/class/filedownload/${file.fileId}"/>'>${file.fileName}</a>
				<a href='<c:url value="/class/filedelete/${sectionId}${file.fileId}"/>'>파일 삭제</a>
			</td>
		</tr>
	</c:forEach>
	<tr>
		<td>
			<form action="/class/fileupload" method="post" enctype="multipart/form-data">
				<input type="hidden" name="sectionId" value="${sectionId}"/>
				파일 선택 : <input type="file" name="file" />
				<input type="submit" value="전송"/>
			</form>
		</td>
	</tr>
</table>