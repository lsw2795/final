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
.col-lg-8 h5{
	font-weight:bold;
}

.image-container img {
	width: 100%;
	height: 100%;
	object-fit: cover;
}

ul#navbarVerticalNav {
   		font-size: 17px;
	}	
</style>
<script type="text/javascript">
	function pageFunc(curPage){
		$('input[name="currentPage"]').val(curPage);
		$('form[name="frmPage"]').submit();
	}

</script>
<div class="card-body">
<form action="<c:url value='/market/marketList'/>" 
	name="frmPage" method="post">
	<input type="hidden" name="currentPage">
	<input type="hidden" name="searchKeyword" value="${param.searchKeyword}">
	<input type="hidden" name="searchCondition" value="${param.searchCondition}">
</form>
 <div class="row gx-3">
	<h2>중고거래 게시판</h2>
	  <div class="row flex-between-center">
		<div class="card" id="allContactTable" data-list='{"valueNames":["name","phone-number","report","subscription","social"],"page":10,"pagination":true,"fallback":"contact-table-fallback"}'>
		  <div class="card-header border-bottom border-200 px-0">
			<div class="d-lg-flex justify-content-between">
				<form name = "frmSearch" action='<c:url value='/market/marketList'/>'>
					<div class="row flex-between-center gy-2 px-x1">
						<div class="col-auto pe-0">
							<select name="searchCondition"
									class="form-select"  aria-label="Bulk actions">
									<option value="title"
										<c:if test="${param.searchCondition=='title'}">
	                            		selected = "selected"
	                            	</c:if>>제목</option>
									<option value="NAME"
										<c:if test="${param.searchCondition=='NAME'}">
	                            		selected = "selected"
	                            	</c:if>>이름</option>
									<option value="discription"
										<c:if test="${param.searchCondition=='discription'}">
	                            		selected = "selected"
	                            	</c:if>>내용</option>
								</select>
						</div>
						<div class="col-auto">
							<div class="input-group input-search-width">
								<input name="searchKeyword"
									class="form-control form-control-sm shadow-none search"
									value='${param.searchKeyword}' type="search"
									placeholder="검색어 입력" aria-label="search" />
								<button
									class="btn btn-sm btn-outline-secondary border-300 hover-border-secondary">
									<span class="fa fa-search fs--1"></span>
								</button>
							</div>
							</form>
						</div>
					</div>
					<div class="border-bottom border-200 my-3"></div>
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
								<c:choose>
									<c:when test="${loopStatus.index %2 ==0 }">
										<div class="col-12 p-x1">
											<div class="row">
												<div class="col-sm-5 col-md-4">
													<div class="position-relative">
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
																<a class="text-dark fs-0 fs-lg-1"
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
																<div class="mb-2 mt-3">
																	
																</div>
																<div class="d-none d-lg-block">
																	<p class="fs--1 mb-1">
																		♥ 좋아요 : <strong>${map['LIKECOUNT'] }</strong>
																	</p>
																	<p class="fs--1 mb-1">
																		<span class="fa-solid fa-eye"></span>
																		조회수 : <strong>${map['READCOUNT'] }</strong>
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
																<a
																	class="btn btn-sm btn-outline-secondary border-300 d-lg-block me-2 me-lg-0"
																	href="<c:url value='/market/like?tradeNo=${map["TRADE_NO"] }'/>">
																	<span class="far fa-heart"></span><span
																	class="ms-2 d-none d-md-inline-block">좋아요</span></a>
																<a
																	class="btn btn-sm btn-primary d-lg-block mt-lg-2"
																	href="#!"><span class="fas fa-envelope-open">
																</span><span class="ms-2 d-none d-md-inline-block">쪽지하기</span></a>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</c:when>
									<c:otherwise>
										<div class="col-12 p-x1 bg-100">
											<div class="row">
												<div class="col-sm-5 col-md-4">
													<div class="position-relative h-sm-100">
														<div class="swiper-container theme-slider h-100"
															data-swiper='{"autoplay":true,"autoHeight":true,"spaceBetween":5,"loop":true,"loopedSlides":5,"navigation":{"nextEl":".swiper-button-next","prevEl":".swiper-button-prev"}}'>
															<div class="swiper-wrapper h-100">
																<div class="swiper-slide h-100">
																	<a class="d-block h-sm-100"
																		href="<c:url value='/market/marketDetail?tradeNo=${map["TRADE_NO"]}'/>">
																		<img class="rounded-1 h-100 w-100 object-fit-cover"
																		style="max-height: 200px; max-weight: 240px;"
																		src="<c:url value='/market/upload/${map["thumbnail"]}'/>"
																		alt="" />
																	</a>
																</div>
																<div class="swiper-slide h-100">
																	<a class="d-block h-sm-100"
																		href="../../../app/e-commerce/product/product-details.jsp">
																		<img class="rounded-1 h-100 w-100 object-fit-cover"
																		src="<c:url value='/assets/img/products/1-2.jpg'/>"
																		alt="" />
																	</a>
																</div>
																<div class="swiper-slide h-100">
																	<a class="d-block h-sm-100"
																		href="../../../app/e-commerce/product/product-details.jsp"><img
																		class="rounded-1 h-100 w-100 object-fit-cover"
																		src="<c:url value='/assets/img/products/1-3.jpg'/>"
																		alt="" /></a>
																</div>
															</div>
															<div class="swiper-nav">
																<div class="swiper-button-next swiper-button-white"></div>
																<div class="swiper-button-prev swiper-button-white"></div>
															</div>
														</div>
														<c:if test="${map['timeNew'] == 1 }">
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
																<a class="text-dark fs-0 fs-lg-1"
																	href="<c:url value='/market/marketDetail?tradeNo=${map["TRADE_NO"]}'/>">
																	${map["TITLE"] } </a>
															</h5>
															<p class="fs--1 mb-2 mb-md-3">
															<h6 class="text-500">
																<fmt:formatDate value="${map['REGDATE']}"
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
																<div class="mb-2 mt-3">
																	
																</div>
																<div class="d-none d-lg-block">
																	<p class="fs--1 mb-1">
																		♥ 좋아요 : <strong>${map["LIKECOUNT"] }</strong>
																	</p>
																	<p class="fs--1 mb-1">
																		조회수 : <strong>${map["READCOUNT"] }</strong>
																	</p>
																	<p class="fs--1 mb-1">
																		작성자 : <strong>${map["NAME"] }</strong>
																	</p>
																	<p class="fs--1 mb-1">
																		Stock:
																		<c:if test="${map['SELFLAG']=='N' }">
																			<strong class="text-success">거래가능</strong>
																		</c:if>
																		<c:if test="${map['SELFLAG']=='Y'}">
																			<strong class="text-danger">판매완료</strong>
																		</c:if>
																	</p>
																</div>
															</div>
															<div class="mt-2">
																<a
																	class="btn btn-sm btn-outline-secondary border-300 d-lg-block me-2 me-lg-0"
																	href="<c:url value='/market/like?tradeNo=${map["TRADE_NO"] }'/>">
																	<span class="far fa-heart"></span><span
																	class="ms-2 d-none d-md-inline-block">좋아요</span></a>
																<a
																	class="btn btn-sm btn-primary d-lg-block mt-lg-2"
																	href="#!"><span class="fas fa-envelope-open">
																</span><span class="ms-2 d-none d-md-inline-block">쪽지하기</span></a>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
	  </div>
		<!-- 페이징 처리  -->
      	<div class="board_page">
		<!-- 페이지 번호 추가 -->		
		<!-- 이전 블럭으로 이동 -->
		<c:if test="${pagingInfo.firstPage>1}">
			<a href="#" class="bt first" onclick="pageFunc(${pagingInfo.firstPage-1})"><<</a>
		</c:if>
		
		<!-- 이전 페이지로 이동  -->
		<c:if test="${pagingInfo.currentPage>1}">
			<a href="#" class="bt prev" onclick="pageFunc(${pagingInfo.currentPage-1})"><</a>
		</c:if>				
		
		<!-- [1][2][3][4][5][6][7][8][9][10] -->
		<c:forEach var="i" begin="${pagingInfo.firstPage}" end="${pagingInfo.lastPage}">		
			<c:if test="${i == pagingInfo.currentPage }">		
				<a href="#" class="num on">${i}</a>
        	</c:if>
			<c:if test="${i != pagingInfo.currentPage }">		
		         <a href="#" class="num" onclick="pageFunc(${i})">${i}</a>
		    </c:if>   		
		</c:forEach>
		
		<!-- 다음 페이지로 이동 -->
		<c:if test="${pagingInfo.totalRecord>0}">
			<c:if test="${pagingInfo.lastPage!=pagingInfo.currentPage}">
	        	<a href="#" class="bt next" onclick="pageFunc(${pagingInfo.currentPage+1})">></a>
			</c:if>
		</c:if>
		
		<!-- 다음 블럭으로 이동 -->
		<c:if test="${pagingInfo.lastPage < pagingInfo.totalPage }">
	         <a href="#" class="bt last" onclick="pageFunc(${pagingInfo.lastPage+1})">>></a>
		</c:if>
		<!--  페이지 번호 끝 -->
	</div>
	</div>
</div>
	<%@ include file="../inc/bottom.jsp"%>