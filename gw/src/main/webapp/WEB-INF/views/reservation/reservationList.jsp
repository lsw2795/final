<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
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
                    	var width = 450; // 창의 가로 크기
        			    var height = 500; // 창의 세로 크기
        			    var left = (window.screen.width - width) / 2;
        			    var top = (window.screen.height - height) / 2;
                    	
                    	var windowFeatures = "width=" + width + ",height=" + height + ",left=" + left + ",top=" + top + ",location=no,menubar=no,toolbar=no,scrollbars=yes";
        				
        				var newModalReser = window.open('<c:url value="/reservation/modalReservation"/>', '자원 예약', windowFeatures);
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
			 	var width = 450; // 창의 가로 크기
			    var height = 500; // 창의 세로 크기
			    var left = (window.screen.width - width) / 2;
			    var top = (window.screen.height - height) / 2;

			    // 새 창을 열기 위한 윈도우 옵션 설정
			    var windowFeatures = "width=" + width + ",height=" + height + ",left=" + left + ",top=" + top + ",location=no,menubar=no,toolbar=no,scrollbars=yes";
				
				var newModalReser = window.open('<c:url value="/reservation/modalReservation"/>', '자원 예약', windowFeatures);
			    
			    
			    //newModalReser.dateFunction(date);
				
				//newModalReser.focus(); // 새 창을 포커스로 가져옴
			},
			events : [ 
	    	    <%List<Map<String, Object>> reservationList = (List<Map<String, Object>>)request.getAttribute("reservationList");%>
	            <%if (reservationList != null) {%>
	            <%for (Map<String, Object> map : reservationList) {
	            	String category = (String)map.get("CATEGORY");
	            	int categoryNo = 0;
	            	if(category.equals("meetingRoom")){
	            		categoryNo = 1;
	            		}else if(category.equals("noteBook")){
	            			categoryNo = 2;
	            		}else{
	            			categoryNo = 3;
	            		}
	            	String imageSrc = "/gw/images/" + map.get("IMAGE");	
	            	%>
	            {
	            	title : '<%= (String)map.get("NAME") %>',
	                start : '<%= (String)map.get("BOOKDATE")%>',
					extendedProps : {
						reservationNo : <%= map.get("RESERVATION_NO")%>,
						starttime : <%= map.get("STARTTIME")%>,
						endtime :<%= map.get("ENDTIME")%>,
						empName:'<%= (String)map.get("EMPNAME")%>',
						imageSrc : '<%= imageSrc%>'
					},
					<%if(categoryNo ==1){%>
						backgroundColor: '#DD6F66'
					<%}else if(categoryNo == 2){%>
						backgroundColor : '#5889F0'
					<%}else if(categoryNo == 3){%>
						backgroundColor : '#FFD966'
					<%}%>
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
								$('#reservationNo').val(result.RESERVATION_NO);
								$('#resempNo').html(result.EMP_NO);
								$('#resName').html(result.EMPNAME);
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
						
					},
					eventMouseEnter:function(info){
						// 이미지 경로를 변수로 저장
	            	    var imageSrc = '<c:url value="' + info.event.extendedProps.imageSrc + '"/>';
	            	    
						var tooltip = '<div class="tooltipevent" style="width:auto;height:auto;background:#fff;position:absolute;z-index:10001;padding:10px;border:1px solid #ddd;">' +
								        '<p><strong>' + info.event.title + "   "+'</strong>' +
								        '<img src="' + imageSrc + '" width="30px" height="30px" class="avatar-name rounded-circle">' +
								         info.event.extendedProps.empName +'</p><hr>' +
								     '<p>' + "대여 시간 : "+info.event.extendedProps.starttime + ":00  ~  " + info.event.extendedProps.endtime + ":00" + '</p>' + 
								        '</div>';
								        
						$("body").append(tooltip);
						
					    $(info.el).mouseover(function(e) {
					        $(this).css('z-index', 10000);
					        $('.tooltipevent').fadeIn('500');
					        $('.tooltipevent').fadeTo('10', 1.9);
					    }).mousemove(function(e) {
					        $('.tooltipevent').css('top', e.pageY + 10);
					        $('.tooltipevent').css('left', e.pageX + 20);
					    });
					},
					eventMouseLeave: function(info) {
					    $(this).css('z-index', 8);
					    $('.tooltipevent').remove();
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
			$('#modalDetail').modal("hide");
			$("body").removeClass("modal-open");
			$(".modal-backdrop").remove();
		});
		
		$('#sprintSettingModalClose').click(function(){
			$("#modalDetail").modal("hide"); // 모달 숨기기
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
	
	function delFunc(reservationNo){
		var reservationNo = $('#reservationNo').val();
		
		if(confirm("예약을 삭제하시겠습니까?")){
			window.location.href="<c:url value='/reservation/delReservation?reservationNo='/>" + reservationNo;
		}
	}
	
	function editFunc(reservationNo){
		var reservationNo = $('#reservationNo').val();
		
		var width = 450; // 창의 가로 크기
	    var height = 500; // 창의 세로 크기
	    var left = (window.screen.width - width) / 2;
	    var top = (window.screen.height - height) / 2;

	    // 새 창을 열기 위한 윈도우 옵션 설정
	    var windowFeatures = "width=" + width + ",height=" + height + ",left=" + left + ",top=" + top + ",location=no,menubar=no,toolbar=no,scrollbars=yes";
		
		var newModalReser = window.open('<c:url value="/reservation/editReservation?reservationNo="/>'+reservationNo, '자원 수정', windowFeatures);
	}
</script>
<style type="text/css">
	#calendar{
		background: white;
		padding : 20px;
	}
	
	.fc-event-title {
		color: black;
		font-weight: bold;
	}
	
	.fc-day-sun a {
	  color: red !important;
	  text-decoration: none !important;
	}

	
	button#addReservation {
    	margin-right: 20px;
	}
</style>


<div id='calendar'></div>

<div class="modal fade" id="modalDetail" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel"></h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close" id ="x">
                        <span aria-hidden="true">x</span>
                    </button>
                </div>

                <div class="modal-body">
                    <div class="form-group">
                    	<input type="hidden" id="reservationNo" >
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
                    <button type="button" class="btn btn-primary px-4" id="editReservation" onclick="editFunc(reservationNo)">수정</button>
                    <button type="button" class="btn btn-primary px-4" id="delReservation" onclick="delFunc(reservationNo)">삭제</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal" id="sprintSettingModalClose">취소</button>
                </div>
    
            </div>
        </div>
    </div>
<%@ include file="../inc/bottom.jsp"%>