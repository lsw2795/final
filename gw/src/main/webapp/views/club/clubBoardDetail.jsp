<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file='../inc/top.jsp'%>
<!DOCTYPE html>

<div class="card">
	<div class="card-header d-flex flex-between-center">
		<button class="btn btn-falcon-default btn-sm" type="button">
			<span class="fas fa-arrow-left"><a href="#"></span>
		</button>
		<div class="d-flex">
			<button class="btn btn-falcon-default btn-sm mx-2" type="button">
				<span class="fas fa-check" data-fa-transform="shrink-2 down-2"></span><span
					class="d-none d-md-inline-block ms-1">close</span>
			</button>
			<button class="btn btn-falcon-default btn-sm ms-2 d-none d-sm-block"
				type="button">
				<span class="fas fa-trash-alt" data-fa-transform="shrink-2 down-1"></span><span
					class="d-none d-md-inline-block ms-1">Delete</span>
			</button>
			<div class="dropdown font-sans-serif ms-2">
				<button
					class="btn btn-falcon-default text-600 btn-sm dropdown-toggle dropdown-caret-none"
					type="button" id="preview-dropdown" data-bs-toggle="dropdown"
					data-boundary="viewport" aria-haspopup="true" aria-expanded="false">
					<span class="fas fa-ellipsis-v fs--2"></span>
				</button>
				<div class="dropdown-menu dropdown-menu-end border py-2"
					aria-labelledby="preview-dropdown">
					<a class="dropdown-item" href="#!">View</a><a class="dropdown-item"
						href="#!">Export</a><a class="dropdown-item d-sm-none" href="#!">Delete</a>
					<div class="dropdown-divider"></div>
					<a class="dropdown-item text-danger" href="#!">Remove</a>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="card mt-3">
                <div class="card-header bg-light">
                  <h5><span class="fas fa-parachute-box me-2"></span><span>club1</span></h5>
                </div>
                <div class="card-body">
                  <div class="d-md-flex d-xl-inline-block d-xxl-flex align-items-center justify-content-between mb-x1">
                    <div class="d-flex align-items-center gap-2"><a href="../../app/support-desk/contact-details.jsp">
                        <div class="avatar avatar-2xl">
                          <div class="avatar-name rounded-circle"><span>HG</span></div>
                        </div>
                      </a>
                      <p class="mb-0"><a class="fw-semi-bold mb-0 text-800" href="#">홍길동  </a>부서명</p>
                    </div>
                    <p class="mb-0 fs--2 fs-sm--1 fw-semi-bold mt-2 mt-md-0 mt-xl-2 mt-xxl-0 ms-5">01 March, 2020<span class="mx-1">|</span><span class="fst-italic">8:40 AM (1 Day ago)</span><span class="fas fa-star ms-2 text-warning"></span></p>
                  </div>
                  <div>
                    <p>사내동아리 모집</p>
                    <div class="p-x1 bg-light rounded-3 mt-3">
                      <div class="d-inline-flex flex-column">
                        <div class="border p-2 rounded-3 d-flex bg-white dark__bg-1000 fs--1 mb-2"><span class="fs-1 far fa-image"></span><span class="ms-2 me-3">broken_tv_solve.jpg (873kb)</span><a class="text-300 ms-auto" href="#!" data-bs-toggle="tooltip" data-bs-placement="right" title="Download"><span class="fas fa-arrow-down"></span></a></div>
                        <div class="border p-2 rounded-3 d-flex bg-white dark__bg-1000 fs--1"><span class="fs-1 fas fa-file-archive"></span><span class="ms-2 me-3">broken_tv_solve.zip (342kb)</span><a class="text-300 ms-auto" href="#!" data-bs-toggle="tooltip" data-bs-placement="right" title="Download"><span class="fas fa-arrow-down"></span></a></div>
                      </div>
                      <hr class="my-x1" />
                      <div class="row flex-between-center gx-4 gy-2">
                        <div class="col-auto">
                          <p class="fs--1 text-1000 mb-sm-0 font-sans-serif fw-medium mb-0"><span class="fas fa-link me-2"></span>2 files attached</p>
                        </div>
                        <div class="col-auto">
                          <button class="btn btn-falcon-default btn-sm"><span class="fas fa-file-download me-2"></span>Download all</button>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="my-5 position-relative text-center">
                    <hr class="position-absolute top-50 border-300 w-100 my-0" /><span class="position-relative bg-white dark__bg-card-dark px-3 z-1">
                      <button class="btn btn-sm btn-outline-secondary rounded-pill border-300 px-lg-5">댓글</button></span>
                  </div>
                  </div>

			<div class="collapse transition-none" id="previewMailForm">
                  <h5 class="mb-0 p-x1 bg-light">댓글</h5>
                  <div class="border border-y-0 border-200">
                    <textarea class="form-control" id="exampleFormControlTextarea1" name="content" cols="50" rows="15"></textarea>
                  </div>
                  <div class="d-flex align-items-center justify-content-between px-x1 py-3">
                    <div class="d-flex align-items-center">
                      <button class="btn btn-primary btn-sm px-4 me-2" type="submit">Send</button>
                      <input class="d-none" id="email-attachment" type="file" />
                      <label class="me-2 btn btn-light btn-sm mb-0 cursor-pointer" for="email-attachment" data-bs-toggle="tooltip" data-bs-placement="top" title="Attach files"><span class="fas fa-paperclip fs-1" data-fa-transform="down-2"></span></label>
                      <input class="d-none" id="email-image" type="file" accept="image/*" />
                      <label class="btn btn-light btn-sm mb-0 cursor-pointer" for="email-image" data-bs-toggle="tooltip" data-bs-placement="top" title="Attach images"><span class="fas fa-image fs-1" data-fa-transform="down-2"></span></label>
                    </div>
                    <div class="d-flex align-items-center">
                      <div class="dropdown font-sans-serif me-2 btn-reveal-trigger">
                        <button class="btn btn-link text-600 btn-sm dropdown-toggle btn-reveal dropdown-caret-none" id="email-options" type="button" data-bs-toggle="dropdown" data-boundary="viewport" aria-haspopup="true" aria-expanded="false"><span class="fas fa-ellipsis-v" data-fa-transform="down-2"></span></button>
                        <div class="dropdown-menu dropdown-menu-end border py-2" aria-labelledby="email-options"><a class="dropdown-item" href="#!">Print</a><a class="dropdown-item" href="#!">Check spelling</a><a class="dropdown-item" href="#!">Plain text mode</a>
                          <div class="dropdown-divider"></div><a class="dropdown-item" href="#!">Archive</a>
                        </div>
                      </div>
                      <button class="btn btn-light btn-sm" type="button" data-bs-toggle="tooltip" data-bs-placement="top" title="Delete" data-dismiss="collapse"><span class="fas fa-trash"></span></button>
                    </div>
                  </div>
                </div>
                <div class="card-footer bg-light" id="preview-footer">
                  <button class="btn btn-falcon-default btn-sm fs--1" type="button" data-bs-toggle="collapse" data-bs-target="#previewMailForm" aria-expanded="false" aria-controls="previewMailForm"><span class="fas fa-reply"></span><span class="d-none d-sm-inline-block ms-1">Reply</span></button>
                </div>
			</div>
<%@ include file='../inc/bottom.jsp'%>