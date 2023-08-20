<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../inc/top.jsp" %>

 <link href="<c:url value='/vendors/swiper/swiper-bundle.min.css'/>" rel="stylesheet">
 <script type="text/javascript">
	function delMarket(){
		if(confirm("삭제하시겠습니까?")){
			location.href="<c:url value='/market/delMarket?tradeNo=${vo.tradeNo}'/>"
		}
		
	}
</script>
<div class="content">
		<h2>상세보기</h2>
		
		<c:if test="${sessionScope.empNo==emp.empNo }">
			<a href="<c:url value='/market/editMarket?tradeNo=${vo.tradeNo}'/>">
              	<button class="btn btn-falcon-default btn-sm" type="button">
            		<span class="fas fa-ban" data-fa-transform="shrink-2 down-1"></span>
   	        		<span class="d-none d-md-inline-block ms-1">수정</span>
         	    </button>
            </a>
            <button onclick="delMarket()" class="btn btn-falcon-default btn-sm ms-2 d-none d-sm-block" type="button">
                 <span class="fas fa-trash-alt" data-fa-transform="shrink-2 down-1"></span>
                 <span class="d-none d-md-inline-block ms-1">삭제</span>
	        </button>
		</c:if>
          <div class="card mb-3">
            <div class="card-body">
              <div class="row">
                <div class="col-lg-6 mb-4 mb-lg-0">
                  <div class="product-slider" id="galleryTop">
                    <div class="swiper-container theme-slider position-lg-absolute all-0" 
                    	data-swiper='{"autoHeight":true,"spaceBetween":5,"loop":true,"loopedSlides":5,
                    	"thumb":{"spaceBetween":5,"slidesPerView":5,"loop":true,"freeMode":true,"grabCursor":true,
                    	"loopedSlides":5,"centeredSlides":true,"slideToClickedSlide":true,
                    	"watchSlidesVisibility":true,"watchSlidesProgress":true,"parent":"#galleryTop"},
                    	"slideToClickedSlide":true}'>
                      <div class="swiper-wrapper">
                      	<c:forEach var="file" items="${file }">
	                        <div class="swiper-slide swiper-slide-duplicate swiper-slide-visible swiper-slide-prev" data-swiper-slide-index="5" role="group" aria-label="6 / 6" style="width: 70.2px; margin-right: 5px;"">
	                        	<img class="rounded-1 object-fit-cover h-100 w-100" src="<c:url value='/market/upload/${file.imageURL }'/>" alt="" />
	                        </div>
                      	</c:forEach>
                      </div>
                      <div class="swiper-nav">
                        <div class="swiper-button-next swiper-button-white"></div>
                        <div class="swiper-button-prev swiper-button-white"></div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="col-lg-6">
                  <h4><strong>${vo.title }</strong></h4>
                  <h6 class="fs--1 mb-2 d-block" href="#!">
                  	<fmt:formatDate value="${vo.regdate }" pattern="yyyy-MM-dd HH:mm"/>
                 	</h6>
                 	  <p class="fs--1 mb-1"> <span><strong>작성자 : ${emp.name } </strong></span></p>
                  <hr>
                  <div class="fs--2 mb-3 d-inline-block text-decoration-none"><span class="fa fa-star text-warning"></span><span class="fa fa-star text-warning"></span><span class="fa fa-star text-warning"></span><span class="fa fa-star text-warning"></span><span class="fa fa-star-half-alt text-warning star-icon"></span><span class="ms-1 text-600">(8)</span>
                  </div>
                  <h4 class="d-flex align-items-center"><span class="me-2">
                  	<fmt:formatNumber value="${vo.price }" pattern="#,###"/>원 
                  	</span><span class="me-1 fs--1 text-500">
                      </span></h4>
                
                  <p class="fs--1 mb-1"> <span>조회수 : ${vo.readCount } </span></p>
                  <p class="fs--1">Stock: 
                  	<c:if test="${vo.selFlag=='N' }">
                    	<strong class="text-success">거래가능</strong>
                    </c:if>
                    <c:if test="${vo.selFlag=='Y' }">
                    	<strong class="text-danger">판매완료</strong>
                    </c:if>
                  </p>
                  <div class="row">
                    <div class="col-auto px-2 px-md-3"><a class="btn btn-sm btn-primary" href="#!"><span class="fas fa-envelope-open"></span><span class="d-none d-sm-inline-block">&nbsp&nbsp판매자에게 쪽지하기</span></a></div>
                    <div class="col-auto px-0">
                    	<a class="btn btn-sm btn-outline-danger border border-300" href="<c:url value='/market/like?tradeNo=${vo.tradeNo }'/>" data-bs-toggle="tooltip" data-bs-placement="top" >
                    		<span class="far fa-heart me-1"></span>${vo.likeCount}
                    	</a>
                    </div>
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="col-12">
                  <div class="overflow-hidden mt-4">
                    <ul class="nav nav-tabs" id="myTab" role="tablist">
                      <li class="nav-item"><span class="nav-link active ps-0" id="description-tab" data-bs-toggle="tab" href="#tab-description" role="tab" aria-controls="tab-description" aria-selected="true">상품 설명</span></li>
                    </ul>
                    <div class="tab-content" id="myTabContent">
                      <div class="tab-pane fade show active" id="tab-description" role="tabpanel" aria-labelledby="description-tab">
                        <div class="mt-3">
                        
                        <!-- 글 줄바꿈 처리  -->
		                  <% pageContext.setAttribute("newLine", "\r\n"); %>
		            	  <c:set var="content" value="${fn:replace(vo.discription, newLine, '<br>')}" />
                  	 		${content}
                  	 		
                        </div>
                      </div>
                      <div class="tab-pane fade" id="tab-reviews" role="tabpanel" aria-labelledby="reviews-tab">
                        <div class="row mt-3">
                          <div class="col-lg-6 mb-4 mb-lg-0">
                            <div class="mb-1"><span class="fa fa-star text-warning fs--1"></span><span class="fa fa-star text-warning fs--1"></span><span class="fa fa-star text-warning fs--1"></span><span class="fa fa-star text-warning fs--1"></span><span class="fa fa-star text-warning fs--1"></span><span class="ms-3 text-dark fw-semi-bold">Awesome support, great code ð</span>
                            </div>
                            <p class="fs--1 mb-2 text-600">By Drik Smith â¢ October 14, 2019</p>
                            <p class="mb-0">You shouldn't need to read a review to see how nice and polished this theme is. So I'll tell you something you won't find in the demo. After the download I had a technical question, emailed the team and got a response right from the team CEO with helpful advice.</p>
                            <hr class="my-4" />
                            <div class="mb-1"><span class="fa fa-star text-warning fs--1"></span><span class="fa fa-star text-warning fs--1"></span><span class="fa fa-star text-warning fs--1"></span><span class="fa fa-star text-warning fs--1"></span><span class="fa fa-star-half-alt text-warning star-icon fs--1"></span><span class="ms-3 text-dark fw-semi-bold">Outstanding Design, Awesome Support</span>
                            </div>
                            <p class="fs--1 mb-2 text-600">By Liane â¢ December 14, 2019</p>
                            <p class="mb-0">This really is an amazing template - from the style to the font - clean layout. SO worth the money! The demo pages show off what Bootstrap 4 can impressively do. Great template!! Support response is FAST and the team is amazing - communication is important.</p>
                          </div>
                          <div class="col-lg-6 ps-lg-5">
                            <form>
                              <h5 class="mb-3">Write your Review</h5>
                              <div class="mb-3">
                                <label class="form-label">Ratting: </label>
                                <div class="d-block" data-rater='{"starSize":32,"step":0.5}'></div>
                              </div>
                              <div class="mb-3">
                                <label class="form-label" for="formGroupNameInput">Name:</label>
                                <input class="form-control" id="formGroupNameInput" type="text" />
                              </div>
                              <div class="mb-3">
                                <label class="form-label" for="formGroupEmailInput">Email:</label>
                                <input class="form-control" id="formGroupEmailInput" type="email" />
                              </div>
                              <div class="mb-3">
                                <label class="form-label" for="formGrouptextareaInput">Review:</label>
                                <textarea class="form-control" id="formGrouptextareaInput" rows="3"></textarea>
                              </div>
                              <button class="btn btn-primary" type="submit">Submit</button>
                            </form>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
<%@ include file="../inc/bottom.jsp" %>

<!-- ===============================================-->
    <!--    JavaScripts-->
    <!-- ===============================================-->
    <script src="<c:url value='/vendors/popper/popper.min.js'/>"></script>
    <script src="<c:url value='/vendors/bootstrap/bootstrap.min.js'/>"></script>
    <script src="<c:url value='/vendors/anchorjs/anchor.min.js'/>"></script>
    <script src="<c:url value='/vendors/is/is.min.js'/>"></script>
    <script src="<c:url value='/vendors/swiper/swiper-bundle.min.js'/>"></script>
    <script src="<c:url value='/vendors/rater-js/index.js'/>"></script>
    <script src="<c:url value='/vendors/fontawesome/all.min.js'/>"></script>
    <script src="<c:url value='/vendors/lodash/lodash.min.js'/>"></script>
    <script src="https://polyfill.io/v3/polyfill.min.js?features=window.scroll"></script>
    <script src="<c:url value='/vendors/list.js/list.min.js'/>"></script>
    <script src="<c:url value='/assets/js/theme.js'/>"></script>
