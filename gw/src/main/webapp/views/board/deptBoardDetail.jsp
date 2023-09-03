<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<link rel="stylesheet"href="<c:url value='/css/mypageempform.css'/>">   
<script type="text/javascript">
	$(function(){
		$('#btnDelete').click(function(){
			if(confirm('정말 삭제하시겠습니까?')){
				location.href="<c:url value='/board/deptBoardDelete?boardlistNo=${boardlistVo.boardlistNo}&boardNo=${param.boardNo }'/>";
			}
		});
		
	});

	function empDetail(empNo) {
	    window.open("<c:url value='/mypage/empDetail?empNo='/>"+empNo,'empDetail', 'width=320,height=550,top=300,left=700,location=yes,resizable=yes');
	}
</script>
<div class="card mb-3">
            <div class="card-body d-flex justify-content-between ">
               <div class="d-lg-flex">
              	 <a class=" btn btn-falcon-default btn-sm" 
        			href="<c:url value='/board/deptBoard?boardlistNo=${boardlistVo.boardlistNo}'/>">
              	 	<span class="fas fa-arrow-left"></span>
              	 </a>
              	 <span class="mypagehyphen"></span>
              	 <h5 class="mb-0 "><span class="fas fa-file" style="margin: 0 10px;"></span>${boardlistVo.boardName} 게시판</h5>
              </div>
            </div>
          </div>
          <div class="card">
            <div class="card-header ">
              <div class="row">
                <div class="col-md d-flex">
               	  <c:if test="${boardlistVo.secflag=='Y'}">
                  <div class="avatar avatar-2xl">
                    <img class="rounded-circle" src="<c:url value='/images/${map["IMAGE"]}'/>" alt="사원 이미지"/>
                  </div>
                  </c:if>
                  <div class="flex-1 ms-2">
                    <h5 class="mb-0 ">${map['TITLE']}</h5>
                    <c:if test="${boardlistVo.secflag=='Y'}">
                    <a class="text-800 fs--1" href="#" onclick="empDetail(${map['EMP_NO']});">
	                    <span class="bold" style="color: black;">${map['NAME']}</span>
	                    <span class="ms-1 text-500">&lt;${map['EMAIL']}&gt;</span>
                    </a>
                    </c:if>
                  </div>
                </div>
                <div class="col-md-auto ms-auto d-flex align-items-center ps-6 ps-md-3">
                	<c:if test="${boardlistVo.boardLike=='Y' && sessionScope.empNo!=map['EMP_NO']}">
                		<a href="#" id="heart" style="float: right;">
							<img id="heartimg" src="<c:url value='/images/heartoff.png'/>" width="50px" height="50px">
						</a>
						<span class="mypagehyphen"></span>
                	</c:if>
                		<c:if test="${sessionScope.empNo==map['EMP_NO']}">
	                	<a href="<c:url value='/board/deptBoardEdit?boardlistNo=${boardlistVo.boardlistNo}&boardNo=${param.boardNo }'/>" class="btn btn-outline-warning">수정</a>
	               		<span class="mypagehyphen"></span>
	               		<button type="button" id="btnDelete" class="btn btn-outline-danger">삭제</button>
	               		</c:if>
               		&nbsp;
                	조회수 : ${map['READCOUNT']}
                	<span class="mypagehyphen"></span>
                	등록일 : <fmt:formatDate value="${map['REGDATE']}" pattern="yyyy-MM-dd a hh:mm:ss"/>
               		<span class="mypagehyphen"></span>
                </div>
              </div>
            </div>
            <div class="card-body " style="background: #f9fafd;">
                <div class="col-lg-12">
                  <div class="card shadow-none mb-3 ">
                    <div class="card-body mypageempdiv15">
                      <p>${map['CONTENT']}</p>
                    </div>
                  </div>
                  <c:if test="${boardlistVo.uploadFlag=='Y'}">
                  <div class="shadow-none mb-3 " style="background: #f9fafd;">
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
                  </c:if>
                  <div style="font-size: 18px;">
                	<c:if test="${empty prevMap['MAX(BOARD_NO)']}">
	                 이전 글이 없습니다.
	                </c:if>
                	<c:if test="${!empty prevMap['MAX(BOARD_NO)']}">
	                 <a style="color: black;" href="<c:url value='/board/deptBoardDetail?boardlistNo=${prevMap["BOARDLIST_NO"]}&boardNo=${prevMap["MAX(BOARD_NO)"]}'/>">이전 글&nbsp;&nbsp;|&nbsp;&nbsp;${prevMap['TITLE']}</a>
	                </c:if>
	                <br>
	                <c:if test="${empty nextMap['MIN(BOARD_NO)']}">
	                 다음 글이 없습니다.
	                </c:if>
	                <c:if test="${!empty nextMap['MIN(BOARD_NO)']}">
                 	  <a style="color: black;" href="<c:url value='/board/deptBoardDetail?boardlistNo=${nextMap["BOARDLIST_NO"]}&boardNo=${nextMap["MIN(BOARD_NO)"]}'/>">다음 글&nbsp;&nbsp;|&nbsp;&nbsp;${nextMap['TITLE']}</a>
               		</c:if>
                </div>
                  <div class="text-center">
                     <a class="btn btn-falcon-default" href="<c:url value='/board/deptBoard?boardlistNo=${boardlistVo.boardlistNo}'/>">
              	 	목록 가기
              	 	</a>
                  </div>
                </div>
            </div>
          </div>
<%@ include file="../inc/bottom.jsp"%>