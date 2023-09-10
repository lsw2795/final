<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../inc/top.jsp"%>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
	$(document).ready(function() {
	    var savedDate = localStorage.getItem("savedSearchDate");
	    if (savedDate) {
	        $("#nowMonth").val(savedDate);
	    }

	    // 검색 버튼 클릭 이벤트
	    $("#searchForm").submit(function(event) {
	        // 검색 일자를 로컬 스토리지에 저장
	        var searchDate = $("#nowMonth").val();
	        localStorage.setItem("savedSearchDate", searchDate);
	    });
	    
	});
	    

	
	window.onload = function() {
		const ctx = document.getElementById('myChart');
		
		new Chart(ctx, {
		  type: 'bar',
		  data: {
		    labels: ['회의실', '노트북', '차량'],
		    datasets: [{
		      label: '월별 자원 예약 통계',
		      data: [${meetingRoom.size()}, ${noteBook.size()}, ${rentCar.size()}],
		      borderWidth: 1
		    }]
		  },
		  options: {
		    scales: {
		      y: {
		        beginAtZero: true
		      }
		    }
		  }
		});
		
	}
	
</script>



<style type="text/css">
.t-List {
	font-size: 14px;
	text-align: center;
	border-collapse: collapse;
	border: 2px solid rgb(200, 200, 200);
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




.t-List2 {
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

.s-container {
	background: white;
	width: 1170px;
	padding: 20px;
	
}


.chart {
    width: 40%;
    float: left;
}

.divSearch {
    float: right;
    width: 40%;
}

.list1 {
    float: right;
    width: 40%;
}

.list2 {
    clear: both;
    padding-top: 30px;
}

table.t-List2 {
    width: 100%;
}

#myChart {
    height: 421px !important;
    width: 669px !important;
}

table.t-List.width1 {
    width: 431px;
}

.search {
    padding-top: 155px;
    margin-left: 50px;
}
</style>


<div class="s-container">
		<h2 style="margin-left: 20px;">자원별 예약 통계</h1>
		<hr>
	<!-- 검색일<input type="text" id="searchDate">  -->
		<!--차트가 그려질 부분-->
		<div class="chart">
			<canvas id="myChart"></canvas>
		</div>
		
<%-- 		<div class="search">
			<div class="divSearch">
				<form id="searchForm" action="<c:url value='/admin/officeProduct/staticProductList'/>" method="post">
					<table class="t-search">
						<tr>
							<td class="t-search-title">검색일</td>
							<td><input type="month" id="nowMonth" name="regdate"> <input
								type="submit" value="검색"></td>
						</tr>
					</table>
				</form>
			</div>
			
			<div  class="list1">
				<table class="t-List width1">
					<tr>
						<th colspan="4">통계</th>
					</tr>
					<tr>
						<th class="th-1">회의실</th>
						<th class="th-1">노트북</th>
						<th class="th-1">차량</th>
						<!-- <th class="th-1">총 근무시간</th> -->
					</tr>
					<c:choose>
						<c:when test="${empty meetingRoom || empty noteBook || empty rentCar}">
							<tr>
								<td>0</td>
								<td>0</td>
								<td>0</td>
							<!-- 	<td>0</td> -->
							</tr>
						</c:when>
					 	<c:otherwise>
					 		<tr>
								<td>${meetingRoom.size()}</td>
								<td>${noteBook.size()}</td>
								<td>${rentCar.size()}</td>
								<td>${TotalWorkTimeOfMonth}<c:if
										test="${!empty TotalWorkTimeOfMonth}">h</c:if></td>
							</tr>
					 	</c:otherwise>
					</c:choose>
				</table>
			</div>
		</div> --%>
		
		<%-- <div class="list2">
			<c:if test="${!empty meetingRoom || !empty noteBook || !empty rentCar}">
				<div>조회된 결과 ${commuteList.size()}건</div>
			</c:if>
			<table  class="t-List2">
				<tr>
					<th class="th-1">날짜</th>
					<th class="th-1">회의실</th>
					<th class="th-1">노트북</th>
					<th class="th-1">차량</th>
					<!-- <th class="th-1">근무상태</th> -->
				</tr>
				<c:if test="${empty meetingRoom || empty noteBook || empty rentCar}">
					<tr>
						<td colspan="5">조회된 근무이력이 없습니다.</td>
					</tr>
				</c:if>
				<c:if test="${!empty meetingRoom || !empty noteBook || !empty rentCar}">
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
		</div> --%>
</div>



<%@ include file="../../inc/bottom.jsp"%>