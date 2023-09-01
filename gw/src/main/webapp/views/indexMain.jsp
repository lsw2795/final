<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style type = "text/css">
	#calendar {
    background: white;
    padding: 20px;
    width: 100%;
}
</style>
   <div class="card mb-3">
     <div class="card-header">
       <div class="row flex-between-end">
         <div class="col-auto align-self-center">
           <h5 class="mb-0" data-anchor="data-anchor">근태관련</h5>
         </div>
         <div class="col-auto ms-auto">
         여기에 버튼 필요하면 쓰세영 빼도되는기능임
         </div>
       </div>
     </div>
      <div class="card-body bg-light">
        <div class="tab-content">
          <div class="tab-pane preview-tab-pane active" role="tabpanel" aria-labelledby="tab-dom-dc27c0b8-dabf-405a-865d-4aaf2768bcc7" id="dom-dc27c0b8-dabf-405a-865d-4aaf2768bcc7">
            <div class="input-group flex-nowrap">
            여기가 본문들어감
            
            
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
                      여기에 버튼 필요하면 쓰세영 빼도되는기능임
                    </div>
                  </div>
                </div>
                <div class="card-body bg-light">
                  <div class="tab-content">
                    <div class="tab-pane preview-tab-pane active" role="tabpanel" aria-labelledby="tab-dom-5535483d-5d29-436e-9b70-bcac05102f58" id="dom-5535483d-5d29-436e-9b70-bcac05102f58">

						본문자리
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
                    버튼기능
                    </div>
                  </div>
                </div>
                <div class="card-body bg-light">
                  <div class="tab-content">
                    <div class="tab-pane preview-tab-pane active" role="tabpanel" aria-labelledby="tab-dom-c5b10b85-baad-4da8-b18b-2973cbe42fac" id="dom-c5b10b85-baad-4da8-b18b-2973cbe42fac">
					본문


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
                    버튼기능
                    </div>
                  </div>
                </div>
                <div class="card-body bg-light">
                  <div class="tab-content">
                    <div class="tab-pane preview-tab-pane active" role="tabpanel" aria-labelledby="tab-dom-5535483d-5d29-436e-9b70-bcac05102f58" id="dom-5535483d-5d29-436e-9b70-bcac05102f58">
					본문


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
    </div>