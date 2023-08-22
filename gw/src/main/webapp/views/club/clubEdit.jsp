<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>
<!DOCTYPE html>
<script type="text/javascript">
	
	$(function() {
		$("#memLimitflag").val('Y').prop("selected", true); 
		$("#memLimitflag").val('N').prop("selected", false);
	});
	
	function deleteClub() {
		
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
		<form name="editFrm" method="post" action="<c:url value='/club/clubEdit/>">
          <div class="card mb-3">
            <div class="card-body">
              <div class="row flex-between-center">
                <div class="col-md">
                  <h5 class="mb-2 mb-md-0">동호회 수정</h5>
                </div>
                <div class="col-auto">
              		<button class="btn btn-falcon-default btn-sm" type="button"><a href="<c:url value='/club/clubList'/>"><span class="fas fa-arrow-left"></span></a></button>
	                <button class="btn btn-falcon-default btn-sm me-2" type="submit">저장</button>
	                <button onclick="deleteClub()" class="btn btn-falcon-default btn-sm mx-2" type="button">
			           <span class="fas fa-trash-alt"></span>
		            </button>
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
                        <input class="form-control" id="manager" name="manager"  type="text" value="${vo.manager }"/>
                      </div>
                      <div class="col-sm-4 mb-3">
                        <label class="form-label" for="memberCnt">모집 회원 수</label>
                        <input class="form-control" id="memberCnt" name="memLimit" type="text" value="${vo.memLimit }"/>
                      </div>
                      <div class="col-12 mb-3">
                        <label class="form-label" for="title">동호희 이름</label>
                        <input class="form-control" id="title" name="title" type="text" value="${vo.title}"/>
                      </div>
                      <div class="col-12 mb-3">
                        <label class="form-label" for="introduce">동호회 소개</label>
                        <input class="form-control" id="introduce" name="introduce" type="text" value="${vo.introduce}"/>
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
	                  <button class="btn btn-sm btn-primary me-2" id="payment" onclick="requestPay()" type="button">가입</button>
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