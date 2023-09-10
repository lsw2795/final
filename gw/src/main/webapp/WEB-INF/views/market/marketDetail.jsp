<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../inc/top.jsp"%>
<link href="<c:url value='/vendors/swiper/swiper-bundle.min.css'/>"
	rel="stylesheet">
<script type="text/javascript">
	function delMarket(no){
		if(confirm("삭제하시겠습니까?")){
			location.href="<c:url value='/market/delMarket?tradeNo="+no+"'/>"
		}
	}
	function insertLikeOn(empNo, tradeNo){
		var empNo = ${sessionScope.empNo}
		$.ajax({
            url: "<c:url value='/market/ajaxlikeit'/>",
            type:'get',
			dataType:'json',
			data:{
				empNo: empNo,
				tradeNo : tradeNo
			},
            success: function (res) {
            	if(res==1){
               		//빨간하트로 바꾸기
               		var likecount = $('#likecount').val();
               		$('#heartimg').attr('src','<c:url value='/images/배경지운풀하트.png'/>');
               		$('#likecount').val(likecount +1);
            	}else if(res ==2){
            		var likecount = $('#likecount').val();
            		$('#heartimg').attr('src','<c:url value='/images/배경지운빈하트.png'/>');
            		$('#likecount').val(likecount -1);
            	}	
        	},
            error:function(xhr,status,error){
                alert(status+" : "+error);
            } 
        });//ajax
	}
	
	function boardReport(no){
		if(confirm("게시글을 신고하시겠습니까?")){
			$.ajax({
				url:'<c:url value="/report/reportMarketAjax"/>',
				type:"get",
				dataType:"text",
				data:{
					tradeNo : no
				},
				success:function(result){
					alert(result);
				},
				error:function(xhr, status, error){
					alert(status + " : " + error);
				}
			});
		}
	}
</script>
<style type="text/css">
div.updateBtn {
	display: flex;
	margin: 10px 3px;
	justify-content: flex-end;
}

.card-header.bg-light {
	display: flex;
	justify-content: space-between;
}

.p-x1.bg-light.rounded-3.mt-3 {
    width: 40%;
    margin: 0 auto;
}

.d-md-flex.d-xl-inline-block.d-xxl-flex.align-items-center.justify-content-between.mb-x1 {
    margin-left: 15px;
    margin-top: 10px;
    margin-right: 15px
}

div#likeCountBox {
    margin-left: 15px;
}

div#explains {
    margin-left: 17px;
    width: 97%;
    padding-bottom: 40px;
}

div#heartBox a {
    text-decoration: none;
    color: white;
    background: #dd6e6e;
    padding: 3px 25px;
    border-radius: 4px;
}
</style>

<div class="content">
	<div class="card">
		<div class="card-header bg-light">
			<h2>${map["TITLE"] }</h2>
			<c:if test="${sessionScope.empNo == map['EMP_NO'] }">
				<div class="updateBtn">
					<a
						href="<c:url value='/market/editMarket?tradeNo=${map["TRADE_NO"]}'/>">
						<button class="btn btn-falcon-default btn-sm" type="button">
							<span class="fas fa-ban" data-fa-transform="shrink-2 down-1"></span>
							<span class="d-none d-md-inline-block ms-1">수정</span>
						</button>
					</a>
					<button onclick="delMarket(${map['TRADE_NO']})"
						class="btn btn-falcon-default btn-sm ms-2 d-none d-sm-block"
						type="button">
						<span class="fas fa-trash-alt" data-fa-transform="shrink-2 down-1"></span>
						<span class="d-none d-md-inline-block ms-1">삭제</span>
					</button>
				</div>
			</c:if>
			<c:if test="${sessionScope.empNo != map['EMP_NO'] }">
				<div class="updateBtn">
					<button onclick="boardReport(${map['TRADE_NO']})"
						class="btn btn-falcon-default btn-sm ms-2 d-none d-sm-block"
						type="button">
						<span class="fas fa-trash-alt" data-fa-transform="shrink-2 down-1"></span>
						<span class="d-none d-md-inline-block ms-1">게시글 신고</span>
					</button>
				</div>
			</c:if>
		</div>
		<input type="hidden" id="tradeNo" name="tradeNo" value="${map['TRADE_NO'] }">
		<div class="d-md-flex d-xl-inline-block d-xxl-flex align-items-center justify-content-between mb-x1">
			<div class="d-flex align-items-center gap-2">
				<div class="avatar avatar-2xl">
					<div class="avatar-name rounded-circle">
						<img src="<c:url value='/images/${map["IMAGE"]}'/>"
							class="avatar-name rounded-circle">
					</div>
				</div>
				<p class="mb-0">${map['NAME']}</p>
			</div>
			<p
				class="mb-0 fs--2 fs-sm--1 fw-semi-bold mt-2 mt-md-0 mt-xl-2 mt-xxl-0 ms-5">
				<fmt:formatDate value="${map['REGDATE']}" pattern="yyyy-MM-dd" />
				<span class="mx-1">|</span><span class="fst-italic"><fmt:formatDate
						value="${map['REGDATE']}" pattern="a h:mm" /></span>
			</p>
		</div>
		<div class="d-flex align-items-center gap-2"id = "likeCountBox">
			<div>
                
				<p class="fs--1 mb-1">
					♥ 좋아요 : <span id="showLike"><strong>${map["LIKECOUNT"]}</strong></span>
				</p>
			</div>
			<div>
				<p class="fs--1 mb-1">
					<span>조회수 : ${map["READCOUNT"] } </span>
				</p>
			</div>
			<div>
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
		<hr>
		<div class="cardfile">
		<input type="hidden" id="empNo" name="empNo" value="${map['EMP_NO']}">
			<c:forEach var="file" items="${file}" varStatus="loopStatus">
				<div class="p-x1 bg-light rounded-3 mt-3">
					<div class="row flex-between-center gx-4 gy-2">
						<img class="rounded-1 object-fit-cover h-100 w-100"
							src="<c:url value='/market/upload/${file.imageURL}'/>" alt="">
					</div>
				</div>
			</c:forEach>
		</div>
		<div class="col-lg-6" id = "explains">
			<h4 class="d-flex align-items-center">
				<span class="me-2"> 
					가격 : <fmt:formatNumber value="${map['PRICE'] }" pattern="#,###" />원
				</span>
				<span class="me-1 fs--1 text-500"> </span>
			</h4>

			
			<div class="row">
				<div class="col-auto px-2 px-md-3">
					<a class="btn btn-sm btn-primary"
						href="<c:url value='/message/messageWrite?empNo=${map["EMP_NO"]}'/>">
						<span class="fas fa-envelope-open"></span> <span
						class="d-none d-sm-inline-block">&nbsp&nbsp판매자에게 쪽지하기</span>
					</a>
				</div>
				<div class="col-auto px-2 px-md-3" id ="heartBox">
                	<a class="" href="#!" onclick="insertLikeOn(empNo, ${map['TRADE_NO']})">
                		<c:if test="${empty map['LIKEFLAG']}">
								<img id="heartimg" src="<c:url value='/images/배경지운빈하트.png'/>"
								width="30px" height="30px" > 좋아요
							</c:if>
							<c:if test="${map['LIKEFLAG'] =='N' }"> 
								<img id="heartimg" src="<c:url value='/images/배경지운빈하트.png'/>"
								width="30px" height="30px"> 좋아요
							</c:if>
							<c:if test="${map['LIKEFLAG'] =='Y' }">
								<img id="heartimg" src="<c:url value='/images/배경지운풀하트.png'/>"
								width="30px" height="30px" > 좋아요
							</c:if>
                		<span class="ms-2 d-none d-md-inline-block"></span>
               		</a>
               	</div>
				<div class="col-auto px-0">
				</div>
			</div>
			<div class="row">
				<div class="col-12">
					<div class="overflow-hidden mt-4">
						<ul class="nav nav-tabs" id="myTab" role="tablist">
							<li class="nav-item"><span class="nav-link active ps-0"
								id="description-tab" data-bs-toggle="tab"
								href="#tab-description" role="tab"
								aria-controls="tab-description" aria-selected="true">상품
									설명</span></li>
						</ul>
						<div class="tab-content" id="myTabContent">
							<div class="tab-pane fade show active" id="tab-description"
								role="tabpanel" aria-labelledby="description-tab">
								<div class="mt-3">

									<!-- 글 줄바꿈 처리  -->
									<% pageContext.setAttribute("newLine", "\r\n"); %>
									<c:set var="content"
										value="${fn:replace(map['DISCRIPTION'], newLine, '<br>')}" />
									${content}

								</div>
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<%@ include file="../inc/bottom.jsp"%>

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
<script
	src="https://polyfill.io/v3/polyfill.min.js?features=window.scroll"></script>
<script src="<c:url value='/vendors/list.js/list.min.js'/>"></script>
<script src="<c:url value='/assets/js/theme.js'/>"></script>