<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<div class="row g-0">
	<div class="col-lg-12 pe-lg-2 mb-3">
		<div class="card h-lg-100 overflow-hidden">
			<div class="card-header">
				<h5 class="mb-0">
					<span class="fas fa-user" style="margin: 0 10px;"></span>조직도
				</h5>
			</div>
			<div class="card-body py-2">
				
					<div id="organization-chart">
						<div class="mb-3">
							<button class="btn btn-primary" type="button"
								data-bs-toggle="collapse" data-bs-target="#dev-employees">
								<span class="fas fa-plus" data-fa-transform="shrink-3"></span>
							</button>
							<span>개발팀</span>
							<div class="collapse" id="dev-employees">
								<ul class="list-group list-group-flush">
									<li class="list-group-item">사원1</li>
									<li class="list-group-item">사원2</li>
									<li class="list-group-item">사원3</li>
								</ul>
							</div>
						</div>

						<div class="mb-3">
							<button class="btn btn-primary" type="button"
								data-bs-toggle="collapse" data-bs-target="#design-employees">
								<span class="fas fa-plus" data-fa-transform="shrink-3"></span>
							</button>	
							<span>디자인팀</span>
							<div class="collapse" id="design-employees">
								<ul class="list-group list-group-flush">
									<li class="list-group-item">사원4</li>
									<li class="list-group-item">사원5</li>
								</ul>
							</div>
						</div>
						<div class="mb-3">
							<button class="btn btn-primary" type="button"
								data-bs-toggle="collapse" data-bs-target="#sales-employees">
								<span class="fas fa-plus" data-fa-transform="shrink-3"></span>
							</button>	
							<span>영업팀</span>
							<div class="collapse" id="sales-employees">
								<ul class="list-group list-group-flush">
									<li class="list-group-item">사원6</li>
									<li class="list-group-item">사원7</li>
									<li class="list-group-item">사원8</li>
								</ul>
							</div>
						</div>
					
					
					
					</div>
				</div>
			</div>
		</div>
	</div>

<%@ include file="../inc/bottom.jsp"%>