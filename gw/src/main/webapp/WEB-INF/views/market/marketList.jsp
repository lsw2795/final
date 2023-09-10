<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../inc/top.jsp"%>

<link href="<c:url value='/vendors/swiper/swiper-bundle.min.css'/>"
	rel="stylesheet">
<link href="<c:url value='/css/Marketcss.css'/>" rel="stylesheet">
<style type="text/css">
.image-container {
	width: 240px;
	height: 200px;
	overflow: hidden;
}

.col-lg-8 h5 {
	font-weight: bold;
}

.image-container img {
	width: 100%;
	height: 100%;
	object-fit: cover;
}

.likebox a {
	margin-right: 83px;
}

div#selflagbox {
	margin-right: 18px;
	margin-top: 11px;
}

.form-select {
	display: inline;
	width: 15%;
}

form.row.gx-2 {
	display: flex;
	flex-wrap: nowrap;
}

.input-search-width {
	width: 17.75rem;
}

.col-md-4 {
	text-align: center;
}

#heartBox a{
	 text-decoration: none;
    color: white;
    background: #dd6e6e;
    padding: 0px 68px 0 54px;
    border-radius: 4px;
}

.d-none.d-lg-block {
    margin-left: 22px;
}

h4.fs-1.fs-md-2.mb-0 {
    margin-left: 19px;
}
</style>
<script type="text/javascript"
	src="<c:url value='/js/jquery-3.7.0.min.js'/>"></script>
<script type="text/javascript">
	function pageFunc(curPage){
		$('input[name="currentPage"]').val(curPage);
		$('form[name="frmPage"]').submit();
	}
	
	 function submitForm() {
		 $('form[name="frmSearch"]').submit();
     }
	
	function insertLikeOn1(tradeNo, empNo, imageId){
		$.ajax({
            url: "<c:url value='/market/ajaxlikeit'/>",
            type:'get',
			dataType:'json',
			data:{
				empNo: empNo,
				tradeNo : tradeNo
			},
            success: function (res) {
            	 if (res == 1) {
                     // 빨간하트로 바꾸기
                     var likecount = $('#likecount' + tradeNo).val();
                     $('#' + imageId).attr('src', '<c:url value="/images/배경지운풀하트.png"/>');
                     $('#likecount' + tradeNo).val(likecount + 1);
                 } else if (res == 2) {
                     var likecount = $('#likecount' + tradeNo).val();
                     $('#' + imageId).attr('src', '<c:url value="/images/배경지운빈하트.png"/>');
                     $('#likecount' + tradeNo).val(likecount - 1);
                 }
        	},
            error:function(xhr,status,error){
                alert(status+" : "+error);
            } 
        });//ajax
	}
	
</script>
<div class="card mb-3">
	<!-- 페이징 처리 관련 form -->
	<form action="<c:url value='/market/marketList'/>" name="frmPage"
		method="post">
		<input type="hidden" name="currentPage"> <input type="hidden"
			name="searchKeyword" value="${param.searchKeyword}"> <input
			type="hidden" name="searchCondition" value="${param.searchCondition}">
		<input type="hidden" name="checkSelflag"
			value="${param.checkSelflag }">
	</form>
	<!-- 페이징 처리 관련 form -->
	<!-- <h2>중고거래 게시판</h2> -->
	<div class="card-body">
		<div class="row flex-between-center">
			<div class="col-sm-auto mb-2 mb-sm-0"
				data-list='{"valueNames":["name","phone-number","report","subscription","social"],"page":10,"pagination":true,"fallback":"contact-table-fallback"}'>
				<c:if test="${!empty param.searchKeyword }">
					<p>
						검색어 : ${param.searchKeyword} , <span
							style="font-weight: bold; color: red;">${pagingInfo.totalRecord}</span>
						건 검색되었습니다.
					</p>
				</c:if>
			</div>
			<div class="row gx-2 align-items-center">
				<form class="row gx-2" name="frmSearch"
					action='<c:url value='/market/marketList'/>'>
					<select name="searchCondition" class="form-select admindefault"
						aria-label="Bulk actions">
						<option value="title"
							<c:if test="${param.searchCondition=='title'}">
	                          		selected = "selected"
	                       		</c:if>>제목
						</option>
						<option value="NAME"
							<c:if test="${param.searchCondition=='NAME'}">
	                          		selected = "selected"
	                       		</c:if>>이름
						</option>
						<option value="discription"
							<c:if test="${param.searchCondition=='discription'}">
	                          		selected = "selected"
	                       		</c:if>>내용
						</option>
					</select>
					<div class="input-group input-search-width">
						<input name="searchKeyword" id="searchKeyword"
							class="form-control shadow-none search admindefault"
							value='${param.searchKeyword}' type="search" placeholder="검색어 입력"
							aria-label="search" />
						<button
							class="btn btn-sm btn-outline-secondary border-300 hover-border-secondary">
							<span class="fa fa-search fs--1"></span>
						</button>
					</div>
					<div id="selflagbox">
						거래 가능 상품만 보기 <input type="checkbox" name="checkSelflag"
							id="checkSelflag" onchange="submitForm()"
							<c:if test="${param.checkSelflag==true}">
										checked="checked"
									</c:if>
							value="true">
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<br>
<div class="card">
	<div class="card-body p-0 overflow-hidden">
		<div class="row g-0">
			<!-- 검색 결과 없을 때 -->
			<c:choose>
				<c:when test="${empty list }">
					<div class="col-12 p-x1">검색결과가 없습니다.</div>
				</c:when>
				<c:otherwise>
					<c:set var="i" value="0" />
					<c:forEach var="map" items="${list }" varStatus="loopStatus">
						<div class="col-12 p-x1">
							<div class="row">
								<div class="col-sm-5 col-md-4">
									<div class="position-relative h-sm-100">
										<a class="d-block"
											href="<c:url value='/market/marketDetail?tradeNo=${map["TRADE_NO"] }'/>">
											<img class="rounded-1"
											style="max-height: 200px; max-weight: 240px;"
											src="<c:url value='/market/upload/${map["thumbnail"]}'/>"
											alt="" />
										</a>
										<c:if test="${map['timeNew']==1}">
											<div
												class="badge rounded-pill bg-success position-absolute top-0 end-0 me-2 mt-2 fs--2 z-2">
												New</div>
										</c:if>
									</div>
								</div>
								<div class="col-sm-7 col-md-8">
									<div class="row">
										<div class="col-lg-8">
											<h5 class="mt-3 mt-sm-0">
												<input type="hidden" id="tradeNo${idx}"
													value="${map['TRADE_NO']}"> <a
													class="text-dark fs-0 fs-lg-1"
													href="<c:url value='/market/marketDetail?tradeNo=${map["TRADE_NO"]}'/>">
													${map["TITLE"] } </a>
											</h5>
											<p class="fs--1 mb-2 mb-md-3">
											<h6 class="text-500">
												<fmt:formatDate value="${map['REGDATE'] }"
													pattern="yyyy-MM-dd HH:mm" />
											</h6>
											</p>
										</div>
										<div
											class="col-lg-4 d-flex justify-content-between flex-column">
											<div>
												<h4 class="fs-1 fs-md-2 mb-0">
													<fmt:formatNumber value="${map['PRICE']}" pattern="#,###" />
													원
												</h4>
												<h5 class="fs--1 text-500 mb-0 mt-1"></h5>
												<div class="mb-2 mt-3"></div>
												<div class="d-none d-lg-block">
													<p class="fs--1 mb-1">
														♥ 좋아요 : <strong id="likecount1">${map['likeCount'] }</strong>
													</p>
													<p class="fs--1 mb-1">
														<span class="fa-solid fa-eye"></span> 조회수 : <strong>${map['READCOUNT'] }</strong>
													</p>
													<p class="fs--1 mb-1">
														작성자 : <strong>${map["NAME"] }</strong>
													</p>
													<p class="fs--1 mb-1">
														Stock:
														<c:if test="${map['SELFLAG']=='N' }">
															<strong class="text-success">거래가능</strong>
														</c:if>
														<c:if test="${map['SELFLAG']=='Y' }">
															<strong class="text-danger">판매완료</strong>
														</c:if>
													</p>
												</div>
											</div>
											
											<div class="mt-2">
												<div class="ILikeIt">
													<div class="col-auto px-2 px-md-3" id="heartBox">
														<!-- 고유한 ID 할당 -->
														<c:set var="imageId"
															value="heartimg${loopStatus.index + 1}" />
														<c:if test="${empty map['likeFlag'] }">
															<a class = "btn-sm" href="#" style="float: right;"
																onclick="insertLikeOn1(${map['TRADE_NO']}, ${map['EMP_NO']}, '${imageId}')">
																<img id="${imageId}"
																src="<c:url value='/images/배경지운빈하트.png'/>" width="30px"
																height="30px">좋아요
															</a>
														</c:if>
														<c:if test="${map['likeFlag'] =='N'}">
															<a href="#" class = "btn-sm" style="float: right;"
																onclick="insertLikeOn1(${map['TRADE_NO']}, ${map['EMP_NO']}, '${imageId}')">
																<img id="${imageId}"
																src="<c:url value='/images/배경지운빈하트.png'/>" width="30px"
																height="30px">좋아요
															</a>
														</c:if>
														<c:if test="${map['likeFlag'] =='Y' }">
															<a class = "btn-sm" href="#" style="float: right;"
																onclick="insertLikeOn1(${map['TRADE_NO']}, ${map['EMP_NO']}, '${imageId}')">
																<img id="${imageId}"
																src="<c:url value='/images/배경지운풀하트.png'/>" width="30px"
																height="30px">좋아요
															</a>
														</c:if>
														<span class="mypagehyphen"></span>
													</div>
												</div>
												<div class="col-auto px-2 px-md-3">
												<a class="btn btn-sm btn-primary d-lg-block mt-lg-2"
													href="<c:url value='/message/messageWrite?empNo=${map["EMP_NO"] }'/>"
													id="message"> <span class="fas fa-envelope-open"></span>
													<span class="ms-2 d-none d-md-inline-block">쪽지하기</span>
												</a>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<hr>
						<c:set var="idx" value="${idx+1 }" />
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
	<!-- 페이징 처리  -->
	<div class="card-footer d-flex justify-content-center admindefault">
		<div class="divPage">
			<!-- 페이지 번호 추가 -->
			<!-- 이전 블럭으로 이동 -->
			<c:if test="${pagingInfo.firstPage>1 }">
				<a href="#" id="prevPage"
					onclick="pageFunc(${pagingInfo.firstPage-1})"> <img
					src="<c:url value='/images/first.JPG'/>">
				</a>
			</c:if>

			<!-- 이전 페이지로 이동  -->
			<c:if test="${pagingInfo.currentPage>1}">
				<a href="#" class="bt prev"
					onclick="pageFunc(${pagingInfo.currentPage-1})"> </a>
			</c:if>

			<!-- [1][2][3][4][5][6][7][8][9][10] -->
			<c:forEach var="i" begin="${pagingInfo.firstPage}"
				end="${pagingInfo.lastPage}">
				<c:if test="${i == pagingInfo.currentPage }">
					<span id="curPage">${i}</span>
				</c:if>
				<c:if test="${i != pagingInfo.currentPage }">
					<a href="#" id="otherPage" onclick="pageFunc(${i})">${i}</a>
				</c:if>
			</c:forEach>

			<!-- 다음 페이지로 이동 -->
			<c:if test="${pagingInfo.totalRecord>0}">
				<c:if test="${pagingInfo.lastPage!=pagingInfo.currentPage}">
					<a href="#" class="bt next"
						onclick="pageFunc(${pagingInfo.currentPage+1})">></a>
				</c:if>
			</c:if>

			<!-- 다음 블럭으로 이동 -->
			<c:if test="${pagingInfo.lastPage < pagingInfo.totalPage }">
				<a href="#" id="nextPage"
					onclick="pageFunc(${pagingInfo.lastPage+1})"> <img
					src="<c:url value='/images/last.JPG'/>">
				</a>
			</c:if>
			<!--  페이지 번호 끝 -->
		</div>
	</div>
</div>
<%@ include file="../inc/bottom.jsp"%>