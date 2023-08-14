<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../inc/top.jsp" %>

<link href="<c:url value='/vendors/swiper/swiper-bundle.min.css'/>" rel="stylesheet">

<div class="card-body">
   <div class="row flex-between-center">
     <div class="col-sm-auto mb-2 mb-sm-0">
       <h6 class="mb-0">검색 결과 갯수 뿌리기</h6>
     </div>
     <div class="col-sm-auto">
       <div class="row gx-2 align-items-center">
         <div class="col-auto">
           <form class="row gx-2">
             <div class="col-auto"><small>Sort by: </small></div>
             <div class="col-auto">
               <select class="form-select form-select-sm" aria-label="Bulk actions">
                 <option selected="">제목</option>
                 <option value="Refund">판매자</option>
                 <option value="Delete">Price</option>
               </select>
             </div>
           </form>
         </div>
         <div class="col-auto pe-0">
         	<a class="text-600 px-1" href="<c:url value='/market/marketGrid.jsp'/>" 
         		data-bs-toggle="tooltip" title="그리드로 보기">
         		<span class="fas fa-th"></span>
       		</a>
     	</div>
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
		     <c:set var="i" value="0"/>
     			<c:forEach var="vo" items="${list }" varStatus="loopStatus">
   		 				<c:choose>
    					<c:when test = "${loopStatus.index %2 ==0 }">
					       <div class="col-12 p-x1">
					         <div class="row">
					           <div class="col-sm-5 col-md-4">
					             <div class="position-relative h-sm-100">
					             	<a class="d-block h-100" href="<c:url value='/market/marketDetail?tradeNo=${vo.tradeNo }'/>">
					             		<img class="<c:url value='/market/upload'/>" 
					             			src="<c:url value='/img/products/2.jpg'/>" alt="" />
					           		</a>
					               <div class="badge rounded-pill bg-success position-absolute top-0 end-0 me-2 mt-2 fs--2 z-2">
					               	New
					               </div>
					             </div>
					           </div>
					           <div class="col-sm-7 col-md-8">
					             <div class="row">
					               <div class="col-lg-8">
					                 <h5 class="mt-3 mt-sm-0">
					                 	<a class="text-dark fs-0 fs-lg-1" href="<c:url value='/market/marketDetail?tradeNo=${vo.tradeNo} }'/>">
					                 		${vo.title }
					                 	</a></h5>
					               </div>
					               <div class="col-lg-4 d-flex justify-content-between flex-column">
					                 <div>
					                   <h4 class="fs-1 fs-md-2 text-warning mb-0">
					                   	<fmt:formatNumber value="${vo.price }" pattern="#,###"></fmt:formatNumber>
					                   </h4>
					                   <h5 class="fs--1 text-500 mb-0 mt-1">
					                   </h5>
					                   <div class="mb-2 mt-3"><span class="fa fa-star text-warning"></span><span class="fa fa-star text-warning"></span><span class="fa fa-star text-warning"></span><span class="fa fa-star text-warning"></span><span class="fa fa-star text-300"></span><span class="ms-1">(8)</span>
					                   </div>
					                   <div class="d-none d-lg-block">
					                     <p class="fs--1 mb-1">Shipping Cost: <strong>$50</strong></p>
					                     <p class="fs--1 mb-1">Stock: <strong class="text-success">Available</strong>
					                     </p>
					                   </div>
					                 </div>
					                 <div class="mt-2"><a class="btn btn-sm btn-outline-secondary border-300 d-lg-block me-2 me-lg-0" href="#!"><span class="far fa-heart"></span><span class="ms-2 d-none d-md-inline-block">Favourite</span></a><a class="btn btn-sm btn-primary d-lg-block mt-lg-2" href="#!"><span class="fas fa-envelope-open"> </span><span class="ms-2 d-none d-md-inline-block">쪽지하기</span></a></div>
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
				               <div class="swiper-container theme-slider h-100" data-swiper='{"autoplay":true,"autoHeight":true,"spaceBetween":5,"loop":true,"loopedSlides":5,"navigation":{"nextEl":".swiper-button-next","prevEl":".swiper-button-prev"}}'>
				                 <div class="swiper-wrapper h-100">
				                   <div class="swiper-slide h-100"><a class="d-block h-sm-100" href="../../../app/e-commerce/product/product-details.jsp"><img class="rounded-1 h-100 w-100 object-fit-cover" src="<c:url value='/assets/img/products/1.jpg'/>" alt="" /></a></div>
				                   <div class="swiper-slide h-100"><a class="d-block h-sm-100" href="../../../app/e-commerce/product/product-details.jsp"><img class="rounded-1 h-100 w-100 object-fit-cover" src="<c:url value='/assets/img/products/1-2.jpg'/>" alt="" /></a></div>
				                   <div class="swiper-slide h-100"><a class="d-block h-sm-100" href="../../../app/e-commerce/product/product-details.jsp"><img class="rounded-1 h-100 w-100 object-fit-cover" src="<c:url value='/assets/img/products/1-3.jpg'/>" alt="" /></a></div>
				                 </div>
				                 <div class="swiper-nav">
				                   <div class="swiper-button-next swiper-button-white"></div>
				                   <div class="swiper-button-prev swiper-button-white"></div>
				                 </div>
				               </div>
				               <div class="badge rounded-pill bg-success position-absolute top-0 end-0 me-2 mt-2 fs--2 z-2">New</div>
				             </div>
				           </div>
				           <div class="col-sm-7 col-md-8">
				             <div class="row">
				               <div class="col-lg-8">
				                 <h5 class="mt-3 mt-sm-0">
				                 	<a class="text-dark fs-0 fs-lg-1" href="<c:url value='../../app/e-commerce/product/product-details.jsp'/>">
				                 		${vo.title }
				                 	</a>
			                 	</h5>
				               </div>
				               <div class="col-lg-4 d-flex justify-content-between flex-column">
				                 <div>
				                   <h4 class="fs-1 fs-md-2 text-warning mb-0">
				                   <fmt:formatNumber value="${vo.price }" pattern="#,###"></fmt:formatNumber>
			                   	   </h4>
				                   <div class="mb-2 mt-3"><span class="fa fa-star text-warning"></span><span class="fa fa-star text-warning"></span><span class="fa fa-star text-warning"></span><span class="fa fa-star text-warning"></span><span class="fa fa-star-half-alt text-warning star-icon"></span><span class="ms-1">(20)</span>
				                   </div>
				                   <div class="d-none d-lg-block">
				                     <p class="fs--1 mb-1">Stock: <strong class="text-danger">Sold-Out</strong>
				                     </p>
				                   </div>
				                 </div>
				                 <div class="mt-2"><a class="btn btn-sm btn-outline-secondary border-300 d-lg-block me-2 me-lg-0" href="#!"><span class="far fa-heart"></span><span class="ms-2 d-none d-md-inline-block">Favourite</span></a><a class="btn btn-sm btn-primary d-lg-block mt-lg-2" href="#!"><span class="fas fa-envelope-open"> </span><span class="ms-2 d-none d-md-inline-block">쪽지하기</span></a></div>
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
			   <div class="card-footer border-top d-flex justify-content-center">
			     <button class="btn btn-falcon-default btn-sm me-2" type="button" disabled="disabled" data-bs-toggle="tooltip" data-bs-placement="top" title="Prev"><span class="fas fa-chevron-left"></span></button><a class="btn btn-sm btn-falcon-default text-primary me-2" href="#!">1</a><a class="btn btn-sm btn-falcon-default me-2" href="#!">2</a><a class="btn btn-sm btn-falcon-default me-2" href="#!"><span class="fas fa-ellipsis-h"></span></a><a class="btn btn-sm btn-falcon-default me-2" href="#!">35</a>
			     <button class="btn btn-falcon-default btn-sm" type="button" data-bs-toggle="tooltip" data-bs-placement="top" title="Next"><span class="fas fa-chevron-right"></span></button>
			   </div>
			 </div>
			<%@ include file="../inc/bottom.jsp"%>