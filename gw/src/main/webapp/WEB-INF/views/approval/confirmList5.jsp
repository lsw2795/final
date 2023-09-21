<!-- 메인 결재문서 리스트 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script src="<c:url value='/js/approval.js'/>"></script>
<div class="card-body pt-2" style="background: white; height: 170px;">
	<table style="width: 100%">
		<tbody>
			<c:if test="${empty list }">
				<tr>
					<td align="center">작성한 결재 문서가 존재하지 않습니다.</td>
				</tr>
			</c:if>
			<c:if test="${!empty list }">
				<c:forEach var="map" items="${list }">
					<tr>
						<td>
							<img src="<c:url value='/images/last.JPG'/>">
							<a href="#" style="text-decoration: none; color:#5e6e82;"
								onclick="approvalDetail('${map['CONFIRM_DOCUMENT_NO']}','${title }')">
								<c:if test="${map['CONFIRM_TITLE'].length()>30 }">
									 ${fn:substring(map['CONFIRM_TITLE'],0,30) }...
								</c:if>
								<c:if test="${map['CONFIRM_TITLE'].length()<=30 }">
			                    	${map['CONFIRM_TITLE']}
								</c:if>
							</a>
						</td>
						<td align="right">
							<c:if test="${map['STATE']=='반려' }">
							    <span class="badge badge rounded-pill p-2 badge-subtle-warning">
							    	<b class="state">${map['STATE']}</b>
							    	<span class="ms-1 fas fa-ban" data-fa-transform="shrink-2"></span>
								</span>
							</c:if> 
							<c:if test="${map['STATE']=='완료' }">
							    <span class="badge badge rounded-pill p-2 badge-subtle-success">
									<b class="state">${map['STATE']}</b>
									<span class="ms-1 fas fa-check" data-fa-transform="shrink-2"></span>
								</span>
							</c:if>
							<c:if test="${map['STATE']!='완료' and map['STATE']!='반려' }">
								<span class="badge badge rounded-pill p-2 badge-subtle-primary">
							    	<b class="state">${map['STATE']}</b>
							    	<span class="ms-1 fas fa-user" data-fa-transform="shrink-2"></span>
								</span>
							</c:if>
						</td>
					</tr>
				</c:forEach>
			</c:if>
		</tbody>
	</table>
</div>