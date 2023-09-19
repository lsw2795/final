<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file='../../inc/adminTop.jsp'%>
<link rel="stylesheet" href="<c:url value='/css/adminempform.css'/>">
<script type="text/javascript">
	$(function(){
		$('#btnDel').click(function(){
			var count = $('tbody input[type=checkbox]:checked').length;
			if(count < 1){
				alert('삭제하고 싶은 게시글을 먼저 체크하세요');
			}
			
			if(count > 0){
				if(confirm('선택한 게시글을 삭제하시겠습니까?')){
					$('form[name=frmList]').prop('action', "<c:url value='/admin/qna/deleteMulti'/>");
					$('form[name=frmList]').submit();
				}
			} 
		});
	});
	
	function pageFunc(curPage){
		$('input[name="currentPage"]').val(curPage);
		$('form[name="frmPage"]').submit();
	}
</script>
<style>
	.gap-2 {
    	padding-left: 52px;
	}
	
	.table-sm > :not(caption) > * > * {
   		text-align: center;
	}
</style>

<!-- 페이징 처리 관련 form -->
<form action="<c:url value='/admin/qna/list'/>" name="frmPage" method="post">
	<input type="hidden" name="currentPage">
	<input type="hidden" name="searchKeyword" value="${param.searchKeyword}">
	<input type="hidden" name="searchCondition" value="${param.searchCondition}">
</form>

<h2><a id="admina" class="admina" href="<c:url value='/admin/board/noticeList'/>">Q&A</a></h2>
<div class="col-lg-12 pe-lg-2 mb-3">
	<div class="card" id="allContactTable">
		<div class="card-header border-bottom border-200 px-0 admindefault">
			<div class="d-lg-flex justify-content-between">
				<form name="frmList" method="post" action='<c:url value='/admin/qna/list'/>'>
					<div class="row flex-between-center gy-2 px-x1">
						<div class="col-auto pe-0">
							<select name="searchCondition" class="form-select admindefault">
								<option value="title" <c:if test="${param.searchCondition=='title'}">selected="selected"</c:if>>제목</option>
								<option value="name" <c:if test="${param.searchCondition=='name'}">selected="selected"</c:if>>작성자</option>
								<option value="content" <c:if test="${param.searchCondition=='content'}">selected="selected"</c:if>>내용</option>
							</select>
						</div>
						<div class="col-auto">
							<div class="input-group input-search-width">
								<input name="searchKeyword" class="form-control shadow-none search admindefault" value='${param.searchKeyword}' type="search" placeholder="검색어 입력" aria-label="search" />
								<button class="btn btn-sm btn-outline-secondary border-300 hover-border-secondary">
									<span class="fa fa-search fs--1"></span>
								</button>
							</div>
						</div>
					</div>
				</form>
				<div class="border-bottom border-200 my-3"></div>
				<div class="d-flex align-items-center justify-content-between justify-content-lg-end px-x1">
					<button class="btn btn-sm btn-falcon-default d-xl-none" type="button" data-bs-toggle="offcanvas" data-bs-target="#allContactOffcanvas" aria-controls="allContactOffcanvas">
						<span class="fas fa-filter" data-fa-transform="shrink-4"></span><span class="ms-1 d-none d-sm-inline-block">Filter</span>
					</button>
					<div class="bg-300 mx-3 d-none d-lg-block d-xl-none" style="width:1px; height:29px"></div>
					<div class="d-flex align-items-center">
						<a href="<c:url value='/admin/qna/write'/>" class="btn btn-primary">등록</a>
						<span class="adminhyphen"></span>
						<span class="adminhyphen"></span>
						<input type="button" value="삭제" id="btnDel" class="btn btn-primary">
					</div>
				</div>
			</div>
		</div>
		<div class="card-body p-0 admindefault">
			<div class="table-responsive scrollbar admindefault">
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
									<input class="form-check-input" id="checkbox-bulk-tickets-select" type="checkbox" data-bulk-select='{"body":"table-contact-body","actions":"table-contact-actions","replacedElement":"table-contact-replace-element"}' />
								</div>
							</th>
							<th class="sort align-middle" scope="col" data-sort="name">작성자</th>
							<th class="sort align-middle" scope="col" data-sort="dept">직급</th>
							<th class="sort align-middle" scope="col" data-sort="title">제목</th>
							<th class="sort align-middle" scope="col" data-sort="regdate">등록일</th>
							<th class="sort align-middle" scope="col" data-sort="readcount">조회수</th>
						</tr>
					</thead>
					<tbody class="list" id="table-contact-body">
						<c:set var="idx" value="0"/>
						<!-- 반복 시작  -->
						<c:forEach var="map" items="${list}">
							<tr>
								<td class="align-middle fs-0 py-3">
									<div class="form-check mb-0">
										<input class="form-check-input" type="checkbox" id="all-contact-0" data-bulk-select-row="data-bulk-select-row" name="boardItems[${idx}].boardNo" value="${map['BOARD_NO']}"/>
									</div>
								</td>
								<td class="align-middle name white-space-nowrap pe-5 ps-2">
									<div class="d-flex align-items-center gap-2 position-relative">
										<div class="avatar avatar-xl">
											<c:if test="${!empty map['IMAGE']}">
												<div class="avatar-name rounded-circle">
													<img src="<c:url value='/images/${map["IMAGE"]}'/>" alt="no">
												</div>
											</c:if>
											<c:if test="${empty map['IMAGE']}">
												<div class="avatar avatar-2xl">
													<img style="position:relative; right: 5px;" class="rounded-circle" src="<c:url value='/images/noImage.jpg'/>"  />
												</div>
											</c:if>
										</div>
										<h6 class="mb-0" style="color: black;">${map['NAME']}</h6>
									</div>
								</td>
								<td class="align-middle">개발팀</td>
								<td class="align-middle">
									<a href="<c:url value='/admin/qna/detail?boardNo=${map.BOARD_NO}'/>">${map['TITLE']}</a>
								</td>
								<td class="align-middle">
									<fmt:formatDate value="${map['REGDATE']}" pattern="yyyy-MM-dd" />
								</td>
								<td class="align-middle">${map['READCOUNT']}</td>
							</tr>
							<c:set var="idx" value="${idx+1}"/>
						</c:forEach>
						<!-- 반복 끝 -->
					</tbody>
				</table>
				<div class="text-center d-none" id="contact-table-fallback">
					<p class="fw-bold fs-1 mt-3">검색결과가 없습니다.</p>
				</div>
			</div>
		</div>
		<div class="card-footer d-flex justify-content-center admindefault">
			<div class="divPage" id="divPage">
				<!-- 페이지 번호 추가 -->		
				<!-- 이전 블럭으로 이동 -->
				<c:if test="${pagingInfo.firstPage > 1 }">
					<a href="#" id="prevPage" onclick="pageFunc(${pagingInfo.firstPage-1})">
						<img src="<c:url value='/images/first.JPG'/>">
					</a>
				</c:if>	
				<!-- [1][2][3][4][5][6][7][8][9][10] -->
				<c:forEach var="i" begin="${pagingInfo.firstPage }" end="${pagingInfo.lastPage }">		
					<c:if test="${i == pagingInfo.currentPage }">		
						<span id="curPage">${i}</span>
			        </c:if>
					<c:if test="${i != pagingInfo.currentPage }">		
				        <a href="#" id="otherPage" onclick="pageFunc(${i})">${i}</a>
				    </c:if>   		
				</c:forEach>
				<!-- 다음 블럭으로 이동 -->
				<c:if test="${pagingInfo.lastPage < pagingInfo.totalPage }">
			        <a href="#" id="nextPage" onclick="pageFunc(${pagingInfo.lastPage+1})">
						<img src="<c:url value='/images/last.JPG'/>">
					</a>
				</c:if>
				<!--  페이지 번호 끝 -->
			</div>
		</div>
	</div>
</div>
<%@ include file='../../inc/adminBottom.jsp'%>