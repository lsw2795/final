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

 <div class="row g-3">
            <div class="col-xxl-12 col-xl-8">
              <div class="card">
                <div class="card-header d-flex flex-between-center">
                  <button class="btn btn-falcon-default btn-sm"type="button"><a href="<c:url value='/qna/list'/>"><span class="fas fa-arrow-left"></span></a></button>
                  <div class="d-flex">
                  	<h2 class="title">Q&A 게시판</h2>
                    <button class="btn btn-falcon-default btn-sm" type="button"><span class="fas fa-ban" data-fa-transform="shrink-2 down-1"></span><span class="d-none d-md-inline-block ms-1">질문 수정</span></button>
                    <button class="btn btn-falcon-default btn-sm ms-2 d-none d-sm-block" type="button"><span class="fas fa-trash-alt" data-fa-transform="shrink-2 down-1"></span><span class="d-none d-md-inline-block ms-1">삭제</span></button>
                    <div class="dropdown font-sans-serif ms-2">
                      <button class="btn btn-falcon-default text-600 btn-sm dropdown-toggle dropdown-caret-none" type="button" id="preview-dropdown" data-bs-toggle="dropdown" data-boundary="viewport" aria-haspopup="true" aria-expanded="false"><span class="fas fa-ellipsis-v fs--2"></span></button>
                      <div class="dropdown-menu dropdown-menu-end border py-2" aria-labelledby="preview-dropdown"><a class="dropdown-item" href="#!">View</a><a class="dropdown-item" href="#!">Export</a><a class="dropdown-item d-sm-none" href="#!">Delete</a>
                        <div class="dropdown-divider"></div><a class="dropdown-item text-danger" href="#!">Remove</a>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="card mt-3">
                <div class="card-header bg-light">
                  <h5><span class="fas fa-envelope me-2"></span><span>${vo.title}</span></h5>
                </div>
                <div class="card-body">
                
                  <!-- 질문 글  -->
                  <div class="d-md-flex d-xl-inline-block d-xxl-flex align-items-center justify-content-between mb-x1">
                    <div class="d-flex align-items-center gap-2"><a href="../../app/support-desk/contact-details.jsp">
                        <div class="avatar avatar-2xl">
                          <img class="rounded-circle" src="../../assets/img/../../assets/img/team/1-thumb.png" alt="" />
                        </div>
                      </a>
                      <p class="mb-0"><a class="fw-semi-bold mb-0 text-800" href="../../app/support-desk/contact-details.jsp">${vo.empNo}</a><span class="fs--2 text-800 fw-normal mx-2">via email</span><a class="mb-0 fs--1 d-block text-500" href="mailto:emma@watson.com">emma@watson.com</a></p>
                    </div>
                    <p class="mb-0 fs--2 fs-sm--1 fw-semi-bold mt-2 mt-md-0 mt-xl-2 mt-xxl-0 ms-5"><fmt:formatDate value="${vo.regdate}" pattern="yyyy-MM-dd"/><span class="mx-1">|</span><span class="fst-italic"><fmt:formatDate value="${vo.regdate}" pattern="a h:mm"/></span><span class="fas fa-star ms-2 text-warning"></span></p>
                  </div>
                  <div id="content">
                  	 ${vo.content}
                  </div>
                  <!-- 질문 글 끝  -->
                  
                  <div class="my-5 position-relative text-center">
                    <hr class="position-absolute top-50 border-300 w-100 my-0" /><span class="position-relative bg-white dark__bg-card-dark px-3 z-1">
                      <button class="btn btn-sm btn-outline-secondary rounded-pill border-300 px-lg-5">답변 내용</button></span>
                  </div>
                  
                  
                  <!-- 답변 시작 -->
                  <div class="d-md-flex d-xl-inline-block d-xxl-flex align-items-center justify-content-between mb-x1">
                    <div class="d-flex align-items-center gap-2"><a href="../../app/support-desk/contact-details.jsp">
                        <div class="avatar avatar-2xl">
                          <img class="rounded-circle" src="../../assets/img/../../assets/img/team/2-thumb.png" alt="" />

                        </div>
                      </a>
                      <p class="mb-0"><a class="fw-semi-bold mb-0 text-800" href="../../app/support-desk/contact-details.jsp">Mike</a><span class="fs--2 text-800 fw-normal mx-2">replied</span><a class="mb-0 fs--1 d-block text-500" href="mailto:mike@support.com">mike@support.com</a></p>
                    </div>
                    <p class="mb-0 fs--2 fs-sm--1 fw-semi-bold mt-2 mt-md-0 mt-xl-2 mt-xxl-0 ms-5">01 March, 2020<span class="mx-1">|</span><span class="fst-italic">8:40 AM (1 Day ago)</span><span class="fas fa-star ms-2 text-warning"></span></p>
                  </div>
                  <div class="border-bottom mb-5 pb-5">
                    <h6 class="mb-3 fw-semi-bold text-1000">Television with cracked screen</h6>
                    <p>Hi Emma Waston,</p>
                    <p>I am sorry to hear about your experience with our TV. It sounds like you received a damaged product. Please provide me with the order number and we will work to resolve this issue as quickly as possible.</p>
                    <p>We are here to help!</p>
                    <p class="mb-0">Thanks</p>
                    <p class="mb-0">Customer Support</p>
                  </div>
                 
                </div>
                <div class="collapse transition-none" id="previewMailForm">
                  <h5 class="mb-0 p-x1 bg-light">답변</h5>
                  <div class="border border-top-0 border-200">
                    <input class="form-control border-0 rounded-0 outline-none px-x1" id="email-to" type="email" aria-describedby="email-from" placeholder="From" value="mike@support.com" />
                  </div>
                  <div class="border border-top-0 border-200">
                    <input class="form-control border-0 rounded-0 outline-none px-x1" id="email-from" type="email" aria-describedby="email-to" placeholder="To" value="emma@watson.com" />
                  </div>
                  <div class="border border-y-0 border-200">
                    <input class="form-control border-0 rounded-0 outline-none px-x1" id="email-subject" type="text" aria-describedby="email-subject" placeholder="Subject" />
                    <textarea class="tinymce d-none" data-tinymce="data-tinymce" name="content"></textarea>
                  </div>
                  <div class="px-x1 py-3 bg-light">
                    <div class="d-inline-flex flex-column">
                      <div class="border p-2 rounded-3 d-flex bg-white dark__bg-1000 fs--1 mb-2"><span class="fs-1 far fa-image"></span><span class="ms-2 me-3">broken_tv_solve.jpg (873kb)</span><a class="text-300 ms-auto" href="#!" data-bs-toggle="tooltip" data-bs-placement="right" title="Detach"><span class="fas fa-times"></span></a></div>
                      <div class="border p-2 rounded-3 d-flex bg-white dark__bg-1000 fs--1"><span class="fs-1 fas fa-file-archive"></span><span class="ms-2 me-3">broken_tv_solve.zip (342kb)</span><a class="text-300 ms-auto" href="#!" data-bs-toggle="tooltip" data-bs-placement="right" title="Detach"><span class="fas fa-times"></span></a></div>
                    </div>
                  </div>
                  <div class="d-flex align-items-center justify-content-between px-x1 py-3">
                    <div class="d-flex align-items-center">
                      <button class="btn btn-primary btn-sm px-4 me-2" type="submit">Send</button>
                      <input class="d-none" id="email-attachment" type="file" />
                      <label class="me-2 btn btn-light btn-sm mb-0 cursor-pointer" for="email-attachment" data-bs-toggle="tooltip" data-bs-placement="top" title="Attach files"><span class="fas fa-paperclip fs-1" data-fa-transform="down-2"></span></label>
                      <input class="d-none" id="email-image" type="file" accept="image/*" />
                      <label class="btn btn-light btn-sm mb-0 cursor-pointer" for="email-image" data-bs-toggle="tooltip" data-bs-placement="top" title="Attach images"><span class="fas fa-image fs-1" data-fa-transform="down-2"></span></label>
                    </div>
                    <div class="d-flex align-items-center">
                      <div class="dropdown font-sans-serif me-2 btn-reveal-trigger">
                        <button class="btn btn-link text-600 btn-sm dropdown-toggle btn-reveal dropdown-caret-none" id="email-options" type="button" data-bs-toggle="dropdown" data-boundary="viewport" aria-haspopup="true" aria-expanded="false"><span class="fas fa-ellipsis-v" data-fa-transform="down-2"></span></button>
                        <div class="dropdown-menu dropdown-menu-end border py-2" aria-labelledby="email-options"><a class="dropdown-item" href="#!">Print</a><a class="dropdown-item" href="#!">Check spelling</a><a class="dropdown-item" href="#!">Plain text mode</a>
                          <div class="dropdown-divider"></div><a class="dropdown-item" href="#!">Archive</a>
                        </div>
                      </div>
                      <button class="btn btn-light btn-sm" type="button" data-bs-toggle="tooltip" data-bs-placement="top" title="Delete" data-dismiss="collapse"><span class="fas fa-trash"></span></button>
                    </div>
                  </div>
                </div>
                <div class="card-footer bg-light" id="preview-footer">
                  <button class="btn btn-falcon-default btn-sm fs--1" type="button" data-bs-toggle="collapse" data-bs-target="#previewMailForm" aria-expanded="false" aria-controls="previewMailForm"><span class="fas fa-reply"></span><span class="d-none d-sm-inline-block ms-1">답변</span></button>
                  <button class="btn btn-falcon-default btn-sm fs--1 mx-2" type="button" data-bs-toggle="collapse" data-bs-target="#previewMailForm" aria-expanded="false" aria-controls="previewMailForm"><span class="fas fa-location-arrow"></span><span class="d-none d-sm-inline-block ms-1">Forward</span></button>
                  <button class="btn btn-falcon-default btn-sm fs--1" type="button" data-bs-toggle="collapse" data-bs-target="#previewMailForm" aria-expanded="false" aria-controls="previewMailForm"><span class="fas fa-file-alt"></span><span class="d-none d-sm-inline-block ms-1">Add Note</span></button>
                </div>
              </div>
            </div>
           
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