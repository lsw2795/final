<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>modalReservation</title>
</head>
	<!-- ===============================================-->
	<!--    Stylesheets-->
	<!-- ===============================================-->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,500,600,700%7cPoppins:300,400,500,600,700,800,900&amp;display=swap" rel="stylesheet">
    <link href="<c:url value='/vendors/simplebar/simplebar.min.css'/>" rel="stylesheet">
    <link href="<c:url value='/scss/theme/_reboot.scss'/>" rel = "stylesheet">
    <link href="<c:url value='/assets/css/theme-rtl.css'/>" rel="stylesheet" id="style-rtl">
    <link href="<c:url value='/assets/css/theme.css'/>" rel="stylesheet" id="style-default">
    <link href="<c:url value='/assets/css/user-rtl.css'/>" rel="stylesheet" id="user-style-rtl">
    <link href="<c:url value='/assets/css/user.css'/>" rel="stylesheet" id="user-style-default">
<style type="text/css">
	.content {
	    padding-bottom: 3.9875rem;
	    padding: 20px;
	}
	
	.card-body label {
	    font-size: 17px;
	    font-weight: bold;
	    margin-top: 10px;
	}
	
	button#addReservation {
    	margin-right: 20px;
	}
</style>  
<script type="text/javascript" src = "<c:url value='/js/jquery-3.7.0.min.js'/>"></script>
<script type="text/javascript">
	
	function getDateFromQueryString() {
	    const queryString = window.location.search;
	    const urlParams = new URLSearchParams(queryString);
	    return urlParams.get('date');
	}
	
	$(function(){
		
		 const date = getDateFromQueryString();
		    if (date) {
		        $('#bookDate').val(date);
		    }
		    
		    
		$('#meetingRoomBox').hide();
   		$('#noteBookBox').hide();
   		$('#rentCarBox').hide();
   		
		$('#category').change(function(){
			 var selectedCategory = $('#category option:selected').val();
				console.log(selectedCategory);
			 	
			 	if(selectedCategory.length<1){
					 $('#meetingRoomBox').hide();
					 $('#noteBookBox').hide();
					 $('#rentCarBox').hide();
				 }else if(selectedCategory === 'meetingRoom'){
					 $('#meetingRoomBox').show();
					 $('#noteBookBox').hide();
					 $('#rentCarBox').hide();
				 }else if(selectedCategory === 'noteBook'){
					 $('#meetingRoomBox').hide();
					 $('#noteBookBox').show();
					 $('#rentCarBox').hide();
				 }else if(selectedCategory === 'rentCar'){
					 $('#meetingRoomBox').hide();
					 $('#noteBookBox').hide();
					 $('#rentCarBox').show();
				 }
		 	});
   		
   		$("#addReservation").on("click",function(){  // modal의 추가 버튼 클릭 시
        	var currentDate = new Date();
        	var bookDateStr = $("#bookDate").val(); // 예: "2023-09-01"
        	var startTimeNumber = parseInt($("#startTime").val()); // 예: 9

        	console.log("Book Date String:", bookDateStr);
        	console.log("Start Time Number:", startTimeNumber);

        	// 시간을 올바른 형식으로 변환 (09:00:00 형태로)
        	var startTimeStr = startTimeNumber < 10 ? "0" + startTimeNumber + ":00:00" : startTimeNumber + ":00:00";

        	console.log("Start Time String:", startTimeStr);

        	// VARCHAR2 형식의 날짜와 NUMBER 형식의 시간을 조합
        	var isoDateTime = bookDateStr + "T" + startTimeStr;

        	console.log("ISO DateTime:", isoDateTime);

        	var bookDate = new Date(isoDateTime);

        	console.log("Book Date:", bookDate);

        	
            var endtime = parseInt($('#endtime').val());
            
            var selectedCategory = $('#category').val();
            var selectedResource = "";
            var checkResult = $('#checkResult').val();
   			 
   		 	if(selectedCategory === 'meetingRoom') {
   		 		selectedResource = $('#meetingRoom').val();
   	        }else if(selectedCategory === 'noteBook') {
   	        	selectedResource = $('#noteBook').val();
   	        }else if (selectedCategory === 'rentCar') {
   	        	selectedResource = $('#rentCar').val();
   	        }

   	        console.log(selectedResource);
   	        $('#hiddenRemanNo').val(selectedResource);
   	        
            if(selectedCategory == null || selectedCategory == ""){
            	alert("자원 종류를 선택해주세요.");
            	return false;
            }else if(selectedResource == null || selectedResource == ""){
				alert("자원을 선택해주세요.");  
				return false;
            }else if(bookDate == null || bookDate == ""){
            	alert("예약 날짜가 없습니다.");
            	return false;
            }else if (isNaN(bookDate.getTime())) {
        	    alert("올바른 날짜 및 시간 형식이 아닙니다.");
        	    return false;
        	}else if (bookDate.getTime() < currentDate.getTime()) {
        	    alert("과거 시간을 선택할 수 없습니다.");
        	    return false;
        	}else if(startTime == null || startTime == ""){
            	alert("예약 시작 시간을 선택해주세요.");
            	return false;
            }else if(endtime == null || endtime == ""){
            	alert("예약 종료 시간을 선택해주세요.");
            	return false;
            }else if(checkResult === 'N'){
            	alert("예약 가능 여부를 확인해주세요.");
            	return false;
            }else if(checkResult === 'A'){
            	alert("예약 가능한 자원을 선택하세요.");
            	return false;
            }else{
            	var obj = {
            			"title" : selectedResource,
            			"start" : bookDate
            	}
            	console.log(obj);
            	
            	$('#addReservationForm').submit();
            }
        });
   		
   		$('#checkTime').click(function(){
			var selectedCategory = $('#category').val();
	        var selectedResource = "";
	        var checkResult = $('#checkResult').val();
				 
			 	if(selectedCategory === 'meetingRoom') {
			 		selectedResource = $('#meetingRoom').val();
		        }else if(selectedCategory === 'noteBook') {
		        	selectedResource = $('#noteBook').val();
		        }else if (selectedCategory === 'rentCar') {
		        	selectedResource = $('#rentCar').val();
		        }
		 	var startTime = $('#startTime').val();
			var endTime = $('#endtime').val();
			if(startTime.length < 1){
				alert("시작시간을 선택해주세요.");
				return false;
			}else if(endTime.length < 1){
				alert("종료시간을 선택해주세요.");
				return false;
			}
			$.ajax({
				url : "<c:url value='/reservation/ajaxCheckBook'/>",
				type: "get",
				dataType : "JSON",
				data : {startTime : $('#startTime').val(),
						endTime : $('#endtime').val(),
						remanNo : selectedResource,
						bookDate : $('#bookDate').val()},
				success:function(result){
					$('#message').text("");
					$('#bookOk').text("");
					if(result == 1){
						$('#message').text("예약이 존재합니다.");
						$('#checkResult').val('A');
						event.preventDefault();
					}else if(result ==2){
						$('#bookOk').text("예약 가능합니다.");
						$('#checkResult').val('Y');
					}else if(result == 3){
						$('#message').text("관리자에게 문의하세요.");
						$('#checkResult').val('A');
					}else if(result == 4){
						$('#message').text("자원에 이상이 있습니다.");
						$('#checkResult').val('A');
					}
				},
				error:function(xhr, status, error){
					alert(status + " : " + error);
				}
			});
		});
   		$('#addReservationForm').submit(function(event){
   		 	event.preventDefault(); // 기본 제출 동작 방지
   			
   		 $.ajax({
   	        url: $("#addReservationForm").attr("action"), // 제출할 URL
   	        type: "POST", // 또는 "GET" 등 HTTP 메서드 선택
   	        data: $("#addReservationForm").serialize(), // 폼 데이터 직렬화
   	        success: function (response) {
   	            // 서버로의 제출이 성공한 경우에만 아래 코드 실행
   	            // 자식 창 닫기
   	            window.close();

   	            // 부모 창 새로 고치기
   	            opener.location.reload();
   	        },
   	        error: function (xhr, status, error) {
   	            // 서버로의 제출이 실패한 경우에 대한 처리
   	            console.error("서버 제출 실패:", status, error);
   	        }
   	    });
   		});
   		
   		$('#sprintSettingModalClose').click(function(){
   			self.close();
   		});
	});
</script>
<body>
	<div class="col-12 mb-3" id="reservationModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="content" role="document">
        <form id = "addReservationForm" autocomplete="on" action="<c:url value='/reservation/addReservation'/>" method = "post" >
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel"></h5>
                </div>

                <div class="card-body">
                    <div class="col-12 mb-3">
                    	<label class="col-form-label" for="product-name"> 자원 종류</label> 
						<select class="form-select" aria-label="Default select example" id = "category" name = "category" style="width:40%">
							<option value="">선택하세요.</option>
							<option value="meetingRoom">회의실</option>
							<option value="noteBook">노트북</option>
							<option value="rentCar">차량</option>
						</select>
						<div id = "meetingRoomBox">
						<label class="col-form-label" for="product-name" >자원</label>
						<select class="form-select" aria-label="Default select example" id = "meetingRoom" style="width:55%">
							<option value="" disabled> 선택하세요.</option>
						<c:forEach var = "mr" items="${meetingRoom }"> 
							<option value="${mr.remanNo}">${mr.name }</option>
						</c:forEach>
						</select>
						</div>
						
						<div id = "noteBookBox">
						<label class="form-label" for="product-name" >자원</label>
						<select class="form-select" aria-label="Default select example" id = "noteBook" style="width:55%">
							<option value="" disabled> 선택하세요.</option>
						<c:forEach var = "nb" items="${noteBook }"> 
							<option value="${nb.remanNo }">${nb.name }</option>
						</c:forEach>
						</select>
						</div>
						<div id = "rentCarBox">
						<label class="form-label" for="product-name" >자원</label>
						<select class="form-select" aria-label="Default select example" id = "rentCar" style="width:55%">
							<option value="" disabled> 선택하세요.</option>
						<c:forEach var = "rc" items="${rentCar }"> 
							<option value="${rc.remanNo }">${rc.name }</option>
						</c:forEach>
						</select>
						</div>
						<div class="divDay">
                  			<div class = "mb-3">
                  			  <input type="hidden" id="hiddenRemanNo" name="remanNo">
		                  	  <label class="fs-0" for="eventStartDate">예약 날짜</label>
		                   	  <input class="form-control datetimepicker" id="bookDate" type="date" required="required" name="bookDate"  data-options='{"static":"true","enableTime":"true","dateFormat":"Y-m-d H:i"}' />
		                  	</div>
		                  </div>
		                  <div class="divDay">
	                  		<div class = "mb-3" >
	                  		<label class="form-label" for="product-name">시작 시간</label> 
							<select class="form-select" aria-label="Default select example" id = "startTime" name = "startTime">
								<option value="" >선택하세요.</option>
								<c:forEach var="i" begin="9" end = "18" step="1">
								<option value="${i }">${i } :00</option>
								</c:forEach>
							</select>
	                  	</div>
	                  	<div class = "mb-3" id = "setEndtime">
		                   <label class="form-label" for="product-name">종료 시간</label> 
							<select class="form-select" aria-label="Default select example" id = "endtime" name = "endTime">
								<option value="" >선택하세요.</option>
								<c:forEach var="i" begin="9" end = "18" step="1">
								<option value="${i }">${i } :00</option>
								</c:forEach>
							</select>
	                  	</div>
	                  	<input type="button" class="btn btn-secondary" id="checkTime" value = "예약 가능 여부 확인">
	                  	<input type = "hidden" id = "checkResult" value="N">
	                  	</div>
	                  	 <div id = "message"></div>
	                	 <div id = "bookOk"></div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary px-4" id="addReservation">등록</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal" id="sprintSettingModalClose">취소</button>
                </div>
    
            </div>
            </form>
        </div>
    </div>
</body>
</html>