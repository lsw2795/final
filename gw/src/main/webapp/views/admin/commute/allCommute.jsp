<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/adminTop.jsp"%>    
    
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<link rel="stylesheet" href="<c:url value='/css/adminempform.css'/>">

<head>
<meta charset="UTF-8">
<title>전사원 근태 현황</title>


<style type="text/css">
	.s-container {
		background: white;
		color: black;
		padding: 20px;
	}
	
	.s-container h2 {
		color: black;
	}

	.form-search {
		margin: 30px 0;
	}
	
	.t-search {
		margin: 20px 0 10px;
		width: 85%;
		margin-right: auto;
		text-align: center;
		border-collapse: collapse;
		border: 2px solid rgb(200, 200, 200);
		min-width: 430px;
		float: right;
	}
	
	.t-search tr {
		height: 45px;
	}
	
	.t-search-title {
		background-color: rgb(240, 240, 240);
		width: 200px;
	}
	
	.t-search input {
		vertical-align: middle;
	}
	
	.t-search select[name="date"] {
		height: 30px;
		font-size: 14px;
		border: 1px solid gray;
		border-radius: 4px;
		width: 80px;
		margin-right: 15px;
	}
	
	.t-search input[type="submit"] {
		background: white;
		border: 1px solid gray;
		border-radius: 4px;
		width: 55px;
		height: 31px;
		font-size: 14px;
	}
	
	.stats-List {
		width: 100%;
		margin-bottom: 20px;
		font-size: 14px;
		text-align: center;
		border-collapse: collapse;
		border-top: 2px solid rgb(200, 200, 200);
		border-bottom: 2px solid rgb(200, 200, 200);
	}
	
	.stats-List tr {
		border-top: 1px solid rgb(200, 200, 200);
		height: 45px;
	}
	
	.stats-List tr:hover {
		background-color: rgb(250, 250, 250);
	}
	
	.stats-List th {
		background-color: rgb(240, 240, 240);
	}
	
	.stats-List a {
		text-decoration: none;
		color: black;
		cursor: pointer;
	}
	
	.stats-List span {
		padding: 5px 10px;
		border-radius: 4px;
		border: 1px;
		color: white;
	}
	
	.t-List {
		width: 900px;
	}
	
	.t-List2 {
		width:100%;
		font-size: 14px;
		text-align: center;
		border-collapse: collapse;
		border: 2px solid rgb(200, 200, 200);
		margin-top: 10px;
	}
	
	.t-List2 tr {
		border-top: 1px solid rgb(200, 200, 200);
		height: 45px;
	}
	
	.t-List2 tr:hover {
		background-color: rgb(250, 250, 250);
	}
	
	.t-List2 th {
		background-color: rgb(240, 240, 240);
	}
	
	.t-List2 .th-1 {
		width: 180px;
	}
	
	.t-List2 .th-2 {
		width: 630px;
	}
	
	.t-List2 .th-3 {
		width: 810px;
	}
	
	.t-List2 a {
		text-decoration: none;
		color: black;
		cursor: pointer;
	}
	
	.t-List2 span {
		padding: 5px 10px;
		border-radius: 4px;
		border: 1px;
		color: white;
	}
	
	input::placeholder {
	    color: white;
	    text-align: center;
	}
	
</style>

<script type="text/javascript">
	function pageFunc(curPage){
		$('input[name="currentPage"]').val(curPage);
		$('form[name="frmPage"]').submit();
	}
</script>

</head>


<!-- 페이징 처리 관련 form -->
<form action="<c:url value='/admin/commute/allCommute'/>" 
	name="frmPage" method="post">
	<input type="hidden" name="currentPage">
	<input type="hidden" name="date1" value="${param.date1}"> 
	<input type="hidden" name="date2" value="${param.date2}">
	<input type="hidden" name="deptNo" value="${param.deptNo}">
	<input type="hidden" name="emp" value="${param.emp}">
</form>

<div class="s-container">
			<div>
				<h2>전사원 근태 관리</h1>
			</div>
			<hr>
			
			<div>
				<table class="stats-List">
					<tr>
						<th class="th-1">정상근무</th>
						<th class="th-1">지각</th>
						<th class="th-1">조퇴</th>
						<th class="th-1">총 근무시간</th>
					</tr>
						<tr>
							<td>0</td>
							<td>0</td>
							<td>0</td>
							<td>0</td>
						</tr>	
				</table> 
			</div>	

		<div class="search">
			<span style="margin-top:35px; float: left;">조회결과 ${commuteList.size()}건</span>
			<form action="<c:url value='/admin/commute/allCommute'/>" method="post" class="form-search">
				<table class="t-search">
			    	<tr>
			    		<td class="t-search-title">
			    			검색일
			    		</td>
			    		<td class="searchTD">
			    			<input type="date" name="date1" value="${param.date1}"> ~
			    			<input type="date" name="date2" value="${param.date2}">
			    			<select name="deptNo">
			    				<option value="">모든부서</option>
			    				<c:forEach var="vo" items="${deptList}">
				    				<option value="${vo.deptNo}"  
				    					<c:if test="${vo.deptNo==param.deptNo}">
				    						selected="selected"
				    					</c:if>
				    				>${vo.name}</option>
			    				</c:forEach>
			    			</select>
			    			<input type="text" name="emp" placeholder="사번/사원명 검색" value="${param.emp}">
				      		<input type="submit" value="검색" style="color: black;">
				      	</td>
				     </tr>
		    	</table>
		    </form>
		</div>    
		
			
			
			
		<div class="list2">
			<table  class="t-List2">
				<tr>
					<th class="th-1">사번</th>
					<th class="th-1">부서</th>
					<th class="th-1">직위</th>
					<th class="th-1">이름</th>
					<th class="th-1">근무일</th>
					<th class="th-1">출근시간</th>
					<th class="th-1">퇴근시간</th>
					<th class="th-1">근무시간</th>
					<th class="th-1">근무상태</th>
				</tr>
				<c:if test="${empty commuteList}">
					<tr>
						<td colspan="9">조회된 근무이력이 없습니다.</td>
					</tr>
				</c:if>
				<c:if test="${!empty commuteList}">
					<c:forEach var="map" items="${commuteList}">
						<tr>
							<td>${map['EMP_NO']}</td>
							<td>${map['DEPT_NAME']}</td>
							<td>${map['POSITION_NAME']}</td>
							<td>${map['NAME']}</td>
							<td>${map['WORK_IN']}</td>
							<td>출근시간</td>
							<td>퇴근시간</td>
							<td>근무시간</td>
							<c:choose>
								<c:when test="${map['state']!='정상근무'}">
									<td style="color: red;">${map['state']}</td>
								</c:when>
								<c:otherwise>
									<td>${map['state']}</td>
								</c:otherwise>
							</c:choose>
						</tr>
					</c:forEach>
				</c:if>
			</table>
			
			<div  class="mt-3 card-footer d-flex justify-content-center admindefault">
				<div class="divPage" id="divPage">
					<!-- 페이지 번호 추가 -->		
					<!-- 이전 블럭으로 이동 -->
					<c:if test="${pagingInfo.firstPage>1 }">
						<a href="#" id="prevPage" onclick="pageFunc(${pagingInfo.firstPage-1})">
							<img src="<c:url value='/images/first.JPG'/>">
						</a>
					</c:if>	
									
					<!-- [1][2][3][4][5][6][7][8][9][10] -->
					<c:forEach var="i" begin="${pagingInfo.firstPage }" end="${pagingInfo.lastPage }">		
						<c:if test="${i == pagingInfo.currentPage }">		
							<span id="curPage">${i}</span>
				        	</c:if>
						<c:if test="${i != pagingInfo.currentPage }">		
					        <a href="#" id="otherPage" onclick="pageFunc(${i})">${i}</a>
					    </c:if>   		
					</c:forEach>
					
					<!-- 다음 블럭으로 이동 -->
					<c:if test="${pagingInfo.lastPage < pagingInfo.totalPage }">
				         <a href="#" id="nextPage" onclick="pageFunc(${pagingInfo.lastPage+1})">
							<img src="<c:url value='/images/last.JPG'/>">
						</a>
					</c:if>
					<!--  페이지 번호 끝 -->
				</div>
			</div>
		</div>
</div>

<%@ include file="../../inc/adminBottom.jsp"%>   