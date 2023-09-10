<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="<c:url value='/css/adminempform.css'/>">
<style type = "text/css">
	#calendar {
    background: white;
    padding: 20px;
    width: 100%;
}

	div#dom-dc27c0b8-dabf-405a-865d-4aaf2768bcc7 {
	    display: flex;
	    justify-content: space-between;
	}

	#weather {
	    background: white;
	    text-align: center;
	    padding: 45px;
	    border-radius: 16px;
	    font-weight: bold;
	    font-size: 15px;
	    height: 222px;
	}
	
	div#weather h4 {
	    font-weight: bold;
	    color: black;
	}
	
	#commute{
		width: 100%;
	}
	
	#weatherCard{
		height: 100%;
	}
	
	#pdsCard{
		height: 100%;
	}
	
	#mgWeather{
		margin-top: 35px;
		margin-left: 37px;
	}
	
	.white{
		color: white;
	}
	
	.black{
		color: black !important;
	}
	
	.marginWeather{
		height: 369px;
	}
	
	.card.stat {
   		height: 100%;
	}
	
</style>
<div class="row g-3 mb-3">

   <div class="col-lg-8">
	   <div class="card mb-3 admindefault marginWeather">
	     <div class="card-header">
	       <div class="row flex-between-end">
	         <div class="col-auto align-self-center">
	           <h5 class="mb-0" data-anchor="data-anchor" style="color: black;">근태상태</h5>
	         </div>
	         <div class="col-auto ms-auto">
           	      <a href="<c:url value='/admin/commute/allCommute'/>" 
                   	style="color: black; font-size: 14px;">전사원 근태관리▶</a>
	         </div>
	       </div>
	     </div>
	      <div class="card-body admindefault">
	        <div class="tab-content">
	          <div class="tab-pane preview-tab-pane active" role="tabpanel" aria-labelledby="tab-dom-dc27c0b8-dabf-405a-865d-4aaf2768bcc7" id="dom-dc27c0b8-dabf-405a-865d-4aaf2768bcc7">
	            	<div id="commute">
	            		<c:import url="/inc/indexCommute"/>
	            	</div>
	          </div>
	        </div>
	      </div>
	    </div>
  	</div>
  	
  	
   <div class="col-lg-4">
	   <div id="marginWeather" class="card mb3 admindefault marginWeather">
	     <div class="card-header">
	       <div class="row flex-between-end">
	         <div class="col-auto align-self-center">
	           <h5 class="mb-0" data-anchor="data-anchor" style="color: black;">오늘의 날씨</h5>
	         </div>
	         <div class="col-auto ms-auto">
	         </div>
	       </div>
	     </div>
	      <div class="card-body admindefault">
	        <div id="mgWeather" class="tab-content">
	          <div class="tab-pane preview-tab-pane active" role="tabpanel" aria-labelledby="tab-dom-dc27c0b8-dabf-405a-865d-4aaf2768bcc7" id="dom-dc27c0b8-dabf-405a-865d-4aaf2768bcc7">
	            	<div id="weather">
	            		<c:import url="../inc/weather.jsp"></c:import>
	            	</div>
	          </div>
	        </div>
	      </div>
	    </div>
  	</div>
  	
 </div>
    
   <!-- 사원통계 -->
    <div class="card mb-3 admindefault">
     <c:import url="/admin/employee/empList"></c:import>
    </div>
   
  <div class="card mb-3 admindefault">
		<div class="row row-card-no-pd">
			<div class="col-md-8">
				<div class="card stat">
					<div class="card-body admindefault">
					<h3 style="color: black">Internal Data</h3>
						<div class="progress-card" style="margin-top: 25px">
							<div class="d-flex justify-content-between mb-1">
								<span>오늘/365일</span>
								<span>
								 	 ${((currentDayOfYear/365)*100).intValue()}%(${currentDayOfYear}일) <!-- 소수점 이하를 제거하고 정수로 변환 -->
								 </span>
							</div>
							<div class="progress mb-2" style="height: 10px;">
								<div class="progress-bar bg-success" role="progressbar" style="width: ${((currentDayOfYear/365)*100).intValue()}%" aria-valuenow="78" aria-valuemin="0" aria-valuemax="100" data-toggle="tooltip" data-placement="top" title="78%"></div>
							</div>
						</div>
						<div class="progress-card">
							<div class="d-flex justify-content-between mb-1">
								<span>퇴사율(연간 퇴사자)</span>
								<span> ${((11/allEmpCount)*100).intValue()}%(11명)</span>
							</div>
							<div class="progress mb-2" style="height: 10px;">
								<div class="progress-bar bg-info" role="progressbar" style="width: ${((11/allEmpCount)*100).intValue()}%" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" data-toggle="tooltip" data-placement="top" title="65%"></div>
							</div>
						</div>
						<div class="progress-card">
							<div class="d-flex justify-content-between mb-1">
								<span>입사율(연간 입사자)</span>
								<span>${((46/allEmpCount)*100).intValue()}%(46명)</span>
							</div>
							<div class="progress mb-2" style="height: 10px;">
								<div class="progress-bar bg-primary" role="progressbar" style="width: ${((46/allEmpCount)*100).intValue()}%" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100" data-toggle="tooltip" data-placement="top" title="70%"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card card-stats">
					<div class="card-body admindefault">
						<p class="fw-bold mt-1">Statistic</p>
						<div class="row">
							<div class="col-7 d-flex align-items-center">
								<div class="numbers">
									<p class="card-category">평균연봉</p>
									<span style="font-weight: bold;">${avgSalary}(만)원</span>
								</div>
							</div>
						</div>
						<hr/>
						<div class="row">
							<div class="col-7 d-flex align-items-center">
								<div class="numbers">
									<p class="card-category">총 사원수</p>
									<span style="font-weight: bold;" >${allEmpCount}명</span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
    </div>