<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../inc/top.jsp" %>

 <div class="row gx-3">
            <h2>Q&A 게시판</h2>
            <div class="col-xxl-10 col-xl-9">
              <div class="card" id="allContactTable" data-list='{"valueNames":["name","phone-number","report","subscription","social"],"page":11,"pagination":true,"fallback":"contact-table-fallback"}'>
                <div class="card-header border-bottom border-200 px-0">
                  <div class="d-lg-flex justify-content-between">
                    <div class="row flex-between-center gy-2 px-x1">
                      <div class="col-auto pe-0">
                            <select class="form-select form-select-sm" aria-label="Bulk actions">
	                            <option value="title">제목</option>
	                            <option value="name">이름</option>
	                            <option value="userid">아이디</option>
                          </select>
                      </div>
                      <div class="col-auto">
                        <form>
                          <div class="input-group input-search-width">
                            <input class="form-control form-control-sm shadow-none search" type="search" placeholder="검색어 입력" aria-label="search" />
                            <button class="btn btn-sm btn-outline-secondary border-300 hover-border-secondary"><span class="fa fa-search fs--1"></span></button>
                          </div>
                        </form>
                      </div>
                    </div>
                    <div class="border-bottom border-200 my-3"></div>
                    <div class="d-flex align-items-center justify-content-between justify-content-lg-end px-x1">
                      <button class="btn btn-sm btn-falcon-default d-xl-none" type="button" data-bs-toggle="offcanvas" data-bs-target="#allContactOffcanvas" aria-controls="allContactOffcanvas"><span class="fas fa-filter" data-fa-transform="shrink-4"></span><span class="ms-1 d-none d-sm-inline-block">Filter</span></button>
                      <div class="bg-300 mx-3 d-none d-lg-block d-xl-none" style="width:1px; height:29px"></div>
                      <div class="d-none" id="table-contact-actions">
                        <div class="d-flex">
                          <button class="btn btn-falcon-default btn-sm ms-2" type="button">수정</button>
                          <button class="btn btn-falcon-default btn-sm ms-2" type="button">삭제</button>
                        </div>
                      </div>
                      <div class="d-flex align-items-center" id="table-contact-replace-element">
                        <button class="btn btn-falcon-default btn-sm" type="button"><span class="fas fa-plus" data-fa-transform="shrink-3"></span><a href="Q&AWrite.jsp"><span class="d-none d-sm-inline-block d-xl-none d-xxl-inline-block ms-1">질문 등록</a></span></button>
                        <button class="btn btn-falcon-default btn-sm mx-2" type="button"><span class="fas fa-external-link-alt" data-fa-transform="shrink-3"></span><span class="d-none d-sm-inline-block d-xl-none d-xxl-inline-block ms-1">Export</span></button>
                        <button class="btn btn-falcon-default btn-sm" type="button"><span class="fas fa-file-import" data--transform="shrink-3"></span><span class="d-none d-sm-inline-block d-xl-none d-xxl-inline-block ms-1">Import</span></button>
                        <div class="dropdown font-sans-serif ms-2">
                          <button class="btn btn-falcon-default text-600 btn-sm dropdown-toggle dropdown-caret-none" type="button" id="preview-dropdown" data-bs-toggle="dropdown" data-boundary="viewport" aria-haspopup="true" aria-expanded="false"><span class="fas fa-ellipsis-h fs--2"></span></button>
                          <div class="dropdown-menu dropdown-menu-end border py-2" aria-labelledby="preview-dropdown"><a class="dropdown-item" href="#!">View</a><a class="dropdown-item" href="#!">Export</a>
                            <div class="dropdown-divider"></div><a class="dropdown-item text-danger" href="#!">Remove</a>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="card-body p-0">
                  <div class="table-responsive scrollbar">
                    <table class="table table-sm fs--1 mb-0">
                      <thead class="text-800 bg-light">
                        <tr>
                          <th class="py-2 fs-0 pe-2" style="width: 28px;">
                            <div class="form-check d-flex align-items-center">
                              <input class="form-check-input" id="checkbox-bulk-tickets-select" type="checkbox" data-bulk-select='{"body":"table-contact-body","actions":"table-contact-actions","replacedElement":"table-contact-replace-element"}' />
                            </div>
                          </th>
                          <th class="sort align-middle ps-2" data-sort="name">이름</th>
                          <th class="sort align-middle pe-5" data-sort="userid">아이디</th>
                          <th class="sort align-middle pe-5" data-sort="title">제목</th>
                          <th class="sort align-middle text-end" data-sort="regdate">등록일</th>
                          <th class="sort align-middle text-end" data-sort="level">직급</th>
                        </tr>
                      </thead>
                      <tbody class="list" id="table-contact-body">
                        <tr>
                          <td class="align-middle fs-0 py-3">
                            <div class="form-check mb-0">
                              <input class="form-check-input" type="checkbox" id="all-contact-0" data-bulk-select-row="data-bulk-select-row" />
                            </div>
                          </td>
                          <td class="align-middle name white-space-nowrap pe-5 ps-2">
                            <div class="d-flex align-items-center gap-2 position-relative">
                              <div class="avatar avatar-xl">
                                <div class="avatar-name rounded-circle"><span>EW</span></div>
                              </div>
                              <h6 class="mb-0"><a class="stretched-link text-900" href="../../app/support-desk/contact-details.jsp">Emma Watson</a></h6>
                            </div>
                          </td>
                          <td class="align-middle phone-number font-sans-serif white-space-nowrap"><a class="text-700" href="tel:+611800861302">+61 1800 861 302</a></td>
                          <td class="align-middle report"><a href="#!">Analysis of the Top Customers</a></td>
                          <td class="align-middle subscription fs-0 text-end"><small class="badge rounded badge-subtle-success">Active</small>
                          </td>
                          <td class="align-middle social text-end ps-4"><a href="#!">Facebook</a>
                          </td>
                        </tr>
                        <tr>
                          <td class="align-middle fs-0 py-3">
                            <div class="form-check mb-0">
                              <input class="form-check-input" type="checkbox" id="all-contact-1" data-bulk-select-row="data-bulk-select-row" />
                            </div>
                          </td>
                          <td class="align-middle name white-space-nowrap pe-5 ps-2">
                            <div class="d-flex align-items-center gap-2 position-relative">
                              <div class="avatar avatar-xl">
                                <div class="avatar-name rounded-circle"><span>L</span></div>
                              </div>
                              <h6 class="mb-0"><a class="stretched-link text-900" href="../../app/support-desk/contact-details.jsp">Luke</a></h6>
                            </div>
                          </td>
                          <td class="align-middle phone-number font-sans-serif white-space-nowrap"><a class="text-700" href="tel:+361256523369">+36 1256 523 369</a></td>
                          <td class="align-middle report"><a href="#!">Performance of a Group</a></td>
                          <td class="align-middle subscription fs-0 text-end"><small class="badge rounded badge-subtle-secondary">Inactive</small>
                          </td>
                          <td class="align-middle social text-end ps-4"><a href="#!">Twitter</a>
                          </td>
                        </tr>
                        <tr>
                          <td class="align-middle fs-0 py-3">
                            <div class="form-check mb-0">
                              <input class="form-check-input" type="checkbox" id="all-contact-2" data-bulk-select-row="data-bulk-select-row" />
                            </div>
                          </td>
                          <td class="align-middle name white-space-nowrap pe-5 ps-2">
                            <div class="d-flex align-items-center gap-2 position-relative">
                              <div class="avatar avatar-xl">
                                <img class="rounded-circle" src="../../assets/img/team/1-thumb.png" alt="" />

                              </div>
                              <h6 class="mb-0"><a class="stretched-link text-900" href="../../app/support-desk/contact-details.jsp">Finley</a></h6>
                            </div>
                          </td>
                          <td class="align-middle phone-number font-sans-serif white-space-nowrap"><a class="text-700" href="tel:+611800861302">+61 1800 861 302</a></td>
                          <td class="align-middle report"><a href="#!">Performance of Agents</a></td>
                          <td class="align-middle subscription fs-0 text-end"><small class="badge rounded badge-subtle-danger">Expired</small>
                          </td>
                          <td class="align-middle social text-end ps-4"><a href="#!">Linkedin</a>
                          </td>
                        </tr>
                        <tr>
                          <td class="align-middle fs-0 py-3">
                            <div class="form-check mb-0">
                              <input class="form-check-input" type="checkbox" id="all-contact-3" data-bulk-select-row="data-bulk-select-row" />
                            </div>
                          </td>
                          <td class="align-middle name white-space-nowrap pe-5 ps-2">
                            <div class="d-flex align-items-center gap-2 position-relative">
                              <div class="avatar avatar-xl">
                                <div class="avatar-name rounded-circle"><span>PG</span></div>
                              </div>
                              <h6 class="mb-0"><a class="stretched-link text-900" href="../../app/support-desk/contact-details.jsp">Peter Gill</a></h6>
                            </div>
                          </td>
                          <td class="align-middle phone-number font-sans-serif white-space-nowrap"><a class="text-700" href="tel:+992536632566">+99 2536 632 566</a></td>
                          <td class="align-middle report"><a href="#!">Handling Time (on Average)</a></td>
                          <td class="align-middle subscription fs-0 text-end"><small class="badge rounded badge-subtle-success">Active</small>
                          </td>
                          <td class="align-middle social text-end ps-4"><a href="#!">Twitter</a>
                          </td>
                        </tr>
                        <tr>
                          <td class="align-middle fs-0 py-3">
                            <div class="form-check mb-0">
                              <input class="form-check-input" type="checkbox" id="all-contact-4" data-bulk-select-row="data-bulk-select-row" />
                            </div>
                          </td>
                          <td class="align-middle name white-space-nowrap pe-5 ps-2">
                            <div class="d-flex align-items-center gap-2 position-relative">
                              <div class="avatar avatar-xl">
                                <img class="rounded-circle" src="../../assets/img/team/25-thumb.png" alt="" />

                              </div>
                              <h6 class="mb-0"><a class="stretched-link text-900" href="../../app/support-desk/contact-details.jsp">Sallie Reyes</a></h6>
                            </div>
                          </td>
                          <td class="align-middle phone-number font-sans-serif white-space-nowrap"><a class="text-700" href="tel:+843698856963">+84 3698 856 963</a></td>
                          <td class="align-middle report"><a href="#!">Handling Time (on Average)</a></td>
                          <td class="align-middle subscription text-500 font-sans-serif text-end">N/A</td>
                          <td class="align-middle social text-end ps-4"><a href="#!">Twitter</a>
                          </td>
                        </tr>
                        <tr>
                          <td class="align-middle fs-0 py-3">
                            <div class="form-check mb-0">
                              <input class="form-check-input" type="checkbox" id="all-contact-5" data-bulk-select-row="data-bulk-select-row" />
                            </div>
                          </td>
                          <td class="align-middle name white-space-nowrap pe-5 ps-2">
                            <div class="d-flex align-items-center gap-2 position-relative">
                              <div class="avatar avatar-xl">
                                <div class="avatar-name rounded-circle"><span>F</span></div>
                              </div>
                              <h6 class="mb-0"><a class="stretched-link text-900" href="../../app/support-desk/contact-details.jsp">Freya</a></h6>
                            </div>
                          </td>
                          <td class="align-middle phone-number font-sans-serif white-space-nowrap"><a class="text-700" href="tel:+663256632235">+66 3256 632 235</a></td>
                          <td class="align-middle report"><a href="#!">Survey of Customer Satisfaction</a></td>
                          <td class="align-middle subscription text-500 font-sans-serif text-end">N/A</td>
                          <td class="align-middle social text-end ps-4">
                            <p class="mb-0 text-500">N/A</p>
                          </td>
                        </tr>
                        <tr>
                          <td class="align-middle fs-0 py-3">
                            <div class="form-check mb-0">
                              <input class="form-check-input" type="checkbox" id="all-contact-6" data-bulk-select-row="data-bulk-select-row" />
                            </div>
                          </td>
                          <td class="align-middle name white-space-nowrap pe-5 ps-2">
                            <div class="d-flex align-items-center gap-2 position-relative">
                              <div class="avatar avatar-xl">
                                <div class="avatar-name rounded-circle"><span>M</span></div>
                              </div>
                              <h6 class="mb-0"><a class="stretched-link text-900" href="../../app/support-desk/contact-details.jsp">Morrison</a></h6>
                            </div>
                          </td>
                          <td class="align-middle phone-number font-sans-serif white-space-nowrap"><a class="text-700" href="tel:+122563223325">+12 2563 223 325</a></td>
                          <td class="align-middle report"><a href="#!">Distribution of Performance</a></td>
                          <td class="align-middle subscription fs-0 text-end"><small class="badge rounded badge-subtle-warning">Pending</small>
                          </td>
                          <td class="align-middle social text-end ps-4"><a href="#!">Twitter</a>
                          </td>
                        </tr>
                        <tr>
                          <td class="align-middle fs-0 py-3">
                            <div class="form-check mb-0">
                              <input class="form-check-input" type="checkbox" id="all-contact-7" data-bulk-select-row="data-bulk-select-row" />
                            </div>
                          </td>
                          <td class="align-middle name white-space-nowrap pe-5 ps-2">
                            <div class="d-flex align-items-center gap-2 position-relative">
                              <div class="avatar avatar-xl">
                                <div class="avatar-name rounded-circle"><span>AK</span></div>
                              </div>
                              <h6 class="mb-0"><a class="stretched-link text-900" href="../../app/support-desk/contact-details.jsp">Aar Kay</a></h6>
                            </div>
                          </td>
                          <td class="align-middle phone-number font-sans-serif white-space-nowrap"><a class="text-700" href="tel:+89213658963">+89 213 658 963</a></td>
                          <td class="align-middle report"><a href="#!">Distribution of Performance</a></td>
                          <td class="align-middle subscription fs-0 text-end"><small class="badge rounded badge-subtle-success">Active</small>
                          </td>
                          <td class="align-middle social text-end ps-4">
                            <p class="mb-0 text-500">N/A</p>
                          </td>
                        </tr>
                        <tr>
                          <td class="align-middle fs-0 py-3">
                            <div class="form-check mb-0">
                              <input class="form-check-input" type="checkbox" id="all-contact-8" data-bulk-select-row="data-bulk-select-row" />
                            </div>
                          </td>
                          <td class="align-middle name white-space-nowrap pe-5 ps-2">
                            <div class="d-flex align-items-center gap-2 position-relative">
                              <div class="avatar avatar-xl">
                                <div class="avatar-name rounded-circle"><span>M</span></div>
                              </div>
                              <h6 class="mb-0"><a class="stretched-link text-900" href="../../app/support-desk/contact-details.jsp">Michele</a></h6>
                            </div>
                          </td>
                          <td class="align-middle phone-number font-sans-serif white-space-nowrap"><a class="text-700" href="tel:+39213658963">+39 213 658 963</a></td>
                          <td class="align-middle report"><a href="#!">Analysis of the Top Customer</a></td>
                          <td class="align-middle subscription text-500 font-sans-serif text-end">N/A</td>
                          <td class="align-middle social text-end ps-4"><a href="#!">Twitter</a>
                          </td>
                        </tr>
                        <tr>
                          <td class="align-middle fs-0 py-3">
                            <div class="form-check mb-0">
                              <input class="form-check-input" type="checkbox" id="all-contact-9" data-bulk-select-row="data-bulk-select-row" />
                            </div>
                          </td>
                          <td class="align-middle name white-space-nowrap pe-5 ps-2">
                            <div class="d-flex align-items-center gap-2 position-relative">
                              <div class="avatar avatar-xl">
                                <img class="rounded-circle" src="../../assets/img/team/14-thumb.png" alt="" />

                              </div>
                              <h6 class="mb-0"><a class="stretched-link text-900" href="../../app/support-desk/contact-details.jsp">Banneker</a></h6>
                            </div>
                          </td>
                          <td class="align-middle phone-number font-sans-serif white-space-nowrap"><a class="text-700" href="tel:+69213658963">+69 213 658 963</a></td>
                          <td class="align-middle report"><a href="#!">Freddy's canned retort</a></td>
                          <td class="align-middle subscription fs-0 text-end"><small class="badge rounded badge-subtle-success">Active</small>
                          </td>
                          <td class="align-middle social text-end ps-4">
                            <p class="mb-0 text-500">N/A</p>
                          </td>
                        </tr>
                        <tr>
                          <td class="align-middle fs-0 py-3">
                            <div class="form-check mb-0">
                              <input class="form-check-input" type="checkbox" id="all-contact-10" data-bulk-select-row="data-bulk-select-row" />
                            </div>
                          </td>
                          <td class="align-middle name white-space-nowrap pe-5 ps-2">
                            <div class="d-flex align-items-center gap-2 position-relative">
                              <div class="avatar avatar-xl">
                                <img class="rounded-circle" src="../../assets/img/team/3-thumb.png" alt="" />

                              </div>
                              <h6 class="mb-0"><a class="stretched-link text-900" href="../../app/support-desk/contact-details.jsp">Romanin</a></h6>
                            </div>
                          </td>
                          <td class="align-middle phone-number font-sans-serif white-space-nowrap"><a class="text-700" href="tel:+79213658963">+79 213 658 963</a></td>
                          <td class="align-middle report"><a href="#!">Emailbot Freddy</a></td>
                          <td class="align-middle subscription fs-0 text-end"><small class="badge rounded badge-subtle-success">Active</small>
                          </td>
                          <td class="align-middle social text-end ps-4">
                            <p class="mb-0 text-500">N/A</p>
                          </td>
                        </tr>
                        <tr>
                          <td class="align-middle fs-0 py-3">
                            <div class="form-check mb-0">
                              <input class="form-check-input" type="checkbox" id="all-contact-11" data-bulk-select-row="data-bulk-select-row" />
                            </div>
                          </td>
                          <td class="align-middle name white-space-nowrap pe-5 ps-2">
                            <div class="d-flex align-items-center gap-2 position-relative">
                              <div class="avatar avatar-xl">
                                <div class="avatar-name rounded-circle"><span>M</span></div>
                              </div>
                              <h6 class="mb-0"><a class="stretched-link text-900" href="../../app/support-desk/contact-details.jsp">Michele</a></h6>
                            </div>
                          </td>
                          <td class="align-middle phone-number font-sans-serif white-space-nowrap"><a class="text-700" href="tel:+663256632235">+66 3256 632 235</a></td>
                          <td class="align-middle report"><a href="#!">Survey of Customer Satisfaction</a></td>
                          <td class="align-middle subscription text-500 font-sans-serif text-end">N/A</td>
                          <td class="align-middle social text-end ps-4">
                            <p class="mb-0 text-500">N/A</p>
                          </td>
                        </tr>
                        <tr>
                          <td class="align-middle fs-0 py-3">
                            <div class="form-check mb-0">
                              <input class="form-check-input" type="checkbox" id="all-contact-12" data-bulk-select-row="data-bulk-select-row" />
                            </div>
                          </td>
                          <td class="align-middle name white-space-nowrap pe-5 ps-2">
                            <div class="d-flex align-items-center gap-2 position-relative">
                              <div class="avatar avatar-xl">
                                <div class="avatar-name rounded-circle"><span>M</span></div>
                              </div>
                              <h6 class="mb-0"><a class="stretched-link text-900" href="../../app/support-desk/contact-details.jsp">Morrison</a></h6>
                            </div>
                          </td>
                          <td class="align-middle phone-number font-sans-serif white-space-nowrap"><a class="text-700" href="tel:+122563223325">+12 2563 223 325</a></td>
                          <td class="align-middle report"><a href="#!">Distribution of Performance</a></td>
                          <td class="align-middle subscription fs-0 text-end"><small class="badge rounded badge-subtle-warning">Pending</small>
                          </td>
                          <td class="align-middle social text-end ps-4"><a href="#!">Twitter</a>
                          </td>
                        </tr>
                        <tr>
                          <td class="align-middle fs-0 py-3">
                            <div class="form-check mb-0">
                              <input class="form-check-input" type="checkbox" id="all-contact-13" data-bulk-select-row="data-bulk-select-row" />
                            </div>
                          </td>
                          <td class="align-middle name white-space-nowrap pe-5 ps-2">
                            <div class="d-flex align-items-center gap-2 position-relative">
                              <div class="avatar avatar-xl">
                                <div class="avatar-name rounded-circle"><span>AK</span></div>
                              </div>
                              <h6 class="mb-0"><a class="stretched-link text-900" href="../../app/support-desk/contact-details.jsp">Aar Kay</a></h6>
                            </div>
                          </td>
                          <td class="align-middle phone-number font-sans-serif white-space-nowrap"><a class="text-700" href="tel:+89213658963">+89 213 658 963</a></td>
                          <td class="align-middle report"><a href="#!">Distribution of Performance</a></td>
                          <td class="align-middle subscription fs-0 text-end"><small class="badge rounded badge-subtle-success">Active</small>
                          </td>
                          <td class="align-middle social text-end ps-4">
                            <p class="mb-0 text-500">N/A</p>
                          </td>
                        </tr>
                        <tr>
                          <td class="align-middle fs-0 py-3">
                            <div class="form-check mb-0">
                              <input class="form-check-input" type="checkbox" id="all-contact-14" data-bulk-select-row="data-bulk-select-row" />
                            </div>
                          </td>
                          <td class="align-middle name white-space-nowrap pe-5 ps-2">
                            <div class="d-flex align-items-center gap-2 position-relative">
                              <div class="avatar avatar-xl">
                                <div class="avatar-name rounded-circle"><span>EW</span></div>
                              </div>
                              <h6 class="mb-0"><a class="stretched-link text-900" href="../../app/support-desk/contact-details.jsp">Emma Watson</a></h6>
                            </div>
                          </td>
                          <td class="align-middle phone-number font-sans-serif white-space-nowrap"><a class="text-700" href="tel:+611800861302">+61 1800 861 302</a></td>
                          <td class="align-middle report"><a href="#!">Analysis of the Top Customers</a></td>
                          <td class="align-middle subscription fs-0 text-end"><small class="badge rounded badge-subtle-success">Active</small>
                          </td>
                          <td class="align-middle social text-end ps-4"><a href="#!">Facebook</a>
                          </td>
                        </tr>
                        <tr>
                          <td class="align-middle fs-0 py-3">
                            <div class="form-check mb-0">
                              <input class="form-check-input" type="checkbox" id="all-contact-15" data-bulk-select-row="data-bulk-select-row" />
                            </div>
                          </td>
                          <td class="align-middle name white-space-nowrap pe-5 ps-2">
                            <div class="d-flex align-items-center gap-2 position-relative">
                              <div class="avatar avatar-xl">
                                <img class="rounded-circle" src="../../assets/img/team/14-thumb.png" alt="" />

                              </div>
                              <h6 class="mb-0"><a class="stretched-link text-900" href="../../app/support-desk/contact-details.jsp">Banneker</a></h6>
                            </div>
                          </td>
                          <td class="align-middle phone-number font-sans-serif white-space-nowrap"><a class="text-700" href="tel:+361256523369">+36 1256 523 369</a></td>
                          <td class="align-middle report"><a href="#!">Performance of a Group</a></td>
                          <td class="align-middle subscription fs-0 text-end"><small class="badge rounded badge-subtle-secondary">Inactive</small>
                          </td>
                          <td class="align-middle social text-end ps-4"><a href="#!">Twitter</a>
                          </td>
                        </tr>
                        <tr>
                          <td class="align-middle fs-0 py-3">
                            <div class="form-check mb-0">
                              <input class="form-check-input" type="checkbox" id="all-contact-16" data-bulk-select-row="data-bulk-select-row" />
                            </div>
                          </td>
                          <td class="align-middle name white-space-nowrap pe-5 ps-2">
                            <div class="d-flex align-items-center gap-2 position-relative">
                              <div class="avatar avatar-xl">
                                <img class="rounded-circle" src="../../assets/img/team/1-thumb.png" alt="" />

                              </div>
                              <h6 class="mb-0"><a class="stretched-link text-900" href="../../app/support-desk/contact-details.jsp">Finley</a></h6>
                            </div>
                          </td>
                          <td class="align-middle phone-number font-sans-serif white-space-nowrap"><a class="text-700" href="tel:+611800861302">+61 1800 861 302</a></td>
                          <td class="align-middle report"><a href="#!">Performance of Agents</a></td>
                          <td class="align-middle subscription fs-0 text-end"><small class="badge rounded badge-subtle-danger">Expired</small>
                          </td>
                          <td class="align-middle social text-end ps-4"><a href="#!">Linkedin</a>
                          </td>
                        </tr>
                        <tr>
                          <td class="align-middle fs-0 py-3">
                            <div class="form-check mb-0">
                              <input class="form-check-input" type="checkbox" id="all-contact-17" data-bulk-select-row="data-bulk-select-row" />
                            </div>
                          </td>
                          <td class="align-middle name white-space-nowrap pe-5 ps-2">
                            <div class="d-flex align-items-center gap-2 position-relative">
                              <div class="avatar avatar-xl">
                                <div class="avatar-name rounded-circle"><span>PG</span></div>
                              </div>
                              <h6 class="mb-0"><a class="stretched-link text-900" href="../../app/support-desk/contact-details.jsp">Peter Gill</a></h6>
                            </div>
                          </td>
                          <td class="align-middle phone-number font-sans-serif white-space-nowrap"><a class="text-700" href="tel:+992536632566">+99 2536 632 566</a></td>
                          <td class="align-middle report"><a href="#!">Handling Time (on Average)</a></td>
                          <td class="align-middle subscription fs-0 text-end"><small class="badge rounded badge-subtle-success">Active</small>
                          </td>
                          <td class="align-middle social text-end ps-4"><a href="#!">Twitter</a>
                          </td>
                        </tr>
                        <tr>
                          <td class="align-middle fs-0 py-3">
                            <div class="form-check mb-0">
                              <input class="form-check-input" type="checkbox" id="all-contact-18" data-bulk-select-row="data-bulk-select-row" />
                            </div>
                          </td>
                          <td class="align-middle name white-space-nowrap pe-5 ps-2">
                            <div class="d-flex align-items-center gap-2 position-relative">
                              <div class="avatar avatar-xl">
                                <img class="rounded-circle" src="../../assets/img/team/25-thumb.png" alt="" />

                              </div>
                              <h6 class="mb-0"><a class="stretched-link text-900" href="../../app/support-desk/contact-details.jsp">Sallie Reyes</a></h6>
                            </div>
                          </td>
                          <td class="align-middle phone-number font-sans-serif white-space-nowrap"><a class="text-700" href="tel:+843698856963">+84 3698 856 963</a></td>
                          <td class="align-middle report"><a href="#!">Handling Time (on Average)</a></td>
                          <td class="align-middle subscription text-500 font-sans-serif text-end">N/A</td>
                          <td class="align-middle social text-end ps-4"><a href="#!">Twitter</a>
                          </td>
                        </tr>
                        <tr>
                          <td class="align-middle fs-0 py-3">
                            <div class="form-check mb-0">
                              <input class="form-check-input" type="checkbox" id="all-contact-19" data-bulk-select-row="data-bulk-select-row" />
                            </div>
                          </td>
                          <td class="align-middle name white-space-nowrap pe-5 ps-2">
                            <div class="d-flex align-items-center gap-2 position-relative">
                              <div class="avatar avatar-xl">
                                <div class="avatar-name rounded-circle"><span>F</span></div>
                              </div>
                              <h6 class="mb-0"><a class="stretched-link text-900" href="../../app/support-desk/contact-details.jsp">Freya</a></h6>
                            </div>
                          </td>
                          <td class="align-middle phone-number font-sans-serif white-space-nowrap"><a class="text-700" href="tel:+663256632235">+66 3256 632 235</a></td>
                          <td class="align-middle report"><a href="#!">Survey of Customer Satisfaction</a></td>
                          <td class="align-middle subscription text-500 font-sans-serif text-end">N/A</td>
                          <td class="align-middle social text-end ps-4">
                            <p class="mb-0 text-500">N/A</p>
                          </td>
                        </tr>
                        <tr>
                          <td class="align-middle fs-0 py-3">
                            <div class="form-check mb-0">
                              <input class="form-check-input" type="checkbox" id="all-contact-20" data-bulk-select-row="data-bulk-select-row" />
                            </div>
                          </td>
                          <td class="align-middle name white-space-nowrap pe-5 ps-2">
                            <div class="d-flex align-items-center gap-2 position-relative">
                              <div class="avatar avatar-xl">
                                <div class="avatar-name rounded-circle"><span>L</span></div>
                              </div>
                              <h6 class="mb-0"><a class="stretched-link text-900" href="../../app/support-desk/contact-details.jsp">Luke</a></h6>
                            </div>
                          </td>
                          <td class="align-middle phone-number font-sans-serif white-space-nowrap"><a class="text-700" href="tel:+361256523369">+36 1256 523 369</a></td>
                          <td class="align-middle report"><a href="#!">Performance of a Group</a></td>
                          <td class="align-middle subscription fs-0 text-end"><small class="badge rounded badge-subtle-secondary">Inactive</small>
                          </td>
                          <td class="align-middle social text-end ps-4"><a href="#!">Twitter</a>
                          </td>
                        </tr>
                        <tr>
                          <td class="align-middle fs-0 py-3">
                            <div class="form-check mb-0">
                              <input class="form-check-input" type="checkbox" id="all-contact-21" data-bulk-select-row="data-bulk-select-row" />
                            </div>
                          </td>
                          <td class="align-middle name white-space-nowrap pe-5 ps-2">
                            <div class="d-flex align-items-center gap-2 position-relative">
                              <div class="avatar avatar-xl">
                                <img class="rounded-circle" src="../../assets/img/team/1-thumb.png" alt="" />

                              </div>
                              <h6 class="mb-0"><a class="stretched-link text-900" href="../../app/support-desk/contact-details.jsp">Finley</a></h6>
                            </div>
                          </td>
                          <td class="align-middle phone-number font-sans-serif white-space-nowrap"><a class="text-700" href="tel:+611800861302">+61 1800 861 302</a></td>
                          <td class="align-middle report"><a href="#!">Performance of Agents</a></td>
                          <td class="align-middle subscription fs-0 text-end"><small class="badge rounded badge-subtle-danger">Expired</small>
                          </td>
                          <td class="align-middle social text-end ps-4"><a href="#!">Linkedin</a>
                          </td>
                        </tr>
                        <tr>
                          <td class="align-middle fs-0 py-3">
                            <div class="form-check mb-0">
                              <input class="form-check-input" type="checkbox" id="all-contact-22" data-bulk-select-row="data-bulk-select-row" />
                            </div>
                          </td>
                          <td class="align-middle name white-space-nowrap pe-5 ps-2">
                            <div class="d-flex align-items-center gap-2 position-relative">
                              <div class="avatar avatar-xl">
                                <img class="rounded-circle" src="../../assets/img/team/14-thumb.png" alt="" />

                              </div>
                              <h6 class="mb-0"><a class="stretched-link text-900" href="../../app/support-desk/contact-details.jsp">Banneker</a></h6>
                            </div>
                          </td>
                          <td class="align-middle phone-number font-sans-serif white-space-nowrap"><a class="text-700" href="tel:+69213658963">+69 213 658 963</a></td>
                          <td class="align-middle report"><a href="#!">Freddy's canned retort</a></td>
                          <td class="align-middle subscription fs-0 text-end"><small class="badge rounded badge-subtle-success">Active</small>
                          </td>
                          <td class="align-middle social text-end ps-4">
                            <p class="mb-0 text-500">N/A</p>
                          </td>
                        </tr>
                        <tr>
                          <td class="align-middle fs-0 py-3">
                            <div class="form-check mb-0">
                              <input class="form-check-input" type="checkbox" id="all-contact-23" data-bulk-select-row="data-bulk-select-row" />
                            </div>
                          </td>
                          <td class="align-middle name white-space-nowrap pe-5 ps-2">
                            <div class="d-flex align-items-center gap-2 position-relative">
                              <div class="avatar avatar-xl">
                                <img class="rounded-circle" src="../../assets/img/team/25-thumb.png" alt="" />

                              </div>
                              <h6 class="mb-0"><a class="stretched-link text-900" href="../../app/support-desk/contact-details.jsp">Sallie Reyes</a></h6>
                            </div>
                          </td>
                          <td class="align-middle phone-number font-sans-serif white-space-nowrap"><a class="text-700" href="tel:+843698856963">+84 3698 856 963</a></td>
                          <td class="align-middle report"><a href="#!">Handling Time (on Average)</a></td>
                          <td class="align-middle subscription text-500 font-sans-serif text-end">N/A</td>
                          <td class="align-middle social text-end ps-4"><a href="#!">Twitter</a>
                          </td>
                        </tr>
                        <tr>
                          <td class="align-middle fs-0 py-3">
                            <div class="form-check mb-0">
                              <input class="form-check-input" type="checkbox" id="all-contact-24" data-bulk-select-row="data-bulk-select-row" />
                            </div>
                          </td>
                          <td class="align-middle name white-space-nowrap pe-5 ps-2">
                            <div class="d-flex align-items-center gap-2 position-relative">
                              <div class="avatar avatar-xl">
                                <div class="avatar-name rounded-circle"><span>F</span></div>
                              </div>
                              <h6 class="mb-0"><a class="stretched-link text-900" href="../../app/support-desk/contact-details.jsp">Freya</a></h6>
                            </div>
                          </td>
                          <td class="align-middle phone-number font-sans-serif white-space-nowrap"><a class="text-700" href="tel:+663256632235">+66 3256 632 235</a></td>
                          <td class="align-middle report"><a href="#!">Survey of Customer Satisfaction</a></td>
                          <td class="align-middle subscription text-500 font-sans-serif text-end">N/A</td>
                          <td class="align-middle social text-end ps-4">
                            <p class="mb-0 text-500">N/A</p>
                          </td>
                        </tr>
                        <tr>
                          <td class="align-middle fs-0 py-3">
                            <div class="form-check mb-0">
                              <input class="form-check-input" type="checkbox" id="all-contact-25" data-bulk-select-row="data-bulk-select-row" />
                            </div>
                          </td>
                          <td class="align-middle name white-space-nowrap pe-5 ps-2">
                            <div class="d-flex align-items-center gap-2 position-relative">
                              <div class="avatar avatar-xl">
                                <div class="avatar-name rounded-circle"><span>L</span></div>
                              </div>
                              <h6 class="mb-0"><a class="stretched-link text-900" href="../../app/support-desk/contact-details.jsp">Luke</a></h6>
                            </div>
                          </td>
                          <td class="align-middle phone-number font-sans-serif white-space-nowrap"><a class="text-700" href="tel:+361256523369">+36 1256 523 369</a></td>
                          <td class="align-middle report"><a href="#!">Performance of a Group</a></td>
                          <td class="align-middle subscription fs-0 text-end"><small class="badge rounded badge-subtle-secondary">Inactive</small>
                          </td>
                          <td class="align-middle social text-end ps-4"><a href="#!">Twitter</a>
                          </td>
                        </tr>
                        <tr>
                          <td class="align-middle fs-0 py-3">
                            <div class="form-check mb-0">
                              <input class="form-check-input" type="checkbox" id="all-contact-26" data-bulk-select-row="data-bulk-select-row" />
                            </div>
                          </td>
                          <td class="align-middle name white-space-nowrap pe-5 ps-2">
                            <div class="d-flex align-items-center gap-2 position-relative">
                              <div class="avatar avatar-xl">
                                <img class="rounded-circle" src="../../assets/img/team/1-thumb.png" alt="" />

                              </div>
                              <h6 class="mb-0"><a class="stretched-link text-900" href="../../app/support-desk/contact-details.jsp">Finley</a></h6>
                            </div>
                          </td>
                          <td class="align-middle phone-number font-sans-serif white-space-nowrap"><a class="text-700" href="tel:+611800861302">+61 1800 861 302</a></td>
                          <td class="align-middle report"><a href="#!">Performance of Agents</a></td>
                          <td class="align-middle subscription fs-0 text-end"><small class="badge rounded badge-subtle-danger">Expired</small>
                          </td>
                          <td class="align-middle social text-end ps-4"><a href="#!">Linkedin</a>
                          </td>
                        </tr>
                        <tr>
                          <td class="align-middle fs-0 py-3">
                            <div class="form-check mb-0">
                              <input class="form-check-input" type="checkbox" id="all-contact-27" data-bulk-select-row="data-bulk-select-row" />
                            </div>
                          </td>
                          <td class="align-middle name white-space-nowrap pe-5 ps-2">
                            <div class="d-flex align-items-center gap-2 position-relative">
                              <div class="avatar avatar-xl">
                                <div class="avatar-name rounded-circle"><span>PG</span></div>
                              </div>
                              <h6 class="mb-0"><a class="stretched-link text-900" href="../../app/support-desk/contact-details.jsp">Peter Gill</a></h6>
                            </div>
                          </td>
                          <td class="align-middle phone-number font-sans-serif white-space-nowrap"><a class="text-700" href="tel:+992536632566">+99 2536 632 566</a></td>
                          <td class="align-middle report"><a href="#!">Handling Time (on Average)</a></td>
                          <td class="align-middle subscription fs-0 text-end"><small class="badge rounded badge-subtle-success">Active</small>
                          </td>
                          <td class="align-middle social text-end ps-4"><a href="#!">Twitter</a>
                          </td>
                        </tr>
                        <tr>
                          <td class="align-middle fs-0 py-3">
                            <div class="form-check mb-0">
                              <input class="form-check-input" type="checkbox" id="all-contact-28" data-bulk-select-row="data-bulk-select-row" />
                            </div>
                          </td>
                          <td class="align-middle name white-space-nowrap pe-5 ps-2">
                            <div class="d-flex align-items-center gap-2 position-relative">
                              <div class="avatar avatar-xl">
                                <img class="rounded-circle" src="../../assets/img/team/25-thumb.png" alt="" />

                              </div>
                              <h6 class="mb-0"><a class="stretched-link text-900" href="../../app/support-desk/contact-details.jsp">Sallie Reyes</a></h6>
                            </div>
                          </td>
                          <td class="align-middle phone-number font-sans-serif white-space-nowrap"><a class="text-700" href="tel:+843698856963">+84 3698 856 963</a></td>
                          <td class="align-middle report"><a href="#!">Handling Time (on Average)</a></td>
                          <td class="align-middle subscription text-500 font-sans-serif text-end">N/A</td>
                          <td class="align-middle social text-end ps-4"><a href="#!">Twitter</a>
                          </td>
                        </tr>
                        <tr>
                          <td class="align-middle fs-0 py-3">
                            <div class="form-check mb-0">
                              <input class="form-check-input" type="checkbox" id="all-contact-29" data-bulk-select-row="data-bulk-select-row" />
                            </div>
                          </td>
                          <td class="align-middle name white-space-nowrap pe-5 ps-2">
                            <div class="d-flex align-items-center gap-2 position-relative">
                              <div class="avatar avatar-xl">
                                <div class="avatar-name rounded-circle"><span>EW</span></div>
                              </div>
                              <h6 class="mb-0"><a class="stretched-link text-900" href="../../app/support-desk/contact-details.jsp">Emma Watson</a></h6>
                            </div>
                          </td>
                          <td class="align-middle phone-number font-sans-serif white-space-nowrap"><a class="text-700" href="tel:+663256632235">+66 3256 632 235</a></td>
                          <td class="align-middle report"><a href="#!">Survey of Customer Satisfaction</a></td>
                          <td class="align-middle subscription text-500 font-sans-serif text-end">N/A</td>
                          <td class="align-middle social text-end ps-4">
                            <p class="mb-0 text-500">N/A</p>
                          </td>
                        </tr>
                        <tr>
                          <td class="align-middle fs-0 py-3">
                            <div class="form-check mb-0">
                              <input class="form-check-input" type="checkbox" id="all-contact-30" data-bulk-select-row="data-bulk-select-row" />
                            </div>
                          </td>
                          <td class="align-middle name white-space-nowrap pe-5 ps-2">
                            <div class="d-flex align-items-center gap-2 position-relative">
                              <div class="avatar avatar-xl">
                                <div class="avatar-name rounded-circle"><span>M</span></div>
                              </div>
                              <h6 class="mb-0"><a class="stretched-link text-900" href="../../app/support-desk/contact-details.jsp">Morrison</a></h6>
                            </div>
                          </td>
                          <td class="align-middle phone-number font-sans-serif white-space-nowrap"><a class="text-700" href="tel:+122563223325">+12 2563 223 325</a></td>
                          <td class="align-middle report"><a href="#!">Distribution of Performance</a></td>
                          <td class="align-middle subscription fs-0 text-end"><small class="badge rounded badge-subtle-warning">Pending</small>
                          </td>
                          <td class="align-middle social text-end ps-4"><a href="#!">Twitter</a>
                          </td>
                        </tr>
                        <tr>
                          <td class="align-middle fs-0 py-3">
                            <div class="form-check mb-0">
                              <input class="form-check-input" type="checkbox" id="all-contact-31" data-bulk-select-row="data-bulk-select-row" />
                            </div>
                          </td>
                          <td class="align-middle name white-space-nowrap pe-5 ps-2">
                            <div class="d-flex align-items-center gap-2 position-relative">
                              <div class="avatar avatar-xl">
                                <div class="avatar-name rounded-circle"><span>AK</span></div>
                              </div>
                              <h6 class="mb-0"><a class="stretched-link text-900" href="../../app/support-desk/contact-details.jsp">Aar Kay</a></h6>
                            </div>
                          </td>
                          <td class="align-middle phone-number font-sans-serif white-space-nowrap"><a class="text-700" href="tel:+89213658963">+89 213 658 963</a></td>
                          <td class="align-middle report"><a href="#!">Distribution of Performance</a></td>
                          <td class="align-middle subscription fs-0 text-end"><small class="badge rounded badge-subtle-success">Active</small>
                          </td>
                          <td class="align-middle social text-end ps-4">
                            <p class="mb-0 text-500">N/A</p>
                          </td>
                        </tr>
                        <tr>
                          <td class="align-middle fs-0 py-3">
                            <div class="form-check mb-0">
                              <input class="form-check-input" type="checkbox" id="all-contact-32" data-bulk-select-row="data-bulk-select-row" />
                            </div>
                          </td>
                          <td class="align-middle name white-space-nowrap pe-5 ps-2">
                            <div class="d-flex align-items-center gap-2 position-relative">
                              <div class="avatar avatar-xl">
                                <img class="rounded-circle" src="../../assets/img/team/3-thumb.png" alt="" />

                              </div>
                              <h6 class="mb-0"><a class="stretched-link text-900" href="../../app/support-desk/contact-details.jsp">Romanin</a></h6>
                            </div>
                          </td>
                          <td class="align-middle phone-number font-sans-serif white-space-nowrap"><a class="text-700" href="tel:+79213658963">+79 213 658 963</a></td>
                          <td class="align-middle report"><a href="#!">Emailbot Freddy</a></td>
                          <td class="align-middle subscription fs-0 text-end"><small class="badge rounded badge-subtle-success">Active</small>
                          </td>
                          <td class="align-middle social text-end ps-4">
                            <p class="mb-0 text-500">N/A</p>
                          </td>
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
            <div class="col-xxl-2 col-xl-3">
              <div class="offcanvas offcanvas-end offcanvas-filter-sidebar border-0 dark__bg-card-dark h-auto rounded-xl-3" tabindex="-1" id="allContactOffcanvas" aria-labelledby="allContactOffcanvasLabel">
                <div class="offcanvas-header d-flex flex-between-center d-xl-none bg-light">
                  <h6 class="fs-0 mb-0 fw-semi-bold">Filter</h6>
                  <button class="btn-close text-reset d-xl-none shadow-none" id="allContactOffcanvasLabel" type="button" data-bs-dismiss="offcanvas" aria-label="Close"></button>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
        
<%@ include file = "../inc/bottom.jsp" %>