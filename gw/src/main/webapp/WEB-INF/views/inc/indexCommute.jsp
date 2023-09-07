<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div>
	<strong>출근시간 :
	 	<c:if test="${!empty commuteVo.workIn}">
		 	${commuteVo.workIn} 
	 	</c:if>
	 	<c:if test="${empty commuteVo.workIn}">
	 		미출근
	 	</c:if>
	</strong>
</div>
<div>
	<strong>퇴근시간 :
		 <c:if test="${!empty commuteVo.workOut}">
			${commuteVo.workOut}
		 </c:if>
		 
		 <c:if test="${!empty commuteVo.workIn}">
			 <c:if test="${empty commuteVo.workOut}">
			 	미퇴근
			 </c:if>
		 </c:if>
	</strong>
</div>