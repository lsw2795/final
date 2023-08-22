<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<link rel="stylesheet"href="<c:url value='/css/mypageempform.css'/>">    
<script type="text/javascript">	
	function pageFunc(curPage){
		$('input[name="currentPage"]').val(curPage);
		$('form[name="frmPage"]').submit();
	}
	
	function submitForm() {
	    document.getElementById('frmSearch').submit();
	}
</script>
<!-- 페이징 처리 관련 form -->
<form action="<c:url value='/mypage/myWritingList'/>" 
	name="frmPage" method="post">
	<input type="hidden" name="currentPage">
	<input type="hidden" name="searchKeyword" value="${param.searchKeyword}">
	<input type="hidden" name="searchCondition" value="${param.searchCondition}">
</form>
<div class="row g-0">
   <div class="col-lg-12 pe-lg-2 mb-3">
       <div class="card h-lg-100 overflow-hidden">
          <div class="card-header">
			<h5 class="mb-0"><span class="fas fa-pen" style="margin: 0 10px;"></span>내가 쓴 글 관리</h5>
  		  </div>
  		  <div class="card-body py-2">
              <div class="card" id="allContactTable">
                <div class="card-header border-bottom border-200 px-0">
                  <div class="d-lg-flex justify-content-between">
                  <form name="frmSearch" method="post" action="<c:url value=''/>">
                    <div class="row flex-between-center gy-2 px-x1">
                      <div class="col-auto pe-0">
                         <select class="mypageempborder mypageempsel">
							<option value="">게시판 목록</option>
							<option value="">제목</option>
							<option value="">내용</option>
						</select>
                      </div>
                      <div class="col-auto">
                         <div class="input-group input-search-width">
                           <input class="form-control shadow-none search" type="search" placeholder="검색어 입력" aria-label="search" />
                           <button class="btn btn-sm btn-outline-secondary border-300 hover-border-secondary"><span class="fa fa-search fs--1"></span></button>
                         </div>
                      </div>
                    </div>
                  </form>
              	<div class="border-bottom border-200 my-3"></div>
                    <div class="d-flex align-items-center justify-content-between justify-content-lg-end px-x1">
                      <div class="d-flex align-items-center" id="table-contact-replace-element">
                        <button class="btn btn-falcon-default btn-sm" type="button"><span class="fas fa-minus" data-fa-transform="shrink-3"></span><span class="d-none d-sm-inline-block d-xl-none d-xxl-inline-block ms-1">삭제</span></button>
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
                    <table class="table table-sm table-hover">
						<colgroup>
							<col style="width:7%;" />
							<col style="width:20%;" />
							<col style="width:43%;" />
							<col style="width:15%;" />
							<col style="width:15%;" />
						</colgroup>
                      <thead class="adminempthead">
                        <tr style="text-align: center;">
                          <th class="py-2 fs-0 pe-2" style="width: 28px;">
                            <div class="form-check d-flex align-items-center">
                              <input class="form-check-input" id="checkbox-bulk-tickets-select" type="checkbox" data-bulk-select='{"body":"table-contact-body","actions":"table-contact-actions","replacedElement":"table-contact-replace-element"}' />
                            </div>
                          </th>
                          <th class="sort align-middle" scope="col">게시판 카테고리</th>
                          <th class="sort align-middle" scope="col">제목</th>
                          <th class="sort align-middle" scope="col">조회수</th>
                          <th class="sort align-middle" scope="col">작성일</th>
                        </tr>
                      </thead>
                      <tbody id="table-contact-body">
                      <c:if test="${empty boardList }">
                      	<tr class="mypageemptr">
                      	<td class="align-middle fs-0 py-3 align-middle" colspan="6">해당 게시글이 없습니다.</td>
                      	</tr>
                      </c:if>
                      <c:if test="${!empty boardList }">
                      <c:forEach var="map" items="${boardList }">
                        <tr class="mypageemptr">
                          <td class="align-middle fs-0 py-3 align-middle">
                            <div class="form-check mb-0">
                              <input class="form-check-input" type="checkbox" value="${map['BOARD_NO']}" data-bulk-select-row="data-bulk-select-row" />
                            </div>
                          </td>
						  <c:if test="${map['BOARDLIST_NO']==100}">	                          
                          	<td class="align-middle"><a href="<c:url value='/market/marketList'/>">${map['BOARD_NAME']}</a></td>
                          	<td class="align-middle"><a href="<c:url value='/market/marketDetail?tradeNo=${map["BOARD_NO"]}'/>">${map['TITLE']}</a></td>
                          </c:if>
                          <c:if test="${map['BOARDLIST_NO']==1000}">	                          
                          	<td class="align-middle"><a href="<c:url value='/qna/list'/>">${map['BOARD_NAME']}</a></td>
                          	<td class="align-middle"><a href="<c:url value='/qna/detail?boardNo=${map["BOARD_NO"]}'/>">${map['TITLE']}</a></td>
                          </c:if>
                          <c:if test="${map['BOARDLIST_NO']==2000}">	                          
                          	<td class="align-middle"><a href="<c:url value='/board/noticeList'/>">${map['BOARD_NAME']}</a></td>
                          	<td class="align-middle"><a href="<c:url value='/board/noticeDetail?boardNo=${map["BOARD_NO"]}'/>">${map['TITLE']}</a></td>
                          </c:if>
                          <c:if test="${map['BOARDLIST_NO']==3000}">	                          
                          	<td class="align-middle"><a href="<c:url value='/pds/list'/>">${map['BOARD_NAME']}</a></td>
                          	<td class="align-middle"><a href="<c:url value='/pds/detail?boardNo=${map["BOARD_NO"]}'/>">${map['TITLE']}</a></td>
                          </c:if>
                          <!-- 추후 동호회 게시글 만들어지면 진행하기 <c:if test="#">	                          
                          	<td class="align-middle"><a href="<c:url value='/pds/list'/>">${map['BOARD_NAME']}</a></td>
                          </c:if> -->
                          <td class="align-middle">${map['READCOUNT']}</td>
                          <td class="align-middle"><fmt:formatDate value="${map['REGDATE']}" pattern="yyyy-MM-dd"/></td>
                        </tr>
                        </c:forEach> 
                        </c:if>
                      </tbody>
                    </table>
                  </div>
                </div>
                <div class="card-footer d-flex justify-content-center">
                	<div class="divPage" id="divPage">
							<!-- 페이지 번호 추가 -->		
							<!-- 이전 블럭으로 이동 -->
							<c:if test="${pagingInfo.firstPage>1 }">
                  			<a href="#" id="prevPage" onclick="pageFunc(${pagingInfo.firstPage-1})" class="btn btn-sm btn-falcon-default me-1">
                  				<span class="fas fa-chevron-left"></span>
							</a>
							</c:if>	
											
							<!-- [1][2][3][4][5][6][7][8][9][10] -->
							<c:forEach var="i" begin="${pagingInfo.firstPage }" end="${pagingInfo.lastPage }">		
								<c:if test="${i == pagingInfo.currentPage }">		
									<span class="mb-0" id="curPage">${i}</span>
					        	</c:if>
								<c:if test="${i != pagingInfo.currentPage }">		
							         <a href="#" class="mb-0" id="otherPage" onclick="pageFunc(${i})">[${i}]</a>
							    </c:if>   		
							</c:forEach>
							
							<!-- 다음 블럭으로 이동 -->
							<c:if test="${pagingInfo.lastPage < pagingInfo.totalPage }">
                  				<a href="#" id="nextPage" onclick="pageFunc(${pagingInfo.lastPage+1})" class="btn btn-sm btn-falcon-default ms-1">
                  					<span class="fas fa-chevron-right"></span>
                  				</a>
							</c:if>
							<!--  페이지 번호 끝 -->
						</div>
                
                
                
                </div>
       		</div>
          </div>
       </div>
   </div>
</div>
<%@ include file ="../inc/bottom.jsp"%>