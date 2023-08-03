<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="../inc/top.jsp"%>    
<link rel="stylesheet"href="<c:url value='/css/mypageempform.css'/>">    
<div class="row g-0">
   <div class="col-lg-12 pe-lg-2 mb-3">
       <div class="card h-lg-100 overflow-hidden">
          <div class="card-header">
			<h5 class="mb-0"><span class="fas fa-phone" style="margin: 0 10px;"></span>주소록</h5>
  		  </div>
          <div class="card-body py-2">
              <div class="card" id="allContactTable">
                <div class="card-header border-bottom border-200 px-0">
                  <div class="d-lg-flex justify-content-between">
                    <div class="row flex-between-center gy-2 px-x1">
                      <div class="col-auto pe-0">
                        <p class="mb-0">검색</p>
                      </div>
                      <div class="col-md">
                        <form>
	                        <div class="row mb-3 d-flex align-items-center mypageempdiv7">
						    	<div class="col-md-3">
			                       <select class="mypageempborder mypageempsel">
										<option value="">이름</option>
										<option value="">회사</option>
									</select>
	                        	</div>
	                          	<div class="input-group input-search-width">
	                            	<input class="form-control mypageempborder shadow-none search" type="search" aria-label="search" />
	                            	<button class="btn btn-sm btn-outline-secondary border-300 hover-border-secondary">
	                            		<span class="fa fa-search fs--1"></span>
	                            	</button>
	                          </div>
                        	</div>
                        </form>
                      </div>
                    </div>
                    
				      <div class="d-flex align-items-center" id="table-contact-replace-element">
				        <button class="btn btn-falcon-default btn-sm" type="button"><span class="fas fa-plus" data-fa-transform="shrink-3"></span><span class="d-none d-sm-inline-block d-xl-none d-xxl-inline-block ms-1">New</span></button>
				        <button class="btn btn-falcon-default btn-sm mx-2" type="button"><span class="fas fa-external-link-alt" data-fa-transform="shrink-3"></span><span class="d-none d-sm-inline-block d-xl-none d-xxl-inline-block ms-1">Export</span></button>
				        <button class="btn btn-falcon-default btn-sm" type="button"><span class="fas fa-file-import" data--transform="shrink-3"></span><span class="d-none d-sm-inline-block d-xl-none d-xxl-inline-block ms-1">Import</span></button>
				      	<span class="mypagehyphen"></span>
				      </div>
                	</div>
                  </div>
              
                <div class="card-body p-0">
                  <div class="table-responsive scrollbar">
                    <table class="table table-sm table-hover">
						<colgroup>
							<col style="width:5%;" />
							<col style="width:20%;" />
							<col style="width:26%;" />
							<col style="width:15%;" />
							<col style="width:15%;" />
							<col style="width:19%;" />		
						</colgroup>
                      <thead class="adminempthead">
                        <tr style="text-align: center;">
                          <th class="py-2 fs-0 pe-2" style="width: 28px;">
                            <div class="form-check d-flex align-items-center">
                              <input class="form-check-input" id="checkbox-bulk-tickets-select" type="checkbox" data-bulk-select='{"body":"table-contact-body","actions":"table-contact-actions","replacedElement":"table-contact-replace-element"}' />
                            </div>
                          </th>
                          <th class="sort align-middle" scope="col">이름</th>
                          <th class="sort align-middle" scope="col">전화번호</th>
                          <th class="sort align-middle" scope="col">이메일</th>
                          <th class="sort align-middle" scope="col">회사</th>
                          <th class="sort align-middle" scope="col">직급</th>
                        </tr>
                      </thead>
                      <tbody id="table-contact-body">
                        <tr class="mypageemptr">
                          <td class="align-middle fs-0 py-3 align-middle">
                            <div class="form-check mb-0">
                              <input class="form-check-input" type="checkbox" data-bulk-select-row="data-bulk-select-row" />
                            </div>
                          </td>
                          <td class="align-middle"><a href="#">2</a></td>
                          <td class="align-middle">3</td>
                          <td class="align-middle">4</td>
                          <td class="align-middle">5</td>
                          <td class="align-middle">6</td>
                        </tr>
                         
                         <tr class="mypageemptr">
                          <td class="align-middle fs-0 py-3 align-middle">
                            <div class="form-check mb-0">
                              <input class="form-check-input" type="checkbox" data-bulk-select-row="data-bulk-select-row" />
                            </div>
                          </td>
                          <td class="align-middle"><a href="#">2</a></td>
                          <td class="align-middle">3</td>
                          <td class="align-middle">4</td>
                          <td class="align-middle">5</td>
                          <td class="align-middle">6</td>
                        </tr>
                         
                      </tbody>
                    </table>
                    <div class="text-center d-none" id="contact-table-fallback">
                      <p class="fw-bold fs-1 mt-3">No contact found</p>
                    </div>
                  </div>
                </div>
                <div class="card-footer d-flex justify-content-center">
                  <button class="btn btn-sm btn-falcon-default me-1" type="button" title="Previous" data-list-pagination="prev"><span class="fas fa-chevron-left"></span></button>
                  <ul class="pagination mb-0"></ul>
                  <button class="btn btn-sm btn-falcon-default ms-1" type="button" title="Next" data-list-pagination="next"><span class="fas fa-chevron-right"></span></button>
                </div>
       		</div>
          </div>
       </div>
   </div>
</div>
<%@ include file ="../inc/bottom.jsp"%>