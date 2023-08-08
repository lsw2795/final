<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../inc/top.jsp" %>
<link rel="stylesheet"href="<c:url value='/css/mypageempform.css'/>">
 <div class="card mb-3">
            <div class="card-body d-flex justify-content-between">
               <div class="d-lg-flex">
              	 <a class="btn btn-falcon-default btn-sm" href="../../app/email/inbox.jsp" data-bs-toggle="tooltip" data-bs-placement="top" title="Back to inbox">
              	 	<span class="fas fa-arrow-left"></span>
              	 </a>
              	 <span class="mypagehyphen"></span>
              	 <h5 class="mb-0"><span class="fas fa-thumbtack" style="margin: 0 10px;"></span>공지사항</h5>
              </div>
            </div>
          </div>
          <div class="card">
            <div class="card-header">
              <div class="row">
                <div class="col-md d-flex">
                  <div class="avatar avatar-2xl">
                    <img class="rounded-circle" src="../../assets/img/team/1.jpg" alt="" />
                  </div>
                  <div class="flex-1 ms-2">
                    <h5 class="mb-0">${map['TITLE']}</h5><a class="text-800 fs--1" href="#!"><span class="fw-semi-bold">${map['NAME']}</span><span class="ms-1 text-500">&lt;${map['EMAIL']}&gt;</span></a>
                  </div>
                </div>
                <div class="col-md-auto ms-auto d-flex align-items-center ps-6 ps-md-3">
                	<small>조회수 : ${map['READCOUNT']}</small>
                	<span class="mypagehyphen"></span>
                	<small>등록일 : ${map['REGDATE']}</small>
                </div>
              </div>
            </div>
            <div class="card-body bg-light">
                <div class="col-lg-12">
                  <div class="card shadow-none mb-3">
                    <div class="card-body">
                      <p>${map['CONTENT']} 
                      </p>
                    </div>
                  </div>
                  <div class="shadow-none mb-3">
                      <p>다운로드파일이름</p>
                  </div>
                  <div class="text-center">
                     <a class="btn btn-falcon-default" href="../../app/email/inbox.jsp" data-bs-toggle="tooltip" data-bs-placement="top" title="Back to inbox">
              	 	목록 가기
              	 	</a>
                  </div>
                 <a href="<c:url value=''/>">이전글</a>
                 <a href="<c:url value=''/>">다음글</a>
                </div>
            </div>
          </div>
<%@ include file = "../inc/bottom.jsp" %>