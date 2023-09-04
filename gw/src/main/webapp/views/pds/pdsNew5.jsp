<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="card-body" style="background: white;">
	<table summary="최근 자료실 게시글 5건을 보여주는 표입니다.">
		<colgroup>
			<col style="width: 100%;" />
		</colgroup>	
		<tbody>
			<c:if test="${empty list}">
				<tr>
					<td>데이터가 없습니다</td>
				</tr>
			</c:if>
			<c:if test="${!empty list}">
				<c:forEach var="vo" items="${list}">
					<tr>
						<td>
							<img src="<c:url value='/images/last.JPG'/>">
							<a href="<c:url value='/pds/detail?boardNo=${vo.boardNo}'/>" style="text-decoration: none; color:#5e6e82;">
								${vo.title}
							</a>
							<img src="<c:url value='/images/file.gif'/>">
						</td>
					</tr>
				</c:forEach>			
			</c:if>
		</tbody>
	</table>
</div>

