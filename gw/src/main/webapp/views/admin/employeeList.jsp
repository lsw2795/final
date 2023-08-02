<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file='../inc/adminTop.jsp'%>
<link rel="stylesheet" href="<c:url value='/css/adminform.css'/>">    
<div class="row g-0">
   <div class="col-lg-12 pe-lg-2 mb-3">
       <div class="card h-lg-100 overflow-hidden">
          <div class="card-header admindefault">
			<h5 class="mb-0 admindefault"><span class="fas fa-user" style="margin: 0 10px;"></span>사원 목록</h5>
  		  </div>
          <div class="card-body py-2 admindefault">
              <div class="card admindefault" id="allContactTable">
                <div class="card-header border-bottom border-200 px-0 admindefault">
                  <div class="d-lg-flex justify-content-between admindefault">
                    <div class="row flex-between-center gy-2 px-x1">
                      <div class="col-auto pe-0 admindefault">
                        <p class="mb-0 admindefault">검색</p>
                      </div>
                      <div class="col-md">
                        <form>
	                        <div class="row mb-3 d-flex align-items-center adminempdiv7">
						    	<div class="col-md-4">
			                       <select class="admindefault adminempborder adminempsel">
										<option value="">부서</option>
										<option value="">이름</option>
										<option value="">직급</option>
										<option value="">재직여부</option>
									</select>
	                        	</div>
	                          	<div class="input-group input-search-width admindefault">
	                            	<input class="form-control adminempborder shadow-none search admindefault" type="search" aria-label="search" />
	                            	<button class="btn btn-sm btn-outline-secondary border-300 hover-border-secondary admindefault">
	                            		<span class="fa fa-search fs--1"></span>
	                            	</button>
	                          </div>
                        	</div>
                        </form>
                      </div>
                    </div>
                    
				      <div class="d-flex align-items-center admindefault" id="table-contact-replace-element">
				        <button class="btn btn-falcon-default btn-sm admindefault" type="button"><span class="fas fa-plus" data-fa-transform="shrink-3"></span><span class="d-none d-sm-inline-block d-xl-none d-xxl-inline-block ms-1">New</span></button>
				        <button class="btn btn-falcon-default btn-sm mx-2 admindefault" type="button"><span class="fas fa-external-link-alt" data-fa-transform="shrink-3"></span><span class="d-none d-sm-inline-block d-xl-none d-xxl-inline-block ms-1">Export</span></button>
				        <button class="btn btn-falcon-default btn-sm admindefault" type="button"><span class="fas fa-file-import" data--transform="shrink-3"></span><span class="d-none d-sm-inline-block d-xl-none d-xxl-inline-block ms-1">Import</span></button>
				      	<span class="adminhyphen"></span>
				      </div>
                	</div>
                  </div>
              
                <div class="card-body p-0 admindefault">
                  <div class="table-responsive scrollbar admindefault">
                    <table class="table table-sm table-hover">
						<colgroup>
							<col style="width:5%;" />
							<col style="width:20%;" />
							<col style="width:15%;" />
							<col style="width:15%;" />
							<col style="width:15%;" />
							<col style="width:19%;" />		
							<col style="width:11%;" />		
						</colgroup>
                      <thead class="adminempthead">
                        <tr style="text-align: center;">
                          <th class="py-2 fs-0 pe-2" style="width: 28px;">
                            <div class="form-check d-flex align-items-center">
                              <input class="form-check-input" id="checkbox-bulk-tickets-select" type="checkbox" data-bulk-select='{"body":"table-contact-body","actions":"table-contact-actions","replacedElement":"table-contact-replace-element"}' />
                            </div>
                          </th>
                          <th class="sort align-middle" scope="col">사원번호</th>
                          <th class="sort align-middle" scope="col">사원이름</th>
                          <th class="sort align-middle" scope="col">부서</th>
                          <th class="sort align-middle" scope="col">직급</th>
                          <th class="sort align-middle" scope="col">전화번호</th>
                          <th class="sort align-middle" scope="col">재직여부</th>
                        </tr>
                      </thead>
                      <tbody id="table-contact-body">
                        <tr class="adminemptr">
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
                          <td class="align-middle">7</td>
                        </tr>
                         
                         <tr class="adminemptr">
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
                          <td class="align-middle">7</td>
                        </tr>
                         
                      </tbody>
                    </table>
                    <div class="text-center d-none" id="contact-table-fallback">
                      <p class="fw-bold fs-1 mt-3">No contact found</p>
                    </div>
                  </div>
                </div>
                <div class="card-footer d-flex justify-content-center admindefault">
                  <button class="btn btn-sm btn-falcon-default me-1" type="button" title="Previous" data-list-pagination="prev"><span class="fas fa-chevron-left"></span></button>
                  <ul class="pagination mb-0"></ul>
                  <button class="btn btn-sm btn-falcon-default ms-1" type="button" title="Next" data-list-pagination="next"><span class="fas fa-chevron-right"></span></button>
                </div>
       		</div>
            
           
          
          

            	
          </div>
       </div>
   </div>
</div>
<%@ include file='../inc/adminBottom.jsp'%>