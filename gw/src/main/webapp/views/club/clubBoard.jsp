<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>
<!DOCTYPE html>
<div class="row gx-3">
            <div class="col-xxl-10 col-xl-9">
              <div class="card" id="ticketsTable" data-list='{"valueNames":["client","subject","status","priority","agent"],"page":7,"pagination":true,"fallback":"tickets-card-fallback"}'>
                <div class="card-header border-bottom border-200 px-0">
                  <div class="d-lg-flex justify-content-between">
                    <div class="row flex-between-center gy-2 px-x1">
                      <div class="col-auto pe-0">
                        <h6 class="mb-0">All Club</h6>
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
                          <button class="btn btn-sm btn-falcon-default dropdown-toggle dropdown-caret-none" type="button" id="ticket-layout" data-bs-toggle="dropdown" data-boundary="window" aria-haspopup="true" aria-expanded="false" data-bs-reference="parent"><span class="d-none d-sm-inline-block d-xl-none d-xxl-inline-block me-1">Card View</span><span class="fas fa-chevron-down" data-fa-transform="shrink-3 down-1"></span></button>
                          <div class="dropdown-menu dropdown-toggle-item dropdown-menu-end border py-2" aria-labelledby="ticket-layout"><a class="dropdown-item" href="../../app/support-desk/table-view.jsp">Table View</a><a class="dropdown-item active" href="../../app/support-desk/card-view.jsp">Card View</a></div>
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
                  <div class="form-check d-none">
                    <input class="form-check-input" id="checkbox-bulk-card-tickets-select" type="checkbox" data-bulk-select='{"body":"card-ticket-body","actions":"table-ticket-actions","replacedElement":"table-ticket-replace-element"}' />
                  </div>
                  <div class="list bg-light p-x1 d-flex flex-column gap-3" id="card-ticket-body">
                    <div class="bg-white dark__bg-1100 d-md-flex d-xl-inline-block d-xxl-flex align-items-center p-x1 rounded-3 shadow-sm card-view-height">
                      <div class="d-flex align-items-start align-items-sm-center">
                        <div class="form-check me-2 me-xxl-3 mb-0">
                          <input class="form-check-input" type="checkbox" id="card-view-tickets-0" data-bulk-select-row="data-bulk-select-row" />
                        </div><a class="d-none d-sm-block" href="../../app/support-desk/contact-details.jsp">
                          <div class="avatar avatar-xl avatar-3xl">
                            <div class="avatar-name rounded-circle"><span>jcm</span></div>
                          </div>
                        </a>
                        <div class="ms-1 ms-sm-3">
                          <p class="fw-semi-bold mb-3 mb-sm-2"><a href="../../app/support-desk/tickets-preview.jsp">club1</a></p>
                          <div class="row align-items-center gx-0 gy-2">
                            <div class="col-auto me-2">
                              <h6 class="client mb-0"><a class="text-800 d-flex align-items-center gap-1" href="../../app/support-desk/contact-details.jsp"><span class="fas fa-user" data-fa-transform="shrink-3 up-1"></span><span>정창모</span></a></h6>
                            </div>
                            <div class="col-auto lh-1 me-3"><small class="badge rounded badge-subtle-success false">최근</small>
                            </div>
                            <div class="col-auto">
                              <h6 class="mb-0 text-500">2d ago</h6>
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="border-bottom mt-4 mb-x1"></div>
                      <div class="d-flex justify-content-between ms-auto">
                        <div class="d-flex align-items-center gap-2 ms-md-4 ms-xl-0" style="width:7.5rem;">
                          <div style="--falcon-circle-progress-bar:100">
                            <svg class="circle-progress-svg" width="26" height="26" viewBox="0 0 120 120">
                              <circle class="progress-bar-rail" cx="60" cy="60" r="54" fill="none" stroke-linecap="round" stroke-width="12"></circle>
                              <circle class="progress-bar-top" cx="60" cy="60" r="54" fill="none" stroke-linecap="round" stroke="#e63757" stroke-width="12"></circle>
                            </svg>
                          </div>
                          <h6 class="mb-0 text-700">마감임박</h6>
                        </div>
                      </div>
                    </div>
                    <div class="bg-white dark__bg-1100 d-md-flex d-xl-inline-block d-xxl-flex align-items-center p-x1 rounded-3 shadow-sm card-view-height">
                      <div class="d-flex align-items-start align-items-sm-center">
                        <div class="form-check me-2 me-xxl-3 mb-0">
                          <input class="form-check-input" type="checkbox" id="card-view-tickets-1" data-bulk-select-row="data-bulk-select-row" />
                        </div><a class="d-none d-sm-block" href="../../app/support-desk/contact-details.jsp">
                          <div class="avatar avatar-xl avatar-3xl">
                            <div class="avatar-name rounded-circle"><span>hgd</span></div>
                          </div>
                        </a>
                        <div class="ms-1 ms-sm-3">
                          <p class="fw-semi-bold mb-3 mb-sm-2"><a href="../../app/support-desk/tickets-preview.jsp">club2</a></p>
                          <div class="row align-items-center gx-0 gy-2">
                            <div class="col-auto me-2">
                              <h6 class="client mb-0"><a class="text-800 d-flex align-items-center gap-1" href="../../app/support-desk/contact-details.jsp"><span class="fas fa-user" data-fa-transform="shrink-3 up-1"></span><span>홍길동</span></a></h6>
                            </div>
                            <div class="col-auto lh-1 me-3"><small class="badge rounded badge-subtle-danger false"></small>
                            </div>
                            <div class="col-auto">
                              <h6 class="mb-0 text-500">2d ago</h6>
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="border-bottom mt-4 mb-x1"></div>
                      <div class="d-flex justify-content-between ms-auto">
                        <div class="d-flex align-items-center gap-2 ms-md-4 ms-xl-0" style="width:7.5rem;">
                          <div style="--falcon-circle-progress-bar:75">
                            <svg class="circle-progress-svg" width="26" height="26" viewBox="0 0 120 120">
                              <circle class="progress-bar-rail" cx="60" cy="60" r="54" fill="none" stroke-linecap="round" stroke-width="12"></circle>
                              <circle class="progress-bar-top" cx="60" cy="60" r="54" fill="none" stroke-linecap="round" stroke="#F68F57" stroke-width="12"></circle>
                            </svg>
                          </div>
                          <h6 class="mb-0 text-700">모집 중</h6>
                        </div>
                      </div>
                    </div>
                    <div class="bg-white dark__bg-1100 d-md-flex d-xl-inline-block d-xxl-flex align-items-center p-x1 rounded-3 shadow-sm card-view-height">
                      <div class="d-flex align-items-start align-items-sm-center">
                        <div class="form-check me-2 me-xxl-3 mb-0">
                          <input class="form-check-input" type="checkbox" id="card-view-tickets-2" data-bulk-select-row="data-bulk-select-row" />
                        </div><a class="d-none d-sm-block" href="../../app/support-desk/contact-details.jsp">
                          <div class="avatar avatar-xl avatar-3xl">
                            <div class="avatar-name rounded-circle"><span>kim</span></div>
                          </div>
                        </a>
                        <div class="ms-1 ms-sm-3">
                          <p class="fw-semi-bold mb-3 mb-sm-2"><a href="../../app/support-desk/tickets-preview.jsp">club3</a></p>
                          <div class="row align-items-center gx-0 gy-2">
                            <div class="col-auto me-2">
                              <h6 class="client mb-0"><a class="text-800 d-flex align-items-center gap-1" href="../../app/support-desk/contact-details.jsp"><span class="fas fa-user" data-fa-transform="shrink-3 up-1"></span><span>김길동</span></a></h6>
                            </div>
                            <div class="col-auto lh-1 me-3"><small class="badge rounded badge-subtle-warning false"></small>
                            </div>
                            <div class="col-auto">
                              <h6 class="mb-0 text-500">2d ago</h6>
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="border-bottom mt-4 mb-x1"></div>
                      <div class="d-flex justify-content-between ms-auto">
                        <div class="d-flex align-items-center gap-2 ms-md-4 ms-xl-0" style="width:7.5rem;">
                          <div style="--falcon-circle-progress-bar:50">
                            <svg class="circle-progress-svg" width="26" height="26" viewBox="0 0 120 120">
                              <circle class="progress-bar-rail" cx="60" cy="60" r="54" fill="none" stroke-linecap="round" stroke-width="12"></circle>
                              <circle class="progress-bar-top" cx="60" cy="60" r="54" fill="none" stroke-linecap="round" stroke="#2A7BE4" stroke-width="12"></circle>
                            </svg>
                          </div>
                          <h6 class="mb-0 text-700">모집 중</h6>
                        </div>
                      </div>
                    </div>
                    <div class="bg-white dark__bg-1100 d-md-flex d-xl-inline-block d-xxl-flex align-items-center p-x1 rounded-3 shadow-sm card-view-height">
                      <div class="d-flex align-items-start align-items-sm-center">
                        <div class="form-check me-2 me-xxl-3 mb-0">
                          <input class="form-check-input" type="checkbox" id="card-view-tickets-3" data-bulk-select-row="data-bulk-select-row" />
                        </div><a class="d-none d-sm-block" href="../../app/support-desk/contact-details.jsp">
                          <div class="avatar avatar-xl avatar-3xl">
                            <div class="avatar-name rounded-circle"><span>Pk</span></div>
                          </div>
                        </a>
                        <div class="ms-1 ms-sm-3">
                          <p class="fw-semi-bold mb-3 mb-sm-2"><a href="../../app/support-desk/tickets-preview.jsp">club4</a></p>
                          <div class="row align-items-center gx-0 gy-2">
                            <div class="col-auto me-2">
                              <h6 class="client mb-0"><a class="text-800 d-flex align-items-center gap-1" href="../../app/support-desk/contact-details.jsp"><span class="fas fa-user" data-fa-transform="shrink-3 up-1"></span><span>박길동</span></a></h6>
                            </div>
                            <div class="col-auto lh-1 me-3"><small class="badge rounded badge-subtle-info false"></small>
                            </div>
                            <div class="col-auto">
                              <h6 class="mb-0 text-500">2d ago</h6>
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="border-bottom mt-4 mb-x1"></div>
                      <div class="d-flex justify-content-between ms-auto">
                        <div class="d-flex align-items-center gap-2 ms-md-4 ms-xl-0" style="width:7.5rem;">
                          <div style="--falcon-circle-progress-bar:25">
                            <svg class="circle-progress-svg" width="26" height="26" viewBox="0 0 120 120">
                              <circle class="progress-bar-rail" cx="60" cy="60" r="54" fill="none" stroke-linecap="round" stroke-width="12"></circle>
                              <circle class="progress-bar-top" cx="60" cy="60" r="54" fill="none" stroke-linecap="round" stroke="#00D27B" stroke-width="12"></circle>
                            </svg>
                          </div>
                          <h6 class="mb-0 text-700">신규</h6>
                        </div>
                      </div>
                    </div>
                    <div class="bg-white dark__bg-1100 d-md-flex d-xl-inline-block d-xxl-flex align-items-center p-x1 rounded-3 shadow-sm card-view-height">
                      <div class="d-flex align-items-start align-items-sm-center">
                        <div class="form-check me-2 me-xxl-3 mb-0">
                          <input class="form-check-input" type="checkbox" id="card-view-tickets-4" data-bulk-select-row="data-bulk-select-row" />
                        </div><a class="d-none d-sm-block" href="../../app/support-desk/contact-details.jsp">
                          <div class="avatar avatar-xl avatar-3xl">
                           <div class="avatar-name rounded-circle"><span>fu</span></div>
                          </div>
                        </a>
                        <div class="ms-1 ms-sm-3">
                          <p class="fw-semi-bold mb-3 mb-sm-2"><a href="../../app/support-desk/tickets-preview.jsp">club5</a></p>
                          <div class="row align-items-center gx-0 gy-2">
                            <div class="col-auto me-2">
                              <h6 class="client mb-0"><a class="text-800 d-flex align-items-center gap-1" href="../../app/support-desk/contact-details.jsp"><span class="fas fa-user" data-fa-transform="shrink-3 up-1"></span><span>푸길동</span></a></h6>
                            </div>
                            <div class="col-auto lh-1 me-3"><small class="badge rounded badge-subtle-secondary dark__bg-1000"></small>
                            </div>
                            <div class="col-auto">
                              <h6 class="mb-0 text-500">3d ago</h6>
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="border-bottom mt-4 mb-x1"></div>
                      <div class="d-flex justify-content-between ms-auto">
                        <div class="d-flex align-items-center gap-2 ms-md-4 ms-xl-0" style="width:7.5rem;">
                          <div style="--falcon-circle-progress-bar:50">
                            <svg class="circle-progress-svg" width="26" height="26" viewBox="0 0 120 120">
                              <circle class="progress-bar-rail" cx="60" cy="60" r="54" fill="none" stroke-linecap="round" stroke-width="12"></circle>
                              <circle class="progress-bar-top" cx="60" cy="60" r="54" fill="none" stroke-linecap="round" stroke="#2A7BE4" stroke-width="12"></circle>
                            </svg>
                          </div>
                          <h6 class="mb-0 text-700">모집 중</h6>
                        </div>
                      </div>
                    </div>
                    <div class="bg-white dark__bg-1100 d-md-flex d-xl-inline-block d-xxl-flex align-items-center p-x1 rounded-3 shadow-sm card-view-height">
                      <div class="d-flex align-items-start align-items-sm-center">
                        <div class="form-check me-2 me-xxl-3 mb-0">
                          <input class="form-check-input" type="checkbox" id="card-view-tickets-5" data-bulk-select-row="data-bulk-select-row" />
                        </div><a class="d-none d-sm-block" href="../../app/support-desk/contact-details.jsp">
                          <div class="avatar avatar-xl avatar-3xl">
                            <div class="avatar-name rounded-circle"><span>hgd</span></div>
                          </div>
                        </a>
                        <div class="ms-1 ms-sm-3">
                          <p class="fw-semi-bold mb-3 mb-sm-2"><a href="../../app/support-desk/tickets-preview.jsp">club6</a></p>
                          <div class="row align-items-center gx-0 gy-2">
                            <div class="col-auto me-2">
                              <h6 class="client mb-0"><a class="text-800 d-flex align-items-center gap-1" href="../../app/support-desk/contact-details.jsp"><span class="fas fa-user" data-fa-transform="shrink-3 up-1"></span><span>황길동</span></a></h6>
                            </div>
                            <div class="col-auto lh-1 me-3"><small class="badge rounded badge-subtle-info false"></small>
                            </div>
                            <div class="col-auto">
                              <h6 class="mb-0 text-500">4d ago</h6>
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="border-bottom mt-4 mb-x1"></div>
                      <div class="d-flex justify-content-between ms-auto">
                        <div class="d-flex align-items-center gap-2 ms-md-4 ms-xl-0" style="width:7.5rem;">
                          <div style="--falcon-circle-progress-bar:50">
                            <svg class="circle-progress-svg" width="26" height="26" viewBox="0 0 120 120">
                              <circle class="progress-bar-rail" cx="60" cy="60" r="54" fill="none" stroke-linecap="round" stroke-width="12"></circle>
                              <circle class="progress-bar-top" cx="60" cy="60" r="54" fill="none" stroke-linecap="round" stroke="#2A7BE4" stroke-width="12"></circle>
                            </svg>
                          </div>
                          <h6 class="mb-0 text-700">모집 중</h6>
                        </div>
                      </div>
                    </div>
                    <div class="bg-white dark__bg-1100 d-md-flex d-xl-inline-block d-xxl-flex align-items-center p-x1 rounded-3 shadow-sm card-view-height">
                      <div class="d-flex align-items-start align-items-sm-center">
                        <div class="form-check me-2 me-xxl-3 mb-0">
                          <input class="form-check-input" type="checkbox" id="card-view-tickets-6" data-bulk-select-row="data-bulk-select-row" />
                        </div><a class="d-none d-sm-block" href="../../app/support-desk/contact-details.jsp">
                          <div class="avatar avatar-xl avatar-3xl">
                            <div class="avatar-name rounded-circle"><span>choi</span></div>
                          </div>
                        </a>
                        <div class="ms-1 ms-sm-3">
                          <p class="fw-semi-bold mb-3 mb-sm-2"><a href="../../app/support-desk/tickets-preview.jsp">club7</a></p>
                          <div class="row align-items-center gx-0 gy-2">
                            <div class="col-auto me-2">
                              <h6 class="client mb-0"><a class="text-800 d-flex align-items-center gap-1" href="../../app/support-desk/contact-details.jsp"><span class="fas fa-user" data-fa-transform="shrink-3 up-1"></span><span>최정윤</span></a></h6>
                            </div>
                            <div class="col-auto lh-1 me-3"><small class="badge rounded badge-subtle-secondary dark__bg-1000"></small>
                            </div>
                            <div class="col-auto">
                              <h6 class="mb-0 text-500">3d ago</h6>
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="border-bottom mt-4 mb-x1"></div>
                      <div class="d-flex justify-content-between ms-auto">
                        <div class="d-flex align-items-center gap-2 ms-md-4 ms-xl-0" style="width:7.5rem;">
                          <div style="--falcon-circle-progress-bar:50">
                            <svg class="circle-progress-svg" width="26" height="26" viewBox="0 0 120 120">
                              <circle class="progress-bar-rail" cx="60" cy="60" r="54" fill="none" stroke-linecap="round" stroke-width="12"></circle>
                              <circle class="progress-bar-top" cx="60" cy="60" r="54" fill="none" stroke-linecap="round" stroke="#2A7BE4" stroke-width="12"></circle>
                            </svg>
                          </div>
                          <h6 class="mb-0 text-700">모집 중</h6>
                        </div>
                      </div>
                    </div>
                    <div class="bg-white dark__bg-1100 d-md-flex d-xl-inline-block d-xxl-flex align-items-center p-x1 rounded-3 shadow-sm card-view-height">
                      <div class="d-flex align-items-start align-items-sm-center">
                        <div class="form-check me-2 me-xxl-3 mb-0">
                          <input class="form-check-input" type="checkbox" id="card-view-tickets-7" data-bulk-select-row="data-bulk-select-row" />
                        </div><a class="d-none d-sm-block" href="../../app/support-desk/contact-details.jsp">
                          <div class="avatar avatar-xl avatar-3xl">
                            <img class="rounded-circle" src="../../assets/img/team/14-thumb.png" alt="" />

                          </div>
                        </a>
                        <div class="ms-1 ms-sm-3">
                          <p class="fw-semi-bold mb-3 mb-sm-2"><a href="../../app/support-desk/tickets-preview.jsp">Regarding Falcon Theme #3262</a></p>
                          <div class="row align-items-center gx-0 gy-2">
                            <div class="col-auto me-2">
                              <h6 class="client mb-0"><a class="text-800 d-flex align-items-center gap-1" href="../../app/support-desk/contact-details.jsp"><span class="fas fa-user" data-fa-transform="shrink-3 up-1"></span><span>Aar Kay</span></a></h6>
                            </div>
                            <div class="col-auto lh-1 me-3"><small class="badge rounded badge-subtle-success false">Recent</small>
                            </div>
                            <div class="col-auto">
                              <h6 class="mb-0 text-500">2d ago</h6>
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="border-bottom mt-4 mb-x1"></div>
                      <div class="d-flex justify-content-between ms-auto">
                        <div class="d-flex align-items-center gap-2 ms-md-4 ms-xl-0" style="width:7.5rem;">
                          <div style="--falcon-circle-progress-bar:75">
                            <svg class="circle-progress-svg" width="26" height="26" viewBox="0 0 120 120">
                              <circle class="progress-bar-rail" cx="60" cy="60" r="54" fill="none" stroke-linecap="round" stroke-width="12"></circle>
                              <circle class="progress-bar-top" cx="60" cy="60" r="54" fill="none" stroke-linecap="round" stroke="#F68F57" stroke-width="12"></circle>
                            </svg>
                          </div>
                          <h6 class="mb-0 text-700">High</h6>
                        </div>
                        <select class="form-select form-select-sm" aria-label="agents actions" style="width:9.375rem;">
                          <option>Select Agent</option>
                          <option>Anindya</option>
                          <option>Nowrin</option>
                          <option>Khalid</option>
                        </select>
                      </div>
                    </div>
                    <div class="bg-white dark__bg-1100 d-md-flex d-xl-inline-block d-xxl-flex align-items-center p-x1 rounded-3 shadow-sm card-view-height">
                      <div class="d-flex align-items-start align-items-sm-center">
                        <div class="form-check me-2 me-xxl-3 mb-0">
                          <input class="form-check-input" type="checkbox" id="card-view-tickets-8" data-bulk-select-row="data-bulk-select-row" />
                        </div><a class="d-none d-sm-block" href="../../app/support-desk/contact-details.jsp">
                          <div class="avatar avatar-xl avatar-3xl">
                            <div class="avatar-name rounded-circle"><span>FB</span></div>
                          </div>
                        </a>
                        <div class="ms-1 ms-sm-3">
                          <p class="fw-semi-bold mb-3 mb-sm-2"><a href="../../app/support-desk/tickets-preview.jsp">i would like to buy theme #3261</a></p>
                          <div class="row align-items-center gx-0 gy-2">
                            <div class="col-auto me-2">
                              <h6 class="client mb-0"><a class="text-800 d-flex align-items-center gap-1" href="../../app/support-desk/contact-details.jsp"><span class="fas fa-user" data-fa-transform="shrink-3 up-1"></span><span>Fadil Badr</span></a></h6>
                            </div>
                            <div class="col-auto lh-1 me-3"><small class="badge rounded badge-subtle-secondary dark__bg-1000">Closed</small>
                            </div>
                            <div class="col-auto">
                              <h6 class="mb-0 text-500">2d ago</h6>
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="border-bottom mt-4 mb-x1"></div>
                      <div class="d-flex justify-content-between ms-auto">
                        <div class="d-flex align-items-center gap-2 ms-md-4 ms-xl-0" style="width:7.5rem;">
                          <div style="--falcon-circle-progress-bar:25">
                            <svg class="circle-progress-svg" width="26" height="26" viewBox="0 0 120 120">
                              <circle class="progress-bar-rail" cx="60" cy="60" r="54" fill="none" stroke-linecap="round" stroke-width="12"></circle>
                              <circle class="progress-bar-top" cx="60" cy="60" r="54" fill="none" stroke-linecap="round" stroke="#00D27B" stroke-width="12"></circle>
                            </svg>
                          </div>
                          <h6 class="mb-0 text-700">Low</h6>
                        </div>
                        <select class="form-select form-select-sm" aria-label="agents actions" style="width:9.375rem;">
                          <option>Select Agent</option>
                          <option>Anindya</option>
                          <option>Nowrin</option>
                          <option selected="selected">Khalid</option>
                        </select>
                      </div>
                    </div>
                    <div class="bg-white dark__bg-1100 d-md-flex d-xl-inline-block d-xxl-flex align-items-center p-x1 rounded-3 shadow-sm card-view-height">
                      <div class="d-flex align-items-start align-items-sm-center">
                        <div class="form-check me-2 me-xxl-3 mb-0">
                          <input class="form-check-input" type="checkbox" id="card-view-tickets-9" data-bulk-select-row="data-bulk-select-row" />
                        </div><a class="d-none d-sm-block" href="../../app/support-desk/contact-details.jsp">
                          <div class="avatar avatar-xl avatar-3xl">
                            <img class="rounded-circle" src="../../assets/img/team/3-thumb.png" alt="" />

                          </div>
                        </a>
                        <div class="ms-1 ms-sm-3">
                          <p class="fw-semi-bold mb-3 mb-sm-2"><a href="../../app/support-desk/tickets-preview.jsp">Theme info (icons) #3260</a></p>
                          <div class="row align-items-center gx-0 gy-2">
                            <div class="col-auto me-2">
                              <h6 class="client mb-0"><a class="text-800 d-flex align-items-center gap-1" href="../../app/support-desk/contact-details.jsp"><span class="fas fa-user" data-fa-transform="shrink-3 up-1"></span><span>Regina Kempt</span></a></h6>
                            </div>
                            <div class="col-auto lh-1 me-3"><small class="badge rounded badge-subtle-secondary dark__bg-1000">Closed</small>
                            </div>
                            <div class="col-auto">
                              <h6 class="mb-0 text-500">2d ago</h6>
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="border-bottom mt-4 mb-x1"></div>
                      <div class="d-flex justify-content-between ms-auto">
                        <div class="d-flex align-items-center gap-2 ms-md-4 ms-xl-0" style="width:7.5rem;">
                          <div style="--falcon-circle-progress-bar:50">
                            <svg class="circle-progress-svg" width="26" height="26" viewBox="0 0 120 120">
                              <circle class="progress-bar-rail" cx="60" cy="60" r="54" fill="none" stroke-linecap="round" stroke-width="12"></circle>
                              <circle class="progress-bar-top" cx="60" cy="60" r="54" fill="none" stroke-linecap="round" stroke="#2A7BE4" stroke-width="12"></circle>
                            </svg>
                          </div>
                          <h6 class="mb-0 text-700">Medium</h6>
                        </div>
                        <select class="form-select form-select-sm" aria-label="agents actions" style="width:9.375rem;">
                          <option>Select Agent</option>
                          <option selected="selected">Anindya</option>
                          <option>Nowrin</option>
                          <option>Khalid</option>
                        </select>
                      </div>
                    </div>
                    <div class="bg-white dark__bg-1100 d-md-flex d-xl-inline-block d-xxl-flex align-items-center p-x1 rounded-3 shadow-sm card-view-height">
                      <div class="d-flex align-items-start align-items-sm-center">
                        <div class="form-check me-2 me-xxl-3 mb-0">
                          <input class="form-check-input" type="checkbox" id="card-view-tickets-10" data-bulk-select-row="data-bulk-select-row" />
                        </div><a class="d-none d-sm-block" href="../../app/support-desk/contact-details.jsp">
                          <div class="avatar avatar-xl avatar-3xl">
                            <div class="avatar-name rounded-circle"><span>C</span></div>
                          </div>
                        </a>
                        <div class="ms-1 ms-sm-3">
                          <p class="fw-semi-bold mb-3 mb-sm-2"><a href="../../app/support-desk/tickets-preview.jsp">Phishing link #3259</a></p>
                          <div class="row align-items-center gx-0 gy-2">
                            <div class="col-auto me-2">
                              <h6 class="client mb-0"><a class="text-800 d-flex align-items-center gap-1" href="../../app/support-desk/contact-details.jsp"><span class="fas fa-user" data-fa-transform="shrink-3 up-1"></span><span>Caleb</span></a></h6>
                            </div>
                            <div class="col-auto lh-1 me-3"><small class="badge rounded badge-subtle-success false">Recent</small>
                            </div>
                            <div class="col-auto">
                              <h6 class="mb-0 text-500">2d ago</h6>
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="border-bottom mt-4 mb-x1"></div>
                      <div class="d-flex justify-content-between ms-auto">
                        <div class="d-flex align-items-center gap-2 ms-md-4 ms-xl-0" style="width:7.5rem;">
                          <div style="--falcon-circle-progress-bar:25">
                            <svg class="circle-progress-svg" width="26" height="26" viewBox="0 0 120 120">
                              <circle class="progress-bar-rail" cx="60" cy="60" r="54" fill="none" stroke-linecap="round" stroke-width="12"></circle>
                              <circle class="progress-bar-top" cx="60" cy="60" r="54" fill="none" stroke-linecap="round" stroke="#00D27B" stroke-width="12"></circle>
                            </svg>
                          </div>
                          <h6 class="mb-0 text-700">Low</h6>
                        </div>
                        <select class="form-select form-select-sm" aria-label="agents actions" style="width:9.375rem;">
                          <option>Select Agent</option>
                          <option>Anindya</option>
                          <option>Nowrin</option>
                          <option>Khalid</option>
                        </select>
                      </div>
                    </div>
                    <div class="bg-white dark__bg-1100 d-md-flex d-xl-inline-block d-xxl-flex align-items-center p-x1 rounded-3 shadow-sm card-view-height">
                      <div class="d-flex align-items-start align-items-sm-center">
                        <div class="form-check me-2 me-xxl-3 mb-0">
                          <input class="form-check-input" type="checkbox" id="card-view-tickets-11" data-bulk-select-row="data-bulk-select-row" />
                        </div><a class="d-none d-sm-block" href="../../app/support-desk/contact-details.jsp">
                          <div class="avatar avatar-xl avatar-3xl">
                            <div class="avatar-name rounded-circle"><span>FB</span></div>
                          </div>
                        </a>
                        <div class="ms-1 ms-sm-3">
                          <p class="fw-semi-bold mb-3 mb-sm-2"><a href="../../app/support-desk/tickets-preview.jsp">i would like to buy theme #3261</a></p>
                          <div class="row align-items-center gx-0 gy-2">
                            <div class="col-auto me-2">
                              <h6 class="client mb-0"><a class="text-800 d-flex align-items-center gap-1" href="../../app/support-desk/contact-details.jsp"><span class="fas fa-user" data-fa-transform="shrink-3 up-1"></span><span>Fadil Badr</span></a></h6>
                            </div>
                            <div class="col-auto lh-1 me-3"><small class="badge rounded badge-subtle-secondary dark__bg-1000">Closed</small>
                            </div>
                            <div class="col-auto">
                              <h6 class="mb-0 text-500">2d ago</h6>
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="border-bottom mt-4 mb-x1"></div>
                      <div class="d-flex justify-content-between ms-auto">
                        <div class="d-flex align-items-center gap-2 ms-md-4 ms-xl-0" style="width:7.5rem;">
                          <div style="--falcon-circle-progress-bar:50">
                            <svg class="circle-progress-svg" width="26" height="26" viewBox="0 0 120 120">
                              <circle class="progress-bar-rail" cx="60" cy="60" r="54" fill="none" stroke-linecap="round" stroke-width="12"></circle>
                              <circle class="progress-bar-top" cx="60" cy="60" r="54" fill="none" stroke-linecap="round" stroke="#2A7BE4" stroke-width="12"></circle>
                            </svg>
                          </div>
                          <h6 class="mb-0 text-700">Medium</h6>
                        </div>
                        <select class="form-select form-select-sm" aria-label="agents actions" style="width:9.375rem;">
                          <option>Select Agent</option>
                          <option>Anindya</option>
                          <option>Nowrin</option>
                          <option selected="selected">Khalid</option>
                        </select>
                      </div>
                    </div>
                    <div class="bg-white dark__bg-1100 d-md-flex d-xl-inline-block d-xxl-flex align-items-center p-x1 rounded-3 shadow-sm card-view-height">
                      <div class="d-flex align-items-start align-items-sm-center">
                        <div class="form-check me-2 me-xxl-3 mb-0">
                          <input class="form-check-input" type="checkbox" id="card-view-tickets-12" data-bulk-select-row="data-bulk-select-row" />
                        </div><a class="d-none d-sm-block" href="../../app/support-desk/contact-details.jsp">
                          <div class="avatar avatar-xl avatar-3xl">
                            <img class="rounded-circle" src="../../assets/img/team/3-thumb.png" alt="" />

                          </div>
                        </a>
                        <div class="ms-1 ms-sm-3">
                          <p class="fw-semi-bold mb-3 mb-sm-2"><a href="../../app/support-desk/tickets-preview.jsp">Theme info (icons) #3260</a></p>
                          <div class="row align-items-center gx-0 gy-2">
                            <div class="col-auto me-2">
                              <h6 class="client mb-0"><a class="text-800 d-flex align-items-center gap-1" href="../../app/support-desk/contact-details.jsp"><span class="fas fa-user" data-fa-transform="shrink-3 up-1"></span><span>Regina Kempt</span></a></h6>
                            </div>
                            <div class="col-auto lh-1 me-3"><small class="badge rounded badge-subtle-secondary dark__bg-1000">Closed</small>
                            </div>
                            <div class="col-auto">
                              <h6 class="mb-0 text-500">2d ago</h6>
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="border-bottom mt-4 mb-x1"></div>
                      <div class="d-flex justify-content-between ms-auto">
                        <div class="d-flex align-items-center gap-2 ms-md-4 ms-xl-0" style="width:7.5rem;">
                          <div style="--falcon-circle-progress-bar:25">
                            <svg class="circle-progress-svg" width="26" height="26" viewBox="0 0 120 120">
                              <circle class="progress-bar-rail" cx="60" cy="60" r="54" fill="none" stroke-linecap="round" stroke-width="12"></circle>
                              <circle class="progress-bar-top" cx="60" cy="60" r="54" fill="none" stroke-linecap="round" stroke="#00D27B" stroke-width="12"></circle>
                            </svg>
                          </div>
                          <h6 class="mb-0 text-700">Low</h6>
                        </div>
                        <select class="form-select form-select-sm" aria-label="agents actions" style="width:9.375rem;">
                          <option>Select Agent</option>
                          <option selected="selected">Anindya</option>
                          <option>Nowrin</option>
                          <option>Khalid</option>
                        </select>
                      </div>
                    </div>
                    <div class="bg-white dark__bg-1100 d-md-flex d-xl-inline-block d-xxl-flex align-items-center p-x1 rounded-3 shadow-sm card-view-height">
                      <div class="d-flex align-items-start align-items-sm-center">
                        <div class="form-check me-2 me-xxl-3 mb-0">
                          <input class="form-check-input" type="checkbox" id="card-view-tickets-13" data-bulk-select-row="data-bulk-select-row" />
                        </div><a class="d-none d-sm-block" href="../../app/support-desk/contact-details.jsp">
                          <div class="avatar avatar-xl avatar-3xl">
                            <div class="avatar-name rounded-circle"><span>C</span></div>
                          </div>
                        </a>
                        <div class="ms-1 ms-sm-3">
                          <p class="fw-semi-bold mb-3 mb-sm-2"><a href="../../app/support-desk/tickets-preview.jsp">Phishing link #3259</a></p>
                          <div class="row align-items-center gx-0 gy-2">
                            <div class="col-auto me-2">
                              <h6 class="client mb-0"><a class="text-800 d-flex align-items-center gap-1" href="../../app/support-desk/contact-details.jsp"><span class="fas fa-user" data-fa-transform="shrink-3 up-1"></span><span>Caleb</span></a></h6>
                            </div>
                            <div class="col-auto lh-1 me-3"><small class="badge rounded badge-subtle-success false">Recent</small>
                            </div>
                            <div class="col-auto">
                              <h6 class="mb-0 text-500">2d ago</h6>
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="border-bottom mt-4 mb-x1"></div>
                      <div class="d-flex justify-content-between ms-auto">
                        <div class="d-flex align-items-center gap-2 ms-md-4 ms-xl-0" style="width:7.5rem;">
                          <div style="--falcon-circle-progress-bar:50">
                            <svg class="circle-progress-svg" width="26" height="26" viewBox="0 0 120 120">
                              <circle class="progress-bar-rail" cx="60" cy="60" r="54" fill="none" stroke-linecap="round" stroke-width="12"></circle>
                              <circle class="progress-bar-top" cx="60" cy="60" r="54" fill="none" stroke-linecap="round" stroke="#2A7BE4" stroke-width="12"></circle>
                            </svg>
                          </div>
                          <h6 class="mb-0 text-700">Medium</h6>
                        </div>
                        <select class="form-select form-select-sm" aria-label="agents actions" style="width:9.375rem;">
                          <option>Select Agent</option>
                          <option>Anindya</option>
                          <option>Nowrin</option>
                          <option>Khalid</option>
                        </select>
                      </div>
                    </div>
                    <div class="bg-white dark__bg-1100 d-md-flex d-xl-inline-block d-xxl-flex align-items-center p-x1 rounded-3 shadow-sm card-view-height">
                      <div class="d-flex align-items-start align-items-sm-center">
                        <div class="form-check me-2 me-xxl-3 mb-0">
                          <input class="form-check-input" type="checkbox" id="card-view-tickets-14" data-bulk-select-row="data-bulk-select-row" />
                        </div><a class="d-none d-sm-block" href="../../app/support-desk/contact-details.jsp">
                          <div class="avatar avatar-xl avatar-3xl">
                            <div class="avatar-name rounded-circle"><span>EW</span></div>
                          </div>
                        </a>
                        <div class="ms-1 ms-sm-3">
                          <p class="fw-semi-bold mb-3 mb-sm-2"><a href="../../app/support-desk/tickets-preview.jsp">Synapse Design #1125</a></p>
                          <div class="row align-items-center gx-0 gy-2">
                            <div class="col-auto me-2">
                              <h6 class="client mb-0"><a class="text-800 d-flex align-items-center gap-1" href="../../app/support-desk/contact-details.jsp"><span class="fas fa-user" data-fa-transform="shrink-3 up-1"></span><span>Emma Watson</span></a></h6>
                            </div>
                            <div class="col-auto lh-1 me-3"><small class="badge rounded badge-subtle-success false">Recent</small>
                            </div>
                            <div class="col-auto">
                              <h6 class="mb-0 text-500">2d ago</h6>
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="border-bottom mt-4 mb-x1"></div>
                      <div class="d-flex justify-content-between ms-auto">
                        <div class="d-flex align-items-center gap-2 ms-md-4 ms-xl-0" style="width:7.5rem;">
                          <div style="--falcon-circle-progress-bar:100">
                            <svg class="circle-progress-svg" width="26" height="26" viewBox="0 0 120 120">
                              <circle class="progress-bar-rail" cx="60" cy="60" r="54" fill="none" stroke-linecap="round" stroke-width="12"></circle>
                              <circle class="progress-bar-top" cx="60" cy="60" r="54" fill="none" stroke-linecap="round" stroke="#e63757" stroke-width="12"></circle>
                            </svg>
                          </div>
                          <h6 class="mb-0 text-700">Urgent</h6>
                        </div>
                        <select class="form-select form-select-sm" aria-label="agents actions" style="width:9.375rem;">
                          <option>Select Agent</option>
                          <option selected="selected">Anindya</option>
                          <option>Nowrin</option>
                          <option>Khalid</option>
                        </select>
                      </div>
                    </div>
                    <div class="bg-white dark__bg-1100 d-md-flex d-xl-inline-block d-xxl-flex align-items-center p-x1 rounded-3 shadow-sm card-view-height">
                      <div class="d-flex align-items-start align-items-sm-center">
                        <div class="form-check me-2 me-xxl-3 mb-0">
                          <input class="form-check-input" type="checkbox" id="card-view-tickets-15" data-bulk-select-row="data-bulk-select-row" />
                        </div><a class="d-none d-sm-block" href="../../app/support-desk/contact-details.jsp">
                          <div class="avatar avatar-xl avatar-3xl">
                            <div class="avatar-name rounded-circle"><span>L</span></div>
                          </div>
                        </a>
                        <div class="ms-1 ms-sm-3">
                          <p class="fw-semi-bold mb-3 mb-sm-2"><a href="../../app/support-desk/tickets-preview.jsp">Change of refund my last buy | Order #125631</a></p>
                          <div class="row align-items-center gx-0 gy-2">
                            <div class="col-auto me-2">
                              <h6 class="client mb-0"><a class="text-800 d-flex align-items-center gap-1" href="../../app/support-desk/contact-details.jsp"><span class="fas fa-user" data-fa-transform="shrink-3 up-1"></span><span>Luke</span></a></h6>
                            </div>
                            <div class="col-auto lh-1 me-3"><small class="badge rounded badge-subtle-danger false">Overdue</small>
                            </div>
                            <div class="col-auto">
                              <h6 class="mb-0 text-500">2d ago</h6>
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="border-bottom mt-4 mb-x1"></div>
                      <div class="d-flex justify-content-between ms-auto">
                        <div class="d-flex align-items-center gap-2 ms-md-4 ms-xl-0" style="width:7.5rem;">
                          <div style="--falcon-circle-progress-bar:75">
                            <svg class="circle-progress-svg" width="26" height="26" viewBox="0 0 120 120">
                              <circle class="progress-bar-rail" cx="60" cy="60" r="54" fill="none" stroke-linecap="round" stroke-width="12"></circle>
                              <circle class="progress-bar-top" cx="60" cy="60" r="54" fill="none" stroke-linecap="round" stroke="#F68F57" stroke-width="12"></circle>
                            </svg>
                          </div>
                          <h6 class="mb-0 text-700">High</h6>
                        </div>
                        <select class="form-select form-select-sm" aria-label="agents actions" style="width:9.375rem;">
                          <option>Select Agent</option>
                          <option selected="selected">Anindya</option>
                          <option>Nowrin</option>
                          <option>Khalid</option>
                        </select>
                      </div>
                    </div>
                    <div class="bg-white dark__bg-1100 d-md-flex d-xl-inline-block d-xxl-flex align-items-center p-x1 rounded-3 shadow-sm card-view-height">
                      <div class="d-flex align-items-start align-items-sm-center">
                        <div class="form-check me-2 me-xxl-3 mb-0">
                          <input class="form-check-input" type="checkbox" id="card-view-tickets-16" data-bulk-select-row="data-bulk-select-row" />
                        </div><a class="d-none d-sm-block" href="../../app/support-desk/contact-details.jsp">
                          <div class="avatar avatar-xl avatar-3xl">
                            <img class="rounded-circle" src="../../assets/img/team/1-thumb.png" alt="" />

                          </div>
                        </a>
                        <div class="ms-1 ms-sm-3">
                          <p class="fw-semi-bold mb-3 mb-sm-2"><a href="../../app/support-desk/tickets-preview.jsp">I need your help #2256</a></p>
                          <div class="row align-items-center gx-0 gy-2">
                            <div class="col-auto me-2">
                              <h6 class="client mb-0"><a class="text-800 d-flex align-items-center gap-1" href="../../app/support-desk/contact-details.jsp"><span class="fas fa-user" data-fa-transform="shrink-3 up-1"></span><span>Finley</span></a></h6>
                            </div>
                            <div class="col-auto lh-1 me-3"><small class="badge rounded badge-subtle-warning false">Remaining</small>
                            </div>
                            <div class="col-auto">
                              <h6 class="mb-0 text-500">2d ago</h6>
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="border-bottom mt-4 mb-x1"></div>
                      <div class="d-flex justify-content-between ms-auto">
                        <div class="d-flex align-items-center gap-2 ms-md-4 ms-xl-0" style="width:7.5rem;">
                          <div style="--falcon-circle-progress-bar:50">
                            <svg class="circle-progress-svg" width="26" height="26" viewBox="0 0 120 120">
                              <circle class="progress-bar-rail" cx="60" cy="60" r="54" fill="none" stroke-linecap="round" stroke-width="12"></circle>
                              <circle class="progress-bar-top" cx="60" cy="60" r="54" fill="none" stroke-linecap="round" stroke="#2A7BE4" stroke-width="12"></circle>
                            </svg>
                          </div>
                          <h6 class="mb-0 text-700">Medium</h6>
                        </div>
                        <select class="form-select form-select-sm" aria-label="agents actions" style="width:9.375rem;">
                          <option>Select Agent</option>
                          <option>Anindya</option>
                          <option selected="selected">Nowrin</option>
                          <option>Khalid</option>
                        </select>
                      </div>
                    </div>
                    <div class="bg-white dark__bg-1100 d-md-flex d-xl-inline-block d-xxl-flex align-items-center p-x1 rounded-3 shadow-sm card-view-height">
                      <div class="d-flex align-items-start align-items-sm-center">
                        <div class="form-check me-2 me-xxl-3 mb-0">
                          <input class="form-check-input" type="checkbox" id="card-view-tickets-17" data-bulk-select-row="data-bulk-select-row" />
                        </div><a class="d-none d-sm-block" href="../../app/support-desk/contact-details.jsp">
                          <div class="avatar avatar-xl avatar-3xl">
                            <div class="avatar-name rounded-circle"><span>PG</span></div>
                          </div>
                        </a>
                        <div class="ms-1 ms-sm-3">
                          <p class="fw-semi-bold mb-3 mb-sm-2"><a href="../../app/support-desk/tickets-preview.jsp">I need your help #2256</a></p>
                          <div class="row align-items-center gx-0 gy-2">
                            <div class="col-auto me-2">
                              <h6 class="client mb-0"><a class="text-800 d-flex align-items-center gap-1" href="../../app/support-desk/contact-details.jsp"><span class="fas fa-user" data-fa-transform="shrink-3 up-1"></span><span>Peter Gill</span></a></h6>
                            </div>
                            <div class="col-auto lh-1 me-3"><small class="badge rounded badge-subtle-info false">Responded</small>
                            </div>
                            <div class="col-auto">
                              <h6 class="mb-0 text-500">2d ago</h6>
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="border-bottom mt-4 mb-x1"></div>
                      <div class="d-flex justify-content-between ms-auto">
                        <div class="d-flex align-items-center gap-2 ms-md-4 ms-xl-0" style="width:7.5rem;">
                          <div style="--falcon-circle-progress-bar:25">
                            <svg class="circle-progress-svg" width="26" height="26" viewBox="0 0 120 120">
                              <circle class="progress-bar-rail" cx="60" cy="60" r="54" fill="none" stroke-linecap="round" stroke-width="12"></circle>
                              <circle class="progress-bar-top" cx="60" cy="60" r="54" fill="none" stroke-linecap="round" stroke="#00D27B" stroke-width="12"></circle>
                            </svg>
                          </div>
                          <h6 class="mb-0 text-700">Low</h6>
                        </div>
                        <select class="form-select form-select-sm" aria-label="agents actions" style="width:9.375rem;">
                          <option>Select Agent</option>
                          <option>Anindya</option>
                          <option selected="selected">Nowrin</option>
                          <option>Khalid</option>
                        </select>
                      </div>
                    </div>
                    <div class="bg-white dark__bg-1100 d-md-flex d-xl-inline-block d-xxl-flex align-items-center p-x1 rounded-3 shadow-sm card-view-height">
                      <div class="d-flex align-items-start align-items-sm-center">
                        <div class="form-check me-2 me-xxl-3 mb-0">
                          <input class="form-check-input" type="checkbox" id="card-view-tickets-18" data-bulk-select-row="data-bulk-select-row" />
                        </div><a class="d-none d-sm-block" href="../../app/support-desk/contact-details.jsp">
                          <div class="avatar avatar-xl avatar-3xl">
                            <img class="rounded-circle" src="../../assets/img/team/25-thumb.png" alt="" />

                          </div>
                        </a>
                        <div class="ms-1 ms-sm-3">
                          <p class="fw-semi-bold mb-3 mb-sm-2"><a href="../../app/support-desk/tickets-preview.jsp">Contact Froms #3264</a></p>
                          <div class="row align-items-center gx-0 gy-2">
                            <div class="col-auto me-2">
                              <h6 class="client mb-0"><a class="text-800 d-flex align-items-center gap-1" href="../../app/support-desk/contact-details.jsp"><span class="fas fa-user" data-fa-transform="shrink-3 up-1"></span><span>Freya</span></a></h6>
                            </div>
                            <div class="col-auto lh-1 me-3"><small class="badge rounded badge-subtle-secondary dark__bg-1000">Closed</small>
                            </div>
                            <div class="col-auto">
                              <h6 class="mb-0 text-500">2d ago</h6>
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="border-bottom mt-4 mb-x1"></div>
                      <div class="d-flex justify-content-between ms-auto">
                        <div class="d-flex align-items-center gap-2 ms-md-4 ms-xl-0" style="width:7.5rem;">
                          <div style="--falcon-circle-progress-bar:100">
                            <svg class="circle-progress-svg" width="26" height="26" viewBox="0 0 120 120">
                              <circle class="progress-bar-rail" cx="60" cy="60" r="54" fill="none" stroke-linecap="round" stroke-width="12"></circle>
                              <circle class="progress-bar-top" cx="60" cy="60" r="54" fill="none" stroke-linecap="round" stroke="#e63757" stroke-width="12"></circle>
                            </svg>
                          </div>
                          <h6 class="mb-0 text-700">Urgent</h6>
                        </div>
                        <select class="form-select form-select-sm" aria-label="agents actions" style="width:9.375rem;">
                          <option>Select Agent</option>
                          <option>Anindya</option>
                          <option>Nowrin</option>
                          <option selected="selected">Khalid</option>
                        </select>
                      </div>
                    </div>
                    <div class="bg-white dark__bg-1100 d-md-flex d-xl-inline-block d-xxl-flex align-items-center p-x1 rounded-3 shadow-sm card-view-height">
                      <div class="d-flex align-items-start align-items-sm-center">
                        <div class="form-check me-2 me-xxl-3 mb-0">
                          <input class="form-check-input" type="checkbox" id="card-view-tickets-19" data-bulk-select-row="data-bulk-select-row" />
                        </div><a class="d-none d-sm-block" href="../../app/support-desk/contact-details.jsp">
                          <div class="avatar avatar-xl avatar-3xl">
                            <div class="avatar-name rounded-circle"><span>M</span></div>
                          </div>
                        </a>
                        <div class="ms-1 ms-sm-3">
                          <p class="fw-semi-bold mb-3 mb-sm-2"><a href="../../app/support-desk/tickets-preview.jsp">I need your help #2256</a></p>
                          <div class="row align-items-center gx-0 gy-2">
                            <div class="col-auto me-2">
                              <h6 class="client mb-0"><a class="text-800 d-flex align-items-center gap-1" href="../../app/support-desk/contact-details.jsp"><span class="fas fa-user" data-fa-transform="shrink-3 up-1"></span><span>Morrison</span></a></h6>
                            </div>
                            <div class="col-auto lh-1 me-3"><small class="badge rounded badge-subtle-info false">Responded</small>
                            </div>
                            <div class="col-auto">
                              <h6 class="mb-0 text-500">2d ago</h6>
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="border-bottom mt-4 mb-x1"></div>
                      <div class="d-flex justify-content-between ms-auto">
                        <div class="d-flex align-items-center gap-2 ms-md-4 ms-xl-0" style="width:7.5rem;">
                          <div style="--falcon-circle-progress-bar:50">
                            <svg class="circle-progress-svg" width="26" height="26" viewBox="0 0 120 120">
                              <circle class="progress-bar-rail" cx="60" cy="60" r="54" fill="none" stroke-linecap="round" stroke-width="12"></circle>
                              <circle class="progress-bar-top" cx="60" cy="60" r="54" fill="none" stroke-linecap="round" stroke="#2A7BE4" stroke-width="12"></circle>
                            </svg>
                          </div>
                          <h6 class="mb-0 text-700">Medium</h6>
                        </div>
                        <select class="form-select form-select-sm" aria-label="agents actions" style="width:9.375rem;">
                          <option>Select Agent</option>
                          <option>Anindya</option>
                          <option>Nowrin</option>
                          <option selected="selected">Khalid</option>
                        </select>
                      </div>
                    </div>
                    <div class="bg-white dark__bg-1100 d-md-flex d-xl-inline-block d-xxl-flex align-items-center p-x1 rounded-3 shadow-sm card-view-height">
                      <div class="d-flex align-items-start align-items-sm-center">
                        <div class="form-check me-2 me-xxl-3 mb-0">
                          <input class="form-check-input" type="checkbox" id="card-view-tickets-20" data-bulk-select-row="data-bulk-select-row" />
                        </div><a class="d-none d-sm-block" href="../../app/support-desk/contact-details.jsp">
                          <div class="avatar avatar-xl avatar-3xl">
                            <div class="avatar-name rounded-circle"><span>MB</span></div>
                          </div>
                        </a>
                        <div class="ms-1 ms-sm-3">
                          <p class="fw-semi-bold mb-3 mb-sm-2"><a href="../../app/support-desk/tickets-preview.jsp">I need your help #2256</a></p>
                          <div class="row align-items-center gx-0 gy-2">
                            <div class="col-auto me-2">
                              <h6 class="client mb-0"><a class="text-800 d-flex align-items-center gap-1" href="../../app/support-desk/contact-details.jsp"><span class="fas fa-user" data-fa-transform="shrink-3 up-1"></span><span>Morrison Banneker</span></a></h6>
                            </div>
                            <div class="col-auto lh-1 me-3"><small class="badge rounded badge-subtle-secondary dark__bg-1000">Closed</small>
                            </div>
                            <div class="col-auto">
                              <h6 class="mb-0 text-500">2d ago</h6>
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="border-bottom mt-4 mb-x1"></div>
                      <div class="d-flex justify-content-between ms-auto">
                        <div class="d-flex align-items-center gap-2 ms-md-4 ms-xl-0" style="width:7.5rem;">
                          <div style="--falcon-circle-progress-bar:50">
                            <svg class="circle-progress-svg" width="26" height="26" viewBox="0 0 120 120">
                              <circle class="progress-bar-rail" cx="60" cy="60" r="54" fill="none" stroke-linecap="round" stroke-width="12"></circle>
                              <circle class="progress-bar-top" cx="60" cy="60" r="54" fill="none" stroke-linecap="round" stroke="#2A7BE4" stroke-width="12"></circle>
                            </svg>
                          </div>
                          <h6 class="mb-0 text-700">Medium</h6>
                        </div>
                        <select class="form-select form-select-sm" aria-label="agents actions" style="width:9.375rem;">
                          <option>Select Agent</option>
                          <option>Anindya</option>
                          <option>Nowrin</option>
                          <option selected="selected">Khalid</option>
                        </select>
                      </div>
                    </div>
                  </div>
                  <div class="text-center d-none" id="tickets-card-fallback">
                    <p class="fw-bold fs-1 mt-3">No ticket found</p>
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
            <div class="col-xxl-2 col-xl-3">
              <div class="offcanvas offcanvas-end offcanvas-filter-sidebar border-0 bg-white dark__bg-card-dark h-auto rounded-xl-3" tabindex="-1" id="ticketOffcanvas" aria-labelledby="ticketOffcanvasLabelCard">
                <div class="offcanvas-header d-flex flex-between-center d-xl-none bg-light">
                  <h6 class="fs-0 mb-0 fw-semi-bold">Filter</h6>
                  <button class="btn-close text-reset d-xl-none shadow-none" id="ticketOffcanvasLabelCard" type="button" data-bs-dismiss="offcanvas" aria-label="Close"></button>
                </div>
                <div class="card scrollbar shadow-none shadow-show-xl">
                  <div class="card-header bg-light d-none d-xl-block">
                    <h6 class="mb-0">Filter</h6>
                  </div>
                  <div class="card-body">
                    <form>
                      <div class="mb-2 mt-n2">
                        <label class="mb-1">Priority</label>
                        <select class="form-select form-select-sm">
                          <option>None</option>
                          <option>Urgent</option>
                          <option>High</option>
                          <option>Medium</option>
                          <option>Low</option>
                        </select>
                      </div>
                      <div class="mb-2">
                        <label class="mb-1 mt-2">Source</label>
                        <select class="form-select form-select-sm">
                          <option>None</option>
                          <option>Email</option>
                          <option>Phone</option>
                          <option>Forum</option>
                          <option selected="selected">Facebook</option>
                          <option>Twitter</option>
                          <option>Chat</option>
                          <option>Whatsapp</option>
                          <option>Portal</option>
                          <option>Bots</option>
                          <option>External Email</option>
                          <option>Ecommerce</option>
                          <option>Feedback Widget</option>
                        </select>
                      </div>
                      <div class="mb-2">
                        <label class="mb-1 mt-2">Status</label>
                        <select class="form-select form-select-sm">
                          <option>None</option>
                          <option>Recent</option>
                          <option>Overdue</option>
                          <option>Closed</option>
                          <option>Remaining</option>
                          <option>Responded</option>
                        </select>
                      </div>
                      <div class="mb-2">
                        <label class="mb-1 mt-2">Group</label>
                        <select class="form-select form-select-sm">
                          <option>None</option>
                          <option>My Group</option>
                          <option>Billing</option>
                          <option>Customer Support</option>
                          <option>Enhancement</option>
                          <option>Unassigned</option>
                        </select>
                      </div>
                      <div class="mb-2">
                        <label class="mb-1 mt-2">Agent</label>
                        <select class="form-select form-select-sm">
                          <option>None</option>
                          <option>Anindya</option>
                          <option>Nowrin</option>
                          <option>Khalid</option>
                        </select>
                      </div>
                      <div class="mb-2">
                        <label class="mb-1 mt-2">Type</label>
                        <select class="form-select form-select-sm">
                          <option>None</option>
                          <option>Question</option>
                          <option>Incident</option>
                          <option>Problem</option>
                          <option>Feature Request</option>
                          <option>Refund</option>
                        </select>
                      </div>
                      <div class="mb-2">
                        <label class="mb-1 mt-2">Category</label>
                        <select class="form-select form-select-sm">
                          <option>None</option>
                          <option>General Issue</option>
                          <option>Maintenance</option>
                          <option>Engineering</option>
                          <option>Accounts</option>
                          <option>Feedback</option>
                          <option selected="selected">Support</option>
                          <option>Test Helpdesk</option>
                        </select>
                      </div>
                      <div class="mb-2">
                        <label class="mb-1 mt-2">Tags</label>
                        <select class="form-select form-select-sm">
                          <option>None</option>
                          <option>Sales</option>
                          <option>Request</option>
                          <option>Complaint</option>
                          <option>Feedback</option>
                          <option>Support</option>
                        </select>
                      </div>
                      <div>
                        <label class="mb-1 mt-2">Subscription</label>
                        <select class="form-select form-select-sm">
                          <option>None</option>
                          <option>Active</option>
                          <option>Inactive</option>
                          <option>Expired</option>
                          <option>Pending</option>
                        </select>
                      </div>
                    </form>
                  </div>
                  <div class="card-footer border-top border-200 py-x1">
                    <button class="btn btn-primary w-100">Update</button>
                  </div>
                </div>
              </div>
            </div>
          </div>
<%@ include file="../inc/bottom.jsp" %>