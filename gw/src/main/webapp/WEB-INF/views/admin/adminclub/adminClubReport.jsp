<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file='../../inc/adminTop.jsp'%>
<link rel="stylesheet" href="<c:url value='/css/adminempform.css'/>">
<!DOCTYPE html>
<!-- 관리자 - 동호회 게시판 신고목록
	-clubBoardController
--> 
<script type="text/javascript">
	//다중 삭제
	$(function() {
		$('#delBtn').click(function(){
			var chk=$('tbody input[type=checkbox]:checked').length;
			if(chk<1){
				alert('삭제할 게시물를 선택하세요.');
			}
			
			if(chk > 0){
				if(confirm('선택한 게시물을 삭제하시겠습니까?')){
					$('form[name=frmChk]').prop('action', "<c:url value='/admin/adminclub/deleteMulti'/>");
					$('form[name=frmChk]').submit();
				} // if
			} 
		});
	});
	
	function deleteClubBoard(clubBoardNo) {
		if(confirm("해당 신고 게시물을 삭제하시겠습니까?")){
			location.href = "<c:url value='/admin/adminclub/adminDeleteClubBoard?boardNo=" + clubBoardNo + "'/>";
		} 
	}

</script>
<style type="text/css">
thead{
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
             <h6 class="mb-0" style="color: black;">신고글 현황</h6>
           </div>
           <div class="col-auto pe-0">
       			<form name="adminClub" action='<c:url value='/admin/adminclub/adminClubReport'/>' method="post">
	               <select name="searchCondition" class="form-select form-select-sm" aria-label="Bulk actions">
	                  <option value="title"
	                  	<c:if test="${param.searchCondition=='title'}">
	                  		selected = "selected"
	                  	</c:if>
	                  >제목</option>
	                  <option value="manager"
	            		        <c:if test="${param.searchCondition=='name'}">
	                  		selected = "selected"
	                  	</c:if>
	                  >이름</option>
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
		 <form name="frmChk" method="post" action="<c:url value='/admin/adminclub/deleteMulti'/>">
	     <div class="d-flex align-items-center" id="table-ticket-replace-element"></div>
	  </div>
	</div>
	<div class="card-body p-0">
		<div class="table-responsive scrollbar">
	  		<table class="table table-hover overflow-hidden">
	    		<thead>
			      <tr>
			      	<th>
			      		<div class="check d-flex align-items-center">
			              	<input class="check-input" id="checkbox-bulk-table-tickets-select" type="checkbox" 
			                  	data-bulk-select='{"body":"table-ticket-body","actions":"table-ticket-actions"'/>
			            </div>
			      	</th>
			        <th scope="col">Name</th>
			        <th scope="col">Title</th>
			        <th scope="col">Date</th>
			        <th scope="col">Status</th>
			        <th scope="col">Delete</th>
			        <th scope="col"><button id="delBtn" class="btn btn-falcon-primary btn-sm" type="button">삭제</button></th>
			      </tr>
			    </thead>
			    <tbody>
			    <c:set var="idx" value="0"/>
				    <!-- 반복 시작  -->
				    <c:forEach var="map" items="${list }">
				      <tr class="align-middle">
				      	<td class="align-middle fs-0 py-3">
					  		<div class="form-check mb-0">
						     <input class="form-check-input" type="checkbox" id="table-view-tickets-0" 
						     data-bulk-select-row="data-bulk-select-row"
						     name="clubBoardItems[${idx }].boardNo"
						     value="${map['BOARD_NO']}" />
						     <input type="hidden" value="${map['CLUB_NO']}" name="clubBoardItems[${idx }].clubNo" >
							</div>
						</td>
				      	<td class="text-nowrap">
				          <div class="d-flex align-items-center">
				            <div class="avatar avatar-xl">
				              <div class="avatar-name rounded-circle">
				              	<img class="avatar-name rounded-circle" src="<c:url value='/images/${map["IMAGE"]}'/>">
				              </div>
				            </div>
				            <div class="ms-2">${map['NAME']}</div>
				          </div>
				        </td>  
				        <td class="text-nowrap">
				        	<a href="<c:url value='/club/clubBoardDetail?clubNo=${map.CLUB_NO}&boardNo=${map.BOARD_NO }'/>">
				        		${map['TITLE']}
				        	</a>
				        </td>
				        <td class="text-nowrap"><fmt:formatDate value="${map['REPORT_DATE']}" pattern="yyyy-MM-dd"/></td>
				        <td>
					       <c:if test="${map['REPORT_STATUS']==0}">
							   <span class="badge badge rounded-pill d-block p-2 badge-subtle-warning">
							       대기<span class="ms-1 fas fa-check" data-fa-transform="shrink-2"></span>
							   </span>
					       </c:if>
						</td>
				        <td>
				          <button class="btn btn-falcon-primary btn-sm" onclick="deleteClubBoard(${map['BOARD_NO']})" type="button">
				          	<span class="fas fa-trash-alt"></span>
				          </button>
				        </td>
				      </tr>
				      <c:set var="idx" value="${idx+1}"/>
				    </c:forEach>
					<!-- 반복 끝 -->
			    </tbody>
			  </table>
			 <div class="text-center d-none" id="tickets-table-fallback">
			     <p class="fw-bold fs-1 mt-3">신고 게시물이 없습니다.</p>
			 </div>
			</form>	 
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







