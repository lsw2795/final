<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file='../../inc/adminTop.jsp'%>
<link rel="stylesheet" href="<c:url value='/css/adminempform.css'/>">    
   <div class="row gx-3">
            <div class="col-xxl-10 col-xl-9">
              <div class="card" id="allContactTable" data-list='{"valueNames":["name","phone-number","report","subscription","social"],"pagination":true,"fallback":"contact-table-fallback"}'>
                <div class="card-header border-bottom border-200 px-0 admindefault">
                  <div class="d-lg-flex justify-content-between admindefault">
                    <div class="row flex-between-center gy-2 px-x1">
                      <div class="col-auto pe-0 admindefault">
                        <h5 class="mb-0 admindefault"><span class="fas fa-user" style="margin: 0 10px;"></span>사원목록</h5>
                      </div>
                      <div class="col-auto admindefault">
                        <form name="frmSearch" method="post" action="<c:url value=''/>">
                    <div class="row flex-between-center gy-2 px-x1">
                      <div class="col-auto pe-0">
	                      <select class="admindefault adminempborder adminempsel">
							<option value="">부서</option>
							<option value="">이름</option>
							<option value="">직급</option>
							<option value="">재직여부</option>
						 </select>
                      </div>
                    <div class="col-auto">
                        <div class="input-group input-search-width admindefault">
                          <input class="form-control shadow-none search admindefault" type="search" placeholder="검색어 입력" aria-label="search" />
                          <button class="btn btn-sm btn-outline-secondary border-300 hover-border-secondary"><span class="fa fa-search fs--1"></span></button>
                        </div>
                      </div>
                    </div>
                  </form> 
                      </div>
                    </div>
                    <div class="border-bottom border-200 my-3 admindefault"></div>
                    <div class="d-flex align-items-center justify-content-between justify-content-lg-end px-x1 admindefault">
                      <button class="btn btn-sm btn-falcon-default d-xl-none admindefault" type="button" data-bs-toggle="offcanvas" data-bs-target="#allContactOffcanvas" aria-controls="allContactOffcanvas"><span class="fas fa-filter" data-fa-transform="shrink-4"></span><span class="ms-1 d-none d-sm-inline-block">Filter</span></button>
                      <div class="bg-300 mx-3 d-none d-lg-block d-xl-none admindefault" style="width:1px; height:29px"></div>
                      <div class="d-none" id="table-contact-actions admindefault">
                        <div class="d-flex admindefault">
                          <select class="form-select form-select-sm admindefault" aria-label="Bulk actions">
                            <option selected="">Bulk actions</option>
                            <option value="Refund">Refund</option>
                            <option value="Delete">Delete</option>
                            <option value="Archive">Archive</option>
                          </select>
                          <button class="btn btn-falcon-default btn-sm ms-2 admindefault" type="button">Apply</button>
                        </div>
                      </div>
                      <div class="d-flex align-items-center admindefault" id="table-contact-replace-element">
                        <button class="btn btn-falcon-default btn-sm admindefault" type="button"><span class="fas fa-plus" data-fa-transform="shrink-3"></span><span class="d-none d-sm-inline-block d-xl-none d-xxl-inline-block ms-1">New</span></button>
                        <button class="btn btn-falcon-default btn-sm mx-2 admindefault" type="button"><span class="fas fa-external-link-alt" data-fa-transform="shrink-3"></span><span class="d-none d-sm-inline-block d-xl-none d-xxl-inline-block ms-1">Export</span></button>
                        <button class="btn btn-falcon-default btn-sm admindefault" type="button"><span class="fas fa-file-import" data--transform="shrink-3"></span><span class="d-none d-sm-inline-block d-xl-none d-xxl-inline-block ms-1">Import</span></button>
                        <div class="dropdown font-sans-serif ms-2 admindefault">
                          <button class="btn btn-falcon-default text-600 btn-sm dropdown-toggle dropdown-caret-none admindefault" type="button" id="preview-dropdown" data-bs-toggle="dropdown" data-boundary="viewport" aria-haspopup="true" aria-expanded="false"><span class="fas fa-ellipsis-h fs--2"></span></button>
                          <div class="dropdown-menu dropdown-menu-end border py-2 admindefault" aria-labelledby="preview-dropdown"><a class="dropdown-item" href="#!">View</a><a class="dropdown-item" href="#!">Export</a>
                            <div class="dropdown-divider admindefault"></div><a class="dropdown-item text-danger" href="#!">Remove</a>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="card-body p-0 admindefault">
                  <div class="table-responsive admindefault">
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
                  </div>
                </div>
              </div>
            </div>
            
            <div class="col-xxl-2 col-xl-3">
              <div class="offcanvas offcanvas-end offcanvas-filter-sidebar h-auto" aria-labelledby="allContactOffcanvasLabel">
                <div class="card admindefault">
                  <div class="card-header admindefault">
                    <h5 class="mb-0 admindefault"><span class="fas fa-users" style="margin: 0 10px;"></span>조직도 관리</h5>
                  </div>
                  <div class="card-body">
                    <div id="organization-chart">
						<div class="mb-3 adminempdiv10">
							<button class="btn btn-primary" type="button"
								data-bs-toggle="collapse" data-bs-target="#dev-employees">
								<span class="fas fa-plus" data-fa-transform="shrink-3"></span>
							</button>
							<span>개발팀</span>
							<div class="collapse" id="dev-employees">
								<div class="list-group adminempdiv9">
									<a href="#" class="list-group-item-action">사원1</a> 
									<a href="#" class="list-group-item-action">사원2</a> 
									<a href="#" class="list-group-item-action">사원3</a>
								</div>
							</div>
						</div>

						<div class="mb-3 adminempdiv10">
							<button class="btn btn-primary" type="button"
								data-bs-toggle="collapse" data-bs-target="#design-employees">
								<span class="fas fa-plus" data-fa-transform="shrink-3"></span>
							</button>
							<span>디자인팀</span>
							<div class="collapse" id="design-employees">
								<div class="list-group adminempdiv9">
									<a href="#" class="list-group-item-action">사원4</a> <a href="#"
										class="list-group-item-action">사원5</a>
								</div>
							</div>
						</div>
						<div class="mb-3 adminempdiv10">
							<button class="btn btn-primary" type="button"
								data-bs-toggle="collapse" data-bs-target="#sales-employees">
								<span class="fas fa-plus" data-fa-transform="shrink-3"></span>
							</button>
							<span>영업팀</span>
							<div class="collapse" id="sales-employees">
								<div class="list-group adminempdiv9">
									<a href="#" class="list-group-item-action">사원6</a> <a href="#"
										class="list-group-item-action">사원7</a> <a href="#"
										class="list-group-item-action">사원8</a>
								</div>
							</div>
						</div>
					</div>
                  </div> 
                  <div class="border-top border-200 py-x1">
                  <div class="d-flex align-items-center justify-content-between px-x1 admindefault">
                        <button class="btn btn-falcon-default btn-sm admindefault" type="button"><span class="fas fa-plus" data-fa-transform="shrink-3"></span><span class="d-none d-sm-inline-block d-xl-none d-xxl-inline-block ms-1">부서 추가</span></button>
                        <button class="btn btn-falcon-default btn-sm mx-2 admindefault" type="button"><span class="fas fa-external-link-alt" data-fa-transform="shrink-3"></span><span class="d-none d-sm-inline-block d-xl-none d-xxl-inline-block ms-1">부서 수정</span></button>
                        <button class="btn btn-falcon-default btn-sm admindefault" type="button"><span class="fas fa-minus" data--transform="shrink-3"></span><span class="d-none d-sm-inline-block d-xl-none d-xxl-inline-block ms-1">부서 삭제</span></button>
                  </div>
                  </div>  
                </div>
              </div>
            </div>
          </div>
<%@ include file='../../inc/adminBottom.jsp'%>