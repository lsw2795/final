<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 
관리자뷰 - 공지사항 목록 뷰
내용 : 등록 이동, 수정 이동, 다중삭제, 페이징처리, 공지사항 제목또는 내용검색
컨트롤러 : com.ez.gw.board.controller.NoticeController	  
작성자 : 송영은
작성일 : 2023.08
 -->  	
<%@ include file='../../inc/adminTop.jsp'%>
<link rel="stylesheet" href="<c:url value='/css/adminempform.css'/>">
<script type="text/javascript">
	$(function(){
		$('#btnNoticeDel').click(function(){
			var count= $('input[type=checkbox]:checked').length;
			var boardNo=$('input[name=boardNo]').val();
		
			if(count<1){
				alert('삭제하고 싶은 게시글을 먼저 체크하세요');
			}
			
			if(count>0){
				if(confirm('선택한 게시글을 삭제하시겠습니까?')){
					$('form[name=frmList]').prop('action', "<c:url value='/admin/board/noticeDeleteMulti'/>");
					$('form[name=frmList]').submit();
				} // if
			} 
		});
	});
	//작성자 정보보기	
	function empDetail(empNo) {
	    window.open("<c:url value='/mypage/empDetail?empNo='/>"+empNo,'empDetail', 'width=320,height=550,top=300,left=700,location=yes,resizable=yes');
	}
	//페이징처리
	function pageFunc(curPage){
		$('input[name="currentPage"]').val(curPage);
		$('form[name="frmPage"]').submit();
	}
	//공지사항 제목 또는 내용 검색
	function submitForm() {
	    document.getElementById('frmSearch').submit();
	}
</script>
  <!-- 페이징 처리 관련 form -->
		<form action="<c:url value='/admin/board/noticeList'/>" 
			name="frmPage" method="post">
			<input type="hidden" name="currentPage">
			<input type="hidden" name="searchKeyword" value="${param.searchKeyword}">
			<input type="hidden" name="searchCondition" value="${param.searchCondition}">
		</form>
<h2><a id="admina" class="admina" href="<c:url value='/admin/board/noticeList'/>">공지사항</a></h2>
<div class="col-lg-12 pe-lg-2 mb-3">
	<div class="card" id="allContactTable">
		<div class="card-header border-bottom border-200 px-0 admindefault">
			<div class="d-lg-flex justify-content-between">
				<div class="row flex-between-center gy-2 px-x1">
					<form name="frmSearch" action='<c:url value='/admin/board/noticeList'/>'>
						<div class="row flex-between-center gy-2 px-x1">
						<div class="col-auto pe-0">
								 <select name="searchCondition" class="form-select admindefault">
		                            <option value="title"
		                            	<c:if test="${param.searchCondition=='title'}">
		                            		selected = "selected"
		                            	</c:if>
		                            >제목</option>
		                            <option value="dept_name"
		                            	<c:if test="${param.searchCondition=='dept_name'}">
		                            		selected= "selected"
		                            	</c:if>
		                            >부서</option>	
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
									class="form-control shadow-none search admindefault"
									value='${param.searchKeyword}' type="search"
									placeholder="검색어 입력" aria-label="search" />
								<button
									class="btn btn-sm btn-outline-secondary border-300 hover-border-secondary">
									<span class="fa fa-search fs--1"></span>
								</button>
							</div>
						</div>
						 <div class="col-auto searchEmpResult admindefault" style="padding: 10px 0 0 25px;">
							<c:if test="${!empty param.searchKeyword }">
							   <p>검색어 : ${param.searchKeyword} , <span style="font-weight: bold; color: red;">${pagingInfo.totalRecord}</span> 건 검색되었습니다.</p>
							</c:if>   
						</div>
						</div>
						</form>
					</div>
				<div class="border-bottom border-200 my-3"></div>
				<div class="d-flex align-items-center justify-content-between justify-content-lg-end px-x1">
                      <button class="btn btn-sm btn-falcon-default d-xl-none" type="button" data-bs-toggle="offcanvas" data-bs-target="#allContactOffcanvas" aria-controls="allContactOffcanvas"><span class="fas fa-filter" data-fa-transform="shrink-4"></span><span class="ms-1 d-none d-sm-inline-block">Filter</span></button>
                      <div class="bg-300 mx-3 d-none d-lg-block d-xl-none" style="width:1px; height:29px"></div>
                      <div class="d-flex align-items-center">
                      	<a href="<c:url value='/admin/board/noticeWrite'/>" class="btn btn-primary">등록</a>
						<span class="adminhyphen"></span>
						<input type="button" value="삭제" id="btnNoticeDel" class="btn btn-danger"/>
                      </div>
                    </div>
			</div>
		</div>
		<div class="card-body p-0 admindefault">
			<div class="table-responsive scrollbar admindefault">
				<table class="table table-sm table-hover">
					<colgroup>
						<col style="width: 5%;" />
						<col style="width: 15%;" />
						<col style="width: 15%;" />
						<col style="width: 40%;" />
						<col style="width: 15%;" />
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
						<c:set var="idx" value="0"/>
						<form name="frmList">
						<c:forEach var="map" items="${list}">
							<tr>
								<td class="align-middle fs-0 py-3">
									<div class="form-check mb-0">
										<input class="form-check-input" type="checkbox"
											id="all-contact-0"
											data-bulk-select-row="data-bulk-select-row"
											value="${map['BOARD_NO']}" name="boardItems[${idx}].boardNo"/>
									</div>
								</td>
								<td class="align-middle name white-space-nowrap pe-5 ps-2">
									<div class="d-flex align-items-center gap-2 position-relative">
										<div class="avatar avatar-xl adminempdiv18">
											<div>
												<img class="rounded-circle" src="<c:url value='/images/${map["IMAGE"]}'/>">
											</div>
										</div>
										<a href="#" onclick="empDetail(${map.EMP_NO});" 
											style="text-decoration:none; color: #5e6e82;">${map['NAME']}
										</a>
									</div>
								</td>
								
								<td class="align-middle"><div class="adminempdiv18">${map['DEPT_NAME']}</div></td>
								<td class="align-middle">
								<div class="adminempdiv18">
									<a href="<c:url value='/admin/board/noticeDetail?boardNo=${map["BOARD_NO"]}'/>">
									${map['TITLE']}
									<c:if test="${map['timeNew']==1}">
										<img alt="New이미지" src="<c:url value='/images/new.jpg'/>">
									</c:if>
									</a>
								</div>
								</td>
								<td class="align-middle">
								<div class="adminempdiv18">
									<fmt:formatDate value="${map['REGDATE']}" pattern="yyyy-MM-dd" />
								</div>
								</td>
								<td class="align-middle">
								<div class="adminempdiv18">
								${map['READCOUNT']}
								</div>
								</td>
							</tr>
							 <c:set var="idx" value="${idx+1 }"/>
						</c:forEach>
						</form>
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
				<c:if test="${pagingInfo.firstPage>1 }">
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
</div>
<%@ include file='../../inc/adminBottom.jsp'%>