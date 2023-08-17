<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>
<!DOCTYPE html>
<script type="text/javascript">
	$(function () {
		$('input[type=checkbox]').each(function (index) {
			if($(this).is(":checked")==true){
		    	$(this).val();
		    }
		}
		
		$('#edit').click(function() {
			
		});
	});
</script>
		<div class="row gx-3">
              <div class="card admindefault" id="ticketsTable" data-list='{"valueNames":["client","subject","status","priority","agent"],"page":11,"pagination":true,"fallback":"tickets-table-fallback"}'>
                <div class="card-header admindefault border-bottom border-200 px-0">
                  <div class="d-lg-flex justify-content-between">
                    <div class="row flex-between-center gy-2 px-x1">
                      <div class="col-auto pe-0">
                        <h6 class="mb-0">Club List</h6>
                      </div>
                        <div class="col-auto pe-0">
                  <form action='<c:url value='/club/clubList'/>'>
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
                      </div>
                  </form>
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
                      
                      <div class="d-flex align-items-center" id="table-ticket-replace-element">
                        <a href="<c:url value='/club/createClub'/>"><button class="btn btn-falcon-default btn-sm mx-2" type="button"><span class="fas fa-plus" ></span></button></a>
                        <a href="<c:url value='/club/editClub?clubNo=${vo.clubNo }'/>"><button class="btn btn-falcon-default btn-sm mx-2" id="edit" type="button"><span class="fas fa-pen" ></span></button></a>
                      </div>
                  </div>
                </div>
                <div class="card-body p-0">
                  <div class="table-responsive scrollbar">
                    <table class="table table-sm mb-0 fs--1 table-view-tickets">
                      <thead class="text-800 bg-light">
                        <tr>
                          <th class="py-2 fs-0 pe-2" style="width: 28px;">
                            <div class="check d-flex align-items-center">
                              <input class="check-input" id="checkbox-bulk-table-tickets-select" type="checkbox" data-bulk-select='{"body":"table-ticket-body","actions":"table-ticket-actions"' />
                            </div>
                          </th>
                          <th class="sort align-middle ps-2" data-sort="Name">Manager</th>
                          <th class="sort align-middle" data-sort="Club Title" style="min-width:15.625rem">Title</th>
                          <th class="sort align-middle" data-sort="memberCnt">모집인원</th>
                          <th class="sort align-middle" data-sort="Date">Date</th>
                        </tr>
                      </thead>
                      <tbody class="list" id="table-ticket-body">
                          <!-- 반복 시작 -->
                          <c:forEach var="vo" items="${list }">
                          	<c:if test="${vo.secflag=='Y' }">
		                        <tr>
		                          <td class="align-middle fs-0 py-3">
		                            <div class="form-check mb-0">
		                              <input class="form-check-input" type="checkbox" id="table-view-tickets-0" data-bulk-select-row="data-bulk-select-row" />
		                            </div>
		                          </td>
		                          	<td class="align-middle client white-space-nowrap pe-3 pe-xxl-4 ps-2">
			                          <div class="d-flex align-items-center gap-2 position-relative">
			                             <h6 class="mb-0">${vo.manager }</h6>
			                           </div>
			                        </td>
			                        <td class="align-middle subject py-2 pe-4"><a class="fw-semi-bold" href="<c:url value='/club/clubDetail?clubNo=${vo.clubNo }'/>">${vo.title }</a></td>
			                        <td class="align-middle memberCnt pe-4">
			                          	${vo.memLimit }
			                        </td>
			                        <td class="align-middle subscription fs-0 pe-4">
			                          <small class="badge rounded badge-subtle-success"><fmt:formatDate value="${vo.regdate }" pattern="yyyy-MM-dd"/></small> 
			                        </td>
			                      </tr>
                          	</c:if>
                          </c:forEach>
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

<%@ include file="../inc/bottom.jsp" %>