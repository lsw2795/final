<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>
<!DOCTYPE html>
<!-- 동호회 개설 
	-clubController
-->
<script type="text/javascript">
	$(function() {
		/* $("#memLimitflag").val('Y').prop("selected", true); 
		$("#memLimitflag").val('N').prop("selected", false); */

		$("#memLimitflag").change(function() {
			if ($("#memLimitflag").val() == "Y") {
				$("#memLimit").val("");
				$("#memLimit").css("visibility", "visible");
				$("#memLimit").focus();
			}else {
				$("#memLimit").val(0);
				$("#memLimit").css("visibility", "hidden");
			}
		});
		
		$('form[name=createFrm]').submit(function() {
			
			if($('#manager').val().length<1){
				alert('동호회장(Manager)을 입력해주세요.');
				$('#manager').focus();
				return false;
			}
			
			if($('#title').val().length<1){
				alert('동호회 제목(Title)을 입력해주세요.');
				$('#title').focus();
				return false;
			}
			
			if($('#introduce').val().length<1){
				alert('동호회 소개(Introduce)를 입력해주세요.');
				$('#introduce').focus();
				return false;
			}
			
			if($("#memLimit").val().length<1){
				alert('모집 인원을 입력해주세요.');
				$('#memLimit').focus();
				return false;
			}
			
			 if($('#secflag').val().length<1){
				alert('동호회 공개여부를 선택해주세요.');
				$('#secflag').focus();
				return false;
			} 
		});
	});
</script>
<html data-bs-theme="light" lang="en-US" dir="ltr">

  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">


    <!-- ===============================================-->
    <!--    Document Title-->
    <!-- ===============================================-->
    <title>create CLUB</title>

 
  	<body>
		<form name="createFrm" action="<c:url value='/club/createClub'/>" method="post">
          <div class="card mb-3">
            <div class="card-body">
              <div class="row flex-between-center">
                <div class="col-md">
                  <h5 class="mb-2 mb-md-0">동호회 개설</h5>
                </div>
                <div class="col-auto">
		          	<a href="<c:url value='/club/clubList'/>">
			          <button class="btn btn-falcon-default btn-sm"type="button">
		          		<span class="fas fa-arrow-left"></span>
			          </button>
		          	</a>
                  <button class="btn btn-primary btn-sm me-2" type="submit">저장</button>
                </div>
              </div>
            </div>
          </div>
          <div class="row g-0">
              <div class="card mb-3">
                <div class="card-body bg-light">
                    <div class="row gx-2">
                    <div class="col-sm-9 mb-3">
                        <label class="form-label" for="managr"><strong>동호회장</strong></label>
                        <input class="form-control" id="manager" name="manager"  type="text" placeholder="Manager" />
                      </div>
                      <div class="col-sm-4 mb-3">
                      <label class="col-auto" style="font-weight: bold;font-size: 0.9em" for="memLimitflag">모집인원 제한</label>
			              <div class="col-auto">
			                   <select class="form-select form-select" name="memLimitflag" id="memLimitflag">
			                        <option value="Y">제한</option>
			                        <option value="N">제한없음</option>
			                   </select>
			              </div>
			          </div>
                      <div class="col-sm-4 mb-3">
                        <label class="form-label" for="memLimit"><strong>모집 회원 수</strong></label>
                        <input class="form-control" id="memLimit" name="memLimit" type="text"/>
                      </div>
                      <div class="col-12 mb-3">
                        <label class="form-label" for="title"><strong>동호회 이름</strong></label>
                        <input class="form-control" id="title" name="title" type="text" placeholder="Club Title" />
                      </div>
                      <div class="col-12 mb-3">
                        <label class="form-label" for="introduce"><strong>동호회 소개</strong></label>
                        <textarea class="form-control" id="introduce" name="introduce" type="textarea" placeholder="Introduce"
                        	style="height:300px"></textarea>	
                      </div>
                      <div class="col-sm-6 mb-3">
                        <label class="form-label" for="secflag"><strong>공개 여부</strong></label>
                        <select class="form-select form-select-sm" name="secflag" id="secflag">
                          <option value="Y">공개</option>
                          <option value="N">비공개</option>
                        </select>
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
              <div class="row row flex-between-center">
              <div class="col-md">
                <h5 class="mb-2 mb-md-0"></h5>
              </div>
                <div class="col-auto">
                  <button class="btn btn-primary btn-sm me-2" type="submit">저장</button>
                </div>
                <div class="col-md">
                  <h5 class="mb-2 mb-md-0"></h5>
                </div>
              </div>
            </div>
          </div>
	</form>
 </body>
</html>
    
<%@ include file="../inc/bottom.jsp" %>