<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<!DOCTYPE html>
<!-- 동호회 상세보기 
	-clubController
-->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript"
	src="<c:url value='/js/jquery-3.7.0.min.js'/>"></script>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<link rel="stylesheet" href="<c:url value='/css/clubModal.css'/>">
<script type="text/javascript">
	
	//온라인 결제(카카오 페이)
	function kakaopay() {
			
		var IMP = window.IMP;
		IMP.init('imp73002547');
		
		IMP.request_pay({
		    pg : 'kakaopay',
		    pay_method : 'card', 
		    merchant_uid : ${param.clubNo}+"_"+${param.empNo} + new Date().getTime(),
		    name : "${clubVo.title}"+"동호회 가입 및 회비 결제",
		    amount : 10000, //판매가격
		    custom_data:{
		    	//emp_no : ${param.empNo},
		    	buyer_emp_no : ${sessionScope.empNo},
		    	club_no : ${param.clubNo}
		    }
		},
		   // m_redirect_url: "{http://localhost:9091/gw/club/clubDetail?clubNo=27}"
	   function(rsp) { //call back
           console.log("rsp"+rsp);
	    if ( rsp.success ) {
	    	console.log("rsp.cd"+rsp.custom_data);
               console.log("rsp2"+rsp);
	    	var msg = "결제 완료! 가입 되었습니다.";
	    	//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
	    	$.ajax({
	    		url: "<c:url value='/club/ajaxPaymentClub'/>", //cross-domain error가 발생하지 않도록 주의해주세요
	    		type: "get",
	    		data: rsp,
	    		success: function (rsp) {
	    			console.log(rsp);
	    			location.href="<c:url value='/club/clubDetail?clubNo=${param.clubNo}'/>";
     	            },
     	            error:function(xhr,status,error){
     	                alert("Error : "+error);
     	            } 
	    	});//ajax
	        
	    } else {
	    	console.log("failed"+rsp);
	        var msg = '결제에 실패하였습니다.';
	        msg += '\nerror : ' + rsp.error_msg;
	        //location.href="/club/clubBoard?clubNo=${param.clubNo }"+rsp.error_msg;
	    }
	        alert(msg);
		});
	} 
	
	//동호회 삭제
	function deleteClub() {
		if(confirm("동호회를 삭제하시겠습니까?")){
			location.href = "<c:url value='/club/deleteClub?clubNo=${param.clubNo}'/>"
		}
	}
</script>



<!-- ===============================================-->
<!--    Document Title-->
<!-- ===============================================-->
<title>Payment Club</title>
<body>
	<form name="detailFrm" action="">
		<div class="card mb-3">
			<div class="card-body">
				<div class="row flex-between-center">
					<div class="col-md">
						<h5 class="mb-2 mb-md-0">동호회 소개</h5>
					</div>
					<div class="col-auto">
					<a href="<c:url value='/club/clubList'/>">
						<button class="btn btn-falcon-default btn-sm mx-2" type="button">
								<span class="fas fa-arrow-left"></span> 
						</button>
					</a>
						<!-- 로그인한 사원과 게시글 작성자와 같을 경우에만 수정,삭제 버튼이 보임  -->
						<c:if test="${sessionScope.empNo==clubVo.empNo}">
							<a
								href="<c:url value='/club/clubEdit?clubNo=${clubVo.clubNo }'/>">
								<button class="btn btn-falcon-default btn-sm" id="edit"
									type="button">
									<span class="fas fa-pen"></span>
								</button>
							</a>
							<button onclick="deleteClub()"
								class="btn btn-falcon-default btn-sm" type="button">
								<span class="fas fa-trash-alt"></span>
							</button>
						</c:if>
					</div>
				</div>
			</div>
		</div>
		<div class="row g-0">
			<div class="card mb-3">
				<div class="card-body bg-light">
					<input type="hidden" name="clubNo" id="clubNo" value="${param.clubNo}">
					<input type="hidden" name="register" id="register" value="${register}">
					<div class="row gx-2">
						<div class="col-sm-6 mb-3">
							<span><strong>동호회장</strong></span><br> <br>
							${clubVo.manager}
							<div class="col-12">
								<div class="border-bottom border-dashed my-2"></div>
							</div>
						</div>
						<div class="col-sm-4 mb-3">
							<span><strong>모집 회원 수</strong></span><br>
							<br>
							 ${clubCnt} <strong>/</strong> ${clubVo.memLimit }
						</div>
						<div class="col-12 mb-3">
							<span><strong>동호희 이름</strong></span><br> ${clubVo.title}
							<div class="col-12">
								<div class="border-bottom border-dashed my-2"></div>
							</div>
						</div>
						<div class="col-12 mb-3">
							<span><strong>동호회 소개</strong></span><br> <br>
							<!-- 글 줄바꿈 처리  -->
							<%pageContext.setAttribute("newLine", "\r\n");%>
							<c:set var="content"
								value="${fn:replace(clubVo.introduce, newLine, '<br>')}" />
							${content}
						</div>
						<div class="col-12">
							<div class="border-bottom border-dashed my-3"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="card mb-3">
			<div class="card-body">
				<div class="row flex-between-center">
					<div class="col-md">
						<h5 class="mb-2 mb-md-0"></h5>
					</div>
					<div class="col-auto mb-0">
						<div class="col-auto">
						<c:if test="${sessionScope.clubNo!=clubVo.clubNo and clubVo.memLimit>clubCnt
                            and register<1}">
                            <button class="btn btn-sm btn-primary me-2"
                                data-bs-target="#paymentModal" data-bs-toggle="modal"
                                name="paymentModal" type="button">가입</button>
                        </c:if>
							<button class="btn btn-falcon-default btn-sm me-2" type="button">
								<a href="<c:url value='/club/clubBoard?clubNo=${param.clubNo }'/>">
									게시판 바로가기 </a>
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>


	<!-- ********************************모달 시작****************************** -->
	<div class="modal fade" id="paymentModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="exampleModalLabel">
						<h5><strong>${clubVo.title} 가입</strong></h5>
					</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<span>동호회 가입 비용은 10,000원입니다.</span><br><br> 
					<h8><strong>카카오 페이 결제만 가능합니다.</strong></h8><br> 
					<a href="#" onclick="kakaopay()"> 
						<img width="100" src="<c:url value='/kakaopay.jpg'/>">
					</a>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
				</div>
			</div>
		</div>
	</div>
	<!-- ****************************모달 끝 *******************************-->

</body>
<style>
/* 모달 스타일 */
.modal-content{
	text-align: center;
}
.modal-header{
	background: #FFEC4A;
}
.modal-body a img{
	margin-top: 20px;
}
</style>
<%@ include file="../inc/bottom.jsp"%>
