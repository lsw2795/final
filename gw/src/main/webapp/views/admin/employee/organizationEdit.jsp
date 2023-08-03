<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file='../../inc/adminTop.jsp'%>
<link rel="stylesheet" href="<c:url value='/css/adminempform.css'/>">
<div class="row g-0">
	<div class="col-lg-12 pe-lg-2 mb-3">
		<div class="card h-lg-100 overflow-hidden">
			<div class="card-header admindefault">
				<h5 class="mb-0 admindefault">
					<span class="fas fa-sitemap" style="margin: 0 10px;"></span>조직도 관리
				</h5>
			</div>
			<div class="card-body py-2 admindefault">
				<div class="card admindefault" id="allContactTable">
					<div class="card-header border-bottom border-200 px-0 admindefault">
						<div class="d-lg-flex justify-content-between admindefault">
							<form name="frmSearch" method="post" action="<c:url value=''/>">
								<div class="row flex-between-center gy-2 px-x1">
									<div class="col-auto">
										<div class="input-group admindefault">
											<input class="form-control shadow-none search admindefault" type="search"
												placeholder="사원번호/이름/부서/직급 검색" aria-label="search"
												style="width: 280px;" />
											<button
												class="btn btn-sm btn-outline-secondary border-300 hover-border-secondary">
												<span class="fa fa-search fs--1"></span>
											</button>
										</div>
									</div>
								</div>
							</form>
							<div class="border-bottom border-200 my-3"></div>
							<div class="d-flex align-items-center justify-content-between justify-content-lg-end px-x1">
								<div class="d-flex align-items-center"
									id="table-contact-replace-element">
									<button class="btn btn-falcon-default btn-sm" type="button">
										<span class="fas fa-plus" data-fa-transform="shrink-3"></span><span
											class="d-none d-sm-inline-block d-xl-none d-xxl-inline-block ms-1">부서추가</span>
									</button>
									<button class="btn btn-falcon-default btn-sm mx-2"
										type="button">
										<span class="fas fa-external-link-alt"
											data-fa-transform="shrink-3"></span><span
											class="d-none d-sm-inline-block d-xl-none d-xxl-inline-block ms-1">Export</span>
									</button>
									<button class="btn btn-falcon-default btn-sm" type="button">
										<span class="fas fa-file-import" data--transform="shrink-3"></span><span
											class="d-none d-sm-inline-block d-xl-none d-xxl-inline-block ms-1">Import</span>
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
			</div>
		</div>
	</div>
</div>
<%@ include file='../../inc/adminBottom.jsp'%>