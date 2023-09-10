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
	                    </a>
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
          
  
    </div>