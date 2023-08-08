<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../inc/top.jsp" %>
<style>
	.title{
	    position: left;
	    left: 10px;
	    position: absolute;
	    left: 100px;
	    top: 10px;
	}
</style>

<script type="text/javascript">
	function deleteQna() {
		if(confirm("질문을 삭제하시겠습니까?")){
			location.href = "<c:url value='/qna/delete?boardNo=${map.BOARD_NO}'/>"
		}
	}
</script>

 <div class="row g-3">
            <div class="col-xxl-12 col-xl-8">
              <div class="card">
                <div class="card-header d-flex flex-between-center">
                  <button class="btn btn-falcon-default btn-sm"type="button"><a href="<c:url value='/qna/list'/>"><span class="fas fa-arrow-left"></span></a></button>
                  <div class="d-flex">
                  	<h2 class="title">Q&A 게시판</h2>
                    <a href="<c:url value='/qna/edit?boardNo=${map.BOARD_NO}'/>">
                    	<button class="btn btn-falcon-default btn-sm" type="button"><span class="fas fa-ban" data-fa-transform="shrink-2 down-1"></span><span class="d-none d-md-inline-block ms-1">질문 수정</span></button>
                    </a>
                    <button onclick="deleteQna()" class="btn btn-falcon-default btn-sm ms-2 d-none d-sm-block" type="button"><span class="fas fa-trash-alt" data-fa-transform="shrink-2 down-1"></span><span class="d-none d-md-inline-block ms-1">삭제</span></button>
                    <div class="dropdown font-sans-serif ms-2">
                    </div>
                  </div>
                </div>
              </div>
              <div class="card mt-3">
                <div class="card-header bg-light">
                  <h1><span class="fas  me-2"></span><span>${map['TITLE']}</span></h1>
                </div>
                <div class="card-body">
                
                  <!-- 질문 글  -->
                  <div class="d-md-flex d-xl-inline-block d-xxl-flex align-items-center justify-content-between mb-x1">
                    <div class="d-flex align-items-center gap-2"><a href="../../app/support-desk/contact-details.jsp">
                        <div class="avatar avatar-2xl">
                          <img class="rounded-circle" src="../../assets/img/../../assets/img/team/1-thumb.png" alt="" />
                        </div>
                      </a>
                      <p class="mb-0"><a class="fw-semi-bold mb-0 text-800" href="../../app/support-desk/contact-details.jsp">${map['NAME']}</a><a class="mb-0 fs--1 d-block text-500" href="mailto:emma@watson.com">${map['EMAIL']}</a></p>
                    </div>
                    <p class="mb-0 fs--2 fs-sm--1 fw-semi-bold mt-2 mt-md-0 mt-xl-2 mt-xxl-0 ms-5"><fmt:formatDate value="${map['REGDATE']}" pattern="yyyy-MM-dd"/><span class="mx-1">|</span><span class="fst-italic"><fmt:formatDate value="${map['REGDATE']}" pattern="a h:mm"/></span><span class="fas fa-star ms-2 text-warning"></span></p>
                  </div>
                  
                  <!-- 글 줄바꿈 처리  -->
                  <% pageContext.setAttribute("newLine", "\r\n"); %>
            	  <c:set var="content" value="${fn:replace(map['CONTENT'], newLine, '<br>')}" />
                  
                  <div id="content">
                  	 ${content}
                  </div>
                  <!-- 질문 글 끝  -->
                  
                  <div class="my-5 position-relative text-center">
                    <hr class="position-absolute top-50 border-300 w-100 my-0" /><span class="position-relative bg-white dark__bg-card-dark px-3 z-1">
                      <button class="btn btn-sm btn-outline-secondary rounded-pill border-300 px-lg-5">답변 내용</button></span>
                  </div>
                  
                  
                  <!-- 답변 반복 시작 -->
                  <c:forEach var="replyMap" items="${replyList}">
	                  <div class="d-md-flex d-xl-inline-block d-xxl-flex align-items-center justify-content-between mb-x1">
	                    <div class="d-flex align-items-center gap-2"><a href="../../app/support-desk/contact-details.jsp">
	                        <div class="avatar avatar-2xl">
	                          <img class="rounded-circle" src="../../assets/img/../../assets/img/team/2-thumb.png" alt="" />
	
	                        </div>
	                      </a>
	                      <p class="mb-0"><a class="fw-semi-bold mb-0 text-800" href="../../app/support-desk/contact-details.jsp">${replyMap['NAME']}</a>
	                      <a class="mb-0 fs--1 d-block text-500" href="mailto:mike@support.com">${replyMap['EMAIL']}</a></p>
	                    </div>
	                    <p class="mb-0 fs--2 fs-sm--1 fw-semi-bold mt-2 mt-md-0 mt-xl-2 mt-xxl-0 ms-5"><fmt:formatDate value="${replyMap['REGDATE']}" pattern="yyyy-MM-dd"/><span class="mx-1">|</span><span class="fst-italic"><fmt:formatDate value="${replyMap['REGDATE']}" pattern="a h:mm"/></span><span class="fas fa-star ms-2 text-warning"></span></p>
	                  </div>
	                  
	                  <div class="border-bottom mb-5 pb-5">
	                      <!-- 답변 글 줄바꿈 처리  -->
		                  <% pageContext.setAttribute("newLine", "\r\n"); %>
		            	  <c:set var="content" value="${fn:replace(replyMap['CONTENT'], newLine, '<br>')}" />
		                  
		                  <div id="content">
		                  	 ${content}
		                  </div>
	                  </div>
                  </c:forEach>
                <!-- 답변 반복 끝  -->
                 
                </div>
                
                
                <!-- 답변 등록  -->
                <form id="replyForm" method="post" action="<c:url value='/qna/reply'/>">
	                <div class="collapse transition-none" id="previewMailForm">
	                  <h5 class="mb-0 p-x1 bg-light">답변</h5>
	                  <div class="border border-y-0 border-200">
	                  	<input name="boardNo" type="hidden" value="${param.boardNo}">
	                    <textarea class="form-control" id="exampleFormControlTextarea1" name="content" cols="50" rows="15" placeholder="내용" form="replyForm"></textarea>
	                  </div>
	                  
	                  <div class="d-flex align-items-center justify-content-between px-x1 py-3">
	                    <div class="d-flex align-items-center">
	                      <button class="btn btn-primary btn-sm px-4 me-2" type="submit">답변 등록</button>
	                                <button class="btn btn-primary btn-sm px-4 me-2" type="button" data-bs-toggle="tooltip" data-bs-placement="top" title="취소" data-dismiss="collapse">취소</button>
	                    </div>
	                    
	                    <div class="d-flex align-items-center">
	                      <div class="dropdown font-sans-serif me-2 btn-reveal-trigger">
	                        <div class="dropdown-menu dropdown-menu-end border py-2" aria-labelledby="email-options">
	                        <a class="dropdown-item" href="#!">Print</a><a class="dropdown-item" href="#!">Check spelling</a><a class="dropdown-item" href="#!">Plain text mode</a>
	                        </div>
	                      </div>
	            
	                    </div>
	                  </div>
	                </div>
	                <div class="card-footer bg-light" id="preview-footer">
	                  <button class="btn btn-falcon-default btn-sm fs--1" type="button" data-bs-toggle="collapse" data-bs-target="#previewMailForm" aria-expanded="false" aria-controls="previewMailForm"><span class="fas fa-reply"></span><span class="d-none d-sm-inline-block ms-1">답변</span></button>
	                </div>
	              </div>
	            </div>
            </form>
            <!-- 답변 등록 끝 -->
           
            </div>
          </div>
          <footer class="footer">
            <div class="row g-0 justify-content-between fs--1 mt-4 mb-3">
              <div class="col-12 col-sm-auto text-center">
                <p class="mb-0 text-600">Thank you for creating with Falcon <span class="d-none d-sm-inline-block">| </span><br class="d-sm-none" /> 2023 &copy; <a href="https://themewagon.com">Themewagon</a></p>
              </div>
              <div class="col-12 col-sm-auto text-center">
                <p class="mb-0 text-600">v3.17.0</p>
              </div>
            </div>
        
<%@ include file = "../inc/bottom.jsp" %>