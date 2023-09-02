<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전사원 근태 현황</title>
<style type="text/css">
	.form-search {
		margin: 30px 0;
	}
	.t-search {
		margin: 20px 0 10px;
		width: 50%;
		margin-right: auto;
		text-align: center;
		border-collapse: collapse;
    	border: 2px solid rgb(200, 200, 200);
    	min-width: 430px;
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
	.stats-List{
		width: 900px;
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
	</style>

<link href="/resources/css/approval/appList-style.css" rel="stylesheet">
</head>
<body>

<div class="s-container">
	<form action="/leave/searchDate.sw" method="post" class="form-search">
		<table class="t-search">
	    	<tr>
	    		<td class="t-search-title">
	    			검색일
	    		</td>
	    		<td>
		      		<jsp:useBean id="now" class="java.util.Date" />
					<fmt:formatDate value="${now}" pattern="yyyy" var="yearStart"/>
					<select id="s-condition" name="date">
						<option value="">선택</option>
						<c:forEach begin="0" end="${yearStart - 1980}" var="result" step="1">
							<option value="<c:out value="${yearStart-result}" />" <c:if test="${yearStart-result == detail.U_YEAR}"> selected="selected"</c:if>><c:out value="${yearStart-result}" /></option>
						</c:forEach>
					</select>
		      		<input type="submit" value="검색" class="btn-search">
		      	</td>
		     </tr>
    	</table>
    </form>
	<form action="/leave/leaveStatsView.sw" method="GET">
		<div>
			<table class="stats-List">
				<tr>
					<th class="th-1">총연차</th>
					<th class="th-1">사용연차</th>
					<th class="th-1">잔여연차</th>
				</tr>
					<tr>
						<td>${tLeaveCount}</td>
						<td>${uLeaveCount}</td>
						<td>${rLeaveCount}</td>
					</tr>	
			</table> 
			<h2 id="h-title" align="center">${year }년도 조회</h2>
			<button id="app-btn" type="button" onclick="location.href='/approval/docWriteView.sw?formNo=3'">연차신청</button><br>
		</div>
		
		<div><br>
			<table class="t-List">
				<tr>
					<th class="th-1">No</th>
					<th class="th-1">휴가종류</th>
					<th class="th-1">사용일자</th>
					<th class="th-1">사용일수</th>
				</tr>
				
					<c:forEach items="${lList }" var="leaveList" varStatus="status">
						<tr>
							<td>${status.count }</td>
							<td>${leaveList.leaveType }</td>
							<c:if test="${leaveList.leaveType != '반차'}">
								<td>${leaveList.leaveStart }~${leaveList.leaveEnd }</td>
							</c:if>
							<c:if test="${leaveList.leaveType == '반차'}">
								<td>${leaveList.leaveStart } ${leaveList.leaveTime }</td>
							</c:if>
							<td>${leaveList.leaveDay }</td>
						</tr>
					</c:forEach>
				
				<c:if test="${empty lList }">
					<tr>
						<td colspan='4'>검색된 휴가가 없습니다</td>
					</tr>
				</c:if>
				
			</table>
		</div>	
		
	</form>
</div>
</body>
</html>
