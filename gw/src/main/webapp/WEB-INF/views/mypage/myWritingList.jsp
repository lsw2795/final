<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 
사원뷰 - 마이페이지 내가 쓴 모든 게시글 조회 뷰
내용 : 내가 쓴 모든 게시글 분류버튼으로 조회, 페이징처리, 검색기능, 카테고리 클릭시 해당 게시판 목록 이동,
	  제목 클릭시 조회수 증가 ajax 처리 후 해당 게시글 상세보기 뷰 이동
컨트롤러 : com.ez.gw.board.controller.BoardController  
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
	//조회수 증가 ajax
	function updateReadCount(boardlistNo, boardNo){
		$.ajax({
            url: "<c:url value='/board/updateReadCount'/>",
            type:'get',
			data: {
				boardNo: boardNo
			},
			dataType:'json',
            success: function (res) {
            	if(res>0){
            		if(boardlistNo<100){
            			location.href="<c:url value='/board/deptBoardDetail?boardlistNo="+boardlistNo+"&boardNo="+boardNo+"'/>";
            		}else if(boardlistNo==2000){
            			location.href="<c:url value='/board/noticeDetail?boardNo="+boardNo+"'/>";
            		}
            	}
            },
            error:function(xhr,status,error){
                alert(status+" : "+error);
            } 
        });//ajax
	}
</script>
<div class="row g-0">
   <div class="col-lg-12 pe-lg-2 mb-3">
       <div class="card h-lg-100 overflow-hidden">
          <div class="card-header">
			<a href="<c:url value='/mypage/myWritingList'/>"><h5 class="mb-0"><span class="fas fa-pen" style="margin: 0 10px;"></span>내가 쓴 글 조회</h5></a>
  		  </div>
  		  <!-- 페이징 처리 관련 form -->
		<form action="<c:url value='/mypage/myWritingList'/>" 
			name="frmPage" method="post">
			<input type="hidden" name="currentPage">
			<input type="hidden" name="searchKeyword" value="${param.searchKeyword}">
			<input type="hidden" name="searchCondition" value="${param.searchCondition}">
			<input type="hidden" name="empNo" value="${sessionScope.empNo }">
		</form>
  		  <div class="card-body py-2">
              <div class="card" id="allContactTable">
                <div class="card-header border-bottom border-200 px-0">
                  <div class="d-lg-flex justify-content-between">
                  <form name="frmSearch" method="post" action="<c:url value='/mypage/myWritingList'/>">
                    <div class="row flex-between-center gy-2 px-x1">
                      <div class="col-auto pe-0">
                         <select name="searchCondition" class="mypageempborder mypageempsel">
							<option value="">전체보기</option>
							<c:forEach var="boardListVo" items="${boardListNames }">
								<option value="${boardListVo.boardName}"
									<c:if test="${param.searchCondition==boardListVo.boardName}">
										selected="selected"
									</c:if>
								>${boardListVo.boardName}</option>
							</c:forEach>
						</select>
                      </div>
                      <div class="col-auto">
                         <div class="input-group">
                           <input name="searchKeyword" value="${param.searchKeyword }" class="form-control shadow-none search" type="search" placeholder="검색할 내용을 입력하세요" aria-label="search" />
                           <button class="btn btn-sm btn-outline-secondary border-300 hover-border-secondary"><span class="fa fa-search fs--1"></span></button>
                         </div>
                      </div>
                    </div>
                  </form>
              	<div class="border-bottom border-200 my-3"></div>
                  </div>
                </div>
                <div class="admindefault searchEmpResult" style="padding: 10px 0 0 25px;">
							<c:if test="${!empty param.searchKeyword }">
							   <p>검색어 : ${param.searchKeyword} , <span style="font-weight: bold; color: red;">${pagingInfo.totalRecord}</span> 건 검색되었습니다.</p>
							</c:if>   
						</div>
                <div class="card-body p-0">
                  <div class="table-responsive scrollbar">
                    <table class="table table-sm table-hover">
						<colgroup>
							<col style="width:20%;" />
							<col style="width:50%;" />
							<col style="width:15%;" />
							<col style="width:15%;" />
						</colgroup>
                      <thead class="adminempthead">
                        <tr style="text-align: center;">
                          <th class="sort align-middle py-2 fs-0 pe-2" scope="col">게시판 카테고리</th>
                          <th class="sort align-middle" scope="col">제목</th>
                          <th class="sort align-middle" scope="col">조회수</th>
                          <th class="sort align-middle" scope="col">작성일</th>
        		        </tr>
                      </thead>
                      <tbody id="table-contact-body">
                      <c:if test="${empty boardList }">
                      	<tr class="mypageemptr">
                      	<td class="align-middle fs-0 py-3 align-middle" colspan="4">해당 게시글이 없습니다.</td>
                      	</tr>
                      </c:if>
                      <c:if test="${!empty boardList }">
                      <c:forEach var="map" items="${boardList }">
                        <tr class="mypageemptr">
                        <!-- 부서 게시판(동적 게시판) -->
                         <c:if test="${map['BOARDLIST_NO']<100}">	                          
                       		<td class="align-middle"><a href="<c:url value='/board/deptBoard?boardlistNo=${map["BOARDLIST_NO"]}'/>">${map['BOARD_NAME']}</a></td>
                        	<td class="align-middle"><a href="#" onclick="updateReadCount(${map['BOARDLIST_NO']},${map['BOARD_NO']});">${map['TITLE']}</a></td>
                         </c:if>
                         <!-- 사내 중고거래 게시판 --> 
						  <c:if test="${map['BOARDLIST_NO']==100}">	                          
                          	<td class="align-middle"><a href="<c:url value='/market/marketList'/>">${map['BOARD_NAME']}</a></td>
                          	<td class="align-middle"><a href="<c:url value='/market/marketDetail?tradeNo=${map["BOARD_NO"]}'/>">${map['TITLE']}</a></td>
                          </c:if>
                         <!-- 동호회 게시판 -->
                          <c:if test="${map['BOARDLIST_NO']==200}">	                          
                          	<td class="align-middle"><a href="<c:url value='/club/clubList'/>">${map['BOARD_NAME']}</a></td>
                          	<td class="align-middle"><a href="<c:url value='/club/clubBoard?clubNo=${map["BOARD_NO"]}'/>">${map['TITLE']}</a></td>
                          </c:if>
                         <!-- Q&A 게시판 -->
                          <c:if test="${map['BOARDLIST_NO']==1000}">	                          
                          	<td class="align-middle"><a href="<c:url value='/qna/list'/>">${map['BOARD_NAME']}</a></td>
                         	<td class="align-middle"><a href="<c:url value='/qna/detail?boardNo=${map["BOARD_NO"]}'/>">${map['TITLE']}</a></td>
                          </c:if>
                          <!-- 공지사항 게시판 -->
                          <c:if test="${map['BOARDLIST_NO']==2000}">	                          
                          	<td class="align-middle"><a href="<c:url value='/board/noticeList'/>">${map['BOARD_NAME']}</a></td>
                          	 <td class="align-middle"><a href="#" onclick="updateReadCount(${map['BOARDLIST_NO']},${map['BOARD_NO']});">${map['TITLE']}</a></td>
                          </c:if>
                          <!-- 자료실 게시판 -->
                          <c:if test="${map['BOARDLIST_NO']==3000}">	                          
                          	<td class="align-middle"><a href="<c:url value='/pds/list'/>">${map['BOARD_NAME']}</a></td>
                         	<td class="align-middle"><a href="<c:url value='/pds/detail?boardNo=${map["BOARD_NO"]}'/>">${map['TITLE']}</a></td>
                          </c:if>
                          <!-- FAQ 게시판 -->
                          <c:if test="${map['BOARDLIST_NO']==4000}">	                          
                          	<td class="align-middle"><a href="<c:url value='/board/faqList'/>">${map['BOARD_NAME']}</a></td>
                          	<td class="align-middle"><a href="<c:url value='/board/faqList'/>">${map['TITLE']}</a></td>
                          </c:if>
                          <!-- 익명 게시판 -->
                           <c:if test="${map['BOARDLIST_NO']==5000}">	                          
                          	<td class="align-middle"><a href="<c:url value='/anonymous/boardList'/>">${map['BOARD_NAME']}</a></td>
                          	<td class="align-middle"><a href="<c:url value='/anonymous/boardList'/>">${map['TITLE']}</a></td>
                          </c:if>
                          <td class="align-middle fs-0 py-3">${map['READCOUNT']}</td>
                          <td class="align-middle"><fmt:formatDate value="${map['REGDATE']}" pattern="yyyy-MM-dd"/></td>
                        </tr>
                        </c:forEach> 
                        </c:if>
                      </tbody>
                    </table>
                  </div>
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
       </div>
   </div>
</div>
<%@ include file ="../inc/bottom.jsp"%>