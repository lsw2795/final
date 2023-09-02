<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/adminTop.jsp"%>    
    
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html></html>
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
		width: 90%;
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

</head>

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
							<td>${tLeaveCount}</td>
							<td>${uLeaveCount}</td>
							<td>${rLeaveCount}</td>
							<td>${rLeaveCount}</td>
						</tr>	
				</table> 
			</div>	

		<div class="search">
			<span style="margin-top:35px; float: left;">조회결과 1건</span>
			<form action="/leave/searchDate.sw" method="post" class="form-search">
				<table class="t-search">
			    	<tr>
			    		<td class="t-search-title">
			    			검색일
			    		</td>
			    		<td class="searchTD">
			    			<input type="date" name="date1"> ~
			    			<input type="date" name="date2">
			    			<select name="dept">
			    				<option value="">모든부서</option>
			    			</select>
			    			<input type="text" name="emp" placeholder="사번/사원명 검색">
				      		<input type="submit" value="검색" style="color: black;">
				      	</td>
				     </tr>
		    	</table>
		    </form>
		</div>    
		
			
			
			
		<div class="list2">
			<c:if test="${!empty commuteList}">
				<div>조회된 결과 ${commuteList.size()}건</div>
			</c:if>
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
							<td>${map['workDate']}</td>
							<td>${map['workInTime']}</td>
							<td>${map['workOutTime']}</td>
							<td>${map['workTime']}</td>
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
		</div>
	</form>
</div>

<%@ include file="../../inc/adminBottom.jsp"%>   