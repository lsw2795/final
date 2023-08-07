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
                        <form action='<c:url value='/qna/list'/>'>
                          <select name="searchCondition" class="form-select form-select-sm" aria-label="Bulk actions">
	                            <option value="title"
	                            	<c:if test="${param.searchCondition=='title'}">
	                            		selected = "selected"
	                            	</c:if>
	                            >제목</option>
	                            <option value="name"
                       		        <c:if test="${param.searchCondition=='name'}">
	                            		selected = "selected"
	                            	</c:if>
	                            >이름</option>
	                            <option value="content"
	                            	<c:if test="${param.searchCondition=='content'}">
	                            		selected = "selected"
	                            	</c:if>
	                            >내용</option>
                          </select>
                      </div>
                      <div class="col-auto">
                          <div class="input-group input-search-width">
                            <input name="searchKeyword" class="form-control form-control-sm shadow-none search" 
                            	value='${param.searchKeyword}' type="search" placeholder="검색어 입력" aria-label="search" />
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
                        <button class="btn btn-falcon-default btn-sm" type="button"><span class="fas fa-plus" data-fa-transform="shrink-3"></span><a href='<c:url value='/qna/write'/>'><span class="d-none d-sm-inline-block d-xl-none d-xxl-inline-block ms-1">질문 등록</a></span></button>
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
                          <th class="sort align-middle ps-2" data-sort="name">작성자</th>
                          <th class="sort align-middle pe-5" data-sort="userid">직급</th>
                          <th class="sort align-middle pe-5" data-sort="title">제목</th>
                          <th class="sort align-middle text-end" data-sort="regdate">등록일</th>
                          <th class="sort align-middle text-end" data-sort="readcount">조회수</th>
                        </tr>
                      </thead>
                      <tbody class="list" id="table-contact-body">
                      <!-- 반복 시작  -->
                      	<c:forEach var="map" items="${list}">
	                        <tr>
	                          <td class="align-middle fs-0 py-3">
	                            <div class="form-check mb-0">
	                              <input class="form-check-input" type="checkbox" id="all-contact-0" data-bulk-select-row="data-bulk-select-row" />
	                            </div>
	                          </td>
	                          <td class="align-middle name white-space-nowrap pe-5 ps-2">
	                            <div class="d-flex align-items-center gap-2 position-relative">
	                              <div class="avatar avatar-xl">
	                                <div class="avatar-name rounded-circle"><span>${map['ENAME']}</span></div>
	                              </div>
	                              <h6 class="mb-0"><span>${map['NAME']}</span></h6>
	                            </div>
	                          </td>
	                          <td class="align-middle phone-number font-sans-serif white-space-nowrap"><span>사원</span></td>
	                          <td class="align-middle report">
	                          		<a href="<c:url value='/qna/detail?boardNo=${map.BOARD_NO}'/>"><span style="color: black">${map['TITLE']}</span>
	                          			<!-- 답변 갯수 표시  -->
	                          			<c:if test="${map['countReply']>0}">
	                          				<span style="color: red">[${map['countReply']}]</span>
	                          			</c:if>
	                          		</a>
	                          </td>
	                          <td class="align-middle subscription fs-0 text-end"><small class="badge rounded badge-subtle-success"><fmt:formatDate value="${map['REGDATE']}" pattern="yyyy-MM-dd"/></small></td>
	                          <td class="align-middle social text-end ps-4">${map['READCOUNT']}</td>
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