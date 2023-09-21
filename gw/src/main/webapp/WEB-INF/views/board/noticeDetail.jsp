<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 
사원뷰 - 공지사항 상세 뷰
내용 : CKEDITOR4로 등록한 이미지,글꼴 등의 내용 조회, 첨부파일 다운로드 기능, 이전글과 다음글 이동
컨트롤러 : com.ez.gw.board.controller.NoticeController	  
작성자 : 송영은
작성일 : 2023.08
 -->      
<%@ include file = "../inc/top.jsp" %>
<link rel="stylesheet"href="<c:url value='/css/mypageempform.css'/>">
 <script type="text/javascript">
 	//작성자 정보보기
	function empDetail(empNo) {
	    window.open("<c:url value='/mypage/empDetail?empNo='/>"+empNo,'empDetail', 'width=320,height=550,top=300,left=700,location=yes,resizable=yes');
	}
	//이전글,다음글 조회수 증가 ajax
	function updateReadCount(boardlistNo, boardNo){
		$.ajax({
            url: "<c:url value='/board/updateReadCount'/>",
            type:'get',
			data: {
				boardNo: boardNo
			},
			dataType:'json',
            success: function (res) {
            	var no='<%= request.getParameter("boardNo")%>';
            	if(res>0){
            		if(no>boardNo){
            			location.href="<c:url value='/board/noticeDetail?boardNo=${prevMap["MAX(BOARD_NO)"]}'/>";
            		}else if(no<boardNo){
            			location.href="<c:url value='/board/noticeDetail?boardNo=${nextMap["MIN(BOARD_NO)"]}'/>";
            		}
            	}
            },
            error:function(xhr,status,error){
                alert(status+" : "+error);
            } 
        });//ajax
	}
 </script>
 <div class="card mb-3">
            <div class="card-body d-flex justify-content-between">
               <div class="d-lg-flex">
              	 <a class="btn btn-falcon-default btn-sm" href="<c:url value='/board/noticeList'/>" data-bs-toggle="tooltip" data-bs-placement="top" title="Back to inbox">
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
                    <img class="rounded-circle" src="<c:url value='/images/${map["IMAGE"]}'/>" alt="사원 이미지" />
                  </div>
                  <div class="flex-1 ms-2">
                    <h5 class="mb-0">${map['TITLE']}</h5>
                    <a class="text-800 fs--1" href="#" onclick="empDetail(${map['EMP_NO']});">
	                    <span class="bold" style="color: black;">${map['NAME']}</span>
	                    <span class="ms-1 text-500">&lt;${map['EMAIL']}&gt;</span>
                    </a>
                  </div>
                </div>
                <div class="col-md-auto ms-auto d-flex align-items-center ps-6 ps-md-3">
                	조회수 : ${map['READCOUNT']}
                	<span class="mypagehyphen"></span>
                	등록일 : <fmt:formatDate value="${map['REGDATE']}" pattern="yyyy-MM-dd a hh:mm:ss"/>
                </div>
              </div>
            </div>
            <div class="card-body bg-light">
                <div class="col-lg-12">
                  <div class="card shadow-none mb-3">
                    <div class="card-body mypageempdiv11">
                      <p>${map['CONTENT']}</p>
                    </div>
                  </div>
                  <div class="shadow-none mb-3">
                      <h6>첨부 파일</h6>
                      <c:if test="${empty pdsList}">
                      첨부파일이 없습니다.
                      </c:if>
                       <c:if test="${!empty pdsList }">
	                      <c:forEach var="pdsVo" items="${pdsList }" varStatus="status">
		                       <span>
			                       <a href="<c:url value='/notice/download?boardNo=${pdsVo.boardNo}&fileName=${pdsVo.fileName}'/>" style="color: black;">
				                       <img alt="첨부파일 이미지" src="<c:url value='/images/file.gif'/>">
				                     	${fileInfoArr[status.index]}
			                     	</a>
		                     	</span><br>
	                      </c:forEach>
                     </c:if>
                  </div>
                    <div style="font-size: 18px;">
                	<c:if test="${empty prevMap['MAX(BOARD_NO)']}">
	                 이전 글이 없습니다.
	                </c:if>
                	<c:if test="${!empty prevMap['MAX(BOARD_NO)']}">
	                 <a style="color: black;" href="#" onclick="updateReadCount(2000,${prevMap['MAX(BOARD_NO)']});">이전 글&nbsp;&nbsp;|&nbsp;&nbsp;${prevMap['TITLE']}</a><br>
	                </c:if>
	                <c:if test="${empty nextMap['MIN(BOARD_NO)']}">
	                 다음 글이 없습니다.
	                </c:if>
	                <c:if test="${!empty nextMap['MIN(BOARD_NO)']}">
                 	  <a style="color: black;" href="#" onclick="updateReadCount(2000,${nextMap['MIN(BOARD_NO)']});">다음 글&nbsp;&nbsp;|&nbsp;&nbsp;${nextMap['TITLE']}</a>
               		</c:if>
                </div>
                  <div class="text-center">
                     <a class="btn btn-falcon-default" href="<c:url value='/board/noticeList'/>">
              	 	목록 가기
              	 	</a>
                  </div>
                  	
                </div>
            </div>
          </div>
<%@ include file = "../inc/bottom.jsp" %>