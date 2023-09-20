<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file='../../inc/adminTop.jsp'%>
<!DOCTYPE html>
<!-- 관리자 - 동호회 전체 목록
	-clubController
-->
<link rel="stylesheet" href="<c:url value='/css/adminempform.css'/>">
<script type="text/javascript">
/*$(function () {
		
		 $('#delBt').click(function(){
			var count = $('tbody input[type=checkbox]:checked').length;
			if(count<1){
				alert('삭제하고 싶은 게시글을 먼저 체크하세요');
			}
			
			if(count > 0){
				if(confirm('선택한 동호회를 삭제하시겠습니까?')){
					$('form[name=frmClub]').prop('action', "<c:url value='/admin/adminclub/deleteMulti'/>");
					$('form[name=frmClub]').submit();
				}
			});
		});
	}); */
	
	//동호회 삭제 메서드
	function adminClubDel(clubNo) {
		if(confirm("해당 동호회를 삭제하시겠습니까?")){
			location.href="<c:url value='/admin/adminclub/adminClubDelete?clubNo=" + clubNo + "'/>"
		}
	}
</script>
<style type="text/css">
thead tr th{
	color: black;
	font-variant: bold;
}
</style>
<div class="row gx-3">
    <div class="card admindefault" id="ticketsTable" data-list='{"valueNames":["client","subject","status","priority","agent"],"page":11,"pagination":true,"fallback":"tickets-table-fallback"}'>
        <div class="card-header admindefault border-bottom border-200 px-0">
            <div class="d-lg-flex justify-content-between">
                <div class="row flex-between-center gy-2 px-x1">
                    <div class="col-auto pe-0">
                        <h6 class="mb-0" style="color: black;">사내 동호회 현황</h6>
                    </div>
                    <div class="col-auto pe-0">
                  		<form name="adminClub" action='<c:url value='/admin/adminclub/clubList'/>' method="post">
                          <select name="searchCondition" class="form-select form-select-sm" aria-label="Bulk actions">
	                            <option value="title"
	                            	<c:if test="${param.searchCondition=='title'}">
	                            		selected = "selected"
	                            	</c:if>
	                            >제목</option>
	                            <option value="manager"
                       		        <c:if test="${param.searchCondition=='manager'}">
	                            		selected = "selected"
	                            	</c:if>
	                            >이름</option>
	                            <option value="introduce"
	                            	<c:if test="${param.searchCondition=='introduce'}">
	                            		selected = "selected"
	                            	</c:if>
	                            >소개</option>
                          </select>
                  		</form>
                	</div>
                    <div class="col-auto">
                        <div class="input-group input-search-width">
                          <input class="form-control form-control-sm shadow-none search" type="search" placeholder="Search  by name" aria-label="search" />
                          <button class="btn btn-sm btn-outline-secondary border-300 hover-border-secondary"><span class="fa fa-search fs--1"></span></button>
                        </div>
                    </div>
                </div>
                <div class="border-bottom border-200 my-3"></div>
                <button class="btn btn-sm btn-falcon-default d-xl-none" type="button" data-bs-toggle="offcanvas" data-bs-target="#ticketOffcanvas" aria-controls="ticketOffcanvas"><span class="fas fa-filter" data-fa-transform="shrink-4 down-1"></span><span class="ms-1 d-none d-sm-inline-block">Filter</span></button>
                <div class="bg-300 mx-3 d-none d-lg-block d-xl-none" style="width:1px; height:29px"></div>
                      
                <form name="frmClub" method="post" action="<c:url value='/admin/adminclub/clubDeleteMulti'/>">
                <div class="d-flex align-items-center" id="table-ticket-replace-element"></div>
            </div>
        </div>
        <div class="card-body p-0">
          <div class="table-responsive scrollbar">
            <table class="table table-sm mb-0 fs--1 table-view-tickets">
              <thead class="text-800 bg-light">
                <tr>
                  <th class="sort align-middle ps-2" data-sort="Name">Manager</th>
                  <th class="sort align-middle" data-sort="Club Title" style="min-width:14rem">Title</th>
                  <th class="sort align-middle" data-sort="memberCnt">모집인원</th>
                  <th class="sort align-middle" data-sort="SECFLAG">공개여부</th>                          
                  <th class="sort align-middle" data-sort="Date">Date</th>
                  <th class="sort align-middle" data-sort="Date">삭제</th>
                </tr>
              </thead>
              <tbody class="list" id="table-ticket-body">
               <c:set var="idx" value="0"/>
                  <!-- 반복 시작 -->
                  <c:forEach var="map" items="${list }">
	                  <tr>
	                    	<td class="align-middle client white-space-nowrap pe-3 pe-xxl-4 ps-2">
	                     <div class="d-flex align-items-center gap-2 position-relative">
	                        <h6 style="color: black;" class="mb-0">${map['MANAGER'] }</h6>
	                      </div>
	                   </td>
	                   <td class="align-middle subject py-2 pe-4"><a class="fw-semi-bold" href="<c:url value='/club/clubDetail?clubNo=${map.CLUB_NO}'/>">${map['TITLE']}</a>
	                   	<c:if test="${map['timeNew']==1}">
							&nbsp;&nbsp;
							<span class="badge rounded-pill bg-success position-absolute me-2">
								New
							</span>
						</c:if>
	                   <td class="align-middle memberCnt pe-4">
	                     	${map['MEM_LIMIT'] }
	                   </td>
	                   <td class="align-middle subscription fs-0 pe-4">
	                   	<c:if test="${map['SECFLAG']=='Y' }">
	                   		<span class="badge badge rounded-pill d-block p-2 badge-subtle-success">
	   							공개<span class="ms-1 fas fa-check" data-fa-transform="shrink-3"></span>
							</span>
	                   	</c:if>
	                   	<c:if test="${map['SECFLAG']=='N' }">
	                   		<span class="badge badge rounded-pill d-block p-2 badge-subtle-warning">
	                   			비공개<span class="ms-1 fas fa-user" data-fa-transform="shrink-3"></span>
	                   		</span>
	                   	</c:if>
	                   </td>
	                   <td class="align-middle subscription fs-0 pe-4">
	                     <small class="badge rounded badge-subtle-success"><fmt:formatDate value="${map['REGDATE']}" pattern="yyyy-MM-dd"/></small> 
	                   </td>
	                   <td>
	                   	<button class="btn btn-falcon-default btn-sm" id="delBt" onclick="adminClubDel(${map['CLUB_NO']})" type="button">
	               					<span class="fas fa-trash-alt" data-fa-transform="shrink-3"></span></button>
	                 	</td>
	                 </tr>
                 </c:forEach>
         		</form>
              </tbody>
            </table>
            <div class="text-center d-none" id="tickets-table-fallback">
              <p class="fw-bold fs-1 mt-3">No club found</p>
            </div>
          </div>
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

<%@ include file='../../inc/adminBottom.jsp'%>