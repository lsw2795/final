<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 
사원뷰 - 공지사항 목록 뷰
내용 : 공지사항 글 페이징처리, 공지사항 제목또는 내용검색, 제목 클릭시 ajax 이용한 조회수 증가 처리
컨트롤러 : com.ez.gw.board.controller.NoticeController	  
작성자 : 송영은
작성일 : 2023.08
 -->  	    
<%@page import="java.text.DecimalFormat"%>
<%@page import="com.ez.gw.common.Utility"%>
<%@ include file = "../inc/top.jsp" %>
<link rel="stylesheet"href="<c:url value='/css/mypageempform.css'/>">    
<script type="text/javascript">
	//작성자 정보보기
	function empDetail(empNo) {
	    window.open("<c:url value='/mypage/empDetail?empNo='/>"+empNo,'empDetail', 'width=320,height=550,top=300,left=700,location=yes,resizable=yes');
	}
	//페이징처리
	function pageFunc(curPage){
		$('input[name="currentPage"]').val(curPage);
		$('form[name="frmPage"]').submit();
	}
	//검색
	function submitForm() {
	    document.getElementById('frmSearch').submit();
	}
	//제목 클릭시 조회수 증가 후 상세보기 뷰 이동
	function updateReadCount(boardNo){
		$.ajax({
            url: "<c:url value='/board/updateReadCount'/>",
            type:'get',
			data: {
				boardNo: boardNo
			},
			dataType:'json',
            success: function (res) {
            	if(res>0){
            		location.href="<c:url value='/board/noticeDetail?boardNo="+boardNo+"'/>"
            	}
            },
            error:function(xhr,status,error){
                alert(status+" : "+error);
            } 
        });//ajax
	}
</script>
  <!-- 페이징 처리 관련 form -->
		<form action="<c:url value='/board/noticeList'/>" 
			name="frmPage" method="post">
			<input type="hidden" name="currentPage">
			<input type="hidden" name="searchKeyword" value="${param.searchKeyword}">
			<input type="hidden" name="searchCondition" value="${param.searchCondition}">
		</form>
<h2><a href="<c:url value='/board/noticeList'/>" style="text-decoration: none; color: #38404e;">공지사항</a></h2>
<div class="col-lg-12 pe-lg-2 mb-3">
	<div class="card" id="allContactTable">
		<div class="card-header border-bottom border-200 px-0 ">
			<div class="d-lg-flex justify-content-between">
				<div class="row flex-between-center gy-2 px-x1">
					<form name="frmSearch" action='<c:url value='/board/noticeList'/>'>
						<div class="row flex-between-center gy-2 px-x1">
						<div class="col-auto pe-0">
								 <select name="searchCondition" class="form-select ">
		                            <option value="title"
		                            	<c:if test="${param.searchCondition=='title'}">
		                            		selected = "selected"
		                            	</c:if>
		                            >제목</option>
		                            <option value="dept_name"
		                            	<c:if test="${param.searchCondition=='dept_name'}">
		                            		selected= "selected"
		                            	</c:if>
		                            >부서</option>		
		                            <option value="name"
	                       		        <c:if test="${param.searchCondition=='name'}">
		                            		selected = "selected"
		                            	</c:if>
		                            >작성자</option>
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
									class="form-control shadow-none search "
									value='${param.searchKeyword}' type="search"
									placeholder="검색어 입력" aria-label="search" />
								<button
									class="btn btn-sm btn-outline-secondary border-300 hover-border-secondary">
									<span class="fa fa-search fs--1"></span>
								</button>
							</div>
						</div>
						 <div class="col-auto searchEmpResult" style="padding: 10px 0 0 25px;">
							<c:if test="${!empty param.searchKeyword }">
							   <p>검색어 : ${param.searchKeyword} , <span style="font-weight: bold; color: red;">${pagingInfo.totalRecord}</span> 건 검색되었습니다.</p>
							</c:if>   
						</div>
						</div>
						</form>
					</div>
			</div>
		</div>
		<div class="card-body p-0 ">
			<div class="table-responsive scrollbar ">
				<table class="table table-sm table-hover">
					<colgroup>
						<col style="width: 20%;" />
						<col style="width: 15%;" />
						<col style="width: 40%;" />
						<col style="width: 15%;" />
						<col style="width: 10%;" />
					</colgroup>
					<thead class="adminempthead">
						<tr style="text-align: center;">
							<th class="align-middle py-2 fs-0 pe-2" scope="col" data-sort="name">작성자</th>
							<th class="align-middle" scope="col" data-sort="dept">부서</th>
							<th class="align-middle" scope="col" data-sort="title">제목</th>
							<th class="align-middle" scope="col" data-sort="regdate">등록일</th>
							<th class="align-middle" scope="col" data-sort="readcount">조회수</th>
						</tr>
					</thead>
					<tbody>
						<!-- 반복 시작  -->
						<c:forEach var="map" items="${list}">
							<tr>
								<td class="align-middle fs-0 py-3">
									<div class="d-flex align-items-center gap-2 position-relative">
										<div class="avatar avatar-xl mypageempdiv14">
											<div>
												<img class="rounded-circle" src="<c:url value='/images/${map["IMAGE"]}'/>">
											</div>
										</div>
										<a href="#" onclick="empDetail(${map.EMP_NO});" 
											style="text-decoration:none; color: #5e6e82;">${map['NAME']}
										</a>
									</div>
								</td>
								
								<td class="align-middle"><div class="mypageempdiv14">${map['DEPT_NAME']}</div></td>
								<td class="align-middle">
									<div class="mypageempdiv14">
									<a href="#" onclick="updateReadCount(${map.BOARD_NO});">
									${map['TITLE']}
									<c:if test="${map['timeNew']==1}">
										<img alt="New이미지" src="<c:url value='/images/new.jpg'/>">
									</c:if>
									</a>
									</div>
								</td>
								<td class="align-middle">
									<div class="mypageempdiv14">
										<fmt:formatDate value="${map['REGDATE']}" pattern="yyyy-MM-dd"/>
										
									</div>
								</td>
								<td class="align-middle">
								<div class="mypageempdiv14">
									${map['READCOUNT']}
								</div>
								</td>
							</tr>
						</c:forEach>
						<!-- 반복 끝 -->
					</tbody>
				</table>
				<div class="text-center d-none" id="contact-table-fallback">
					<p class="fw-bold fs-1 mt-3">검색결과가 없습니다.</p>
				</div>
			</div>
		</div>
		<div class="card-footer d-flex justify-content-center ">
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
<%@ include file = "../inc/bottom.jsp" %>