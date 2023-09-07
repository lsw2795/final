<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div>
	<h3>출근시간 :
	 	<c:if test="${!empty commuteVo.workIn}">
		 	${commuteVo.workIn} 
	 	</c:if>
	 	<c:if test="${empty commuteVo.workIn}">
	 		미출근
	 	</c:if>
	</h3>
</div>
<div>
	<h3>퇴근시간 :
		 <c:if test="${!empty commuteVo.workOut}">
			${commuteVo.workOut}
		 </c:if>
		 
		 <c:if test="${!empty commuteVo.workIn}">
			 <c:if test="${empty commuteVo.workOut}">
			 	미퇴근
			 </c:if>
		 </c:if>
	</h3>
</div>
<div>
	<h3>근태상태 :
		 <c:if test="${commuteVo.commuteState==0}">
			정상출근
		 </c:if>
		 <c:if test="${commuteVo.commuteState==1}">
			지각
		 </c:if>
		 <c:if test="${commuteVo.commuteState==2}">
			조퇴
		 </c:if>
		 <c:if test="${commuteVo.commuteState==3}">
			지각 & 조퇴
		 </c:if>
	</h3>
</div>