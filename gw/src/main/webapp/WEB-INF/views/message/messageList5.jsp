<!-- 메인화면 쪽지 리스트 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="card-body" style="background: white; height: 170px;">
	<table style="width: 100%">
		<tbody>
			<c:if test="${empty list }">
				<tr>
					<td align="center">받은 쪽지가 존재하지 않습니다.</td>
				</tr>
			</c:if>
			<c:if test="${!empty list }">
				<c:forEach var="messageVo" items="${list }">
					<tr>
						<td>
							<img src="<c:url value='/images/last.JPG'/>">
								${messageVo.sendName} : 
							<c:if test="${messageVo.messageContent.length()>30 }">
								${fn:substring(messageVo.messageContent,0,30) }...
							</c:if>
							<c:if test="${messageVo.messageContent.length()<=30 }">
			                    ${messageVo.messageContent}
							</c:if>
						</td>
					</tr>
				</c:forEach>
			</c:if>
		</tbody>
	</table>
</div>