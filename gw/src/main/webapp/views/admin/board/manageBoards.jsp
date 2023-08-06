<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file='../../inc/adminTop.jsp'%>
<link rel="stylesheet" href="<c:url value='/css/adminempform.css'/>">
<div class="row g-3 mb-3">
	<div class="col-xxl-4">
		<div class="card h-100 admindefault">
			<div class="card-header d-flex flex-between-center admindefault">
				<h5 class="mb-0 admindefault">게시판 목록</h5>
			</div>
			<div class="card-body pt-3 admindefault">
						<div class="table-responsive scrollbar admindefault">
							<table class="table table-hover">
								<colgroup>
									<col style="width: 40%;" />
									<col style="width: 40%;" />
									<col style="width: 20%;" />
								</colgroup>
								<thead class="adminempthead">
									<tr style="text-align: center;">
										<th class="sort align-middle" scope="col">게시판 이름</th>
										<th class="sort align-middle" scope="col">게시판 종류</th>
										<th class="sort align-middle" scope="col">삭제</th>
									</tr>
								</thead>
								<tbody id="table-contact-body">
									<tr class="adminemptr">
										<td class="align-middle"><a href="#">2</a></td>
										<td class="align-middle">3</td>
										<td class="align-middle">
										<button type="button" class="btn btn-danger"><span class="fas fa-trash"></span></button>
										</td>
									</tr>

									<tr class="adminemptr">
										<td class="align-middle"><a href="#">2</a></td>
										<td class="align-middle">3</td>
										<td class="align-middle">
										<button type="button" class="btn btn-danger"><span class="fas fa-trash"></span></button>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
			<div class="card-footer d-flex justify-content-center admindefault">
				<button class="btn btn-sm btn-falcon-default me-1" type="button"
					title="Previous" data-list-pagination="prev">
					<span class="fas fa-chevron-left"></span>
				</button>
				<ul class="pagination mb-0"></ul>
				<button class="btn btn-sm btn-falcon-default ms-1" type="button"
					title="Next" data-list-pagination="next">
					<span class="fas fa-chevron-right"></span>
				</button>
			</div>
		</div>
	</div>
	<div class="col-xxl-8">
		<div class="row g-3 h-100">
			<div class="col-md-6">
				<div class="card font-sans-serif h-100 admindefault">
					<div class="card-header pb-0 admindefault">
						<h5 class="mb-0 admindefault">게시판 추가</h5>
					</div>
					<div class="card-body pt-3 admindefault">
						<div class="table-responsive scrollbar admindefault">
							<table class="table table-bordered">
								<colgroup>
									<col style="width: 35%;" />
									<col style="width: 65%;" />
								</colgroup>
								<tbody id="table-contact-body">
									<tr class="adminemptr">
										<td class="align-middle">게시판 이름</td>
										<td class="align-middle">
											<input type="text" class="form-control admindefault" id=""/>
										</td>
									</tr>
									<tr class="adminemptr">
										<td class="align-middle">게시판 종류</td>
										<td class="align-middle">
											<input type="text" class="form-control admindefault" id=""/>
										</td>
									</tr>
									<tr class="adminemptr">
										<td class="align-middle">좋아요<br>허용여부</td>
										<td class="align-middle">
											<div class="form-check form-switch">
											  <input class="form-check-input" type="checkbox" role="switch" id="flexSwitchCheckDefault">
											  <label class="form-check-label" for="flexSwitchCheckDefault">기본설정 : 비허용</label>
											</div>
										</td>
									</tr>
									<tr class="adminemptr">
										<td class="align-middle">댓글<br>허용여부</td>
										<td class="align-middle">
											<div class="form-check form-switch">
											  <input class="form-check-input" type="checkbox" role="switch" id="flexSwitchCheckDefault">
											  <label class="form-check-label" for="flexSwitchCheckDefault">기본설정 : 비허용</label>
											</div>
										</td>
									</tr>
									<tr class="adminemptr">
										<td class="align-middle">업로드<br>허용여부</td>
										<td class="align-middle">
											<div class="form-check form-switch">
											  <input class="form-check-input" type="checkbox" role="switch" id="flexSwitchCheckChecked" checked>
  											  <label class="form-check-label" for="flexSwitchCheckChecked">기본설정 : 허용</label>
											</div>
										</td>
									</tr>
									<tr class="adminemptr">
										<td class="align-middle">사원<br>공개여부</td>
										<td class="align-middle">
											<div class="form-check form-switch">
											  <input class="form-check-input" type="checkbox" role="switch" id="flexSwitchCheckChecked" checked>
  											  <label class="form-check-label" for="flexSwitchCheckChecked">기본설정 : 허용</label>
											</div>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<div class="card-footer d-flex justify-content-center admindefault">
						<input type="submit" value="등록" class="btn btn-primary"/>
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="card font-sans-serif h-100 admindefault">
					<div class="card-header pb-0 admindefault">
						<h5 class="mb-0 admindefault">게시판 권한 수정</h5>
					</div>
					<div class="card-body pt-3 admindefault">
						<div class="table-responsive scrollbar admindefault">
							<table class="table table-bordered">
								<colgroup>
									<col style="width: 35%;" />
									<col style="width: 65%;" />
								</colgroup>
								<tbody id="table-contact-body">
									<tr class="adminemptr">
										<td class="align-middle">게시판 이름</td>
										<td class="align-middle">
											<div class="adminempdiv11"> 
											<select class="admindefault adminempborder adminempsel form-select">
												<option value="">선택하세요</option>
												<option value="">영업팀</option>
												<option value="">마케팅팀</option>
												<option value="">개발팀</option>
											</select>
											</div>
										</td>
									</tr>
									<tr class="adminemptr">
										<td class="align-middle">게시판 종류</td>
										<td class="align-middle">
											<input type="text" class="form-control admindefault" id=""/>
										</td>
									</tr>
									<tr class="adminemptr">
										<td class="align-middle">좋아요 허용여부</td>
										<td class="align-middle">
											<div class="form-check form-switch">
											  <input class="form-check-input" type="checkbox" role="switch" id="flexSwitchCheckDefault">
											  <label class="form-check-label" for="flexSwitchCheckDefault">기본설정 : 비허용</label>
											</div>
										</td>
									</tr>
									<tr class="adminemptr">
										<td class="align-middle">댓글 허용여부</td>
										<td class="align-middle">
											<div class="form-check form-switch">
											  <input class="form-check-input" type="checkbox" role="switch" id="flexSwitchCheckDefault">
											  <label class="form-check-label" for="flexSwitchCheckDefault">기본설정 : 비허용</label>
											</div>
										</td>
									</tr>
									<tr class="adminemptr">
										<td class="align-middle">업로드 허용여부</td>
										<td class="align-middle">
											<div class="form-check form-switch">
											   <input class="form-check-input" type="checkbox" role="switch" id="flexSwitchCheckChecked" checked>
  											  <label class="form-check-label" for="flexSwitchCheckChecked">기본설정 : 허용</label>
											</div>
										</td>
									</tr>
									<tr class="adminemptr">
										<td class="align-middle">사원 공개여부</td>
										<td class="align-middle">
											<div class="form-check form-switch">
											   <input class="form-check-input" type="checkbox" role="switch" id="flexSwitchCheckChecked" checked>
  											  <label class="form-check-label" for="flexSwitchCheckChecked">기본설정 : 허용</label>
											</div>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<div class="card-footer d-flex justify-content-center admindefault">
					<input type="submit" value="수정" class="btn btn-primary"/>
					</div>
				</div>
			</div>
			<div class="col-12">
				<div class="card h-100 admindefault">
					<div class="card-header py-2 admindefault">
						<div class="row flex-between-center g-0 admindefault">
							<div class="card-header pb-0 admindefault">
								<h5 class="mb-0 admindefault">최근 게시글 조회</h5>
							</div>
						</div>
					</div>
						<div class="card-body pb-0 admindefault">
						<div class="table-responsive scrollbar admindefault">
							<table class="table table-sm table-hover">
								<colgroup>
									<col style="width: 5%;" />
									<col style="width: 20%;" />
									<col style="width: 15%;" />
									<col style="width: 15%;" />
									<col style="width: 15%;" />
									<col style="width: 17%;" />
									<col style="width: 13%;" />
								</colgroup>
								<thead class="adminempthead">
									<tr style="text-align: center;">
										<th class="py-2 fs-0 pe-2" style="width: 28px;">
											<div class="form-check d-flex align-items-center">
												<input class="form-check-input"
													id="checkbox-bulk-tickets-select" type="checkbox"
													data-bulk-select='{"body":"table-contact-body","actions":"table-contact-actions","replacedElement":"table-contact-replace-element"}' />
											</div>
										</th>
										<th class="sort align-middle" scope="col">게시판 이름</th>
										<th class="sort align-middle" scope="col">게시판 종류</th>
										<th class="sort align-middle" scope="col">사원번호</th>
										<th class="sort align-middle" scope="col">사원이름</th>
										<th class="sort align-middle" scope="col">제목</th>
										<th class="sort align-middle" scope="col">내용</th>
									</tr>
								</thead>
								<tbody id="table-contact-body">
									<tr class="adminemptr">
										<td class="align-middle fs-0 py-3 align-middle">
											<div class="form-check mb-0">
												<input class="form-check-input" type="checkbox"
													data-bulk-select-row="data-bulk-select-row" />
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
												<input class="form-check-input" type="checkbox"
													data-bulk-select-row="data-bulk-select-row" />
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
		</div>
	</div>
</div>
<%@ include file='../../inc/adminBottom.jsp'%>