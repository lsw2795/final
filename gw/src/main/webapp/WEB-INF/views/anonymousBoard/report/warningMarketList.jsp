<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file='../../inc/adminTop.jsp'%>
<!DOCTYPE html>
<script type="text/javascript" src = "<c:url value='/js/jquery-3.7.0.min.js'/>"></script>
<script type="text/javascript">
	
	$(function(){
		
		$('#find').click(function(){
			console.log(1);
			$('form[name="market"]').submit();	
		});
		
		var tradeNo = $('#tradeNo').val();
		var reportNo = $('#reportNo').val();
		var name = $('#name').val();
		var empNo = $('#empNo').val();
		var reportDate = $('#reportDate').val();
		
		
		$('.align-middle').click(function(){
			$('#modalDetail').modal("show");
			$('#modalTradeNo').val(tradeNo);
			$('#modalReportNo').val(reportNo);
			$('#modalName').html(name);
			$('#modalEmpNo').html(empNo);
			$('#modalReportDate').html(reportDate);
			$('#modalTradeNo2').html(tradeNo);
		});
		
		$('#x').click(function(){
			$('#modalDetail').modal("hide");
			$("body").removeClass("modal-open");
			$(".modal-backdrop").remove();
		});
		
		$('#showMarket').click(function(){
			var tradeNo = $('#modalTradeNo').val();
			$('#modalDetail').modal("hide");
			$("body").removeClass("modal-open");
			$(".modal-backdrop").remove();
			
			location.href= "<c:url value='/market/marketDetail?tradeNo="+tradeNo+"'/>";
		});
		
		$('#delMarket').click(function(){
			var tradeNo = $('#modalTradeNo').val();
			
			if(confirm("해당 신고 게시물을 삭제하시겠습니까?")){
				$('#modalDetail').modal("hide");
				$("body").removeClass("modal-open");
				$(".modal-backdrop").remove();
				
				location.href = "<c:url value='/report/adminDeleteMarket?tradeNo=" + tradeNo + "'/>";
			} 
		});
	});

</script>
<style type="text/css">
.admin-card{
	 background: white;
	    color: black;
}

a.btn {
   		background: white;
	}

div#tableName {
    margin-left: 54px;
}
</style>
<div class="card admin-card">
<div class="row gx-3">
   <div class="card admin-card admindefault" id="ticketsTable" data-list='{"valueNames":["client","subject","status","priority","agent"],"page":11,"pagination":true,"fallback":"tickets-table-fallback"}'>
     <div class="card-header admindefault border-bottom border-200 px-0">
       <div class="d-lg-flex justify-content-between">
         <div class="row flex-between-center gy-2 px-x1">
           <div class="col-auto pe-0">
             <h6 class="mb-0" style="color: black;">검색</h6>
           </div>
           <div class="col-auto pe-0">
       		<form name="market" action='<c:url value='/report/warningMarketList'/>' method="post">
               <select name="searchCondition" class="form-select form-select-sm" aria-label="Bulk actions">
                  <option value="title"
                  	<c:if test="${param.searchCondition=='title'}">
                  		selected = "selected"
                  	</c:if>
                  >제목</option>
                  <option value="name"
            		        <c:if test="${param.searchCondition=='name'}">
                  		selected = "selected"
                  	</c:if>
                  >이름</option>
               </select>
           </div>
           <div class="col-auto">
               <div class="input-group input-search-width">
                 <input name = "searchKeyword" class="form-control form-control-sm shadow-none search" value="${param.searchKeyword }" type="search" placeholder="Search  by name" aria-label="search" />
                 <button id = "find" class="btn btn-sm btn-outline-secondary border-300 hover-border-secondary"><span class="fa fa-search fs--1"></span></button>
               </div>
           </div>
       	</form>
         </div>
         <div class="border-bottom border-200 my-3"></div>
           <button class="btn btn-sm btn-falcon-default d-xl-none" type="button" data-bs-toggle="offcanvas" data-bs-target="#ticketOffcanvas" aria-controls="ticketOffcanvas"><span class="fas fa-filter" data-fa-transform="shrink-4 down-1"></span><span class="ms-1 d-none d-sm-inline-block">Filter</span></button>
           <div class="bg-300 mx-3 d-none d-lg-block d-xl-none" style="width:1px; height:29px"></div>
	      <div class="d-flex align-items-center" id="table-ticket-replace-element"></div>
	  </div>
	</div>
<div class="card-body p-0">
	<div class="table-responsive scrollbar">
	  <table class="table table-hover table-striped overflow-hidden">
	    <thead class = "align-middle" align="center">
	      <tr>
	        <th width = "25%" scope="col">Name</th>
	        <th width = "45%" scope="col">Title</th>
	        <th width = "15" scope="col">Date</th>
	        <th width = "15" scope="col">Status</th>
	      </tr>
	    </thead>
	    <tbody>
	    <c:set var="idx" value="0"/>
	    <!-- 반복 시작  -->
	    <c:forEach var="map" items="${list }">
	      <tr class = "align-middle" align="center" id="modal">
	      	<td class="align-middle" align="center">
		  		<div class="form-check mb-0">
			     <input type="hidden" id = "reportNo" value="${map['REPORT_NO']}" name="reportNo" >
				 <input type="hidden" id="tradeNo" value="${map['TRADE_NO'] }">
				<div class="d-flex align-items-center" id="tableName">
	            <div class="avatar avatar-xl">
	              <div class="avatar-name rounded-circle">
	              	<img class="avatar-name rounded-circle" src="<c:url value='/images/${map["IMAGE"]}'/>">
	              </div>
	            </div>
	            <input type="hidden" id="name" value="${map['NAME'] }">
	            <input type="hidden" id="empNo" value="${map['EMP_NO']}">
	            <div class="ms-2" >${map['NAME']}</div>
	          </div>
				</div>
			</td>
	      	<td class="text-nowrap">
	          ${map['TITLE']}
	        </td>  
	        <td class="text-nowrap">
	        	<input type="hidden" id = "reportDate" value="<fmt:formatDate value="${map['REPORT_DATE']}" pattern="yyyy-MM-dd"/>">
        		<fmt:formatDate value="${map['REPORT_DATE']}" pattern="yyyy-MM-dd"/>
	        </td>
	        <td>
	          <span class="badge badge rounded-pill d-block p-2 badge-subtle-warning">
				<b class="state">대기</b>
				<span class="ms-1 fas fa-user" data-fa-transform="shrink-2"></span>
				</span>
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
 </div>
 
 
 <div class="modal fade" id="modalDetail" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel"></h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close" id ="x">
                        <span aria-hidden="true">x</span>
                    </button>
                </div>

                <div class="modal-body">
                    <div class="form-group">
                    	<input type="hidden" name="reportNo" id="modalReportNo" >
                    	<input type="hidden" name="tradeNo" id="modalTradeNo">
                    	<label class="fs-0" for="product-name">작성자 : </label> 
                    	<label class="fs-0" for="product-name" id="modalName"> </label><br> 
                    	<label class="fs-0" for="product-name">사원번호 : </label> 
                    	<label class="fs-0" for="product-name" id="modalEmpNo"> </label> <br>
						<label class="fs-0" for="product-name" >글 번호 :</label>
						<label class="fs-0" for="product-name" id = "modalTradeNo2"></label><br>
                		<div class = "mb-3">
	                  	  <label class="fs-0" for="eventStartDate">신고 날짜 :</label>
	                  	  <label class="fs-0" for="eventStartDate" id="modalReportDate"></label>
	                  	</div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary px-4" id="showMarket" >글 보기</button>
                    <button type="button" class="btn btn-primary px-4" id="delMarket">삭제</button>
                </div>
    
            </div>
        </div>
    </div>   
<%@ include file='../../inc/adminBottom.jsp'%>







