<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>
<!DOCTYPE html>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript">

	function requestPay() {
			
		var IMP = window.IMP;
		IMP.init('imp73002547');
		
		IMP.request_pay({
		    pg : 'kakaopay',
		    pay_method : 'card', //카드결제
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : '동호회 가입 및 회비 결제',
		    amount : 10000, //판매가격
		    buyer_email : 'rlacodud4456@naver.com',
		    buyer_name : '차은우',
		    buyer_tel : '010-2222-2222',
		    buyer_addr : '서울',
		    buyer_postcode : '110-888'
		   // m_redirect_url: "{http://localhost:9091/gw/club/clubDetail?clubNo=27}"
		}, function(rsp) { //call back
		    if ( rsp.success ) {
		    	//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
		    	jQuery.ajax({
		    		url: '/payments/complete', //cross-domain error가 발생하지 않도록 주의해주세요
		    		type: 'POST',
		    		dataType: 'json',
		    		data: {
			    		imp_uid : rsp.imp_uid
			    		//기타 필요한 데이터가 있으면 추가 전달
		    		}
		    	}).done(function(data) {
		    		//[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
		    		if ( everythings_fine ) {
		    			var msg = '결제가 완료되었습니다.';
		    			msg += '\n고유ID : ' + rsp.imp_uid;
		    			msg += '\n상점 거래ID : ' + rsp.merchant_uid;
		    			msg += '\결제 금액 : ' + rsp.paid_amount;
		    			msg += '카드 승인번호 : ' + rsp.apply_num;
		    			alert(msg);
		    		} else {
		    			//[3] 아직 제대로 결제가 되지 않았습니다.
		    			//[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
		    		}
		    	});
		        
		    } else {
		        var msg = '결제에 실패하였습니다.';
		        msg += '\nerror : ' + rsp.error_msg;
		        //location.href="/club/clubDetail?clubNo=${param.clubNo }"+rsp.error_msg;
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

<html data-bs-theme="light" lang="en-US" dir="ltr">

  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">


    <!-- ===============================================-->
    <!--    Document Title-->
    <!-- ===============================================-->
    <title>Introduce CLUB</title>

 
  	<body>
		<form name="detailFrm" action="" method="">
          <div class="card mb-3">
            <div class="card-body">
              <div class="row flex-between-center">
                <div class="col-md">
                  <h5 class="mb-2 mb-md-0">동호회 소개</h5>
                </div>
                <div class="col-auto">
              		<button class="btn btn-falcon-default btn-sm mx-2"type="button"><a href="<c:url value='/club/clubList'/>"><span class="fas fa-arrow-left"></span></a></button>
	                <!-- 로그인한 사원과 게시글 작성자와 같을 경우에만 수정,삭제 버튼이 보임  -->
                  	<c:if test="${sessionScope.empNo==clubVo.empNo}">
	                  	<a href="<c:url value='/club/clubEdit?clubNo=${clubVo.clubNo }'/>">
	                  		<button class="btn btn-falcon-default btn-sm" id="edit" type="button">
	                  			<span class="fas fa-pen" ></span>
	                  		</button>
	                  	</a>
	                  	<button onclick="deleteClub()" class="btn btn-falcon-default btn-sm mx-2" type="button">
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
                        <label class="form-label" for="managr">동호회장</label>
                        <input class="form-control" id="manager" name="manager"  type="text" value="${clubVo.manager }" disabled/>
                      </div>
                      <div class="col-sm-4 mb-3">
                        <label class="form-label" for="memberCnt">모집 회원 수</label>
                        <input class="form-control" id="memberCnt" name="memLimit" type="text" value="${clubVo.memLimit }" disabled/>
                      </div>
                      <div class="col-12 mb-3">
                        <label class="form-label" for="title">동호희 이름</label>
                        <input class="form-control" id="title" name="title" type="text" value="${clubVo.title}" disabled/>
                      </div>
                      <div class="col-12 mb-3">
                        <label class="form-label" for="introduce">동호회 소개</label>
                        <textarea class="form-control" id="introduce" name="introduce" type="textarea" placeholder="Introduce"
                        	style="height:300px" disabled>${clubVo.introduce}</textarea>	
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
	                  <button class="btn btn-sm btn-primary me-2" id="payment" name="payment" onclick="requestPay()" type="button">가입</button>
	                  <button class="btn btn-falcon-default btn-sm me-2" type="submit">
	                  	<a href="<c:url value='/club/clubBoard?clubNo=${param.clubNo }'/>">게시판 바로가기</a>
	                  </button>
                	</div>
	               </div>
              </div>
            </div>
	              </div>
	            </div>
          </div>
	</form>
    
    </body>
    </html>
    
<%@ include file="../inc/bottom.jsp" %>