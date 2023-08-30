<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file='../../inc/adminTop.jsp'%>
<!DOCTYPE html>
<script type="text/javascript">

	function deleteReport() {
		if(confirm("신고 게시물을 삭제하시겠습니까?")){
			location.href = "<c:url value='/admin/adminclub/deleteMulti?clubNo=${param.clubNo}&boardNo=${param.boardNo}'/>"
		}
	}
	
	$(function() {
		$('#btnDel').click(function() {
			confrm('해당 신고 게시물을 삭제하시겠습니까?');
			location.href="<c:url value='/club/deleteClubBoard?clubNo=${param.clubNo}&boardNo=${param.boardNo}'/>"
		});
	});

</script>
<div class="table-responsive scrollbar">
  <table class="table table-hover table-striped overflow-hidden">
    <thead>
      <tr>
      	<th>
      		<div class="check d-flex align-items-center">
                <input class="check-input" id="checkbox-bulk-table-tickets-select" type="checkbox" data-bulk-select='{"body":"table-ticket-body","actions":"table-ticket-actions"' />
            </div>
      	</th>
        <th scope="col">Name</th>
        <th scope="col">Title</th>
        <th scope="col">Date</th>
        <th scope="col">Status</th>
        <th scope="col">Delete</th>
        <th scope="col"><button onclick="deleteReport()" class="btn btn-falcon-primary btn-sm" type="button">삭제</button></th>
      </tr>
    </thead>
    <tbody>
    <!-- 반복 시작  -->
    <c:forEach var="map" items="${list }">
      <tr class="align-middle">
      	<td class="align-middle fs-0 py-3">
		   <div class="form-check mb-0">
		      <input class="form-check-input" type="checkbox" id="table-view-tickets-0" data-bulk-select-row="data-bulk-select-row" />
		   </div>
		</td>
        <td class="text-nowrap">
          <div class="d-flex align-items-center">
            <div class="avatar avatar-xl">
              <div class="avatar-name rounded-circle"><span>${map['IMAGE']}</span></div>
            </div>
            <div class="ms-2">${map['NAME']}</div>
          </div>
        </td>
        <td class="text-nowrap">${map['TITLE']}</td>
        <td class="text-nowrap"><fmt:formatDate value="${map['REGDATE']}" pattern="yyyy-MM-dd"/></td>
        <td>
        	<span class="badge badge rounded-pill d-block p-2 badge-subtle-success">
        	<c:if test="${map['REPORT_STATUS']==1}">
	        	<td>
		        	<span class="badge badge rounded-pill d-block p-2 badge-subtle-success">
		        		대기<span class="ms-1 fas fa-check" data-fa-transform="shrink-2"></span>
		        	</span>
		        </td>
        	</c:if>
        		<span class="ms-1 fas fa-check" data-fa-transform="shrink-2"></span>
        	</span>
        <td>
          <button class="btn btn-falcon-primary btn-sm" id="btnDel" type="button">삭제</button>
        </td>
      </tr>
    </c:forEach>
	<!-- 반복 끝 -->
    </tbody>
  </table>
  <div class="text-center d-none" id="contact-table-fallback">
     <p class="fw-bold fs-1 mt-3">신고 게시물이 없습니다.</p>
 </div>
</div>
	<div class="card-footer d-flex justify-content-center">
        <button class="btn btn-sm btn-falcon-default me-1" type="button" title="Previous" data-list-pagination="prev"><span class="fas fa-chevron-left"></span></button>
           <ul class="pagination mb-0"></ul>
        <button class="btn btn-sm btn-falcon-default ms-1" type="button" title="Next" data-list-pagination="next"><span class="fas fa-chevron-right"></span></button>
    </div>
<%@ include file='../../inc/adminBottom.jsp'%>








