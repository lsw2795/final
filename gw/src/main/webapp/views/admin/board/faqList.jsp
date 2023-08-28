<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file='../../inc/adminTop.jsp'%>
<link rel="stylesheet" href="<c:url value='/css/adminempform.css'/>">
<script src="<c:url value='/vendors/ckeditor/ckeditor.js'/>"></script>
<script src="<c:url value='/vendors/ckeditor/lang/ko.js'/>"></script>
<script type="text/javascript">
	$(function(){
		$('#btnFaqEdit').click(function(){
			var count= $('input[type=checkbox]:checked').length;
			if(count==1){
				var boardNo=$('input[type=checkbox]:checked').val();
				//alert(boardNo);
				window.open("<c:url value='/admin/board/faqEdit?boardNo='/>"+boardNo,'faqEdit',
				 'width=700,height=800,top=300,left=700,location=yes,resizable=yes');
			}else if(count<1){
				alert('수정할 FAQ 게시글을 체크 바랍니다.');
			}else if(count>1){
				alert('수정할 FAQ 게시글을 하나만 체크 바랍니다.');
			}
		});
		
		$('#btnFaqDel').click(function(){
			var count= $('input[type=checkbox]:checked').length;
			if(count<1){
				alert('삭제하고 싶은 게시글을 먼저 체크하세요');
			}
			
			if(count > 0){
				if(confirm('선택한 게시글을 삭제하시겠습니까?')){
					$('form[name=frmList]').prop('action', "<c:url value='/admin/board/faqDeleteMulti'/>");
					$('form[name=frmList]').submit();
				} // if
			} 
		});
		
		
	});
	
	function pageFunc(curPage){
		$('input[name="currentPage"]').val(curPage);
		$('form[name="frmPage"]').submit();
	}
	
	function submitForm() {
	    document.getElementById('frmSearch').submit();
	}
	
	function btnFaqWrite(){
		 window.open("<c:url value='/admin/board/faqWrite'/>",'faqWrite', 'width=700,height=800,top=300,left=700,location=yes,resizable=yes');
	}
</script>
 <!-- 페이징 처리 관련 form -->
<form action="<c:url value='/admin/board/faqList'/>" 
	name="frmPage" method="get">
	<input type="hidden" name="currentPage" value=${param.currentPage }>
	<input type="hidden" name="searchKeyword" value="${param.searchKeyword}">
	<input type="hidden" name="searchCondition" value="${param.searchCondition}">
</form>
<div class="card mb-3">
	<div class="card-body admindefault position-relative">
		<div class="row">
			<div class="col-lg-12">
				<h3 class="admindefault">FAQ</h3>
				<div class="col-auto">
					<div class="input-group admindefault">
						<form name="frmSearch" action='<c:url value='/admin/board/faqList'/>'>
						<div class="row flex-between-center">
						<div class="col-auto pe-0">
							<select name="searchCondition" class="form-select admindefault">
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
									class="form-control shadow-none search admindefault"
									value='${param.searchKeyword}' type="search"
									placeholder="검색어 입력" aria-label="search" />
								<button
									class="btn btn-sm btn-outline-secondary border-300 hover-border-secondary">
									<span class="fa fa-search fs--1"></span>
								</button>
							</div>
						</div>
						<div class="col-auto mt-3">
							<div class="admindefault adminempdiv13" id="table-contact-replace-element">
								<input type="button" value="등록" class="btn btn-outline-primary" onclick="btnFaqWrite()"/>
								<span class="adminhyphen"></span>
								<input type="button" value="수정" id="btnFaqEdit" class="btn btn-outline-warning"/>
								<span class="adminhyphen"></span>
								<input type="button" value="삭제" id="btnFaqDel" class="btn btn-outline-danger"/>
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
      <div class="card-body admindefault">
       <div class="col-auto searchEmpResult admindefault" style="padding: 10px 0 0 25px;">
			<c:if test="${!empty param.searchKeyword }">
			   <p>검색어 : ${param.searchKeyword} , <span style="font-weight: bold; color: red;">${pagingInfo.totalRecord}</span> 건 검색되었습니다.</p>
			</c:if>   
		</div>
        <div class="accordion border rounded overflow-hidden" id="accordionFaq">
          <c:if test="${!empty faqList }">
          <c:set var="idx" value="0"/>
          <c:forEach var="boardVo" items="${faqList }">
          <div class="card shadow-none rounded-bottom-0 border-bottom">
            <div class="accordion-item border-0">
              <div class="card-header p-0 d-flex align-items-center adminempdiv12" id="faqAccordionHeading${boardVo.boardNo }">
	       	 	<form name="frmList">
	       	 	<input class="form-check-input" type="checkbox" id="all-contact-0"
					data-bulk-select-row="data-bulk-select-row" name="boardItems[${idx}].boardNo" value="${boardVo.boardNo}"/>
				</form>
                <button class="accordion-button btn btn-link text-decoration-none d-block w-100 py-2 px-3 collapsed border-0 text-start rounded-0 shadow-none" 
                data-bs-toggle="collapse" data-bs-target="#collapseFaqAccordion${boardVo.boardNo }" aria-expanded="false" aria-controls="collapseFaqAccordion${boardVo.boardNo }">
                <span class="fas fa-caret-right accordion-icon me-3" data-fa-transform="shrink-2"></span>
                <span class="fw-medium font-sans-serif text-900">${boardVo.title }</span>
                </button>
              </div>
              <div class="accordion-collapse collapse" id="collapseFaqAccordion${boardVo.boardNo }" 
              aria-labelledby="faqAccordionHeading${boardVo.boardNo }" data-parent="#accordionFaq">
                <div class="accordion-body p-0 admindefault">
                  <div class="card-body pt-2">
                    <div class="ps-3 mb-0">
                      <p>${boardVo.content }</p>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <c:set var="idx" value="${i+1 }"/>
		</c:forEach>
		</c:if>
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
		        <a href="<c:url value='/admin/board/noticeList?currentPage=${i}&searchKeyword=${param.searchKeyword }&searchCondition=${param.searchCondition }'/>" id="otherPage">${i}</a>
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