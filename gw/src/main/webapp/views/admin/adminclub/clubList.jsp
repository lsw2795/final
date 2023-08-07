<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file='../../inc/adminTop.jsp'%>
<!DOCTYPE html>

		<div class="row gx-3">
              <div class="card admindefault" id="ticketsTable" data-list='{"valueNames":["client","subject","status","priority","agent"],"page":11,"pagination":true,"fallback":"tickets-table-fallback"}'>
                <div class="card-header admindefault border-bottom border-200 px-0">
                  <div class="d-lg-flex justify-content-between">
                    <div class="row flex-between-center gy-2 px-x1">
                      <div class="col-auto pe-0">
                        <h6 class="mb-0">Club List</h6>
                      </div>
                      <div class="col-auto">
                        <form>
                          <div class="input-group input-search-width">
                            <input class="form-control form-control-sm shadow-none search" type="search" placeholder="Search  by name" aria-label="search" />
                            <button class="btn btn-sm btn-outline-secondary border-300 hover-border-secondary"><span class="fa fa-search fs--1"></span></button>
                          </div>
                        </form>
                      </div>
                    </div>
                    <div class="border-bottom border-200 my-3"></div>
                    <div class="d-flex align-items-center justify-content-between justify-content-lg-end px-x1">
                      <button class="btn btn-sm btn-falcon-default d-xl-none" type="button" data-bs-toggle="offcanvas" data-bs-target="#ticketOffcanvas" aria-controls="ticketOffcanvas"><span class="fas fa-filter" data-fa-transform="shrink-4 down-1"></span><span class="ms-1 d-none d-sm-inline-block">Filter</span></button>
                      <div class="bg-300 mx-3 d-none d-lg-block d-xl-none" style="width:1px; height:29px"></div>
                      <div class="d-none" id="table-ticket-actions">
                        <div class="d-flex">
                          <select class="form-select form-select-sm" aria-label="Bulk actions">
                            <option selected="">Bulk actions</option>
                            <option value="Refund">Refund</option>
                            <option value="Delete">Delete</option>
                            <option value="Archive">Archive</option>
                          </select>
                          <button class="btn btn-falcon-default btn-sm ms-2" type="button">Apply</button>
                        </div>
                      </div>
                      <div class="d-flex align-items-center" id="table-ticket-replace-element">
                        <div class="dropdown">
                          <button class="btn btn-sm btn-falcon-default dropdown-toggle dropdown-caret-none" type="button" id="ticket-layout" data-bs-toggle="dropdown" data-boundary="window" aria-haspopup="true" aria-expanded="false" data-bs-reference="parent"><span class="d-none d-sm-inline-block d-xl-none d-xxl-inline-block me-1">Table View</span><span class="fas fa-chevron-down" data-fa-transform="shrink-3 down-1"></span></button>
                          <div class="dropdown-menu dropdown-toggle-item dropdown-menu-end border py-2" aria-labelledby="ticket-layout"><a class="dropdown-item active" href="../../app/support-desk/table-view.jsp">Table View</a><a class="dropdown-item" href="../../app/support-desk/card-view.jsp">Card View</a></div>
                        </div>
                        <button class="btn btn-falcon-default btn-sm mx-2" type="button"><span class="fas fa-plus" data-fa-transform="shrink-3"></span><span class="d-none d-sm-inline-block d-xl-none d-xxl-inline-block ms-1">New</span></button>
                        <button class="btn btn-falcon-default btn-sm" type="button"><span class="fas fa-external-link-alt" data-fa-transform="shrink-3"></span><span class="d-none d-sm-inline-block d-xl-none d-xxl-inline-block ms-1">Export</span></button>
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
                    <table class="table table-sm mb-0 fs--1 table-view-tickets">
                      <thead class="text-800 bg-light">
                        <tr>
                          <th class="py-2 fs-0 pe-2" style="width: 28px;">
                            <div class="form-check d-flex align-items-center">
                              <input class="form-check-input" id="checkbox-bulk-table-tickets-select" type="checkbox" data-bulk-select='{"body":"table-ticket-body","actions":"table-ticket-actions","replacedElement":"table-ticket-replace-element"}' />
                            </div>
                          </th>
                          <th class="sort align-middle ps-2" data-sort="Name">Name</th>
                          <th class="sort align-middle" data-sort="Club Title" style="min-width:15.625rem">Club Title</th>
                          <th class="sort align-middle" data-sort="status">Status</th>
                          <th class="sort align-middle" data-sort="Date">Date</th>
                        </tr>
                      </thead>
                      <tbody class="list" id="table-ticket-body">
                        <tr>
                          <td class="align-middle fs-0 py-3">
                            <div class="form-check mb-0">
                              <input class="form-check-input" type="checkbox" id="table-view-tickets-0" data-bulk-select-row="data-bulk-select-row" />
                            </div>
                          </td>
                          <td class="align-middle client white-space-nowrap pe-3 pe-xxl-4 ps-2">
                            <div class="d-flex align-items-center gap-2 position-relative">
                              <div class="avatar avatar-xl">
                                <div class="avatar-name rounded-circle"><span>HG</span></div>
                              </div>
                              <h6 class="mb-0"><a class="stretched-link text-900" href="../../app/support-desk/contact-details.jsp">홍길동</a></h6>
                            </div>
                          </td>
                          <td class="align-middle subject py-2 pe-4"><a class="fw-semi-bold" href="../../app/support-desk/tickets-preview.jsp">clu2</a></td>
                          <td class="align-middle status fs-0 pe-4"><small class="badge rounded badge-subtle-success false">신규</small>
                          </td>
                          <td class="align-middle Date pe-4">
                          	2023-08-03
                          </td>
                        </tr>
                        <tr>
                          <td class="align-middle fs-0 py-3">
                            <div class="form-check mb-0">
                              <input class="form-check-input" type="checkbox" id="table-view-tickets-1" data-bulk-select-row="data-bulk-select-row" />
                            </div>
                          </td>
                          <td class="align-middle client white-space-nowrap pe-3 pe-xxl-4 ps-2">
                            <div class="d-flex align-items-center gap-2 position-relative">
                              <div class="avatar avatar-xl">
                                <div class="avatar-name rounded-circle"><span>L</span></div>
                              </div>
                              <h6 class="mb-0"><a class="stretched-link text-900" href="../../app/support-desk/contact-details.jsp">Luke</a></h6>
                            </div>
                          </td>
                          <td class="align-middle subject py-2 pe-4"><a class="fw-semi-bold" href="../../app/support-desk/tickets-preview.jsp">Change of refund my last buy | Order #125631</a></td>
                          <td class="align-middle status fs-0 pe-4"><small class="badge rounded badge-subtle-danger false">Overdue</small>
                          </td>
                           <td class="align-middle Date pe-4">
                          	2023-08-03
                          </td>
                        </tr>
                        <tr>
                          <td class="align-middle fs-0 py-3">
                            <div class="form-check mb-0">
                              <input class="form-check-input" type="checkbox" id="table-view-tickets-2" data-bulk-select-row="data-bulk-select-row" />
                            </div>
                          </td>
                          <td class="align-middle client white-space-nowrap pe-3 pe-xxl-4 ps-2">
                            <div class="d-flex align-items-center gap-2 position-relative">
                              <div class="avatar avatar-xl">
                                <img class="rounded-circle" src="../../assets/img/team/1-thumb.png" alt="" />

                              </div>
                              <h6 class="mb-0"><a class="stretched-link text-900" href="../../app/support-desk/contact-details.jsp">Finley</a></h6>
                            </div>
                          </td>
                          <td class="align-middle subject py-2 pe-4"><a class="fw-semi-bold" href="../../app/support-desk/tickets-preview.jsp">I need your help #2256</a></td>
                          <td class="align-middle status fs-0 pe-4"><small class="badge rounded badge-subtle-warning false">Remaining</small>
                          </td>
                           <td class="align-middle Date pe-4">
                          	2023-08-03
                          </td>
                        </tr>
                        </tr>
                        <tr>
                          <td class="align-middle fs-0 py-3">
                            <div class="form-check mb-0">
                              <input class="form-check-input" type="checkbox" id="table-view-tickets-3" data-bulk-select-row="data-bulk-select-row" />
                            </div>
                          </td>
                          <td class="align-middle client white-space-nowrap pe-3 pe-xxl-4 ps-2">
                            <div class="d-flex align-items-center gap-2 position-relative">
                              <div class="avatar avatar-xl">
                                <div class="avatar-name rounded-circle"><span>PG</span></div>
                              </div>
                              <h6 class="mb-0"><a class="stretched-link text-900" href="../../app/support-desk/contact-details.jsp">Peter Gill</a></h6>
                            </div>
                          </td>
                          <td class="align-middle subject py-2 pe-4"><a class="fw-semi-bold" href="../../app/support-desk/tickets-preview.jsp">I need your help #2256</a></td>
                          <td class="align-middle status fs-0 pe-4"><small class="badge rounded badge-subtle-info false">Responded</small>
                          </td>
                           <td class="align-middle Date pe-4">
                          	2023-08-03
                          </td>
                        </tr>
                        <tr>
                          <td class="align-middle fs-0 py-3">
                            <div class="form-check mb-0">
                              <input class="form-check-input" type="checkbox" id="table-view-tickets-4" data-bulk-select-row="data-bulk-select-row" />
                            </div>
                          </td>
                          <td class="align-middle client white-space-nowrap pe-3 pe-xxl-4 ps-2">
                            <div class="d-flex align-items-center gap-2 position-relative">
                              <div class="avatar avatar-xl">
                                <img class="rounded-circle" src="../../assets/img/team/25-thumb.png" alt="" />

                              </div>
                              <h6 class="mb-0"><a class="stretched-link text-900" href="../../app/support-desk/contact-details.jsp">Freya</a></h6>
                            </div>
                          </td>
                          <td class="align-middle subject py-2 pe-4"><a class="fw-semi-bold" href="../../app/support-desk/tickets-preview.jsp">Contact Froms #3264</a></td>
                          <td class="align-middle status fs-0 pe-4"><small class="badge rounded badge-subtle-secondary dark__bg-1000">Closed</small>
                          </td>
                           <td class="align-middle Date pe-4">
                          	2023-08-03
                          </td>
                        </tr>
                        <tr>
                          <td class="align-middle fs-0 py-3">
                            <div class="form-check mb-0">
                              <input class="form-check-input" type="checkbox" id="table-view-tickets-5" data-bulk-select-row="data-bulk-select-row" />
                            </div>
                          </td>
                          <td class="align-middle client white-space-nowrap pe-3 pe-xxl-4 ps-2">
                            <div class="d-flex align-items-center gap-2 position-relative">
                              <div class="avatar avatar-xl">
                                <div class="avatar-name rounded-circle"><span>M</span></div>
                              </div>
                              <h6 class="mb-0"><a class="stretched-link text-900" href="../../app/support-desk/contact-details.jsp">Morrison</a></h6>
                            </div>
                          </td>
                          <td class="align-middle subject py-2 pe-4"><a class="fw-semi-bold" href="../../app/support-desk/tickets-preview.jsp">I need your help #2256</a></td>
                          <td class="align-middle status fs-0 pe-4"><small class="badge rounded badge-subtle-info false">Responded</small>
                          </td>
                           <td class="align-middle Date pe-4">
                          	2023-08-03
                          </td>
                        </tr>
                        <tr>
                          <td class="align-middle fs-0 py-3">
                            <div class="form-check mb-0">
                              <input class="form-check-input" type="checkbox" id="table-view-tickets-6" data-bulk-select-row="data-bulk-select-row" />
                            </div>
                          </td>
                          <td class="align-middle client white-space-nowrap pe-3 pe-xxl-4 ps-2">
                            <div class="d-flex align-items-center gap-2 position-relative">
                              <div class="avatar avatar-xl">
                                <div class="avatar-name rounded-circle"><span>MB</span></div>
                              </div>
                              <h6 class="mb-0"><a class="stretched-link text-900" href="../../app/support-desk/contact-details.jsp">Morrison Banneker</a></h6>
                            </div>
                          </td>
                          <td class="align-middle subject py-2 pe-4"><a class="fw-semi-bold" href="../../app/support-desk/tickets-preview.jsp">I need your help #2256</a></td>
                          <td class="align-middle status fs-0 pe-4"><small class="badge rounded badge-subtle-secondary dark__bg-1000">Closed</small>
                          </td>
                           <td class="align-middle Date pe-4">
                          	2023-08-03
                          </td>
                        </tr>
                        <tr>
                          <td class="align-middle fs-0 py-3">
                            <div class="form-check mb-0">
                              <input class="form-check-input" type="checkbox" id="table-view-tickets-7" data-bulk-select-row="data-bulk-select-row" />
                            </div>
                          </td>
                          <td class="align-middle client white-space-nowrap pe-3 pe-xxl-4 ps-2">
                            <div class="d-flex align-items-center gap-2 position-relative">
                              <div class="avatar avatar-xl">
                                <img class="rounded-circle" src="../../assets/img/team/14-thumb.png" alt="" />

                              </div>
                              <h6 class="mb-0"><a class="stretched-link text-900" href="../../app/support-desk/contact-details.jsp">Aar Kay</a></h6>
                            </div>
                          </td>
                          <td class="align-middle subject py-2 pe-4"><a class="fw-semi-bold" href="../../app/support-desk/tickets-preview.jsp">Regarding Falcon Theme #3262</a></td>
                          <td class="align-middle status fs-0 pe-4"><small class="badge rounded badge-subtle-success false">Recent</small>
                          </td>
                           <td class="align-middle Date pe-4">
                          	2023-08-03
                          </td>
                        </tr>
                        <tr>
                          <td class="align-middle fs-0 py-3">
                            <div class="form-check mb-0">
                              <input class="form-check-input" type="checkbox" id="table-view-tickets-8" data-bulk-select-row="data-bulk-select-row" />
                            </div>
                          </td>
                          <td class="align-middle client white-space-nowrap pe-3 pe-xxl-4 ps-2">
                            <div class="d-flex align-items-center gap-2 position-relative">
                              <div class="avatar avatar-xl">
                                <div class="avatar-name rounded-circle"><span>FB</span></div>
                              </div>
                              <h6 class="mb-0"><a class="stretched-link text-900" href="../../app/support-desk/contact-details.jsp">Fadil Badr</a></h6>
                            </div>
                          </td>
                          <td class="align-middle subject py-2 pe-4"><a class="fw-semi-bold" href="../../app/support-desk/tickets-preview.jsp">i would like to buy theme #3261</a></td>
                          <td class="align-middle status fs-0 pe-4"><small class="badge rounded badge-subtle-secondary dark__bg-1000">Closed</small>
                          </td>
                           <td class="align-middle Date pe-4">
                          	2023-08-03
                          </td>
                        </tr>
                        <tr>
                          <td class="align-middle fs-0 py-3">
                            <div class="form-check mb-0">
                              <input class="form-check-input" type="checkbox" id="table-view-tickets-9" data-bulk-select-row="data-bulk-select-row" />
                            </div>
                          </td>
                          <td class="align-middle client white-space-nowrap pe-3 pe-xxl-4 ps-2">
                            <div class="d-flex align-items-center gap-2 position-relative">
                              <div class="avatar avatar-xl">
                                <img class="rounded-circle" src="../../assets/img/team/3-thumb.png" alt="" />

                              </div>
                              <h6 class="mb-0"><a class="stretched-link text-900" href="../../app/support-desk/contact-details.jsp">Regina Kempt</a></h6>
                            </div>
                          </td>
                          <td class="align-middle subject py-2 pe-4"><a class="fw-semi-bold" href="../../app/support-desk/tickets-preview.jsp">Theme info (icons) #3260</a></td>
                          <td class="align-middle status fs-0 pe-4"><small class="badge rounded badge-subtle-secondary dark__bg-1000">Closed</small>
                          </td>
                           <td class="align-middle Date pe-4">
                          	2023-08-03
                          </td>
                        </tr>
                        <tr>
                          <td class="align-middle fs-0 py-3">
                            <div class="form-check mb-0">
                              <input class="form-check-input" type="checkbox" id="table-view-tickets-10" data-bulk-select-row="data-bulk-select-row" />
                            </div>
                          </td>
                          <td class="align-middle client white-space-nowrap pe-3 pe-xxl-4 ps-2">
                            <div class="d-flex align-items-center gap-2 position-relative">
                              <div class="avatar avatar-xl">
                                <div class="avatar-name rounded-circle"><span>C</span></div>
                              </div>
                              <h6 class="mb-0"><a class="stretched-link text-900" href="../../app/support-desk/contact-details.jsp">Caleb</a></h6>
                            </div>
                          </td>
                          <td class="align-middle subject py-2 pe-4"><a class="fw-semi-bold" href="../../app/support-desk/tickets-preview.jsp">Phishing link #3259</a></td>
                          <td class="align-middle status fs-0 pe-4"><small class="badge rounded badge-subtle-success false">Recent</small>
                          </td>
                           <td class="align-middle Date pe-4">
                          	2023-08-03
                          </td>
                        </tr>
                        <tr>
                          <td class="align-middle fs-0 py-3">
                            <div class="form-check mb-0">
                              <input class="form-check-input" type="checkbox" id="table-view-tickets-11" data-bulk-select-row="data-bulk-select-row" />
                            </div>
                          </td>
                          <td class="align-middle client white-space-nowrap pe-3 pe-xxl-4 ps-2">
                            <div class="d-flex align-items-center gap-2 position-relative">
                              <div class="avatar avatar-xl">
                                <div class="avatar-name rounded-circle"><span>FB</span></div>
                              </div>
                              <h6 class="mb-0"><a class="stretched-link text-900" href="../../app/support-desk/contact-details.jsp">Fadil Badr</a></h6>
                            </div>
                          </td>
                          <td class="align-middle subject py-2 pe-4"><a class="fw-semi-bold" href="../../app/support-desk/tickets-preview.jsp">i would like to buy theme #3261</a></td>
                          <td class="align-middle status fs-0 pe-4"><small class="badge rounded badge-subtle-secondary dark__bg-1000">Closed</small>
                          </td>
                           <td class="align-middle Date pe-4">
                          	2023-08-03
                          </td>
                        </tr>
                        <tr>
                          <td class="align-middle fs-0 py-3">
                            <div class="form-check mb-0">
                              <input class="form-check-input" type="checkbox" id="table-view-tickets-12" data-bulk-select-row="data-bulk-select-row" />
                            </div>
                          </td>
                          <td class="align-middle client white-space-nowrap pe-3 pe-xxl-4 ps-2">
                            <div class="d-flex align-items-center gap-2 position-relative">
                              <div class="avatar avatar-xl">
                                <img class="rounded-circle" src="../../assets/img/team/3-thumb.png" alt="" />

                              </div>
                              <h6 class="mb-0"><a class="stretched-link text-900" href="../../app/support-desk/contact-details.jsp">Regina Kempt</a></h6>
                            </div>
                          </td>
                          <td class="align-middle subject py-2 pe-4"><a class="fw-semi-bold" href="../../app/support-desk/tickets-preview.jsp">Theme info (icons) #3260</a></td>
                          <td class="align-middle status fs-0 pe-4"><small class="badge rounded badge-subtle-secondary dark__bg-1000">Closed</small>
                          </td>
                           <td class="align-middle Date pe-4">
                          	2023-08-03
                          </td>
                        </tr>
                        <tr>
                          <td class="align-middle fs-0 py-3">
                            <div class="form-check mb-0">
                              <input class="form-check-input" type="checkbox" id="table-view-tickets-13" data-bulk-select-row="data-bulk-select-row" />
                            </div>
                          </td>
                          <td class="align-middle client white-space-nowrap pe-3 pe-xxl-4 ps-2">
                            <div class="d-flex align-items-center gap-2 position-relative">
                              <div class="avatar avatar-xl">
                                <div class="avatar-name rounded-circle"><span>C</span></div>
                              </div>
                              <h6 class="mb-0"><a class="stretched-link text-900" href="../../app/support-desk/contact-details.jsp">Caleb</a></h6>
                            </div>
                          </td>
                          <td class="align-middle subject py-2 pe-4"><a class="fw-semi-bold" href="../../app/support-desk/tickets-preview.jsp">Phishing link #3259</a></td>
                          <td class="align-middle status fs-0 pe-4"><small class="badge rounded badge-subtle-success false">Recent</small>
                          </td>
                          <td class="align-middle Date pe-4">
                          	2023-08-03
                          </td>
                        </tr>
                        <tr>
                          <td class="align-middle fs-0 py-3">
                            <div class="form-check mb-0">
                              <input class="form-check-input" type="checkbox" id="table-view-tickets-14" data-bulk-select-row="data-bulk-select-row" />
                            </div>
                          </td>
                          <td class="align-middle client white-space-nowrap pe-3 pe-xxl-4 ps-2">
                            <div class="d-flex align-items-center gap-2 position-relative">
                              <div class="avatar avatar-xl">
                                <div class="avatar-name rounded-circle"><span>EW</span></div>
                              </div>
                              <h6 class="mb-0"><a class="stretched-link text-900" href="../../app/support-desk/contact-details.jsp">Emma Watson</a></h6>
                            </div>
                          </td>
                          <td class="align-middle subject py-2 pe-4"><a class="fw-semi-bold" href="../../app/support-desk/tickets-preview.jsp">Synapse Design #1125</a></td>
                          <td class="align-middle status fs-0 pe-4"><small class="badge rounded badge-subtle-success false">Recent</small>
                          </td>
                           <td class="align-middle Date pe-4">
                          	2023-08-03
                          </td>
                        </tr>
                        <tr>
                          <td class="align-middle fs-0 py-3">
                            <div class="form-check mb-0">
                              <input class="form-check-input" type="checkbox" id="table-view-tickets-15" data-bulk-select-row="data-bulk-select-row" />
                            </div>
                          </td>
                          <td class="align-middle client white-space-nowrap pe-3 pe-xxl-4 ps-2">
                            <div class="d-flex align-items-center gap-2 position-relative">
                              <div class="avatar avatar-xl">
                                <div class="avatar-name rounded-circle"><span>L</span></div>
                              </div>
                              <h6 class="mb-0"><a class="stretched-link text-900" href="../../app/support-desk/contact-details.jsp">Luke</a></h6>
                            </div>
                          </td>
                          <td class="align-middle subject py-2 pe-4"><a class="fw-semi-bold" href="../../app/support-desk/tickets-preview.jsp">Change of refund my last buy | Order #125631</a></td>
                          <td class="align-middle status fs-0 pe-4"><small class="badge rounded badge-subtle-danger false">Overdue</small>
                          </td>
                           <td class="align-middle Date pe-4">
                          	2023-08-03
                          </td>
                        </tr>
                        <tr>
                          <td class="align-middle fs-0 py-3">
                            <div class="form-check mb-0">
                              <input class="form-check-input" type="checkbox" id="table-view-tickets-16" data-bulk-select-row="data-bulk-select-row" />
                            </div>
                          </td>
                          <td class="align-middle client white-space-nowrap pe-3 pe-xxl-4 ps-2">
                            <div class="d-flex align-items-center gap-2 position-relative">
                              <div class="avatar avatar-xl">
                                <img class="rounded-circle" src="../../assets/img/team/1-thumb.png" alt="" />

                              </div>
                              <h6 class="mb-0"><a class="stretched-link text-900" href="../../app/support-desk/contact-details.jsp">Finley</a></h6>
                            </div>
                          </td>
                          <td class="align-middle subject py-2 pe-4"><a class="fw-semi-bold" href="../../app/support-desk/tickets-preview.jsp">I need your help #2256</a></td>
                          <td class="align-middle status fs-0 pe-4"><small class="badge rounded badge-subtle-warning false">Remaining</small>
                          </td>
                           <td class="align-middle Date pe-4">
                          	2023-08-03
                          </td>
                        </tr>
                        <tr>
                          <td class="align-middle fs-0 py-3">
                            <div class="form-check mb-0">
                              <input class="form-check-input" type="checkbox" id="table-view-tickets-17" data-bulk-select-row="data-bulk-select-row" />
                            </div>
                          </td>
                          <td class="align-middle client white-space-nowrap pe-3 pe-xxl-4 ps-2">
                            <div class="d-flex align-items-center gap-2 position-relative">
                              <div class="avatar avatar-xl">
                                <div class="avatar-name rounded-circle"><span>PG</span></div>
                              </div>
                              <h6 class="mb-0"><a class="stretched-link text-900" href="../../app/support-desk/contact-details.jsp">Peter Gill</a></h6>
                            </div>
                          </td>
                          <td class="align-middle subject py-2 pe-4"><a class="fw-semi-bold" href="../../app/support-desk/tickets-preview.jsp">I need your help #2256</a></td>
                          <td class="align-middle status fs-0 pe-4"><small class="badge rounded badge-subtle-info false">Responded</small>
                          </td>
                           <td class="align-middle Date pe-4">
                          	2023-08-03
                          </td>
                        </tr>
                        <tr>
                          <td class="align-middle fs-0 py-3">
                            <div class="form-check mb-0">
                              <input class="form-check-input" type="checkbox" id="table-view-tickets-18" data-bulk-select-row="data-bulk-select-row" />
                            </div>
                          </td>
                          <td class="align-middle client white-space-nowrap pe-3 pe-xxl-4 ps-2">
                            <div class="d-flex align-items-center gap-2 position-relative">
                              <div class="avatar avatar-xl">
                                <img class="rounded-circle" src="../../assets/img/team/25-thumb.png" alt="" />

                              </div>
                              <h6 class="mb-0"><a class="stretched-link text-900" href="../../app/support-desk/contact-details.jsp">Freya</a></h6>
                            </div>
                          </td>
                          <td class="align-middle subject py-2 pe-4"><a class="fw-semi-bold" href="../../app/support-desk/tickets-preview.jsp">Contact Froms #3264</a></td>
                          <td class="align-middle status fs-0 pe-4"><small class="badge rounded badge-subtle-secondary dark__bg-1000">Closed</small>
                          </td>
                           <td class="align-middle Date pe-4">
                          	2023-08-03
                          </td>
                        </tr>
                        <tr>
                          <td class="align-middle fs-0 py-3">
                            <div class="form-check mb-0">
                              <input class="form-check-input" type="checkbox" id="table-view-tickets-19" data-bulk-select-row="data-bulk-select-row" />
                            </div>
                          </td>
                          <td class="align-middle client white-space-nowrap pe-3 pe-xxl-4 ps-2">
                            <div class="d-flex align-items-center gap-2 position-relative">
                              <div class="avatar avatar-xl">
                                <div class="avatar-name rounded-circle"><span>M</span></div>
                              </div>
                              <h6 class="mb-0"><a class="stretched-link text-900" href="../../app/support-desk/contact-details.jsp">Morrison</a></h6>
                            </div>
                          </td>
                          <td class="align-middle subject py-2 pe-4"><a class="fw-semi-bold" href="../../app/support-desk/tickets-preview.jsp">I need your help #2256</a></td>
                          <td class="align-middle status fs-0 pe-4"><small class="badge rounded badge-subtle-info false">Responded</small>
                          </td>
                           <td class="align-middle Date pe-4">
                          	2023-08-03
                          </td>
                        </tr>
                        <tr>
                          <td class="align-middle fs-0 py-3">
                            <div class="form-check mb-0">
                              <input class="form-check-input" type="checkbox" id="table-view-tickets-20" data-bulk-select-row="data-bulk-select-row" />
                            </div>
                          </td>
                          <td class="align-middle client white-space-nowrap pe-3 pe-xxl-4 ps-2">
                            <div class="d-flex align-items-center gap-2 position-relative">
                              <div class="avatar avatar-xl">
                                <div class="avatar-name rounded-circle"><span>MB</span></div>
                              </div>
                              <h6 class="mb-0"><a class="stretched-link text-900" href="../../app/support-desk/contact-details.jsp">Morrison Banneker</a></h6>
                            </div>
                          </td>
                          <td class="align-middle subject py-2 pe-4"><a class="fw-semi-bold" href="../../app/support-desk/tickets-preview.jsp">I need your help #2256</a></td>
                          <td class="align-middle status fs-0 pe-4"><small class="badge rounded badge-subtle-secondary dark__bg-1000">Closed</small>
                          </td>
                           <td class="align-middle Date pe-4">
                          	2023-08-03
                          </td>
                        </tr>
                        <tr>
                          <td class="align-middle fs-0 py-3">
                            <div class="form-check mb-0">
                              <input class="form-check-input" type="checkbox" id="table-view-tickets-21" data-bulk-select-row="data-bulk-select-row" />
                            </div>
                          </td>
                          <td class="align-middle client white-space-nowrap pe-3 pe-xxl-4 ps-2">
                            <div class="d-flex align-items-center gap-2 position-relative">
                              <div class="avatar avatar-xl">
                                <img class="rounded-circle" src="../../assets/img/team/14-thumb.png" alt="" />

                              </div>
                              <h6 class="mb-0"><a class="stretched-link text-900" href="../../app/support-desk/contact-details.jsp">Aar Kay</a></h6>
                            </div>
                          </td>
                          <td class="align-middle subject py-2 pe-4"><a class="fw-semi-bold" href="../../app/support-desk/tickets-preview.jsp">Regarding Falcon Theme #3262</a></td>
                          <td class="align-middle status fs-0 pe-4"><small class="badge rounded badge-subtle-success false">Recent</small>
                          </td>
                          <td class="align-middle Date pe-4">
                          	2023-08-03
                          </td>
                        </tr>
                        <tr>
                          <td class="align-middle fs-0 py-3">
                            <div class="form-check mb-0">
                              <input class="form-check-input" type="checkbox" id="table-view-tickets-22" data-bulk-select-row="data-bulk-select-row" />
                            </div>
                          </td>
                          <td class="align-middle client white-space-nowrap pe-3 pe-xxl-4 ps-2">
                            <div class="d-flex align-items-center gap-2 position-relative">
                              <div class="avatar avatar-xl">
                                <div class="avatar-name rounded-circle"><span>C</span></div>
                              </div>
                              <h6 class="mb-0"><a class="stretched-link text-900" href="../../app/support-desk/contact-details.jsp">Caleb</a></h6>
                            </div>
                          </td>
                          <td class="align-middle subject py-2 pe-4"><a class="fw-semi-bold" href="../../app/support-desk/tickets-preview.jsp">Phishing link #3259</a></td>
                          <td class="align-middle status fs-0 pe-4"><small class="badge rounded badge-subtle-success false">Recent</small>
                          </td>
                           <td class="align-middle Date pe-4">
                          	2023-08-03
                          </td>
                        </tr>
                        <tr>
                          <td class="align-middle fs-0 py-3">
                            <div class="form-check mb-0">
                              <input class="form-check-input" type="checkbox" id="table-view-tickets-23" data-bulk-select-row="data-bulk-select-row" />
                            </div>
                          </td>
                          <td class="align-middle client white-space-nowrap pe-3 pe-xxl-4 ps-2">
                            <div class="d-flex align-items-center gap-2 position-relative">
                              <div class="avatar avatar-xl">
                                <div class="avatar-name rounded-circle"><span>FB</span></div>
                              </div>
                              <h6 class="mb-0"><a class="stretched-link text-900" href="../../app/support-desk/contact-details.jsp">Fadil Badr</a></h6>
                            </div>
                          </td>
                          <td class="align-middle subject py-2 pe-4"><a class="fw-semi-bold" href="../../app/support-desk/tickets-preview.jsp">i would like to buy theme #3261</a></td>
                          <td class="align-middle status fs-0 pe-4"><small class="badge rounded badge-subtle-secondary dark__bg-1000">Closed</small>
                          </td>
                           <td class="align-middle Date pe-4">
                          	2023-08-03
                          </td>
                        </tr>
                        <tr>
                          <td class="align-middle fs-0 py-3">
                            <div class="form-check mb-0">
                              <input class="form-check-input" type="checkbox" id="table-view-tickets-24" data-bulk-select-row="data-bulk-select-row" />
                            </div>
                          </td>
                          <td class="align-middle client white-space-nowrap pe-3 pe-xxl-4 ps-2">
                            <div class="d-flex align-items-center gap-2 position-relative">
                              <div class="avatar avatar-xl">
                                <img class="rounded-circle" src="../../assets/img/team/3-thumb.png" alt="" />

                              </div>
                              <h6 class="mb-0"><a class="stretched-link text-900" href="../../app/support-desk/contact-details.jsp">Regina Kempt</a></h6>
                            </div>
                          </td>
                          <td class="align-middle subject py-2 pe-4"><a class="fw-semi-bold" href="../../app/support-desk/tickets-preview.jsp">Theme info (icons) #3260</a></td>
                          <td class="align-middle status fs-0 pe-4"><small class="badge rounded badge-subtle-secondary dark__bg-1000">Closed</small>
                          </td>
                           <td class="align-middle Date pe-4">
                          	2023-08-03
                          </td>
                        </tr>
                        <tr>
                          <td class="align-middle fs-0 py-3">
                            <div class="form-check mb-0">
                              <input class="form-check-input" type="checkbox" id="table-view-tickets-25" data-bulk-select-row="data-bulk-select-row" />
                            </div>
                          </td>
                          <td class="align-middle client white-space-nowrap pe-3 pe-xxl-4 ps-2">
                            <div class="d-flex align-items-center gap-2 position-relative">
                              <div class="avatar avatar-xl">
                                <div class="avatar-name rounded-circle"><span>EW</span></div>
                              </div>
                              <h6 class="mb-0"><a class="stretched-link text-900" href="../../app/support-desk/contact-details.jsp">Emma Watson</a></h6>
                            </div>
                          </td>
                          <td class="align-middle subject py-2 pe-4"><a class="fw-semi-bold" href="../../app/support-desk/tickets-preview.jsp">Synapse Design #1125</a></td>
                          <td class="align-middle status fs-0 pe-4"><small class="badge rounded badge-subtle-success false">Recent</small>
                          </td>
                           <td class="align-middle Date pe-4">
                          	2023-08-03
                          </td>
                        </tr>
                        <tr>
                          <td class="align-middle fs-0 py-3">
                            <div class="form-check mb-0">
                              <input class="form-check-input" type="checkbox" id="table-view-tickets-26" data-bulk-select-row="data-bulk-select-row" />
                            </div>
                          </td>
                          <td class="align-middle client white-space-nowrap pe-3 pe-xxl-4 ps-2">
                            <div class="d-flex align-items-center gap-2 position-relative">
                              <div class="avatar avatar-xl">
                                <div class="avatar-name rounded-circle"><span>L</span></div>
                              </div>
                              <h6 class="mb-0"><a class="stretched-link text-900" href="../../app/support-desk/contact-details.jsp">Luke</a></h6>
                            </div>
                          </td>
                          <td class="align-middle subject py-2 pe-4"><a class="fw-semi-bold" href="../../app/support-desk/tickets-preview.jsp">Change of refund my last buy | Order #125631</a></td>
                          <td class="align-middle status fs-0 pe-4"><small class="badge rounded badge-subtle-danger false">Overdue</small>
                          </td>
                           <td class="align-middle Date pe-4">
                          	2023-08-03
                          </td>
                        </tr>
                        <tr>
                          <td class="align-middle fs-0 py-3">
                            <div class="form-check mb-0">
                              <input class="form-check-input" type="checkbox" id="table-view-tickets-27" data-bulk-select-row="data-bulk-select-row" />
                            </div>
                          </td>
                          <td class="align-middle client white-space-nowrap pe-3 pe-xxl-4 ps-2">
                            <div class="d-flex align-items-center gap-2 position-relative">
                              <div class="avatar avatar-xl">
                                <img class="rounded-circle" src="../../assets/img/team/14-thumb.png" alt="" />

                              </div>
                              <h6 class="mb-0"><a class="stretched-link text-900" href="../../app/support-desk/contact-details.jsp">Aar Kay</a></h6>
                            </div>
                          </td>
                          <td class="align-middle subject py-2 pe-4"><a class="fw-semi-bold" href="../../app/support-desk/tickets-preview.jsp">Regarding Falcon Theme #3262</a></td>
                          <td class="align-middle status fs-0 pe-4"><small class="badge rounded badge-subtle-success false">Recent</small>
                          </td>
                           <td class="align-middle Date pe-4">
                          	2023-08-03
                          </td>
                        </tr>
                        <tr>
                          <td class="align-middle fs-0 py-3">
                            <div class="form-check mb-0">
                              <input class="form-check-input" type="checkbox" id="table-view-tickets-28" data-bulk-select-row="data-bulk-select-row" />
                            </div>
                          </td>
                          <td class="align-middle client white-space-nowrap pe-3 pe-xxl-4 ps-2">
                            <div class="d-flex align-items-center gap-2 position-relative">
                              <div class="avatar avatar-xl">
                                <div class="avatar-name rounded-circle"><span>MB</span></div>
                              </div>
                              <h6 class="mb-0"><a class="stretched-link text-900" href="../../app/support-desk/contact-details.jsp">Morrison Banneker</a></h6>
                            </div>
                          </td>
                          <td class="align-middle subject py-2 pe-4"><a class="fw-semi-bold" href="../../app/support-desk/tickets-preview.jsp">I need your help #2256</a></td>
                          <td class="align-middle status fs-0 pe-4"><small class="badge rounded badge-subtle-secondary dark__bg-1000">Closed</small>
                          </td>
                           <td class="align-middle Date pe-4">
                          	2023-08-03
                          </td>
                        </tr>
                        <tr>
                          <td class="align-middle fs-0 py-3">
                            <div class="form-check mb-0">
                              <input class="form-check-input" type="checkbox" id="table-view-tickets-29" data-bulk-select-row="data-bulk-select-row" />
                            </div>
                          </td>
                          <td class="align-middle client white-space-nowrap pe-3 pe-xxl-4 ps-2">
                            <div class="d-flex align-items-center gap-2 position-relative">
                              <div class="avatar avatar-xl">
                                <div class="avatar-name rounded-circle"><span>M</span></div>
                              </div>
                              <h6 class="mb-0"><a class="stretched-link text-900" href="../../app/support-desk/contact-details.jsp">Morrison</a></h6>
                            </div>
                          </td>
                          <td class="align-middle subject py-2 pe-4"><a class="fw-semi-bold" href="../../app/support-desk/tickets-preview.jsp">I need your help #2256</a></td>
                          <td class="align-middle status fs-0 pe-4"><small class="badge rounded badge-subtle-info false">Responded</small>
                          </td>
                           <td class="align-middle Date pe-4">
                          	2023-08-03
                          </td>
                        </tr>
                        <tr>
                          <td class="align-middle fs-0 py-3">
                            <div class="form-check mb-0">
                              <input class="form-check-input" type="checkbox" id="table-view-tickets-30" data-bulk-select-row="data-bulk-select-row" />
                            </div>
                          </td>
                          <td class="align-middle client white-space-nowrap pe-3 pe-xxl-4 ps-2">
                            <div class="d-flex align-items-center gap-2 position-relative">
                              <div class="avatar avatar-xl">
                                <img class="rounded-circle" src="../../assets/img/team/1-thumb.png" alt="" />

                              </div>
                              <h6 class="mb-0"><a class="stretched-link text-900" href="../../app/support-desk/contact-details.jsp">Finley</a></h6>
                            </div>
                          </td>
                          <td class="align-middle subject py-2 pe-4"><a class="fw-semi-bold" href="../../app/support-desk/tickets-preview.jsp">I need your help #2256</a></td>
                          <td class="align-middle status fs-0 pe-4"><small class="badge rounded badge-subtle-warning false">Remaining</small>
                          </td>
                           <td class="align-middle Date pe-4">
                          	2023-08-03
                          </td>
                        </tr>
                        <tr>
                          <td class="align-middle fs-0 py-3">
                            <div class="form-check mb-0">
                              <input class="form-check-input" type="checkbox" id="table-view-tickets-31" data-bulk-select-row="data-bulk-select-row" />
                            </div>
                          </td>
                          <td class="align-middle client white-space-nowrap pe-3 pe-xxl-4 ps-2">
                            <div class="d-flex align-items-center gap-2 position-relative">
                              <div class="avatar avatar-xl">
                                <div class="avatar-name rounded-circle"><span>PG</span></div>
                              </div>
                              <h6 class="mb-0"><a class="stretched-link text-900" href="../../app/support-desk/contact-details.jsp">Peter Gill</a></h6>
                            </div>
                          </td>
                          <td class="align-middle subject py-2 pe-4"><a class="fw-semi-bold" href="../../app/support-desk/tickets-preview.jsp">I need your help #2256</a></td>
                          <td class="align-middle status fs-0 pe-4"><small class="badge rounded badge-subtle-info false">Responded</small>
                          </td>
                           <td class="align-middle Date pe-4">
                          	2023-08-03
                          </td>
                        </tr>
                        <tr>
                          <td class="align-middle fs-0 py-3">
                            <div class="form-check mb-0">
                              <input class="form-check-input" type="checkbox" id="table-view-tickets-32" data-bulk-select-row="data-bulk-select-row" />
                            </div>
                          </td>
                          <td class="align-middle client white-space-nowrap pe-3 pe-xxl-4 ps-2">
                            <div class="d-flex align-items-center gap-2 position-relative">
                              <div class="avatar avatar-xl">
                                <img class="rounded-circle" src="../../assets/img/team/25-thumb.png" alt="" />

                              </div>
                              <h6 class="mb-0"><a class="stretched-link text-900" href="../../app/support-desk/contact-details.jsp">Freya</a></h6>
                            </div>
                          </td>
                          <td class="align-middle subject py-2 pe-4"><a class="fw-semi-bold" href="../../app/support-desk/tickets-preview.jsp">Contact Froms #3264</a></td>
                          <td class="align-middle status fs-0 pe-4"><small class="badge rounded badge-subtle-secondary dark__bg-1000">Closed</small>
                          </td>
                           <td class="align-middle Date pe-4">
                          	2023-08-03
                          </td>
                        </tr>
                      </tbody>
                    </table>
                    <div class="text-center d-none" id="tickets-table-fallback">
                      <p class="fw-bold fs-1 mt-3">No ticket found</p>
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