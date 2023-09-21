<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 
관리자뷰 - 공지사항 상세 뷰
내용 : CKEDITOR4로 등록한 이미지,글꼴 등의 내용 조회, 첨부파일 다운로드 기능, 
	  게시글 삭제, 수정 이동, 이전글과 다음글 이동
컨트롤러 : com.ez.gw.board.controller.NoticeController	  
작성자 : 송영은
작성일 : 2023.08
 -->  
<%@ include file='../../inc/adminTop.jsp'%>
<link rel="stylesheet" href="<c:url value='/css/adminempform.css'/>">
<script type="text/javascript">
	$(function(){
		$('#btnDelNotice').click(function(){
			if(confirm('정말 삭제하시겠습니까?')){
				location.href="<c:url value='/admin/board/noticeDelete?boardNo=${param.boardNo }'/>";
			}
		});
	});

	function empDetail(empNo) {
	    window.open("<c:url value='/mypage/empDetail?empNo='/>"+empNo,'empDetail', 'width=320,height=550,top=300,left=700,location=yes,resizable=yes');
	}
</script>
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
                    <img class="rounded-circle" src="<c:url value='/images/${map["IMAGE"]}'/>" alt="사원 이미지"/>
                  </div>
                  <div class="flex-1 ms-2">
                    <h5 class="mb-0 admindefault">${map['TITLE']}</h5>
                    <a class="text-800 fs--1" href="#" onclick="empDetail(${map['EMP_NO']});">
	                    <span class="bold" style="color: black;">${map['NAME']}</span>
	                    <span class="ms-1 text-500">&lt;${map['EMAIL']}&gt;</span>
                    </a>
                  </div>
                </div>
                <div class="col-md-auto ms-auto d-flex align-items-center ps-6 ps-md-3">
	                	<a href="<c:url value='/admin/board/noticeEdit?boardNo=${param.boardNo }'/>" class="btn btn-outline-warning">수정</a>
	               		<span class="adminhyphen"></span>
	               		<button id="btnDelNotice" class="btn btn-outline-danger">삭제</button>
               		&nbsp;
                	조회수 : ${map['READCOUNT']}
                	<span class="adminhyphen"></span>
                	등록일 : <fmt:formatDate value="${map['REGDATE']}" pattern="yyyy-MM-dd a hh:mm:ss"/>
               		<span class="adminhyphen"></span>
                </div>
              </div>
            </div>
            <div class="card-body admindefault" style="background: #fffcf0;">
                <div class="col-lg-12">
                  <div class="card shadow-none mb-3 admindefault">
                    <div class="card-body adminempdiv15">
                      <p>${map['CONTENT']}</p>
                    </div>
                  </div>
                  <div class="shadow-none mb-3 admindefault" style="background: #fffcf0;">
                      <h6 style="color: black;">첨부 파일</h6>
                      <c:if test="${empty pdsList}">
                      첨부파일이 없습니다.
                      </c:if>
                       <c:if test="${!empty pdsList }">
	                      <c:forEach var="pdsVo" items="${pdsList }" varStatus="status">
		                       <span><a href="<c:url value='/notice/download?boardNo=${pdsVo.boardNo}&fileName=${pdsVo.fileName}'/>" style="color: black;">
			                       <img alt="첨부파일 이미지" src="<c:url value='/images/file.gif'/>">
			                     	${fileInfoArr[status.index]}</a>
		                     	</span><br>
	                      </c:forEach>
                     </c:if>
                  </div>
                  <div style="font-size: 18px;">
                	<c:if test="${empty prevMap['MAX(BOARD_NO)']}">
	                 이전 글이 없습니다.
	                </c:if>
                	<c:if test="${!empty prevMap['MAX(BOARD_NO)']}">
	                 <a style="color: black;" href="<c:url value='/admin/board/noticeDetail?boardNo=${prevMap["MAX(BOARD_NO)"]}'/>">이전 글&nbsp;&nbsp;|&nbsp;&nbsp;${prevMap['TITLE']}</a>
	                 <br>
	                </c:if>
	                <c:if test="${empty nextMap['MIN(BOARD_NO)']}">
	                 다음 글이 없습니다.
	                </c:if>
	                <c:if test="${!empty nextMap['MIN(BOARD_NO)']}">
                 	  <a style="color: black;" href="<c:url value='/admin/board/noticeDetail?boardNo=${nextMap["MIN(BOARD_NO)"]}'/>">다음 글&nbsp;&nbsp;|&nbsp;&nbsp;${nextMap['TITLE']}</a>
               		</c:if>
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