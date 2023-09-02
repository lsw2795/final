<%@page import="java.util.Map"%>
<%@page import="com.ez.gw.reservation.model.ReservationVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import = "java.util.List" %>
<%@ include file="../inc/top.jsp"%>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.css">

<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/locales-all.js"></script>
<script type="text/javascript">

	document.addEventListener('DOMContentLoaded', function() {
		var calendarEl = document.getElementById('calendar');
		var calendar = new FullCalendar.Calendar(calendarEl, {
			initialView : 'dayGridMonth', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
			locale : 'ko',//한국어 설정
			headerToolbar : { // 헤더에 표시할 툴 바
				start : 'prev next today',
				center : 'title',
				end : 'dayGridMonth,dayGridWeek,dayGridDay,addEventButton',
				},customButtons: {
                addEventButton: { // 추가한 버튼 설정
                    text : "자원 예약",  // 버튼 내용
                    click : function(){ // 버튼 클릭 시 이벤트 추가
                        $("#reservationModal").modal("show"); // modal 나타내기
						
                        $('#meetingRoomBox').hide();
	               		$('#noteBookBox').hide();
	               		$('#rentCarBox').hide();
	               		
		           		
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

                        	if (isNaN(bookDate.getTime())) {
                        	    alert("올바른 날짜 및 시간 형식이 아닙니다.");
                        	} else if (bookDate.getTime() < currentDate.getTime()) {
                        	    alert("과거 시간을 선택할 수 없습니다.");
                        	}
                        	
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

                            console.log(selectedCategory);
                   	        console.log(selectedResource);
                   	        
                            if(selectedCategory == null || selectedCategory == ""){
                            	alert("자원 종류를 선택해주세요.");
                            }else if(selectedResource == null || selectedResource == ""){
								alert("자원을 선택해주세요.");  
                            }else if(bookDate == null || bookDate == ""){
                            	alert("예약 날짜가 없습니다.");
                            }else if(startTime == null || startTime == ""){
                            	alert("예약 시작 시간을 선택해주세요.");
                            }else if(endtime == null || endtime == ""){
                            	alert("예약 종료 시간을 선택해주세요.");
                            }else if(checkResult === 'N'){
                            	alert("예약 가능 여부를 확인해주세요.");
                            }else{
                            	var obj = {
                            			"title" : selectedCategory,
                            			"start" : bookDate
                            	}
                            	console.log(obj);
                            	$('#addReservationForm').submit();
                            }
                        });
                    }
                }
            },
			titleFormat : function(date) {
				return date.date.year + '년 ' + (parseInt(date.date.month) + 1) + '월';
			},
			//initialDate: '2021-07-15', // 초기 날짜 설정 (설정하지 않으면 오늘 날짜가 보인다.)
			selectable : true, // 달력 일자 드래그 설정가능
			droppable : true,
			editable : true,
			nowIndicator: true, // 현재 시간 마크
			dateClick:function(info){
			 	var width = 500; // 창의 가로 크기
			    var height = 550; // 창의 세로 크기
			    var left = (window.screen.width - width) / 2;
			    var top = (window.screen.height - height) / 2;

			    // 새 창을 열기 위한 윈도우 옵션 설정
			    var windowFeatures = "width=" + width + ",height=" + height + ",left=" + left + ",top=" + top + ",location=no,menubar=no,toolbar=no,scrollbars=yes";
				
				var newModalReser = window.open('<c:url value="/reservation/modalReservation"/>', '자원 예약', windowFeatures);
			    
				//newModalReser.focus(); // 새 창을 포커스로 가져옴
				
				//$("#reservationModal").modal("show");
				
				$('#meetingRoomBox').hide();
           		$('#noteBookBox').hide();
           		$('#rentCarBox').hide();
           		
				$('#bookDate').val(info.dateStr);
				
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

                	if (isNaN(bookDate.getTime())) {
                	    alert("올바른 날짜 및 시간 형식이 아닙니다.");
                	} else if (bookDate.getTime() < currentDate.getTime()) {
                	    alert("과거 시간을 선택할 수 없습니다.");
                	}
                	
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

                    console.log(selectedCategory);
           	        console.log(selectedResource);
           	        
                    if(selectedCategory == null || selectedCategory == ""){
                    	alert("자원 종류를 선택해주세요.");
                    }else if(selectedResource == null || selectedResource == ""){
						alert("자원을 선택해주세요.");  
                    }else if(bookDate == null || bookDate == ""){
                    	alert("예약 날짜가 없습니다.");
                    }else if(startTime == null || startTime == ""){
                    	alert("예약 시작 시간을 선택해주세요.");
                    }else if(endtime == null || endtime == ""){
                    	alert("예약 종료 시간을 선택해주세요.");
                    }else if(checkResult === 'N'){
                    	alert("예약 가능 여부를 확인해주세요.");
                    }else{
                    	var obj = {
                    			"title" : selectedCategory,
                    			"start" : bookDate
                    	}
                    	console.log(obj);
                    	$("#addReservationForm").submit();
                    }
                });
			},
			events : [ 
	    	    <%List<Map<String, Object>> reservationList = (List<Map<String, Object>>)request.getAttribute("reservationList");%>
	            <%if (reservationList != null) {%>
	            <%for (Map<String, Object> map : reservationList) {%>
	            {
	            	title : '<%= map.get("NAME") %>',
	                start : '<%= map.get("BOOKDATE")%>',
					extendedProps : {
						reservationNo : <%= map.get("RESERVATION_NO")%>
					}

	             },
		<%}
	}%>
					],
					eventClick : function(info){
						var reservationNum = info.event.extendedProps.reservationNo; 
						
						$.ajax({
							url:'<c:url value="/reservation/DetailReservation"/>',
							type:'GET',
							dataType:'JSON',
							data :{reservationNo : reservationNum},
							success:function(result){
								$('#modalDetail').modal("show"); //modal 띄우기
								$('#resempNo').html(result.EMP_NO);
								$('#resName').html(result.emp_NAME);
								$('#resReman').html(result.NAME);
								$('#resBookDate').html(result.BOOKDATE);
								$('#resStartTime').html(result.STARTTIME + ":00");
								if(result.ENDTIME != null || result.ENDTIME != ""){
									$('#resEndTime').html(result.ENDTIME + ":00");
									
								}
							},
							error:function(xhr, status, error){
								alert(status + " : " + error);
							}
						});
						
					}
		});
		calendar.render();
	});
	
	$(function(){
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
		
		$('#category').change(function(){
			 	selectedCategory = $('#category option:selected').val();
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
		
		$('#x').on("click", function(){
			$('#reservationModal').modal("hide");
			$("body").removeClass("modal-open");
			$(".modal-backdrop").remove();
		});
		
		$('#sprintSettingModalClose').click(function(){
			$("#reservationModal").modal("hide"); // 모달 숨기기
			$("body").removeClass("modal-open"); // 부모 창 활성화 클래스 제거
			$(".modal-backdrop").remove(); // 모달 배경 제거
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
						event.preventDefault();
					}else if(result ==2){
						$('#bookOk').text("예약 가능합니다.");
						$('#checkResult').val('Y');
					}else if(result == 3){
						$('#message').text("관리자에게 문의하세요.");
					}
				},
				error:function(xhr, status, error){
					alert(status + " : " + error);
				}
			});
		});
		
	});
</script>
<style type="text/css">
	#calendar{
		background: white;
		padding : 20px;
	}
</style>


<div id='calendar'></div>

<div class="modal fade" id="modalDetail" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel"></h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close" id ="x2">
                        <span aria-hidden="true">x</span>
                    </button>
                </div>

                <div class="modal-body">
                    <div class="form-group">
                    	<label class="fs-0" for="product-name">사원번호 : </label> 
                    	<label class="fs-0" for="product-name" id="resempNo"> </label><br> 
                    	<label class="fs-0" for="product-name">이름 : </label> 
                    	<label class="fs-0" for="product-name" id="resName"> </label> <br>
						<label class="fs-0" for="product-name" >예약 자원 :</label>
						<label class="fs-0" for="product-name" id = "resReman"></label><br>
                		<div class = "mb-3">
	                  	  <label class="fs-0" for="eventStartDate">예약 날짜 :</label>
	                  	  <label class="fs-0" for="eventStartDate" id="resBookDate"></label>
                  		  <label class="fs-0" for="product-name" id="resStartTime">시간</label>
                  		  ~ 
	                   	  <label class="fs-0" for="product-name" id ="resEndTime">종료 시간</label> 
	                  	</div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary px-4" id="editReservation">수정</button>
                    <button type="button" class="btn btn-primary px-4" id="delReservation">삭제</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal" id="sprintSettingModalClose">취소</button>
                </div>
    
            </div>
        </div>
    </div>
	
	<div class="modal fade" id="reservationModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
        <form id = "addReservationForm" autocomplete="on" action="<c:url value='/reservation/addReservation'/>" method = "post" >
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel"></h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close" id ="x">
                        <span aria-hidden="true">x</span>
                    </button>
                </div>

                <div class="modal-body">
                    <div class="form-group">
                    	<label class="form-label" for="product-name"> 자원 종류</label> 
						<select class="form-select" aria-label="Default select example" id = "category" name = "category" style="width:40%">
							<option value="">선택하세요.</option>
							<option value="meetingRoom">회의실</option>
							<option value="noteBook">노트북</option>
							<option value="rentCar">차량</option>
						</select>
						<div id = "meetingRoomBox">
						<label class="form-label" for="product-name" >자원</label>
						<select class="form-select" aria-label="Default select example" id = "meetingRoom" name = "remanNo" style="width:55%">
							<option value="" disabled> 선택하세요.</option>
						<c:forEach var = "mr" items="${meetingRoom }"> 
							<option value="${mr.remanNo}">${mr.name }</option>
						</c:forEach>
						</select>
						</div>
						
						<div id = "noteBookBox">
						<label class="form-label" for="product-name" >자원</label>
						<select class="form-select" aria-label="Default select example" id = "noteBook" name = "remanNo" style="width:55%">
							<option value="" disabled> 선택하세요.</option>
						<c:forEach var = "nb" items="${noteBook }"> 
							<option value="${nb.remanNo }">${nb.name }</option>
						</c:forEach>
						</select>
						</div>
						<div id = "rentCarBox">
						<label class="form-label" for="product-name" >자원</label>
						<select class="form-select" aria-label="Default select example" id = "rentCar" name = "remanNo" style="width:55%">
							<option value="" disabled> 선택하세요.</option>
						<c:forEach var = "rc" items="${rentCar }"> 
							<option value="${rc.remanNo }">${rc.name }</option>
						</c:forEach>
						</select>
						</div>
						<div class="divDay">
                  			<div class = "mb-3">
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
	                  	<input type="button" id="checkTime" value = "예약 가능 여부 확인">
	                  	<input type = "text" id = "checkResult" value="N">
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

<%@ include file="../inc/bottom.jsp"%>