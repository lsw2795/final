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
	    padding: 15px;
	    border-radius: 16px;
	    margin-right: 23px;
	    font-weight: bold;
	    font-size: 15px;
	}
	
	div#weather h4 {
	    font-weight: bold;
	}
</style>
   <div class="card mb-3 admindefault">
     <div class="card-header">
       <div class="row flex-between-end">
         <div class="col-auto align-self-center">
           <h5 class="mb-0" data-anchor="data-anchor" style="color: black;">근태관련</h5>
         </div>
         <div class="col-auto ms-auto">
         버튼기능
         </div>
       </div>
     </div>
      <div class="card-body admindefault">
        <div class="tab-content">
          <div class="tab-pane preview-tab-pane active" role="tabpanel" aria-labelledby="tab-dom-dc27c0b8-dabf-405a-865d-4aaf2768bcc7" id="dom-dc27c0b8-dabf-405a-865d-4aaf2768bcc7">
            	<div id="commute">
            	본문
            	</div>
            	<div id="weather">
            		<c:import url="../inc/weather.jsp"></c:import>
            	</div>
          </div>
        </div>
      </div>
    </div>
   
  <div class="card mb-3 admindefault">
     <div class="card-header">
       <div class="row flex-between-end">
         <div class="col-auto align-self-center">
           <h5 class="mb-0" data-anchor="data-anchor" style="color: black;"></h5>
         </div>
         <div class="col-auto ms-auto">
         	<a href="<c:url value='/calendar/fullCalendar'/>" style="color: black;">
				캘린더   	
         	</a>	
         </div>
       </div>
     </div>
      <div class="card-body admindefault">
        <div class="tab-content">
          <div class="tab-pane preview-tab-pane active" role="tabpanel" aria-labelledby="tab-dom-dc27c0b8-dabf-405a-865d-4aaf2768bcc7" id="dom-dc27c0b8-dabf-405a-865d-4aaf2768bcc7" style="width:100%;">
            <div class="input-group flex-nowrap">
            	<c:import url="/indexCalendar"></c:import>
            </div>
          </div>
        </div>
      </div>
      
      						<div class="row row-card-no-pd">
							<div class="col-md-4">
								<div class="card admindefault">
									<div class="card-body admindefault">
										<p class="fw-bold mt-1 admindefault">프로젝트 진행상황</p>
										<h4><b>사내 그룹웨어 개발</b></h4>
										<a href="#" class="btn btn-primary btn-full text-left mt-3 mb-3"><i class="la la-plus"></i> 자세히</a>
									</div>
									<div class="card-footer">
										<ul class="nav">
											<li class="nav-item"><a class="btn btn-default btn-link" href="#"><i class="la la-history"></i> History</a></li>
											<li class="nav-item ml-auto"><a class="btn btn-default btn-link" href="#"><i class="la la-refresh"></i> Refresh</a></li>
										</ul>
									</div>
								</div>
							</div>
							<div class="col-md-5">
								<div class="card">
									<div class="card-body admindefault">
										<div class="progress-card">
											<div class="d-flex justify-content-between mb-1">
												<span class="text-muted">기획팀</span>
												<span class="text-muted fw-bold"> 90%</span>
											</div>
											<div class="progress mb-2" style="height: 7px;">
												<div class="progress-bar bg-success" role="progressbar" style="width: 90%" aria-valuenow="78" aria-valuemin="0" aria-valuemax="100" data-toggle="tooltip" data-placement="top" title="78%"></div>
											</div>
										</div>
										<div class="progress-card">
											<div class="d-flex justify-content-between mb-1">
												<span class="text-muted">디자인팀</span>
												<span class="text-muted fw-bold"> 80%</span>
											</div>
											<div class="progress mb-2" style="height: 7px;">
												<div class="progress-bar bg-info" role="progressbar" style="width: 80%" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" data-toggle="tooltip" data-placement="top" title="65%"></div>
											</div>
										</div>
										<div class="progress-card">
											<div class="d-flex justify-content-between mb-1">
												<span class="text-muted">프론트엔드팀</span>
												<span class="text-muted fw-bold"> 10%</span>
											</div>
											<div class="progress mb-2" style="height: 7px;">
												<div class="progress-bar bg-primary" role="progressbar" style="width: 10%" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100" data-toggle="tooltip" data-placement="top" title="70%"></div>
											</div>
										</div>
										<div class="progress-card">
											<div class="d-flex justify-content-between mb-1">
												<span class="text-muted">백엔드팀</span>
												<span class="text-muted fw-bold"> 10%</span>
											</div>
											<div class="progress mb-2" style="height: 7px;">
												<div class="progress-bar bg-warning" role="progressbar" style="width: 10%" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" data-toggle="tooltip" data-placement="top" title="60%"></div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-md-3">
								<div class="card card-stats">
									<div class="card-body admindefault">
										<p class="fw-bold mt-1">Statistic</p>
										<div class="row">
											<div class="col-5">
												<div class="icon-big text-center icon-warning">
													<i class="la la-pie-chart text-warning"></i>
												</div>
											</div>
											<div class="col-7 d-flex align-items-center">
												<div class="numbers">
													<p class="card-category">전체진행율</p>
													<h4 class="card-title">30%</h4>
												</div>
											</div>
										</div>
										<hr/>
										<div class="row">
											<div class="col-5">
												<div class="icon-big text-center">
													<i class="la la-heart-o text-primary"></i>
												</div>
											</div>
											<div class="col-7 d-flex align-items-center">
												<div class="numbers">
													<p class="card-category">참여사원수</p>
													<h4 class="card-title">6명</h4>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
    </div>