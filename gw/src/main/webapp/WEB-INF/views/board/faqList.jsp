<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 
사원뷰 - FAQ 목록뷰
내용 : FAQ 페이징처리, 검색, 아코디언을 이용한 제목과 내용 조회,CKEDITOR4 API를 이용한 이미지 파일 조회
컨트롤러 : com.ez.gw.board.controller.FaqController
작성자 : 송영은
작성일 : 2023.08
 -->    	
<%@ include file="../inc/top.jsp"%>
<link rel="stylesheet"href="<c:url value='/css/mypageempform.css'/>">   
<script type="text/javascript">	
	//페이징처리
	function pageFunc(curPage){
		$('input[name="currentPage"]').val(curPage);
		$('form[name="frmPage"]').submit();
	}
	//검색
	function submitForm() {
	    document.getElementById('frmSearch').submit();
	}
</script>
<!-- 페이징 처리 관련 form -->
<form action="<c:url value='/board/faqList'/>" 
	name="frmPage" method="post">
	<input type="hidden" name="currentPage" value=${param.currentPage }>
	<input type="hidden" name="searchKeyword" value="${param.searchKeyword}">
	<input type="hidden" name="searchCondition" value="${param.searchCondition}">
</form>
<div class="card mb-3">
	<div class="card-body position-relative">
		<div class="row">
			<div class="col-lg-12">
				<h3><a id="mypagea" class="mypagea" href="<c:url value='/board/faqList'/>">FAQ</a></h3>
				<div class="col-auto">
					<div class="input-group">
						<form name="frmSearch" action='<c:url value='/board/faqList'/>'>
						<div class="row flex-between-center">
						<div class="col-auto pe-0">
							<select name="searchCondition" class="form-select ">
	                            <option value="title"
	                            	<c:if test="${param.searchCondition=='title'}">
	                            		selected = "selected"
	                            	</c:if>
	                            >제목</option>
	                            <option value="content"
	                            	<c:if test="${param.searchCondition=='content'}">
	                            		selected = "selected"
	                            	</c:if>
	                            >내용</option>
                          </select>
						</div>
						<div class="col-auto">
							<div class="input-group">
								<input name="searchKeyword"
									class="form-control shadow-none search"
									value='${param.searchKeyword}' type="search"
									placeholder="검색어 입력" aria-label="search"/>
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
		</div>
	</div>
</div>
	<div class="card">
      <div class="card-body bg-light">
       <div class="col-auto searchEmpResult" style="padding: 10px 0 0 25px;">
			<c:if test="${!empty param.searchKeyword }">
			   <p>검색어 : ${param.searchKeyword} , <span style="font-weight: bold; color: red;">${pagingInfo.totalRecord}</span> 건 검색되었습니다.</p>
			</c:if>   
		</div>
        <div class="accordion border rounded overflow-hidden" id="accordionFaq">
          <c:if test="${!empty faqList }">
          <c:forEach var="boardVo" items="${faqList }">
          <div class="card shadow-none rounded-bottom-0 border-bottom">
            <div class=" accordion-item border-0">
              <div class="card-header p-0 d-flex align-items-center mypageempdiv15" id="faqAccordionHeading${boardVo.boardNo }">
                <button type="button" class="accordion-button btn btn-link text-decoration-none d-block w-100 py-2 px-3 collapsed border-0 text-start rounded-0 shadow-none"
                data-bs-toggle="collapse" data-bs-target="#collapseFaqAccordion${boardVo.boardNo }"
                 aria-expanded="false" aria-controls="collapseFaqAccordion${boardVo.boardNo }"
                 style="background: #dbe2ee;">
                <span class="fas fa-caret-right accordion-icon me-3" data-fa-transform="shrink-2"></span>
                <span class="fw-medium font-sans-serif text-900">${boardVo.title }</span>
                </button>
              </div>
              <div class="accordion-collapse collapse" id="collapseFaqAccordion${boardVo.boardNo }" 
              aria-labelledby="faqAccordionHeading${boardVo.boardNo }" data-parent="#accordionFaq">
                <div class="accordion-body p-0 ">
                  <div class="card-body pt-2">
                    <div class="ps-3 mb-0">
                      <p>${boardVo.content }</p>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
		</c:forEach>
		</c:if>
		</div>
	<div class="card-footer d-flex justify-content-center">
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

<%@ include file="../inc/bottom.jsp"%>