<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>
<!DOCTYPE html>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
 <script type="text/javascript" src="<c:url value='/js/jquery-3.7.0.min.js'/>"></script>
<link rel="stylesheet" href="<c:url value='/css/club.css'/>">
<script type="text/javascript">
	var popup=document.getElementById('paymentModal');
	var modal = document.getElementById('popupModal');
	var closeBtn = document.getElementById('closeBtn');
	
	function madalShow() {
		document.querySelector(".background").className = "background show";
	}
	
	function close() {
	    document.querySelector(".background").className = "background";
	}
	
	document.querySelector("#paymentModal").addEventListener("click", show);
    document.querySelector("#close").addEventListener("click", close);
	
	
	
	
	function kakaopay() {
			
		var IMP = window.IMP;
		IMP.init('imp73002547');
		
		IMP.request_pay({
		    pg : 'kakaopay',
		    pay_method : 'card', 
		    merchant_uid : ${param.clubNo}+"_"+${param.empNo} + new Date().getTime(),
		    name : ${clubVo.title}+"동호회 가입 및 회비 결제",
		    amount : 10000, //판매가격
		    custom_data{
		    	emp_no : ${param.empNo}
		    	club_no : ${param.clubNo}
		    }
		    buyer_emp_no : ${sessionScope.empNo},
		    buyer_name : name,
		    buyer_tel : hp,
		    buyer_addr : address,
		    buyer_postcode : zipcode
		   // m_redirect_url: "{http://localhost:9091/gw/club/clubDetail?clubNo=27}"
		}, function(rsp) { //call back
		    if ( rsp.success ) {
		    	console.log(rsp.custom_data);
                console.log(rsp);
		    	var msg = "결제 완료! 가입 되었습니다.";
		    	//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
		    	$.ajax({
		    		url: "<c:url value='/club/ajaxPaymentClub'/>", //cross-domain error가 발생하지 않도록 주의해주세요
		    		type: "get",
		    		dataType: "json",
		    		data: rsp
		    		success: function (rsp) {
		    			console.log(rsp);
		    			location.href="<c:url value='/club/clubDetail?clubNo=${param.clubNo}'/>";
      	            },
      	            error:function(xhr,status,error){
      	                alert("Error : "+error);
      	            } 
		    	});//ajax
		        
		    } else {
		        var msg = '결제에 실패하였습니다.';
		        msg += '\nerror : ' + rsp.error_msg;
		        //location.href="/club/clubBoard?clubNo=${param.clubNo }"+rsp.error_msg;
		    }
		        alert(msg);
		});
	}
	
	$(function() {
		$("#memLimitflag").val('Y').prop("selected", true); 
		$("#memLimitflag").val('N').prop("selected", false);
	});
	
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
		<form name="detailFrm" action="" >
          <div class="card mb-3">
            <div class="card-body">
              <div class="row flex-between-center">
                <div class="col-md">
                  <h5 class="mb-2 mb-md-0">동호회 소개</h5>
                </div>
                <div class="col-auto">
              		<button class="btn btn-falcon-default btn-sm mx-2"type="button">
              		<a href="<c:url value='/club/clubList'/>"><span class="fas fa-arrow-left"></span>
              		</a></button>
	                <!-- 로그인한 사원과 게시글 작성자와 같을 경우에만 수정,삭제 버튼이 보임  -->
                  	<c:if test="${sessionScope.empNo==clubVo.empNo}">
	                  	<a href="<c:url value='/club/clubEdit?clubNo=${clubVo.clubNo }'/>">
	                  		<button class="btn btn-falcon-default btn-sm" id="edit" type="button">
	                  			<span class="fas fa-pen" ></span>
	                  		</button>
	                  	</a>
	                  	<button onclick="deleteClub()" class="btn btn-falcon-default btn-sm" type="button">
				           	<span class="fas fa-trash-alt"></span>
			            </button>
                  	</c:if>
                </div>
              </div>
            </div>
          </div>
          <div class="row g-0">
              <div class="card mb-3">
                <div class="card-header">
                  <h5 class="mb-0">Introduce Club</h5>
                </div>
                <div class="card-body bg-light">
                	<input type="hidden" name="clubNo" id="clubNo" value="${param.clubNo}">
                    <div class="row gx-2">
                    <div class="col-sm-6 mb-3">
                        <span><strong>동호회장</strong></span><br><br>
                        ${clubVo.manager }
                        <div class="col-12">
	                        <div class="border-bottom border-dashed my-2"></div>
	                   	</div>
                    </div>
                      <div class="col-sm-4 mb-3">
                        <span><strong>모집 회원 수</strong></span><br><br>
                        ${clubVo.memLimit }
	                    <div class="col-12">
	                        <div class="border-bottom border-dashed my-2"></div>
	                   	</div>
                      </div>
                      <div class="col-12 mb-3">
                        <span><strong>동호희 이름</strong></span><br>
                        ${clubVo.title}
	                      <div class="col-12">
		                        <div class="border-bottom border-dashed my-2"></div>
		                   	</div>
                      </div>
                      <div class="col-12 mb-3">
                        <span><strong>동호회 소개</strong></span><br><br>
                        <!-- 글 줄바꿈 처리  -->
		                  <% pageContext.setAttribute("newLine", "\r\n"); %>
		            	  <c:set var="content" value="${fn:replace(clubVo.introduce, newLine, '<br>')}" />
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
		                  <button class="btn btn-sm btn-primary me-2" onclick="madalShow()" id="paymentModal" name="paymentModal" type="button">가입</button>
		                  <button class="btn btn-falcon-default btn-sm me-2" type="button">
			                  <a href="<c:url value='/club/clubBoard?clubNo=${param.clubNo }'/>">
		                  		게시판 바로가기
	                	  	  </a>	
		                  </button>
                	</div>
	               </div>
              </div>
            </div>
	              </div>
	</form>
	
    <!-- ********************************모달 시작****************************** -->
<div class="modal fade" id="staticBackdrop1" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel1" aria-hidden="true">
  <div class="background">
    <div class="window">
      <div class="modal-header admindefault">
        <h5 class="modal-title fs-2 admindefault" align="center" id="staticBackdropLabel1">${clubVo.title} 가입</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
     <div class="popup">  <!-- 실제 팝업창 -->
   		<div class="row flex-between-center">
			<h5>카카오 페이 결제만 가능합니다.</h5><span>동호회 가입 비용은 10,000원입니다.</span>
		</div>
		<div>
          	<div>
          		<a href="#" onclick="kakaopay()">
					<img width="30" src="<c:url value='/kakaopay.jpg'/>">
				</a>
			</div>
			<div>
				<button class="btn btn-sm btn-falcon-default me-2" id="closeBtn" name="closeBtn" type="button">취소</button>
			</div>
        </div>
		
   	</div>
   </div>
      <div class="modal-footer admindefault">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
      </div>
    </div>
  </div>
   <!-- ****************************모달 끝 *******************************-->
   
</body>
<%@ include file="../inc/bottom.jsp" %>
    