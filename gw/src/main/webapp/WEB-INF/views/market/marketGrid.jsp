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
	<div class="card mb-3">
    <div class="card-body">
    <div class="row">
	 <table>
	  <tr>
	   <td>
      	<div class="mb-4 col-md-6 col-lg-4">
        <div class="border rounded-1 h-100 d-flex flex-column justify-content-between pb-3">
          <div class="overflow-hidden">
            <div class="position-relative rounded-top overflow-hidden"><a class="d-block" href="<c:url value='/app/e-commerce/product/product-details.jsp'/>"><img class="img-fluid rounded-top" src="<c:url value='/assets/img/products/2.jpg'/>" alt="" /></a><span class="badge rounded-pill bg-success position-absolute mt-2 me-2 z-2 top-0 end-0">New</span>
            </div>
            <div class="p-3">
              <h5 class="fs-0"><a class="text-dark" href="<c:url value='/app/e-commerce/product/product-details.jsp'/>">Apple iMac Pro (27-inch with Retina 5K Display, 3.0GHz 10-core Intel Xeon W, 1TB SSD)</a></h5>
              <p class="fs--1 mb-3"><a class="text-500" href="#!">Computer &amp; Accessories</a></p>
              <h5 class="fs-md-2 text-warning mb-0 d-flex align-items-center mb-3"> $1199.5
                <del class="ms-2 fs--1 text-500">$2399 </del>
              </h5>
              <p class="fs--1 mb-1">Shipping Cost: <strong>$50</strong></p>
              <p class="fs--1 mb-1">Stock: <strong class="text-success">Available</strong>
              </p>
            </div>
          </div>
          <div class="d-flex flex-between-center px-3">
            <div><span class="fa fa-star text-warning"></span><span class="fa fa-star text-warning"></span><span class="fa fa-star text-warning"></span><span class="fa fa-star text-warning"></span><span class="fa fa-star text-300"></span><span class="ms-1">(8)</span>
            </div>
            <div><a class="btn btn-sm btn-falcon-default me-2" href="#!" data-bs-toggle="tooltip" data-bs-placement="top" title="Add to Wish List"><span class="far fa-heart"></span></a><a class="btn btn-sm btn-falcon-default" href="#!" data-bs-toggle="tooltip" data-bs-placement="top" title="Add to Cart"><span class="fas fa-cart-plus"></span></a></div>
          </div>
        </div>
      </div>
      </td>
      <td>
      <div class="mb-4 col-md-6 col-lg-4">
        <div class="border rounded-1 h-100 d-flex flex-column justify-content-between pb-3">
          <div class="overflow-hidden">
            <div class="position-relative rounded-top overflow-hidden">
              <div class="swiper-container theme-slider" data-swiper='{"autoplay":true,"autoHeight":true,"spaceBetween":5,"loop":true,"loopedSlides":5,"navigation":{"nextEl":".swiper-button-next","prevEl":".swiper-button-prev"}}'>
                <div class="swiper-wrapper">
                  <div class="swiper-slide"><a class="d-block" href="<c:url value='/app/e-commerce/product/product-details.jsp'/>"><img class="rounded-top img-fluid" src="<c:url value='/assets/img/products/1.jpg'/>" alt="" /></a></div>
                  <div class="swiper-slide"><a class="d-block" href="<c:url value='/app/e-commerce/product/product-details.jsp'/>"><img class="rounded-top img-fluid" src="<c:url value='/assets/img/products/1-2.jpg'/>" alt="" /></a></div>
                  <div class="swiper-slide"><a class="d-block" href="<c:url value='/app/e-commerce/product/product-details.jsp'/>"><img class="rounded-top img-fluid" src="<c:url value='/assets/img/products/1-3.jpg'/>" alt="" /></a></div>
                </div>
                <div class="swiper-nav">
                  <div class="swiper-button-next swiper-button-white"></div>
                  <div class="swiper-button-prev swiper-button-white"></div>
                </div>
              </div><span class="badge rounded-pill bg-success position-absolute mt-2 me-2 z-2 top-0 end-0">New</span>
            </div>
            <div class="p-3">
              <h5 class="fs-0"><a class="text-dark" href="<c:url value='/app/e-commerce/product/product-details.jsp'/>">Apple MacBook Pro (15&quot; Retina, Touch Bar, 2.2GHz 6-Core Intel Core i7, 16GB RAM, 256GB SSD) - Space Gray (Latest Model)</a></h5>
              <p class="fs--1 mb-3"><a class="text-500" href="#!">Computer &amp; Accessories</a></p>
              <h5 class="fs-md-2 text-warning mb-0 d-flex align-items-center mb-3"> $7199
              </h5>
              <p class="fs--1 mb-1">Shipping Cost: <strong>$65</strong></p>
              <p class="fs--1 mb-1">Stock: <strong class="text-danger">Sold-Out</strong>
              </p>
            </div>
          </div>
          <div class="d-flex flex-between-center px-3">
            <div><span class="fa fa-star text-warning"></span><span class="fa fa-star text-warning"></span><span class="fa fa-star text-warning"></span><span class="fa fa-star text-warning"></span><span class="fa fa-star-half-alt text-warning star-icon"></span><span class="ms-1">(20)</span>
            </div>
            <div><a class="btn btn-sm btn-falcon-default me-2" href="#!" data-bs-toggle="tooltip" data-bs-placement="top" title="Add to Wish List"><span class="far fa-heart"></span></a><a class="btn btn-sm btn-falcon-default" href="#!" data-bs-toggle="tooltip" data-bs-placement="top" title="Add to Cart"><span class="fas fa-cart-plus"></span></a></div>
          </div>
        </div>
      </div>
      </td>
      <td>
      <div class="mb-4 col-md-6 col-lg-4">
        <div class="border rounded-1 h-100 d-flex flex-column justify-content-between pb-3">
          <div class="overflow-hidden">
            <div class="position-relative rounded-top overflow-hidden"><a class="d-block" href="../../../app/e-commerce/product/product-details.jsp"><img class="img-fluid rounded-top" src="<c:url value='/assets/img/products/4.jpg'/>" alt="" /></a>
            </div>
            <div class="p-3">
              <h5 class="fs-0"><a class="text-dark" href="../../../app/e-commerce/product/product-details.jsp">Apple iPad Air 2019 (3GB RAM, 128GB ROM, 8MP Main Camera)</a></h5>
              <p class="fs--1 mb-3"><a class="text-500" href="#!">Mobile &amp; Tabs</a></p>
              <h5 class="fs-md-2 text-warning mb-0 d-flex align-items-center mb-3"> $562.5
                <del class="ms-2 fs--1 text-500">$750 </del>
              </h5>
              <p class="fs--1 mb-1">Shipping Cost: <strong>$47</strong></p>
              <p class="fs--1 mb-1">Stock: <strong class="text-success">Available</strong>
              </p>
            </div>
          </div>
          <div class="d-flex flex-between-center px-3">
            <div><span class="fa fa-star text-warning"></span><span class="fa fa-star text-warning"></span><span class="fa fa-star-half-alt text-warning star-icon"></span><span class="fa fa-star text-300"></span><span class="fa fa-star text-300"></span><span class="ms-1">(14)</span>
            </div>
            <div><a class="btn btn-sm btn-falcon-default me-2" href="#!" data-bs-toggle="tooltip" data-bs-placement="top" title="Add to Wish List"><span class="far fa-heart"></span></a><a class="btn btn-sm btn-falcon-default" href="#!" data-bs-toggle="tooltip" data-bs-placement="top" title="Add to Cart"><span class="fas fa-cart-plus"></span></a></div>
          </div>
        </div>
      </div>
      </td>
      </tr>
     </table>
      
      
    </div>
  </div>
  <div class="card-footer bg-light d-flex justify-content-center">
    <div>
      <button class="btn btn-falcon-default btn-sm me-2" type="button" disabled="disabled" data-bs-toggle="tooltip" data-bs-placement="top" title="Prev"><span class="fas fa-chevron-left"></span></button><a class="btn btn-sm btn-falcon-default text-primary me-2" href="#!">1</a><a class="btn btn-sm btn-falcon-default me-2" href="#!">2</a><a class="btn btn-sm btn-falcon-default me-2" href="#!"> <span class="fas fa-ellipsis-h"></span></a><a class="btn btn-sm btn-falcon-default me-2" href="#!">35</a>
      <button class="btn btn-falcon-default btn-sm" type="button" data-bs-toggle="tooltip" data-bs-placement="top" title="Next"><span class="fas fa-chevron-right">     </span></button>
    </div>
  </div>
</div>
 

<%@ include file="../inc/bottom.jsp"%>