<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../inc/top.jsp" %>
<div class="row g-3">
	<div class="col-lg-10 m-auto mt-3">
		<div class="card mb-3">
			<div class="card-header bg-light overflow-hidden">
				<div class="d-flex align-items-center">
					<div class="flex-1 ms-2">
                    	<h5 class="mb-0 fs-0">익명게시판</h5>
                    	<pre>특정인을 비하하거나 음란물,도박성 광고 공유시 신고될수 있습니다.</pre>
                    </div>
                </div>
			</div>
            <div class="card-body p-0">
            	<form>
                	<textarea class="shadow-none form-control rounded-0 resize-none px-x1 border-y-0 border-200" placeholder="내용을 입력하세요." rows="4"></textarea>
                    <div class="row g-0 justify-content-between mt-3 px-x1 pb-3">
                    	<div class="col">
	                        <button class="btn btn-light btn-sm rounded-pill shadow-none d-inline-flex align-items-center fs--1 mb-0 me-1" type="button">
		                        <img class="cursor-pointer" src="<c:url value='/assets/img/icons/spot-illustrations/image.svg'/>" width="17" alt="" />
		                        <span class="ms-2 d-none d-md-inline-block">Image</span>
	                        </button>
                      	</div>
                      	<div class="col-auto">
                        	<button class="btn btn-primary btn-sm px-4 px-sm-5" type="submit">작성</button>
                      	</div>
                    </div>
                </form>
            </div>
        </div>
        <div class="card mb-3">
        	<div class="card-header bg-light">
            	<div class="row justify-content-between">
                	<div class="col">
                    	<div class="d-flex">
	                        <div class="flex-1 align-self-center ms-2">
	                        	<p class="mb-1 lh-1">익명의 게시글입니다.</p>
	                          	<p class="mb-0 fs--1">11 hrs</p>
	                        </div>
                      	</div>
                    </div>
                    <div class="col-auto">
                    	<div class="dropdown font-sans-serif btn-reveal-trigger">
                        	<button class="btn btn-link text-600 btn-sm dropdown-toggle p-1 dropdown-caret-none btn-reveal" type="button" id="post-album-action" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        		<span class="fas fa-ellipsis-h fs--1"></span>
                        	</button>
	                        <div class="dropdown-menu dropdown-menu-end py-3" aria-labelledby="post-album-action">
	                        	<a class="dropdown-item" href="#!">수정하기</a>
	                          	<a class="dropdown-item text-danger" href="#!">삭제하기</a>
	                        </div>
                      	</div>
                    </div>
                </div>
            </div>
            <div class="card-body overflow-hidden">
            	<p>내용</p>
                <div class="row mx-n1">
					<div class="col-8 p-1 m-auto">
	                	<a href="<c:url value='/images/last.JPG'/>" data-gallery="gallery-1">
	                    	<img class="img-fluid rounded" src="<c:url value='/assets/img/generic/4.jpg'/>" alt="" />
	                    </a>
	                </div>
            	</div>
          	</div>
            <div class="card-footer bg-light pt-0">
            	<div class="border-bottom border-200 fs--1 py-3">
            		<a class="text-700" href="#!">34개의 댓글이 있습니다.</a>
                </div>
                <div class="row g-0 fw-semi-bold text-center py-2 fs--1">
                    <div class="col-auto">
                    	<a class="rounded-2 d-flex align-items-center me-3" href="#!">
                    		<img src="<c:url value='/assets/img/icons/spot-illustrations/comment-active.png'/>" width="20" alt="" />
                    		<span class="ms-1">댓글</span>
                    	</a>
                    </div>
                </div>
                <form class="d-flex align-items-center border-top border-200 pt-3">
                	<input class="form-control rounded-pill ms-2 fs--1" type="text" placeholder="내용을 입력하세요." />
                </form>
                <div class="d-flex mt-3">
                	<div class="avatar avatar-xl">
                    	<img class="rounded-circle" src="<c:url value='/assets/img/team/4.jpg'/>" alt="" />
                    </div>
                    <div class="flex-1 ms-2 fs--1">
                    	<p class="mb-1 bg-200 rounded-3 p-2">
                      	익명 :
                      	내용</p>
                      	<div class="px-2">
                      		시간 
                      		&bull;<a href="#!">답글달기</a>  
                      		&bull;<a href="#!">신고하기</a> 
                      	</div>
                    </div>
				</div>
			</div>
		</div>
	</div>
</div>
<%@ include file = "../inc/bottom.jsp" %>