<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet"href="<c:url value='/css/mypageempform.css'/>">
<div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasRight" aria-labelledby="offcanvasRightLabel">
		  <div class="offcanvas-header">
		    <h5 class="offcanvas-title" id="offcanvasRightLabel">조직도</h5>
		    <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
		  </div>
		  <div class="offcanvas-body">
		   <div class="card-body">
					<div id="organization-chart">
						<div class="mb-3 mypageempdiv10">
							<button class="btn btn-primary" type="button"
								data-bs-toggle="collapse" data-bs-target="#dev-employees">
								<span class="fas fa-plus" data-fa-transform="shrink-3"></span>
							</button>
							<span>개발팀</span>
							<div class="collapse" id="dev-employees">
								<div class="list-group mypageempdiv9">
									<a href="#" class="list-group-item-action">사원1</a> 
									<a href="#" class="list-group-item-action">사원2</a> 
									<a href="#" class="list-group-item-action">사원3</a>
								</div>
							</div>
						</div>
						<div class="mb-3 mypageempdiv10">
							<button class="btn btn-primary" type="button"
								data-bs-toggle="collapse" data-bs-target="#design-employees">
								<span class="fas fa-plus" data-fa-transform="shrink-3"></span>
							</button>
							<span>디자인팀</span>
							<div class="collapse" id="design-employees">
								<div class="list-group mypageempdiv9">
									<a href="#" class="list-group-item-action">사원4</a> 
									<a href="#" class="list-group-item-action">사원5</a>
								</div>
							</div>
						</div>
						<div class="mb-3 mypageempdiv10">
							<button class="btn btn-primary" type="button"
								data-bs-toggle="collapse" data-bs-target="#sales-employees">
								<span class="fas fa-plus" data-fa-transform="shrink-3"></span>
							</button>
							<span>영업팀</span>
							<div class="collapse" id="sales-employees">
								<div class="list-group mypageempdiv9">
									<a href="#" class="list-group-item-action">사원6</a> 
									<a href="#" class="list-group-item-action">사원7</a> 
									<a href="#" class="list-group-item-action">사원8</a>
								</div>
							</div>
						</div>
						<div class="mb-3 mypageempdiv10">
							<button class="btn btn-primary" type="button"
								data-bs-toggle="collapse" data-bs-target="#sales-employees">
								<span class="fas fa-plus" data-fa-transform="shrink-3"></span>
							</button>
							<span>인사팀</span>
							<div class="collapse" id="sales-employees">
								<div class="list-group mypageempdiv9">
									<a href="#" class="list-group-item-action">사원9</a>
									 <a href="#" class="list-group-item-action">사원10</a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="border-top border-200 py-x1">
					<small>사원번호/이름/부서/직급 검색</small>
					<div class="input-group">
						<input class="form-control shadow-none search"
							type="search" placeholder="검색어 입력" aria-label="search"/>
						<button class="btn btn-sm btn-outline-secondary border-300 hover-border-secondary">
							<span class="fa fa-search fs--1"></span>
						</button>
					</div>
				</div>
		  </div>
		</div>