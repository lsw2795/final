<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                 <option selected="">Best Match</option>
                 <option value="Refund">Newest</option>
                 <option value="Delete">Price</option>
               </select>
             </div>
           </form>
         </div>
         <div class="col-auto pe-0"><a class="text-600 px-1" href="<c:url value='/market/marketGrid.jsp'/>" data-bs-toggle="tooltip" title="그리드로 보기"><span class="fas fa-th"></span></a></div>
       </div>
     </div>
   </div>
 </div>
 <br>
 <div class="card">
   <div class="card-body p-0 overflow-hidden">
     <div class="row g-0">
     <!--  홀수 번호 list for문 돌리기 -->
       <div class="col-12 p-x1">
         <div class="row">
           <div class="col-sm-5 col-md-4">
             <div class="position-relative h-sm-100"><a class="d-block h-100" href="../../../app/e-commerce/product/product-details.jsp"><img class="img-fluid object-fit-cover w-sm-100 h-sm-100 rounded-1 absolute-sm-centered" src="<c:url value='/assets/img/products/2.jpg'/>" alt="" /></a>
               <div class="badge rounded-pill bg-success position-absolute top-0 end-0 me-2 mt-2 fs--2 z-2">New</div>
             </div>
           </div>
           <div class="col-sm-7 col-md-8">
             <div class="row">
               <div class="col-lg-8">
                 <h5 class="mt-3 mt-sm-0"><a class="text-dark fs-0 fs-lg-1" href="../../../app/e-commerce/product/product-details.jsp">Apple iMac Pro (27-inch with Retina 5K Display, 3.0GHz 10-core Intel Xeon W, 1TB SSD)</a></h5>
                 <p class="fs--1 mb-2 mb-md-3"><a class="text-500" href="#!">Computer &amp; Accessories</a></p>
                 <ul class="list-unstyled d-none d-lg-block">
                   <li><span class="fas fa-circle" data-fa-transform="shrink-12"></span><span>16GB RAM</span></li>
                   <li><span class="fas fa-circle" data-fa-transform="shrink-12"></span><span>1TB SSD Hard Drive</span></li>
                   <li><span class="fas fa-circle" data-fa-transform="shrink-12"></span><span>10-core Intel Xeon</span></li>
                   <li><span class="fas fa-circle" data-fa-transform="shrink-12"></span><span>Mac OS</span></li>
                   <li><span class="fas fa-circle" data-fa-transform="shrink-12"></span><span>Secured</span></li>
                 </ul>
               </div>
               <div class="col-lg-4 d-flex justify-content-between flex-column">
                 <div>
                   <h4 class="fs-1 fs-md-2 text-warning mb-0">$1199.5</h4>
                   <h5 class="fs--1 text-500 mb-0 mt-1">
                     <del>$2399 </del><span class="ms-1">-50%</span>
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
       <!-- 짝수번호 list for문 돌리기!! -->
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
                 <h5 class="mt-3 mt-sm-0"><a class="text-dark fs-0 fs-lg-1" href="<c:url value='../../app/e-commerce/product/product-details.jsp'/>">Apple MacBook Pro (15&quot; Retina, Touch Bar, 2.2GHz 6-Core Intel Core i7, 16GB RAM, 256GB SSD) - Space Gray (Latest Model)</a></h5>
                 <p class="fs--1 mb-2 mb-md-3"><a class="text-500" href="#!">Computer &amp; Accessories</a></p>
                 <ul class="list-unstyled d-none d-lg-block">
                   <li><span class="fas fa-circle" data-fa-transform="shrink-12"></span><span>16GB RAM</span></li>
                   <li><span class="fas fa-circle" data-fa-transform="shrink-12"></span><span>256GB SSD Hard Drive</span></li>
                   <li><span class="fas fa-circle" data-fa-transform="shrink-12"></span><span>Intel Core i7</span></li>
                   <li><span class="fas fa-circle" data-fa-transform="shrink-12"></span><span>Mac OS</span></li>
                   <li><span class="fas fa-circle" data-fa-transform="shrink-12"></span><span>Space Gray</span></li>
                 </ul>
               </div>
               <div class="col-lg-4 d-flex justify-content-between flex-column">
                 <div>
                   <h4 class="fs-1 fs-md-2 text-warning mb-0">$7199</h4>
                   <div class="mb-2 mt-3"><span class="fa fa-star text-warning"></span><span class="fa fa-star text-warning"></span><span class="fa fa-star text-warning"></span><span class="fa fa-star text-warning"></span><span class="fa fa-star-half-alt text-warning star-icon"></span><span class="ms-1">(20)</span>
                   </div>
                   <div class="d-none d-lg-block">
                     <p class="fs--1 mb-1">Shipping Cost: <strong>$65</strong></p>
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
     </div>
   </div>
   <div class="card-footer border-top d-flex justify-content-center">
     <button class="btn btn-falcon-default btn-sm me-2" type="button" disabled="disabled" data-bs-toggle="tooltip" data-bs-placement="top" title="Prev"><span class="fas fa-chevron-left"></span></button><a class="btn btn-sm btn-falcon-default text-primary me-2" href="#!">1</a><a class="btn btn-sm btn-falcon-default me-2" href="#!">2</a><a class="btn btn-sm btn-falcon-default me-2" href="#!"><span class="fas fa-ellipsis-h"></span></a><a class="btn btn-sm btn-falcon-default me-2" href="#!">35</a>
     <button class="btn btn-falcon-default btn-sm" type="button" data-bs-toggle="tooltip" data-bs-placement="top" title="Next"><span class="fas fa-chevron-right"></span></button>
   </div>
 </div>
<%@ include file="../inc/bottom.jsp"%>