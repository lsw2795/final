<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>
<!DOCTYPE html>
<!-- 동호회 게시판 목록
	-clubBoardController
--> 
<div class="row gx-3">
    <div class="card" id="ticketsTable" data-list='{"valueNames":["client","subject","status","priority","agent"],"page":7,"pagination":true,"fallback":"tickets-card-fallback"}'>
        <div class="card-header border-200 px-0">
            <div class="d-lg-flex justify-content-between">
                <div class="row flex-between-center gy-2 px-x1">
                  <div class="col-12 pe-0">
                    <h6 class="mb-0"> 동호회 게시판</h6>
                  </div>
                  <form name="clubBoardFrm" method="post" action="<c:url value='/club/clubBoard?clubNo=${param.clubNo }'/>">
					<div class="row pe-0">
						<div class="col-auto pe-0">
							<select name="searchCondition"
								class="form-select form-select-sm" aria-label="Bulk actions">
								<option value="title"
									<c:if test="${searchVo.searchCondition=='title'}">
			                           	selected = "selected"
			                           </c:if>>제목</option>
								<option value="name"
									<c:if test="${searchVo.searchCondition=='name'}">
			                           	selected = "selected"
			                           </c:if>>작성자</option>
								<option value="content"
									<c:if test="${searchVo.searchCondition=='content'}">
			                           	selected = "selected"
			                           </c:if>>내용</option>
								</select>
							</div>
							<div class="col-auto">
								<div class="input-group input-search-width">
									<input class="form-control form-control-sm shadow-none search"
										type="search" name="searchKeyword"
										placeholder="Search by name" aria-label="search" />
									<button
										class="btn btn-sm btn-outline-secondary border-300 hover-border-secondary">
										<span class="fa fa-search fs--1"></span>
									</button>
								</div>
							</div>
						</div>
					</form>
               </div>
                <div class="border-bottom border-200 my-3"></div>
                <div class="d-flex align-items-center justify-content-between justify-content-lg-end px-x1">
                  <button class="btn btn-sm btn-falcon-default d-xl-none" type="button" data-bs-toggle="offcanvas" data-bs-target="#ticketOffcanvas" aria-controls="ticketOffcanvas"><span class="fas fa-filter" data-fa-transform="shrink-4 down-1"></span><span class="ms-1 d-none d-sm-inline-block">Filter</span></button>
                  <div class="bg-300 mx-3 d-none d-lg-block d-xl-none" style="width:1px; height:29px"></div>
                  	<a href="<c:url value='/club/clubDetail?clubNo=${param.clubNo}'/>">
						<button class="btn btn-falcon-default btn-sm" type="button">
							<span class="fas fa-arrow-left">
							</span>
						</button>
					</a>
                  <div class="d-flex align-items-center" id="table-ticket-replace-element">
	                  <c:if test="${sessionScope.clubNo==param.clubNo}">
	                 	 <a href="<c:url value='/club/clubBoardWrite?clubNo=${param.clubNo}'/>">
	                   		 <button class="btn btn-falcon-default btn-sm mx-2" type="button">
	                    		<span class="fas fa-plus" data-fa-transform="shrink-3">
	                    		</span><span class="d-none d-sm-inline-block d-xl-none d-xxl-inline-block ms-1">New</span>
	                    	</button>
	                    </a>
	                  </c:if>
                  </div>
                </div>
           </div>
        </div>
        <div class="card-body p-0">
            <!-- 반복 시작  -->
            <c:forEach var="map" items="${list }">
              <div class="list bg-light d-flex flex-column gap-3" id="card-ticket-body">
                <div class="bg-white dark__bg-1100 d-md-flex  align-items-center p-x1 rounded-3 shadow-sm card-view-height">
                  <div class="d-flex align-items-start align-items-sm-center">
                    <div class="avatar avatar-xl avatar-3xl">
                      <div class="avatar-name rounded-circle">
                      	<img class="rounded-circle" src="<c:url value='/images/${map["IMAGE"]}'/>">
                      </div>
                    </div>
                    <div class="ms-1 ms-sm-3">
                      <p class="fw-semi-bold mb-3 mb-sm-2">
                      	<a href="<c:url value='/club/clubBoardDetail?clubNo=${param.clubNo}&boardNo=${map.BOARD_NO }'/>">
                      		${map['TITLE']}
                      	</a>
                      	<c:if test="${map['timeNew']==1}">
                        	&nbsp;<small class="badge rounded-pill bg-success position-absolute me-2">New</small>
                        </c:if>
                      </p>
                      <div class="row align-items-center gx-0 gy-2">
                        <div class="col-auto me-2">
                          <h6 class="client mb-0">
                           	<span class="fas fa-user" data-fa-transform="shrink-3 up-1"></span>
                           	<span>${map['NAME']}</span>
                          </h6>
                          <p class="mb-0 fs--2 fs-sm--1 fw-semi-bold mt-2 mt-md-0 mt-xl-2 mt-xxl-0 ms-5"> </p>
                 		<fmt:formatDate value="${map['REGDATE']}" pattern="yyyy-MM-dd"/><span class="mx-1">|</span><fmt:formatDate value="${map['REGDATE']}" pattern="a h:mm"/>
                 		<p class="mb-0 text-700">조회수&nbsp;${map['READCOUNT'] }</p>
                 	
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
	             <div class="text-center d-none" id="tickets-card-fallback">
	               <p class="fw-bold fs-1 mt-3">게시물이 존재하지 않습니다.</p>
	             </div>
             </div>
           </c:forEach>
        </div>
        <div class="card-footer">
          <div class="d-flex justify-content-center">
            <button class="btn btn-sm btn-falcon-default me-1" type="button" title="Previous" data-list-pagination="prev"><span class="fas fa-chevron-left"></span></button>
            <ul class="pagination mb-0"></ul>
            <button class="btn btn-sm btn-falcon-default ms-1" type="button" title="Next" data-list-pagination="next"><span class="fas fa-chevron-right"></span></button>
          </div>
        </div>
    </div>
</div>
<%@ include file="../inc/bottom.jsp" %>