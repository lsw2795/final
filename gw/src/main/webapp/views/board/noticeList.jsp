<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../inc/top.jsp" %>
<h2><a href="<c:url value='/board/noticeList'/>" style="text-decoration: none; color: #38404e;">공지사항</a></h2>
<div class="col-lg-12 pe-lg-2 mb-3">
	<div class="card" id="allContactTable">
		<div class="card-header border-bottom border-200 px-0 ">
			<div class="d-lg-flex justify-content-between">
				<div class="row flex-between-center gy-2 px-x1">
					<form name="frmSearch" action='<c:url value='/board/noticeList'/>'>
						<div class="row flex-between-center gy-2 px-x1">
						<div class="col-auto pe-0">
								 <select name="searchCondition" class="form-select ">
		                            <option value="title"
		                            	<c:if test="${param.searchCondition=='title'}">
		                            		selected = "selected"
		                            	</c:if>
		                            >제목</option>
		                            <option value="name"
	                       		        <c:if test="${param.searchCondition=='name'}">
		                            		selected = "selected"
		                            	</c:if>
		                            >작성자</option>
		                            <option value="content"
		                            	<c:if test="${param.searchCondition=='content'}">
		                            		selected = "selected"
		                            	</c:if>
		                            >내용</option>
	                          </select>
						</div>
						<div class="col-auto">
							<div class="input-group input-search-width">
								<input name="searchKeyword"
									class="form-control shadow-none search "
									value='${param.searchKeyword}' type="search"
									placeholder="검색어 입력" aria-label="search" />
								<button
									class="btn btn-sm btn-outline-secondary border-300 hover-border-secondary">
									<span class="fa fa-search fs--1"></span>
								</button>
							</div>
						</div>
						</div>
						</form>
					</div>
			</div>
		</div>
		<div class="card-body p-0 ">
			<div class="table-responsive scrollbar ">
				<table class="table table-sm table-hover">
					<colgroup>
						<col style="width: 5%;" />
						<col style="width: 20%;" />
						<col style="width: 15%;" />
						<col style="width: 40%;" />
						<col style="width: 10%;" />
						<col style="width: 10%;" />
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
							<th class="sort align-middle" scope="col" data-sort="name">작성자</th>
							<th class="sort align-middle" scope="col" data-sort="dept">부서</th>
							<th class="sort align-middle" scope="col" data-sort="title">제목</th>
							<th class="sort align-middle" scope="col" data-sort="regdate">등록일</th>
							<th class="sort align-middle" scope="col" data-sort="readcount">조회수</th>
						</tr>
					</thead>
					<tbody class="list" id="table-contact-body">
						<!-- 반복 시작  -->
						<c:forEach var="map" items="${list}">
							<tr>
								<td class="align-middle fs-0 py-3">
									<div class="form-check mb-0">
										<input class="form-check-input" type="checkbox"
											id="all-contact-0"
											data-bulk-select-row="data-bulk-select-row" />
									</div>
								</td>
								<td class="align-middle name white-space-nowrap pe-5 ps-2">
									<div class="d-flex align-items-center gap-2 position-relative">
										<div class="avatar avatar-xl">
											<div class="avatar-name rounded-circle">
												<span>${map['NAME']}</span>
											</div>
										</div>
										<h6 class="mb-0">${map['NAME']}</h6>
									</div>
								</td>
								
								<td class="align-middle">개발팀</td>
								<td class="align-middle">
									<a href="<c:url value='/board/noticeDetail?boardNo=${map.BOARD_NO}'/>">${map['TITLE']}</a>
								</td>
								<td class="align-middle">
									<fmt:formatDate value="${map['REGDATE']}" pattern="yyyy-MM-dd" />
								</td>
								<td class="align-middle">${map['READCOUNT']}</td>
							</tr>
						</c:forEach>
						<!-- 반복 끝 -->
					</tbody>
				</table>
				<div class="text-center d-none" id="contact-table-fallback">
					<p class="fw-bold fs-1 mt-3">검색결과가 없습니다.</p>
				</div>
			</div>
		</div>
		<div class="card-footer d-flex justify-content-center ">
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
<%@ include file = "../inc/bottom.jsp" %>