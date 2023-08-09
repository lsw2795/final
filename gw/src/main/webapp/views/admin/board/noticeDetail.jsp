<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file='../../inc/adminTop.jsp'%>
<link rel="stylesheet" href="<c:url value='/css/adminempform.css'/>">
<div class="card mb-3">
            <div class="card-body d-flex justify-content-between admindefault">
               <div class="d-lg-flex">
              	 <a class="admindefault btn btn-falcon-default btn-sm" href="<c:url value='/admin/board/noticeList'/>">
              	 	<span class="fas fa-arrow-left"></span>
              	 </a>
              	 <span class="adminhyphen"></span>
              	 <h5 class="mb-0 admindefault"><span class="fas fa-thumbtack" style="margin: 0 10px;"></span>공지사항</h5>
              </div>
            </div>
          </div>
          <div class="card">
            <div class="card-header admindefault">
              <div class="row">
                <div class="col-md d-flex">
                  <div class="avatar avatar-2xl">
                    <img class="rounded-circle" src="<c:url value='/images/IMG_5487.jpg'/>" alt="" />
                  </div>
                  <div class="flex-1 ms-2">
                    <h5 class="mb-0 admindefault">${map['TITLE']}</h5><a class="text-800 fs--1" href="#!"><span class="fw-semi-bold">${map['NAME']}</span><span class="ms-1 text-500">&lt;${map['EMAIL']}&gt;</span></a>
                  </div>
                </div>
                <div class="col-md-auto ms-auto d-flex align-items-center ps-6 ps-md-3">
                	조회수 : ${map['READCOUNT']}
                	<span class="adminhyphen"></span>
                	등록일 : <fmt:formatDate value="${map['REGDATE']}" pattern="yyyy/MM/dd HH:mm:ss"/>
               		<span class="adminhyphen"></span>
                	<input type="button" value="수정" class="btn btn-primary"/>
               		<span class="adminhyphen"></span>
                	<input type="button" value="삭제" class="btn btn-primary"/>
                </div>
              </div>
            </div>
            <div class="card-body admindefault">
                <div class="col-lg-12">
                  <div class="card shadow-none mb-3 bg-light">
                    <div class="card-body admindefault">
                      <p>${map['CONTENT']}</p>
                    </div>
                  </div>
                  <div class="shadow-none mb-3 admindefault">
                      <p>다운로드파일이름 : 수정해야함</p>
                  </div>
                  <div class="text-center">
                     <a class="btn btn-falcon-default" href="<c:url value='/admin/board/noticeList'/>">
              	 	목록 가기
              	 	</a>
                  </div>
                </div>
            </div>
          </div>
<%@ include file='../../inc/adminBottom.jsp'%>