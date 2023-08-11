<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>

<div class="card">
	<div class="card-header">
		<div class="row align-items-center">
			<div class="col d-flex align-items-center">
				<div class="form-check mb-0 d-none d-sm-block">
					<input class="form-check-input checkbox-bulk-select"
						type="checkbox"
						data-bulk-select='{"body":"emails","actions":"emails-actions"}' />
				</div>
				<button class="btn btn-falcon-default btn-sm ms-sm-1" type="button"
					onclick="location.reload()">
					<span class="fas fa-redo"></span>
				</button>
				<div class="dropdown font-sans-serif">
					<button
						class="btn btn-falcon-default text-600 btn-sm dropdown-toggle dropdown-caret-none ms-2"
						type="button" id="email-filter" data-bs-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false">
						<span class="fas fa-sliders-h"></span>
					</button>
					<div class="dropdown-menu border py-0"
						aria-labelledby="email-filter">
						<div class="bg-white dark__bg-dark py-2">
							<a class="dropdown-item d-flex justify-content-between" href="#!">All<span
								class="fas fa-check" data-fa-transform="down-4 shrink-4"></span></a><a
								class="dropdown-item" href="#!">Unread</a><a
								class="dropdown-item" href="#!">To me</a><a
								class="dropdown-item" href="#!">Flagged</a><a
								class="dropdown-item" href="#!">Mentions</a><a
								class="dropdown-item" href="#!">Attachments</a>
						</div>
					</div>
				</div>
				&nbsp;&nbsp;
				<h2>자료실</h2>
				<div class="border-start ms-3 ps-3 d-none" id="emails-actions">
					<div class="btn-group btn-group-sm">
						<button class="btn btn-falcon-default" type="button"
							data-bs-toggle="tooltip" data-bs-placement="top" title="Archive">
							<span class="fas fa-archive"></span>
						</button>
						<button class="btn btn-falcon-default" type="button"
							data-bs-toggle="tooltip" data-bs-placement="top" title="Delete">
							<span class="fas fa-trash-alt"></span>
						</button>
						<button class="btn btn-falcon-default" type="button"
							data-bs-toggle="tooltip" data-bs-placement="top"
							title="Mark as unread">
							<span class="fas fa-envelope"></span>
						</button>
						<button class="btn btn-falcon-default" type="button"
							data-bs-toggle="tooltip" data-bs-placement="top" title="Snooze">
							<span class="fas fa-clock"></span>
						</button>
					</div>
				</div>
			</div>
		</div>
	</div>


	<div class="card-header border-bottom border-200 px-0">
		<div class="d-lg-flex justify-content-between">
			<div class="row flex-between-center gy-2 px-x1">
				<div class="col-auto pe-0">
					<form action='<c:url value='/qna/list'/>'>
						<select name="searchCondition" class="form-select form-select-sm"
							aria-label="Bulk actions">
							<option value="title"
								<c:if test="${param.searchCondition=='title'}">
       		selected = "selected"
       	</c:if>>제목</option>
							<option value="name"
								<c:if test="${param.searchCondition=='name'}">
       		selected = "selected"
       	</c:if>>이름</option>
							<option value="content"
								<c:if test="${param.searchCondition=='content'}">
       		selected = "selected"
       	</c:if>>내용</option>
						</select>
				</div>
				<div class="col-auto">
					<div class="input-group input-search-width">
						<input name="searchKeyword"
							class="form-control form-control-sm shadow-none search"
							value='${param.searchKeyword}' type="search" placeholder="검색어 입력"
							aria-label="search" />
						<button
							class="btn btn-sm btn-outline-secondary border-300 hover-border-secondary">
							<span class="fa fa-search fs--1"></span>
						</button>
					</div>
					</form>
				</div>
			</div>
			<div class="border-bottom border-200 my-3"></div>
			<div
				class="d-flex align-items-center justify-content-between justify-content-lg-end px-x1">
				<button class="btn btn-sm btn-falcon-default d-xl-none"
					type="button" data-bs-toggle="offcanvas"
					data-bs-target="#allContactOffcanvas"
					aria-controls="allContactOffcanvas">
					<span class="fas fa-filter" data-fa-transform="shrink-4"></span><span
						class="ms-1 d-none d-sm-inline-block">Filter</span>
				</button>
				<div class="bg-300 mx-3 d-none d-lg-block d-xl-none"
					style="width: 1px; height: 29px"></div>
				<div class="d-none" id="table-contact-actions">
					<div class="d-flex">
						<button class="btn btn-falcon-default btn-sm ms-2" type="button">질문
							삭제</button>
					</div>
				</div>
				<div class="d-flex align-items-center"
					id="table-contact-replace-element">
					<button class="btn btn-falcon-default btn-sm" type="button">
						<span class="fas fa-plus" data-fa-transform="shrink-3"></span><a
							href='<c:url value='/qna/write'/>'><span
							class="d-none d-sm-inline-block d-xl-none d-xxl-inline-block ms-1">자료
								등록</a></span>
					</button>
					<div class="dropdown font-sans-serif ms-2">
						<button
							class="btn btn-falcon-default text-600 btn-sm dropdown-toggle dropdown-caret-none"
							type="button" id="preview-dropdown" data-bs-toggle="dropdown"
							data-boundary="viewport" aria-haspopup="true"
							aria-expanded="false">
							<span class="fas fa-ellipsis-h fs--2"></span>
						</button>
						<div class="dropdown-menu dropdown-menu-end border py-2"
							aria-labelledby="preview-dropdown">
							<a class="dropdown-item" href="#!">View</a><a
								class="dropdown-item" href="#!">Export</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item text-danger" href="#!">Remove</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 검색 div  -->

	<div class="card-body fs--1 border-top border-200 p-0" id="emails">
		<h5 class="fs-0 px-3 pt-3 pb-2 mb-0 border-bottom border-200">Unread</h5>
		<div
			class="row border-bottom border-200 hover-actions-trigger hover-shadow py-2 px-1 mx-0 bg-white dark__bg-dark"
			data-href="../../app/email/email-detail.jsp">
			<div class="btn-group btn-group-sm z-2 hover-actions end-0 me-3"
				style="width: 10rem;">
				<button class="btn btn-light hover-bg-200" type="button"
					data-bs-toggle="tooltip" data-bs-placement="top" title="Archive">
					<span class="fas fa-archive"></span>
				</button>
				<button class="btn btn-light hover-bg-200" type="button"
					data-bs-toggle="tooltip" data-bs-placement="top" title="Delete">
					<span class="fas fa-trash-alt"></span>
				</button>
				<button class="btn btn-light hover-bg-200" type="button"
					data-bs-toggle="tooltip" data-bs-placement="top"
					title="Mark as read">
					<span class="fas fa-envelope-open"></span>
				</button>
				<button class="btn btn-light hover-bg-200" type="button"
					data-bs-toggle="tooltip" data-bs-placement="top" title="Snooze">
					<span class="fas fa-clock"></span>
				</button>
			</div>
			<div class="col-auto d-none d-sm-block">
				<div class="d-flex bg-white dark__bg-dark">
					<div class="form-check mb-0 fs-0">
						<input class="form-check-input" type="checkbox" id="checkbox-2"
							data-bulk-select-row="data-bulk-select-row" />
					</div>
					<span class="fas text-warning fa-star ms-1"
						data-fa-transform="down-4"></span>
				</div>
			</div>
			<div class="col col-md-9 col-xxl-10">
				<div class="row">
					<div class="col-md-4 col-xl-3 col-xxl-2 ps-md-0 mb-1 mb-md-0">
						<div class="d-flex position-relative">
							<div class="avatar avatar-s">
								<img class="rounded-soft" src="../../assets/img/team/17.jpg"
									alt="" />

							</div>
							<div class="flex-1 ms-2">
								<a class="fw-bold stretched-link inbox-link"
									href="../../app/email/email-detail.jsp">Diana</a><span
									class="badge badge-subtle-success badge-pill ms-2">NEW</span>
							</div>
						</div>
					</div>
					<div class="col">
						<a class="d-block inbox-link"
							href="../../app/email/email-detail.jsp"><span class="fw-bold">Your
								Daily Work Summary</span><span class="mx-1">&ndash;</span><span>And
								they'd probably do a lot of damage to an...</span></a>
					</div>
				</div>
			</div>
			<div
				class="col-auto ms-auto d-flex flex-column justify-content-between">
				<span class="fw-bold">Mar 26</span><span
					class="fas text-warning fa-star ms-auto mb-2 d-sm-none"
					data-fa-transform="down-7"></span>
			</div>
		</div>
		<div
			class="row border-bottom border-200 hover-actions-trigger hover-shadow py-2 px-1 mx-0 bg-white dark__bg-dark"
			data-href="../../app/email/email-detail.jsp">
			<div class="btn-group btn-group-sm z-2 hover-actions end-0 me-3"
				style="width: 10rem;">
				<button class="btn btn-light hover-bg-200" type="button"
					data-bs-toggle="tooltip" data-bs-placement="top" title="Archive">
					<span class="fas fa-archive"></span>
				</button>
				<button class="btn btn-light hover-bg-200" type="button"
					data-bs-toggle="tooltip" data-bs-placement="top" title="Delete">
					<span class="fas fa-trash-alt"></span>
				</button>
				<button class="btn btn-light hover-bg-200" type="button"
					data-bs-toggle="tooltip" data-bs-placement="top"
					title="Mark as read">
					<span class="fas fa-envelope-open"></span>
				</button>
				<button class="btn btn-light hover-bg-200" type="button"
					data-bs-toggle="tooltip" data-bs-placement="top" title="Snooze">
					<span class="fas fa-clock"></span>
				</button>
			</div>
			<div class="col-auto d-none d-sm-block">
				<div class="d-flex bg-white dark__bg-dark">
					<div class="form-check mb-0 fs-0">
						<input class="form-check-input" type="checkbox" id="checkbox-7"
							data-bulk-select-row="data-bulk-select-row" />
					</div>
					<span class="far text-300 fa-star ms-1" data-fa-transform="down-4"></span>
				</div>
			</div>
			<div class="col col-md-9 col-xxl-10">
				<div class="row">
					<div class="col-md-4 col-xl-3 col-xxl-2 ps-md-0 mb-1 mb-md-0">
						<div class="d-flex position-relative">
							<div class="avatar avatar-s">
								<img class="rounded-soft"
									src="../../assets/img/logos/unsplash.png" alt="" />

							</div>
							<div class="flex-1 ms-2">
								<a class="fw-bold stretched-link inbox-link"
									href="../../app/email/email-detail.jsp">Unsplash Team</a>
							</div>
						</div>
					</div>
					<div class="col">
						<a class="d-block inbox-link"
							href="../../app/email/email-detail.jsp"><span class="fw-bold">Get
								involved for International Women's Day - with link ð©</span><span
							class="mx-1">&ndash;</span><span>The link below is now
								clickable for Chrome users...</span></a><a
							class="d-inline-flex align-items-center border rounded-pill px-3 py-1 me-2 mt-2 inbox-link"
							href="../../assets/img/generic/1.jpg" data-gallery="gallery-7"><span
							class="fas fa-image text-danger" data-fa-transform="grow-4"></span><span
							class="ms-2">Winter</span></a><a
							class="d-inline-flex align-items-center border rounded-pill px-3 py-1 me-2 mt-2 inbox-link"
							href="../../assets/img/generic/8.jpg" data-gallery="gallery-7"><span
							class="fas fa-image text-danger" data-fa-transform="grow-4"></span><span
							class="ms-2">Coffee</span></a>
					</div>
				</div>
			</div>
			<div
				class="col-auto ms-auto d-flex flex-column justify-content-between">
				<span class="fw-bold">Dec 16</span><span
					class="far text-300 fa-star ms-auto mb-2 d-sm-none"
					data-fa-transform="down-7"></span>
			</div>
		</div>
		<div
			class="row border-bottom border-200 hover-actions-trigger hover-shadow py-2 px-1 mx-0 bg-white dark__bg-dark"
			data-href="../../app/email/email-detail.jsp">
			<div class="btn-group btn-group-sm z-2 hover-actions end-0 me-3"
				style="width: 10rem;">
				<button class="btn btn-light hover-bg-200" type="button"
					data-bs-toggle="tooltip" data-bs-placement="top" title="Archive">
					<span class="fas fa-archive"></span>
				</button>
				<button class="btn btn-light hover-bg-200" type="button"
					data-bs-toggle="tooltip" data-bs-placement="top" title="Delete">
					<span class="fas fa-trash-alt"></span>
				</button>
				<button class="btn btn-light hover-bg-200" type="button"
					data-bs-toggle="tooltip" data-bs-placement="top"
					title="Mark as read">
					<span class="fas fa-envelope-open"></span>
				</button>
				<button class="btn btn-light hover-bg-200" type="button"
					data-bs-toggle="tooltip" data-bs-placement="top" title="Snooze">
					<span class="fas fa-clock"></span>
				</button>
			</div>
			<div class="col-auto d-none d-sm-block">
				<div class="d-flex bg-white dark__bg-dark">
					<div class="form-check mb-0 fs-0">
						<input class="form-check-input" type="checkbox" id="checkbox-12"
							data-bulk-select-row="data-bulk-select-row" />
					</div>
					<span class="far text-300 fa-star ms-1" data-fa-transform="down-4"></span>
				</div>
			</div>
			<div class="col col-md-9 col-xxl-10">
				<div class="row">
					<div class="col-md-4 col-xl-3 col-xxl-2 ps-md-0 mb-1 mb-md-0">
						<div class="d-flex position-relative">
							<div class="avatar avatar-s">
								<img class="rounded-soft"
									src="../../assets/img/logos/goodreads.png" alt="" />

							</div>
							<div class="flex-1 ms-2">
								<a class="fw-bold stretched-link inbox-link"
									href="../../app/email/email-detail.jsp">Goodreads</a>
							</div>
						</div>
					</div>
					<div class="col">
						<a class="d-block inbox-link"
							href="../../app/email/email-detail.jsp"><span class="fw-bold">Goodreads
								Newsletter: March 5, 2019</span><span class="mx-1">&ndash;</span><span>The
								most anticipated books of spring, a rocking read, and more!
								Goodreads Spring...</span></a>
					</div>
				</div>
			</div>
			<div
				class="col-auto ms-auto d-flex flex-column justify-content-between">
				<span class="fw-bold">March 5</span><span
					class="far text-300 fa-star ms-auto mb-2 d-sm-none"
					data-fa-transform="down-7"></span>
			</div>
		</div>
		<h5 class="fs-0 px-3 pt-3 pb-2 mb-0 border-bottom border-200">Everything
			else</h5>
		<div
			class="row border-bottom border-200 hover-actions-trigger hover-shadow py-2 px-1 mx-0 bg-light"
			data-href="../../app/email/email-detail.jsp">
			<div class="btn-group btn-group-sm z-2 hover-actions end-0 me-3"
				style="width: 10rem;">
				<button class="btn btn-light hover-bg-200" type="button"
					data-bs-toggle="tooltip" data-bs-placement="top" title="Archive">
					<span class="fas fa-archive"></span>
				</button>
				<button class="btn btn-light hover-bg-200" type="button"
					data-bs-toggle="tooltip" data-bs-placement="top" title="Delete">
					<span class="fas fa-trash-alt"></span>
				</button>
				<button class="btn btn-light hover-bg-200" type="button"
					data-bs-toggle="tooltip" data-bs-placement="top"
					title="Mark as unread">
					<span class="fas fa-envelope"></span>
				</button>
				<button class="btn btn-light hover-bg-200" type="button"
					data-bs-toggle="tooltip" data-bs-placement="top" title="Snooze">
					<span class="fas fa-clock"></span>
				</button>
			</div>
			<div class="col-auto d-none d-sm-block">
				<div class="d-flex bg-light">
					<div class="form-check mb-0 fs-0">
						<input class="form-check-input" type="checkbox" id="checkbox-1"
							data-bulk-select-row="data-bulk-select-row" />
					</div>
					<span class="fas text-warning fa-star ms-1"
						data-fa-transform="down-4"></span>
				</div>
			</div>
			<div class="col col-md-9 col-xxl-10">
				<div class="row">
					<div class="col-md-4 col-xl-3 col-xxl-2 ps-md-0 mb-1 mb-md-0">
						<div class="d-flex position-relative">
							<div class="avatar avatar-s">
								<img class="rounded-soft"
									src="../../assets/img/logos/github.png" alt="" />

							</div>
							<div class="flex-1 ms-2">
								<a class="stretched-link inbox-link"
									href="../../app/email/email-detail.jsp">GitHub</a>
							</div>
						</div>
					</div>
					<div class="col">
						<a class="d-block inbox-link"
							href="../../app/email/email-detail.jsp"><span>[GitHub]
								Subscribed to technext/photogallery notifications</span><span
							class="mx-1">&ndash;</span><span>Hey there, weâre just
								writing to let you know that youâve been...</span></a>
					</div>
				</div>
			</div>
			<div
				class="col-auto ms-auto d-flex flex-column justify-content-between">
				<span>11:50AM</span><span
					class="fas text-warning fa-star ms-auto mb-2 d-sm-none"
					data-fa-transform="down-7"></span>
			</div>
		</div>
		<div
			class="row border-bottom border-200 hover-actions-trigger hover-shadow py-2 px-1 mx-0 bg-light"
			data-href="../../app/email/email-detail.jsp">
			<div class="btn-group btn-group-sm z-2 hover-actions end-0 me-3"
				style="width: 10rem;">
				<button class="btn btn-light hover-bg-200" type="button"
					data-bs-toggle="tooltip" data-bs-placement="top" title="Archive">
					<span class="fas fa-archive"></span>
				</button>
				<button class="btn btn-light hover-bg-200" type="button"
					data-bs-toggle="tooltip" data-bs-placement="top" title="Delete">
					<span class="fas fa-trash-alt"></span>
				</button>
				<button class="btn btn-light hover-bg-200" type="button"
					data-bs-toggle="tooltip" data-bs-placement="top"
					title="Mark as unread">
					<span class="fas fa-envelope"></span>
				</button>
				<button class="btn btn-light hover-bg-200" type="button"
					data-bs-toggle="tooltip" data-bs-placement="top" title="Snooze">
					<span class="fas fa-clock"></span>
				</button>
			</div>
			<div class="col-auto d-none d-sm-block">
				<div class="d-flex bg-light">
					<div class="form-check mb-0 fs-0">
						<input class="form-check-input" type="checkbox" id="checkbox-3"
							data-bulk-select-row="data-bulk-select-row" />
					</div>
					<span class="fas text-warning fa-star ms-1"
						data-fa-transform="down-4"></span>
				</div>
			</div>
			<div class="col col-md-9 col-xxl-10">
				<div class="row">
					<div class="col-md-4 col-xl-3 col-xxl-2 ps-md-0 mb-1 mb-md-0">
						<div class="d-flex position-relative">
							<div class="avatar avatar-s">
								<img class="rounded-soft"
									src="../../assets/img/logos/coursera.png" alt="" />

							</div>
							<div class="flex-1 ms-2">
								<a class="stretched-link inbox-link"
									href="../../app/email/email-detail.jsp">Coursera</a>
							</div>
						</div>
					</div>
					<div class="col">
						<a class="d-block inbox-link"
							href="../../app/email/email-detail.jsp"><span>Recommended:
								Server-side Development with NodeJS, Express and MongoDB</span><span
							class="mx-1">&ndash;</span><span>We combed our catalog and
								found courses...</span></a><a
							class="d-inline-flex align-items-center border rounded-pill px-3 py-1 me-2 mt-2 inbox-link"
							href="#!"><span class="fas fa-file-archive text-warning"
							data-fa-transform="grow-4"></span><span class="ms-2">syllabus</span></a>
					</div>
				</div>
			</div>
			<div
				class="col-auto ms-auto d-flex flex-column justify-content-between">
				<span>Mar 3</span><span
					class="fas text-warning fa-star ms-auto mb-2 d-sm-none"
					data-fa-transform="down-7"></span>
			</div>
		</div>
		<div
			class="row border-bottom border-200 hover-actions-trigger hover-shadow py-2 px-1 mx-0 bg-light"
			data-href="../../app/email/email-detail.jsp">
			<div class="btn-group btn-group-sm z-2 hover-actions end-0 me-3"
				style="width: 10rem;">
				<button class="btn btn-light hover-bg-200" type="button"
					data-bs-toggle="tooltip" data-bs-placement="top" title="Archive">
					<span class="fas fa-archive"></span>
				</button>
				<button class="btn btn-light hover-bg-200" type="button"
					data-bs-toggle="tooltip" data-bs-placement="top" title="Delete">
					<span class="fas fa-trash-alt"></span>
				</button>
				<button class="btn btn-light hover-bg-200" type="button"
					data-bs-toggle="tooltip" data-bs-placement="top"
					title="Mark as unread">
					<span class="fas fa-envelope"></span>
				</button>
				<button class="btn btn-light hover-bg-200" type="button"
					data-bs-toggle="tooltip" data-bs-placement="top" title="Snooze">
					<span class="fas fa-clock"></span>
				</button>
			</div>
			<div class="col-auto d-none d-sm-block">
				<div class="d-flex bg-light">
					<div class="form-check mb-0 fs-0">
						<input class="form-check-input" type="checkbox" id="checkbox-4"
							data-bulk-select-row="data-bulk-select-row" />
					</div>
					<span class="far text-300 fa-star ms-1" data-fa-transform="down-4"></span>
				</div>
			</div>
			<div class="col col-md-9 col-xxl-10">
				<div class="row">
					<div class="col-md-4 col-xl-3 col-xxl-2 ps-md-0 mb-1 mb-md-0">
						<div class="d-flex position-relative">
							<div class="avatar avatar-s">
								<img class="rounded-soft"
									src="../../assets/img/logos/spectrum.jpg" alt="" />

							</div>
							<div class="flex-1 ms-2">
								<a class="stretched-link inbox-link"
									href="../../app/email/email-detail.jsp">Spectrum</a>
							</div>
						</div>
					</div>
					<div class="col">
						<a class="d-block inbox-link"
							href="../../app/email/email-detail.jsp"><span>Spectrum
								Weekly Digest: ZEIT watercooler, Escape Room!</span><span class="mx-1">&ndash;</span><span>You
								didnât gain any reputation last week. Reputation is an...</span></a>
					</div>
				</div>
			</div>
			<div
				class="col-auto ms-auto d-flex flex-column justify-content-between">
				<span>Feb 21</span><span
					class="far text-300 fa-star ms-auto mb-2 d-sm-none"
					data-fa-transform="down-7"></span>
			</div>
		</div>
		<div
			class="row border-bottom border-200 hover-actions-trigger hover-shadow py-2 px-1 mx-0 bg-light"
			data-href="../../app/email/email-detail.jsp">
			<div class="btn-group btn-group-sm z-2 hover-actions end-0 me-3"
				style="width: 10rem;">
				<button class="btn btn-light hover-bg-200" type="button"
					data-bs-toggle="tooltip" data-bs-placement="top" title="Archive">
					<span class="fas fa-archive"></span>
				</button>
				<button class="btn btn-light hover-bg-200" type="button"
					data-bs-toggle="tooltip" data-bs-placement="top" title="Delete">
					<span class="fas fa-trash-alt"></span>
				</button>
				<button class="btn btn-light hover-bg-200" type="button"
					data-bs-toggle="tooltip" data-bs-placement="top"
					title="Mark as unread">
					<span class="fas fa-envelope"></span>
				</button>
				<button class="btn btn-light hover-bg-200" type="button"
					data-bs-toggle="tooltip" data-bs-placement="top" title="Snooze">
					<span class="fas fa-clock"></span>
				</button>
			</div>
			<div class="col-auto d-none d-sm-block">
				<div class="d-flex bg-light">
					<div class="form-check mb-0 fs-0">
						<input class="form-check-input" type="checkbox" id="checkbox-5"
							data-bulk-select-row="data-bulk-select-row" />
					</div>
					<span class="far text-300 fa-star ms-1" data-fa-transform="down-4"></span>
				</div>
			</div>
			<div class="col col-md-9 col-xxl-10">
				<div class="row">
					<div class="col-md-4 col-xl-3 col-xxl-2 ps-md-0 mb-1 mb-md-0">
						<div class="d-flex position-relative">
							<div class="avatar avatar-s">
								<img class="rounded-soft"
									src="../../assets/img/logos/pinterest.png" alt="" />

							</div>
							<div class="flex-1 ms-2">
								<a class="stretched-link inbox-link"
									href="../../app/email/email-detail.jsp">Pinterest</a>
							</div>
						</div>
					</div>
					<div class="col">
						<a class="d-block inbox-link"
							href="../../app/email/email-detail.jsp"><span>Tony, 14
								ideas in Pink saree</span><span class="mx-1">&ndash;</span><span>New
								ideas for you in Web Development...</span></a>
					</div>
				</div>
			</div>
			<div
				class="col-auto ms-auto d-flex flex-column justify-content-between">
				<span>Jan 16</span><span
					class="far text-300 fa-star ms-auto mb-2 d-sm-none"
					data-fa-transform="down-7"></span>
			</div>
		</div>
		<div
			class="row border-bottom border-200 hover-actions-trigger hover-shadow py-2 px-1 mx-0 bg-light"
			data-href="../../app/email/email-detail.jsp">
			<div class="btn-group btn-group-sm z-2 hover-actions end-0 me-3"
				style="width: 10rem;">
				<button class="btn btn-light hover-bg-200" type="button"
					data-bs-toggle="tooltip" data-bs-placement="top" title="Archive">
					<span class="fas fa-archive"></span>
				</button>
				<button class="btn btn-light hover-bg-200" type="button"
					data-bs-toggle="tooltip" data-bs-placement="top" title="Delete">
					<span class="fas fa-trash-alt"></span>
				</button>
				<button class="btn btn-light hover-bg-200" type="button"
					data-bs-toggle="tooltip" data-bs-placement="top"
					title="Mark as unread">
					<span class="fas fa-envelope"></span>
				</button>
				<button class="btn btn-light hover-bg-200" type="button"
					data-bs-toggle="tooltip" data-bs-placement="top" title="Snooze">
					<span class="fas fa-clock"></span>
				</button>
			</div>
			<div class="col-auto d-none d-sm-block">
				<div class="d-flex bg-light">
					<div class="form-check mb-0 fs-0">
						<input class="form-check-input" type="checkbox" id="checkbox-6"
							data-bulk-select-row="data-bulk-select-row" />
					</div>
					<span class="fas text-warning fa-star ms-1"
						data-fa-transform="down-4"></span>
				</div>
			</div>
			<div class="col col-md-9 col-xxl-10">
				<div class="row">
					<div class="col-md-4 col-xl-3 col-xxl-2 ps-md-0 mb-1 mb-md-0">
						<div class="d-flex position-relative">
							<div class="avatar avatar-s">
								<img class="rounded-soft"
									src="../../assets/img/logos/medium.png" alt="" />

							</div>
							<div class="flex-1 ms-2">
								<a class="stretched-link inbox-link"
									href="../../app/email/email-detail.jsp">Medium</a>
							</div>
						</div>
					</div>
					<div class="col">
						<a class="d-block inbox-link"
							href="../../app/email/email-detail.jsp"><span>Technology
								Brief: Whoâs keeping us safe?</span><span class="mx-1">&ndash;</span><span>policy
								at Google, Twitter, and Pinterest, says, &quot;The team starts
								to feel like the...</span></a>
					</div>
				</div>
			</div>
			<div
				class="col-auto ms-auto d-flex flex-column justify-content-between">
				<span>Jan 11</span><span
					class="fas text-warning fa-star ms-auto mb-2 d-sm-none"
					data-fa-transform="down-7"></span>
			</div>
		</div>
		<div
			class="row border-bottom border-200 hover-actions-trigger hover-shadow py-2 px-1 mx-0 bg-light"
			data-href="../../app/email/email-detail.jsp">
			<div class="btn-group btn-group-sm z-2 hover-actions end-0 me-3"
				style="width: 10rem;">
				<button class="btn btn-light hover-bg-200" type="button"
					data-bs-toggle="tooltip" data-bs-placement="top" title="Archive">
					<span class="fas fa-archive"></span>
				</button>
				<button class="btn btn-light hover-bg-200" type="button"
					data-bs-toggle="tooltip" data-bs-placement="top" title="Delete">
					<span class="fas fa-trash-alt"></span>
				</button>
				<button class="btn btn-light hover-bg-200" type="button"
					data-bs-toggle="tooltip" data-bs-placement="top"
					title="Mark as unread">
					<span class="fas fa-envelope"></span>
				</button>
				<button class="btn btn-light hover-bg-200" type="button"
					data-bs-toggle="tooltip" data-bs-placement="top" title="Snooze">
					<span class="fas fa-clock"></span>
				</button>
			</div>
			<div class="col-auto d-none d-sm-block">
				<div class="d-flex bg-light">
					<div class="form-check mb-0 fs-0">
						<input class="form-check-input" type="checkbox" id="checkbox-8"
							data-bulk-select-row="data-bulk-select-row" />
					</div>
					<span class="fas text-warning fa-star ms-1"
						data-fa-transform="down-4"></span>
				</div>
			</div>
			<div class="col col-md-9 col-xxl-10">
				<div class="row">
					<div class="col-md-4 col-xl-3 col-xxl-2 ps-md-0 mb-1 mb-md-0">
						<div class="d-flex position-relative">
							<div class="avatar avatar-s">
								<img class="rounded-soft"
									src="../../assets/img/logos/stripe.png" alt="" />

							</div>
							<div class="flex-1 ms-2">
								<a class="stretched-link inbox-link"
									href="../../app/email/email-detail.jsp">Stripe</a>
							</div>
						</div>
					</div>
					<div class="col">
						<a class="d-block inbox-link"
							href="../../app/email/email-detail.jsp"><span>Confirm
								your Stripe email address!</span><span class="mx-1">&ndash;</span><span>Before
								you can start accepting live payments, you need to confirm your
								email address...</span></a>
					</div>
				</div>
			</div>
			<div
				class="col-auto ms-auto d-flex flex-column justify-content-between">
				<span>Dec 11</span><span
					class="fas text-warning fa-star ms-auto mb-2 d-sm-none"
					data-fa-transform="down-7"></span>
			</div>
		</div>
		<div
			class="row border-bottom border-200 hover-actions-trigger hover-shadow py-2 px-1 mx-0 bg-light"
			data-href="../../app/email/email-detail.jsp">
			<div class="btn-group btn-group-sm z-2 hover-actions end-0 me-3"
				style="width: 10rem;">
				<button class="btn btn-light hover-bg-200" type="button"
					data-bs-toggle="tooltip" data-bs-placement="top" title="Archive">
					<span class="fas fa-archive"></span>
				</button>
				<button class="btn btn-light hover-bg-200" type="button"
					data-bs-toggle="tooltip" data-bs-placement="top" title="Delete">
					<span class="fas fa-trash-alt"></span>
				</button>
				<button class="btn btn-light hover-bg-200" type="button"
					data-bs-toggle="tooltip" data-bs-placement="top"
					title="Mark as unread">
					<span class="fas fa-envelope"></span>
				</button>
				<button class="btn btn-light hover-bg-200" type="button"
					data-bs-toggle="tooltip" data-bs-placement="top" title="Snooze">
					<span class="fas fa-clock"></span>
				</button>
			</div>
			<div class="col-auto d-none d-sm-block">
				<div class="d-flex bg-light">
					<div class="form-check mb-0 fs-0">
						<input class="form-check-input" type="checkbox" id="checkbox-9"
							data-bulk-select-row="data-bulk-select-row" />
					</div>
					<span class="far text-300 fa-star ms-1" data-fa-transform="down-4"></span>
				</div>
			</div>
			<div class="col col-md-9 col-xxl-10">
				<div class="row">
					<div class="col-md-4 col-xl-3 col-xxl-2 ps-md-0 mb-1 mb-md-0">
						<div class="d-flex position-relative">
							<div class="avatar avatar-s">
								<img class="rounded-soft" src="../../assets/img/team/4.jpg"
									alt="" />

							</div>
							<div class="flex-1 ms-2">
								<a class="stretched-link inbox-link"
									href="../../app/email/email-detail.jsp">Tony Stark</a>
							</div>
						</div>
					</div>
					<div class="col">
						<a class="d-block inbox-link"
							href="../../app/email/email-detail.jsp"><span>Bruce
								Banner - Invitation to edit</span><span class="mx-1">&ndash;</span><span>Tony
								Stark has invited you to edit the following document...</span></a><a
							class="d-inline-flex align-items-center border rounded-pill px-3 py-1 me-2 mt-2 inbox-link"
							href="#!"><span class="fas fa-file-alt text-primary"
							data-fa-transform="grow-4"></span><span class="ms-2">Endgame
								schedule</span></a><a
							class="d-inline-flex align-items-center border rounded-pill px-3 py-1 me-2 mt-2 inbox-link"
							href="#!"><span class="fas fa-file-pdf text-danger"
							data-fa-transform="grow-4"></span><span class="ms-2">Endgame
								schedule</span></a>
					</div>
				</div>
			</div>
			<div
				class="col-auto ms-auto d-flex flex-column justify-content-between">
				<span>Mar 9</span><span
					class="far text-300 fa-star ms-auto mb-2 d-sm-none"
					data-fa-transform="down-7"></span>
			</div>
		</div>
		<div
			class="row border-bottom border-200 hover-actions-trigger hover-shadow py-2 px-1 mx-0 bg-light"
			data-href="../../app/email/email-detail.jsp">
			<div class="btn-group btn-group-sm z-2 hover-actions end-0 me-3"
				style="width: 10rem;">
				<button class="btn btn-light hover-bg-200" type="button"
					data-bs-toggle="tooltip" data-bs-placement="top" title="Archive">
					<span class="fas fa-archive"></span>
				</button>
				<button class="btn btn-light hover-bg-200" type="button"
					data-bs-toggle="tooltip" data-bs-placement="top" title="Delete">
					<span class="fas fa-trash-alt"></span>
				</button>
				<button class="btn btn-light hover-bg-200" type="button"
					data-bs-toggle="tooltip" data-bs-placement="top"
					title="Mark as unread">
					<span class="fas fa-envelope"></span>
				</button>
				<button class="btn btn-light hover-bg-200" type="button"
					data-bs-toggle="tooltip" data-bs-placement="top" title="Snooze">
					<span class="fas fa-clock"></span>
				</button>
			</div>
			<div class="col-auto d-none d-sm-block">
				<div class="d-flex bg-light">
					<div class="form-check mb-0 fs-0">
						<input class="form-check-input" type="checkbox" id="checkbox-10"
							data-bulk-select-row="data-bulk-select-row" />
					</div>
					<span class="far text-300 fa-star ms-1" data-fa-transform="down-4"></span>
				</div>
			</div>
			<div class="col col-md-9 col-xxl-10">
				<div class="row">
					<div class="col-md-4 col-xl-3 col-xxl-2 ps-md-0 mb-1 mb-md-0">
						<div class="d-flex position-relative">
							<div class="avatar avatar-s">
								<img class="rounded-soft"
									src="../../assets/img/logos/youtube.png" alt="" />

							</div>
							<div class="flex-1 ms-2">
								<a class="stretched-link inbox-link"
									href="../../app/email/email-detail.jsp">Youtube</a>
							</div>
						</div>
					</div>
					<div class="col">
						<a class="d-block inbox-link"
							href="../../app/email/email-detail.jsp"><span>Firebase
								just uploaded a video</span><span class="mx-1">&ndash;</span><span>Firebase
								has uploaded Understanding Cloud Functions: Configuration
								settings In the last...</span></a><a
							class="d-inline-flex align-items-center border rounded-pill px-3 py-1 me-2 mt-2 inbox-link"
							href="#!"><span class="fab fa-youtube text-youtube"
							data-fa-transform="grow-4"></span><span class="ms-2">Cloud
								Functions</span></a>
					</div>
				</div>
			</div>
			<div
				class="col-auto ms-auto d-flex flex-column justify-content-between">
				<span>Nov 19</span><span
					class="far text-300 fa-star ms-auto mb-2 d-sm-none"
					data-fa-transform="down-7"></span>
			</div>
		</div>
		<div
			class="row border-bottom border-200 hover-actions-trigger hover-shadow py-2 px-1 mx-0 bg-light"
			data-href="../../app/email/email-detail.jsp">
			<div class="btn-group btn-group-sm z-2 hover-actions end-0 me-3"
				style="width: 10rem;">
				<button class="btn btn-light hover-bg-200" type="button"
					data-bs-toggle="tooltip" data-bs-placement="top" title="Archive">
					<span class="fas fa-archive"></span>
				</button>
				<button class="btn btn-light hover-bg-200" type="button"
					data-bs-toggle="tooltip" data-bs-placement="top" title="Delete">
					<span class="fas fa-trash-alt"></span>
				</button>
				<button class="btn btn-light hover-bg-200" type="button"
					data-bs-toggle="tooltip" data-bs-placement="top"
					title="Mark as unread">
					<span class="fas fa-envelope"></span>
				</button>
				<button class="btn btn-light hover-bg-200" type="button"
					data-bs-toggle="tooltip" data-bs-placement="top" title="Snooze">
					<span class="fas fa-clock"></span>
				</button>
			</div>
			<div class="col-auto d-none d-sm-block">
				<div class="d-flex bg-light">
					<div class="form-check mb-0 fs-0">
						<input class="form-check-input" type="checkbox" id="checkbox-11"
							data-bulk-select-row="data-bulk-select-row" />
					</div>
					<span class="far text-300 fa-star ms-1" data-fa-transform="down-4"></span>
				</div>
			</div>
			<div class="col col-md-9 col-xxl-10">
				<div class="row">
					<div class="col-md-4 col-xl-3 col-xxl-2 ps-md-0 mb-1 mb-md-0">
						<div class="d-flex position-relative">
							<div class="avatar avatar-s">
								<img class="rounded-soft" src="../../assets/img/team/5.jpg"
									alt="" />

							</div>
							<div class="flex-1 ms-2">
								<a class="stretched-link inbox-link"
									href="../../app/email/email-detail.jsp">Bruce Banner</a>
							</div>
						</div>
					</div>
					<div class="col">
						<a class="d-block inbox-link"
							href="../../app/email/email-detail.jsp"><span>Invitation
								for migration</span><span class="mx-1">&ndash;</span><span>Bruce
								Wayne, you have an invitation of migration...</span></a><a
							class="d-inline-flex align-items-center border rounded-pill px-3 py-1 me-2 mt-2 inbox-link"
							href="#!"><span class="fas fa-file-pdf text-danger"
							data-fa-transform="grow-4"></span><span class="ms-2">Invitation</span></a>
					</div>
				</div>
			</div>
			<div
				class="col-auto ms-auto d-flex flex-column justify-content-between">
				<span>Oct 26</span><span
					class="far text-300 fa-star ms-auto mb-2 d-sm-none"
					data-fa-transform="down-7"></span>
			</div>
		</div>
	</div>
	<div
		class="card-footer d-flex justify-content-between align-items-center">
		<small>2.29 GB <span class="d-none d-sm-inline-block">(13%)
		</span> of 17 GB used
		</small>
		<div>
			<small>1-12 of 354</small>
			<button class="btn btn-falcon-default btn-sm ms-1 ms-sm-2"
				type="button" disabled="disabled">
				<span class="fas fa-chevron-left"></span>
			</button>
			<button class="btn btn-falcon-default btn-sm ms-1 ms-sm-2"
				type="button">
				<span class="fas fa-chevron-right"></span>
			</button>
		</div>
	</div>
</div>
<footer class="footer">
	<div class="row g-0 justify-content-between fs--1 mt-4 mb-3">
		<div class="col-12 col-sm-auto text-center">
			<p class="mb-0 text-600">
				Thank you for creating with Falcon <span
					class="d-none d-sm-inline-block">| </span><br class="d-sm-none" />
				2023 &copy; <a href="https://themewagon.com">Themewagon</a>
			</p>
		</div>
		<div class="col-12 col-sm-auto text-center">
			<p class="mb-0 text-600">v3.17.0</p>
		</div>
	</div>

	<%@ include file="../inc/bottom.jsp"%>