<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	}
	
	#weatherCard{
		height: 100%;
	}
	
	#pdsCard{
		height: 100%;
	}
	
	#mgWeather{
		margin-top: 20px;
	}
</style>
      
         	<div class="row g-3 mb-3">
         	
          <div class="col-lg-8">
            <div class="card">
              <div class="card-header">
                <div class="row flex-between-end">
                  <div class="col-auto align-self-center">
                    <h5 class="mb-0" data-anchor="data-anchor">근무상태</h5>
                  </div>
                  <div class="col-auto ms-auto">
                  	      <a href="<c:url value='/commute/status'/>" 
                   	style="color: black; font-size: 14px;">출/퇴근 현황 ▶</a>
                  </div>
                </div>
              </div>
              <div class="card-body bg-light">
                <div class="tab-content">
                  <div class="tab-pane preview-tab-pane active" role="tabpanel" aria-labelledby="tab-dom-c5b10b85-baad-4da8-b18b-2973cbe42fac" id="dom-c5b10b85-baad-4da8-b18b-2973cbe42fac">
					<c:import url="/inc/indexCommute"/>
                  </div>
                  </div>
                </div>
              </div>
            </div>
            
            
            <div class="col-lg-4">
              <div id="weatherCard" class="card">
                <div class="card-header">
                  <div class="row flex-between-end">
                    <div class="col-auto align-self-center">
                      <h5 class="mb-0" data-anchor="data-anchor">오늘의 날씨</h5>
                    </div>
                    <div class="col-auto ms-auto">
                    </div>
                  </div>
                </div>
                <div  class="card-body bg-light">
                  <div id="mgWeather" class="tab-content">
                    <div class="tab-pane preview-tab-pane active" role="tabpanel" aria-labelledby="tab-dom-5535483d-5d29-436e-9b70-bcac05102f58" id="dom-5535483d-5d29-436e-9b70-bcac05102f58">
		            	<div id="weather">
            				<c:import url="inc/weather.jsp"></c:import>
            			</div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            </div>
   
   
    

    
    
    <div class="card mb-3">
     <div class="card-header">
       <div class="row flex-between-end">
         <div class="col-auto align-self-center">
           <h5 class="mb-0" data-anchor="data-anchor"></h5>
         </div>
         <div class="col-auto ms-auto">
         	<a href="<c:url value='/calendar/fullCalendar'/>">
				캘린더   	
         	</a>	
         </div>
       </div>
     </div>
      <div class="card-body bg-light">
        <div class="tab-content">
          <div class="tab-pane preview-tab-pane active" role="tabpanel" aria-labelledby="tab-dom-dc27c0b8-dabf-405a-865d-4aaf2768bcc7" id="dom-dc27c0b8-dabf-405a-865d-4aaf2768bcc7" style="width:100%;">
            <div class="input-group flex-nowrap" >
            	<c:import url="/indexCalendar"></c:import>
            </div>
          </div>
        </div>
      </div>
   
   	<div class="row g-3 mb-3">
          <div class="col-lg-6">
            <div class="card">
              <div class="card-header">
                <div class="row flex-between-end">
                  <div class="col-auto align-self-center">
                    <h5 class="mb-0" data-anchor="data-anchor">공지사항</h5>
                  </div>
                  <div class="col-auto ms-auto">
                   <a href="<c:url value='/board/noticeList'/>" 
                   	style="color: black; font-size: 14px;">더보기 ▶</a>
                  </div>
                </div>
              </div>
              <div class="card-body bg-light">
                <div class="tab-content">
                  <div class="tab-pane preview-tab-pane active" role="tabpanel" aria-labelledby="tab-dom-c5b10b85-baad-4da8-b18b-2973cbe42fac" id="dom-c5b10b85-baad-4da8-b18b-2973cbe42fac">
					<c:import url="/board/noticeList5"></c:import>
                  </div>
                  </div>
                </div>
              </div>
            </div>
            
            
            <div class="col-lg-6">
              <div class="card">
                <div class="card-header">
                  <div class="row flex-between-end">
                    <div class="col-auto align-self-center">
                      <h5 class="mb-0" data-anchor="data-anchor">결재</h5>
                    </div>
                    <div class="col-auto ms-auto">
                      <a href="<c:url value='/approval/confirmList'/>" 
                   	style="color: black; font-size: 14px;">더보기 ▶</a>
                    </div>
                  </div>
                </div>
                <div class="card-body bg-light">
                  <div class="tab-content">
                    <div class="tab-pane preview-tab-pane active" role="tabpanel" aria-labelledby="tab-dom-5535483d-5d29-436e-9b70-bcac05102f58" id="dom-5535483d-5d29-436e-9b70-bcac05102f58">
						<c:import url="/approval/confirmList5"></c:import>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            </div>
            
            <div class="row g-3 mb-3">
            <div class="col-lg-6">
              <div class="card">
                <div class="card-header">
                  <div class="row flex-between-end">
                    <div class="col-auto align-self-center">
                      <h5 class="mb-0" data-anchor="data-anchor">쪽지함</h5>
                    </div>
                    <div class="col-auto ms-auto">
                    	<a href="<c:url value='/message/messageList'/>" 
                   		style="color: black; font-size: 14px;">더보기 ▶</a>
                    </div>
                  </div>
                </div>
                <div class="card-body bg-light">
                  <div class="tab-content">
                    <div class="tab-pane preview-tab-pane active" role="tabpanel" aria-labelledby="tab-dom-c5b10b85-baad-4da8-b18b-2973cbe42fac" id="dom-c5b10b85-baad-4da8-b18b-2973cbe42fac">
						<c:import url="/message/messageList5"></c:import>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            
            
            
            <div class="col-lg-6">
              <div class="card">
                <div class="card-header">
                  <div class="row flex-between-end">
                    <div class="col-auto align-self-center">
                      <h5 class="mb-0" data-anchor="data-anchor">자료실</h5>
                    </div>
                    <div class="col-auto ms-auto">
	                    <a href="<c:url value='/pds/list'/>"
	                    	style="color: black; font-size: 14px;">
	                    		더보기 ▶
                    </div>
                  </div>
                </div>
                <div class="card-body bg-light">
                  <div class="tab-content">
                    <div class="tab-pane preview-tab-pane active" role="tabpanel" aria-labelledby="tab-dom-c5b10b85-baad-4da8-b18b-2973cbe42fac" id="dom-c5b10b85-baad-4da8-b18b-2973cbe42fac">
						<c:import url="/pds/newFiveList"></c:import>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            
  			</div>
          
  
      
      						<div class="row row-card-no-pd">
							<div class="col-md-4">
								<div class="card">
									<div class="card-body">
										<p class="fw-bold mt-1">프로젝트 진행상황</p>
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
									<div class="card-body">
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
									<div class="card-body">
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