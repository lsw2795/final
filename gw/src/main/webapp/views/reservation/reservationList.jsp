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
				end : 'dayGridMonth,dayGridWeek,dayGridDay,addEventButton'
			},customButtons: {
                addEventButton: { // 추가한 버튼 설정
                    text : "자원 예약",  // 버튼 내용
                    click : function(){ // 버튼 클릭 시 이벤트 추가
                        $("#reservationModal").modal("show"); // modal 나타내기
						
                        $('#meetingRoomBox').hide();
	               		$('#noteBookBox').hide();
	               		$('#rentCarBox').hide();
	               		
	               		var selectedCategory = "";
		           		var selectedResource = "";
	               		
		           		
                        $("#addReservation").on("click",function(){  // modal의 추가 버튼 클릭 시
                            var bookDate = $("#bookDate").val();
                        	var startTime = $('#startTime').val();
                        	var endtime = $('#endtime').val();
                            var currentDate = new Date();
                            selectedCategory = $('#category option:selected');
                            
                   			 
                   		 	if (selectedCategory === 'meetingRoom') {
                   	            selectedResource = $('#meetingRoom option:selected');
                   	        } else if (selectedCategory === 'noteBook') {
                   	            selectedResource = $('#noteBook option:selected');
                   	        } else if (selectedCategory === 'rentCar') {
                   	            selectedResource = $('#rentCar option:selected').val();

                            console.log(selectedCategory);
                   	        console.log(selectedResource);
                   	        }
                            if(selectedCategory == null || selectedCategory == ""){
                            	alert("자원 종류를 선택해주세요.");
                            }else if(selectedResource == null || selectedResource == ""){
								alert("자원을 선택해주세요.");                            	
                            }else if(bookDate == null || bookDate == ""){
                            	alert("예약 날짜가 없습니다.");
                            }else if(new Date(endtime) - new Date(startTime)){
                            	alert("종료시간이 시작시간보다 앞일 수 없습니다.");
                            }else if(startTime == null || startTime == ""){
                            	alert("예약 시작 시간을 선택해주세요.");
                            }else if(endtime == null || endtime == ""){
                            	alert("예약 종료 시간을 선택해주세요.");
                            }else if(new Date(bookDate) - currentDate<0){
                            	alert("과거 날짜를 선택할 수 없습니다.");
                            }else{
                            	var obj = {
                            			"title" : selectedCategory,
                            			"start" : bookDate
                            	}
                            	console.log(obj);
                            	$('#addReservationForm').submit();
                            }
                            
                         /*    
                            
                            //내용 입력 여부 확인
                            if(title == null || title == ""){
                            	alert("제목을 입력하세요.");	
                            }else if(content == null || content == ""){
                                alert("내용을 입력하세요.");
                            }else if(new Date(end_date)- new Date(start_date) < 0){ // date 타입으로 변경 후 확인
                                alert("종료일이 시작일보다 먼저입니다.");
                            }else if(start_date == null || start_date == ""){
                            	alert("날짜를 선택해주세요.");
                            }else if(new Date(start_date) - currentDate<0){
                            	alert("과거 날짜를 선택할 수 없습니다.");
                            }else if(categoryNo.length <1){
                            	alert("일정 종류를 선택해주세요.");
                            }else{ // 정상적인 입력 시
                                var obj = {
                                    "title" : content,
                                    "start" : start_date,
                                    "end" : end_date
                                }//전송할 객체 생성 

                            }
                                console.log(obj); //서버로 해당 객체를 전달해서 DB 연동 가능  */
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
			events : [ 
	    	    <%List<Map<String, Object>> reservationList = (List<Map<String, Object>>)request.getAttribute("reservationList");%>
	            <%if (reservationList != null) {%>
	            <%for (Map<String, Object> map : reservationList) {%>
	            {
	            	title : '<%= map.get("NAME") %>',
	                start : '<%= map.get("BOOKDATE")%>',
	             },
		<%}
	}%>
					],
					
		});
		calendar.render();
	});
	
	$(function(){
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
			$.ajax({
				url : "<c:url value='/reservation/ajaxCheckBook'/>",
				type: "get",
				dataType : "JSON",
				data : {startTime : $('#startTime').val(),
						endTime : $('#endTime').val(),
						remanNo : $('#selectedResource').val(),
						bookDate : $('#bookDate').val()},
				success:function(){
					
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
                    	<label class="form-label" for="product-name">종류</label> 
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
							<option value="${mr.remanNo }">${mr.name }</option>
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
	                  	<input type = "text" id = "checkResult">
	                  	</div>
	                  	 <div id = "message"></div>
	                	 <div id = "bookOk"></div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary px-4" id="addReservation" type="submit">등록</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal" id="sprintSettingModalClose">취소</button>
                </div>
    
            </div>
            </form>
        </div>
    </div>


<%@ include file="../inc/bottom.jsp"%>