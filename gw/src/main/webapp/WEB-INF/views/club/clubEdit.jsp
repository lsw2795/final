<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>
<!DOCTYPE html>
<!-- 동호회 수정 
	-clubController
-->
<script type="text/javascript">
	
	$(function() {
		$("#memLimitflag").change(function() {
			if ($("#memLimitflag").val() == "Y") {
				$("#memLimit").val("");
				$("#memLimit").css("visibility", "visible");
				$("#memLimit").focus();
			}else {
				$("#memLimit").css("visibility", "hidden");
			}
		});
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
		<form name="ClubEditFrm" method="post" action="<c:url value='/club/clubEdit'/>">
          <div class="card mb-3">
            <div class="card-body">
              <div class="row flex-between-center">
                <div class="col-md">
                  <h5 class="mb-2 mb-md-0">동호회 수정</h5>
                </div>
                <div class="col-auto">
              		<button class="btn btn-falcon-default btn-sm" type="button"><a href="<c:url value='/club/clubDetail?clubNo=${param.clubNo }'/>"><span class="fas fa-arrow-left"></span></a></button>
	                <button class="btn btn-falcon-default btn-sm me-2" type="submit">저장</button>
	                <button onclick="deleteClub()" class="btn btn-falcon-default btn-sm" type="button">
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
                    <div class="col-sm-9 mb-3">
                        <label class="form-label" for="managr"><strong>동호회장</strong></label>
                        <input class="form-control" id="manager" name="manager"  type="text" value="${vo.manager }"/>
                      </div>
                      <div class="col-sm-4 mb-3">
                      <label class="col-auto" style="font-weight: bold;font-size: 0.9em" for="memLimitflag"><strong>모집인원 제한</strong></label>
			              <div class="col-auto">
			                   <select class="form-select form-select" name="memLimitflag" id="memLimitflag">
			                        <option value="Y">제한</option>
			                        <option value="N">제한없음</option>
			                   </select>
			              </div>
			          </div>
                      <div class="col-sm-4 mb-3">
                        <label class="form-label" for="memLimit"><strong>모집 회원 수</strong></label>
                        <input class="form-control" id="memLimit" name="memLimit" type="text" value="${vo.memLimit }"/>
                      </div>
                      <div class="col-12 mb-3">
                        <label class="form-label" for="title"><strong>동호희 이름</strong></label>
                        <input class="form-control" id="title" name="title" type="text" value="${vo.title}"/>
                      </div>
                      <div class="col-12 mb-3">
                        <label class="form-label" for="introduce"><strong>동호회 소개</strong></label>
                        <textarea class="form-control" id="introduce" name="introduce" type="textarea" placeholder="Introduce"
                        	 style="height:300px">${vo.introduce}
                        </textarea>
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
		                	<button class="btn btn-falcon-default btn-sm me-2" type="submit">저장</button>
		                	<button onclick="deleteClub()" class="btn btn-falcon-default btn-sm" type="button">
				           		<span class="fas fa-trash-alt"></span>
			            	</button>
	                	</div>
	               </div>
              </div>
            </div>
	      </div>
	</form>
  </body>
</html>
    
<%@ include file="../inc/bottom.jsp" %>