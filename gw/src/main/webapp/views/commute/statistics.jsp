<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>

<style type="text/css">
.t-List {
	font-size: 14px;
	text-align: center;
	border-collapse: collapse;
	border-top: 2px solid rgb(200, 200, 200);
	border-bottom: 2px solid rgb(200, 200, 200);
}

.t-List tr {
	border-top: 1px solid rgb(200, 200, 200);
	height: 45px;
}

.t-List tr:hover {
	background-color: rgb(250, 250, 250);
}

.t-List th {
	background-color: rgb(240, 240, 240);
}

.t-List .th-1 {
	width: 180px;
}

.t-List .th-2 {
	width: 630px;
}

.t-List .th-3 {
	width: 810px;
}

.t-List a {
	text-decoration: none;
	color: black;
	cursor: pointer;
}

.t-List span {
	padding: 5px 10px;
	border-radius: 4px;
	border: 1px;
	color: white;
}

.att-header {
	width: 100%;
	height: 153px;
	margin: 10px 0;
}

.div-time-btn {
	width: 40%;
	height: 100%;
	float: left;
	min-width: 340px;
}

#now-time {
	font-size: 70px;
}

.div-time-btn form {
	display: inline-block;
}

.btn-sub {
	width: 115px;
	height: 60px;
	background: rgb(117, 144, 194);
	border: none;
	border-radius: 4px;
	color: white;
	font-size: 17px;
}

#button1 {
	margin-right: 25px;
}

.div-stats {
	width: 60%;
	height: 100%;
	align-items: flex-end;
	min-width: 515px;
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

.t-search input[name="date"] {
	height: 30px;
	font-size: 14px;
	border: 1px solid gray;
	border-radius: 4px;
	width: 120px;
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

.s-container{
	background: white;
}
</style>

<div class="s-container">
	<!-- 검색일<input type="text" id="searchDate">  -->
	<form action="/attendance/searchDate.sw" method="post">
		<table class="t-search">
			<tr>
				<td class="t-search-title">검색일</td>
				<td><input type="month" id="nowMonth" name="date"> <input
					type="submit" value="검색"></td>
			</tr>
		</table>
	</form>
	<div>
		<table class="t-List">
			<tr>
				<th class="th-1">날짜</th>
				<th class="th-1">출근시간</th>
				<th class="th-1">퇴근시간</th>
				<th class="th-1">근무시간</th>
				<th class="th-1">근무상태</th>
			</tr>
			<tr>
				<td>1</td>
				<td>2</td>
				<td>3</td>
				<td>4</td>
				<td>5</td>
			</tr>
			<tr>
				<td>1</td>
				<td>2</td>
				<td>3</td>
				<td>4</td>
				<td>5</td>
			</tr>
		</table>
	</div>
		<br>
		
		<div class="div-stats">
			<table class="t-List width1">
				<tr>
					<th colspan="3">통계</th>
				</tr>
				<tr>
					<th class="th-1">지각</th>
					<th class="th-1">조퇴</th>
					<th class="th-1">출근</th>
				</tr>
				<tr>
					<td>1</td>
					<td>2</td>
					<td>3</td>
				</tr>
			</table>
		</div>
		
		
</div>



<%@ include file="../inc/bottom.jsp"%>