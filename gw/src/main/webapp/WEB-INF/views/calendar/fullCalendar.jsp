<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import = "java.util.List" %>
<%@ page import = "com.ez.gw.calendar.model.CalendarVO" %>
<%@ include file="../inc/top.jsp"%>

<link href="<c:url value='/lib/fullcalendar/main.css'/>"
	rel='stylesheet' />

<script src="<c:url value='/lib/fullcalendar/main.js'/> "></script>
<script src="<c:url value='/lib/fullcalendar/locales-all.min.js'/> "></script>
<script type="text/javascript">

	document.addEventListener('DOMContentLoaded', function() {
		var calendarEl = document.getElementById('calendar');
		var calendar = new FullCalendar.Calendar(calendarEl, {
			
			
			//initialView : 'dayGridMonth', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
			//nextDayThreshold          : "09:00:00",
			//allDaySlot                : true,
			//displayEventTime          : true,
			locale : 'ko',//한국어 설정
			//timeZone:'UTC',
			//navLinks : true,
			headerToolbar : { // 헤더에 표시할 툴 바
				start : 'prev next today',
				center : 'title',
				end : 'dayGridMonth,dayGridWeek,dayGridDay,addEventButton'
			},customButtons: {
                addEventButton: { // 추가한 버튼 설정
                    text : "일정 추가",  // 버튼 내용
                    click : function(){ // 버튼 클릭 시 이벤트 추가
                        $("#calendarModal").modal("show"); // modal 나타내기

                        $("#addCalendar").on("click",function(){  // modal의 추가 버튼 클릭 시
                            var title = $('#title').val();
                        	var content = $("#content").val();
                            var start_date = $("#begindate").val();
                            var end_date = $("#enddate").val();
                            var currentDate = new Date();
                            var categoryNo = $("#categoryNo").val();
                            
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

                                console.log(obj); //서버로 해당 객체를 전달해서 DB 연동 가능
                                $("#addEventForm").submit();
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
			select : true,
			droppable : true,
			editable : true,
			nowIndicator : true,
			dateClick:function(info){
				 $("#calendarModal").modal("show");
				 
                 var clickedDate = info.date;
                 clickedDate.setDate(clickedDate.getDate() + 1);
				 var clickedDateString = clickedDate.toISOString().slice(0, 16);
                 
                 $('#begindate').val(clickedDateString);
                 console.log(clickedDateString);
				 
				 $("#addCalendar").on("click",function(){  // modal의 추가 버튼 클릭 시
                     var title = $('#title').val();
                 	var content = $("#content").val();
                     var start_date = $("#begindate").val();
                     var end_date = $("#enddate").val();
                     var currentDate = new Date();
                     var categoryNo = $("#categoryNo").val();
                     
                     
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

                         console.log(obj); //서버로 해당 객체를 전달해서 DB 연동 가능
                         $("#addEventForm").submit();
                     }
                 });
			},
	        dayMaxEventRows: 3, // 각 날짜에 표시할 최대 이벤트 행 수	
	        displayEventTime: false,
	        eventBackgroundColor:function(info){
	        	console.log('Event ID:', info.event.id);
	        	<%-- console.log('Category No:', '<%= vo.getCategoryNo() %>'); --%>
	        	
	        	if(info.event.id == 1){
	        		 info.el.querySelector('.fc .fc-daygrid-event-dot').attr('.fc-daygrid-event-dot');
	        	}else if(info.event.id == 2){
	        		  info.el.querySelector('.fc .fc-daygrid-event-dot').style.backgroundColor = '#A9D18E';
	        	}else if(info.event.id == 3){
	        		 info.el.querySelector('.fc .fc-daygrid-event-dot').style.backgroundColor = '#5889F0';
	        	}else if(info.event.id == 4){
	        		  info.el.querySelector('.fc .fc-daygrid-event-dot').attr('.red');
	        	}else{
	        		info.el.style.backgroundColor = '';
	        	}
	        },
	        events : [ 
	    	    <%List<CalendarVO> calendarList = (List<CalendarVO>)request.getAttribute("calendarList");%>
	    	    <%-- <%	List<Map<String, Object>> mapList = (List<Map<String, Object>>)request.getAttribute("mapList");%> --%>
	            <%if (calendarList != null) {%>
	            <%for (CalendarVO vo : calendarList) {%>
	            {
	            	title : '<%=vo.getTitle() %>',
	                start : '<%= vo.getBegindate() %>',
	                end : '<%=vo.getEnddate()%>',
	                id: '<%= vo.getCategoryNo() %>',
	                content: '<%= vo.getContent() %>',
	                extendedProps : {
	                	calendarNo : '<%= vo.getCalendarNo()%>',
	                	starttime : '<%= vo.getBegintime()%>',
	                	endtime : '<%= vo.getEndtime()%>'
	                },
	            	<%if(vo.getCategoryNo() == 1){%>
	            	backgroundColor: '#DD6F66'
	            	<%}else if(vo.getCategoryNo() == 2){%>
	            	backgroundColor : '#A9D18E'
	            	<%}else if(vo.getCategoryNo() == 3){%>
	            	backgroundColor : '#5889F0'
	            	<%}else if(vo.getCategoryNo() == 4){%>
	            	backgroundColor : '#FFD966'
	            	<%}%>
	             },
		<%}
	}%>
					],
				eventClick: function(info) {
				    var calendarNum = info.event.extendedProps.calendarNo;
				    
				    $.ajax({
				        url: '<c:url value="/calendar/DetailCalendar"/>',
				        type:'GET',
				        dataType: 'JSON',
				        data: { calendarNo: calendarNum },
				        success: function(result) {
				        	$('#modalDetail').modal("show");
				        	$('#calendarNo').val(result.calendarNo);
				        	$('#modalTitle').val(result.title);
				        	if(result.categoryNo==1){
				        		$('#modalCategoryNo').val("1");
				        	}else if(result.categoryNo ==2){
				        		$('#modalCategoryNo').val("2");
				        	}else if(result.categoryNo ==3){
				        		$('#modalCategoryNo').val("3");
				        	}else if(result.categoryNo == 4){
				        		$('#modalCategoryNo').val("4");
				        	}
				        	/* var begindate = result.beginDate;
				        	begindate = begindate.getDate() + result.beginTime;
				        	
				        	var Settingbegindate = begindate.toISOString().slice(0, 16);
				        	 */
				        	
				        	$('#modalPlace').val(result.place);
				        	$('#modalContent').val(result.content);
				        	$('#modalBegindate').val(result.beginDate);
				        	$('#modalEnddate').val(result.endDate);
				        	
				        	if(result.alldayFlag === "Y"){
				        		$('#modalAlldayFlag').prop("checked", true);
				        	}else{
				        		$('#modalAlldayFlag').prop("checked", false);
				        	}
				        },
				        error: function(xhr, status, error) {
				            alert(status + " : " + error);
				        }
				    });

					 $("#modalDetail").modal("show"); // modal 나타내기 
					 // 이벤트 클릭 시, 이벤트 수정 모달 폼을 표시하세요.
				},
				eventMouseEnter:function(info){
					var tooltip = '<div class="tooltipevent" style="width:auto;height:auto;background:#fff;position:absolute;z-index:10001;padding:10px;border:1px solid #ddd;">' +
							        '<p><strong>' + info.event.title + '</strong></p><hr>' +
							     '<p>' + "시작 시간  : " +  info.event.extendedProps.starttime + '</p>' + 
							        '<p>' +info.event.extendedProps.content +'</p>' +
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
		$("#x").on("click", function() {
			$("#calendarModal").modal("hide"); // 모달 숨기기
			$("body").removeClass("modal-open"); // 부모 창 활성화 클래스 제거
			$(".modal-backdrop").remove(); // 모달 배경 제거
		});
		
		$('#sprintSettingModalClose').click(function(){
			$("#calendarModal").modal("hide"); // 모달 숨기기
			$("body").removeClass("modal-open"); // 부모 창 활성화 클래스 제거
			$(".modal-backdrop").remove(); // 모달 배경 제거
		});
		
		$('#x2').on("click", function(){
			$('#modalDetail').modal("hide");
			$('body').removeClass("modal-open");
			$('.modal-backdrop').remove();
		});
		
		$('#sprintSettingModalClose2').click(function(){
			$("#modalDetail").modal("hide"); // 모달 숨기기
			$("body").removeClass("modal-open"); // 부모 창 활성화 클래스 제거
			$(".modal-backdrop").remove(); // 모달 배경 제거
		});
		
		$('#editCalendar').click(function(){
			var title = $('#modalTitle').val();
			var content = $("#modalContent").val();
            var start_date = $("#modalBegindate").val();
            var end_date = $("#modalEnddate").val();
            var currentDate = new Date();
            var categoryNo = $("#modalCategoryNo").val();
			
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

                console.log(obj); //서버로 해당 객체를 전달해서 DB 연동 가능
				$('#editEventForm').submit();
            }
            
		});
			
	});
	
	function delFunc(calendarNo){
		var calendarNo = $('#calendarNo').val();
	
		if(confirm("이 일정을 삭제하시겠습니까?")){
			window.location.href = '<c:url value="/calendar/delCalendar?calendarNo="/>'+calendarNo;
		}
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
	
	
</style>


<div id='calendar'></div>

 <div class="modal fade" id="calendarModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
        	<form id = "addEventForm" autocomplete="on" action="<c:url value='/calendar/addCalendar'/>" method = "post" >
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">일정을 입력하세요.</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close" id ="x">
                        <span aria-hidden="true">x</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="taskId" class="col-form-label">제목</label>
                        <input type="text" class="form-control" id="title" name="title">
                        <label class="fs-0" for="eventLabel">구분</label>
                    	<select class="form-select" id="categoryNo" name="categoryNo">
	                      <option value="" selected="selected">선택</option>
	                      <option value="1" id = "meeting">회의</option>
	                      <option value="2" id = "out">출장</option>
	                      <option value="3" id = "deadline">일정마감</option>
	                      <option value = "4" id = "other">기타</option>
	                    </select>
	                    <label for="taskId" class="col-form-label">장소</label>
                        <input type="text" class="form-control" id="place" name="place">
                        <label for="taskId" class="col-form-label">일정 내용</label>
                        <textarea type="text" class="form-control" id="content" name="content" rows="3"></textarea>
                        <label for="taskId" class="col-form-label">시작 날짜</label>
                        <input type="datetime-local" class="form-control" id="begindate" name="begindate">
                        <label for="taskId" class="col-form-label">종료 날짜</label>
                        <input type="datetime-local" class="form-control" id="enddate" name="enddate">
	                    <label class="form-check-label" for="eventAllDay" >종일 여부</label>
	                    <input class="form-check-input" type="checkbox" id="alldayFlag" name="alldayFlag" value="Y"/>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary px-4" id="addCalendar" type="submit">등록</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal" id="sprintSettingModalClose">취소</button>
                </div>
    
            </div>
            </form>
        </div>
    </div>
    
    <div class="modal fade" id="modalDetail" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
        	<form id = "editEventForm" autocomplete="on" action="<c:url value='/calendar/editCalendar'/>" method = "post" >
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">일정 내용</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close" id ="x2">
                        <span aria-hidden="true">x</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="taskId" class="col-form-label">제목</label>
                        <input type = "hidden" id="calendarNo" name="calendarNo">
                        <input type="text" class="form-control" id="modalTitle" name="title" >
                        <label class="fs-0" for="eventLabel">구분</label>
                    	<select class="form-select" id="modalCategoryNo" name="categoryNo">
	                      <option value="" selected="selected">선택</option>
	                      <option value="1">회의</option>
	                      <option value="2">출장</option>
	                      <option value="3">일정마감</option>
	                      <option value = "4">기타</option>
	                    </select>
	                    <label for="taskId" class="col-form-label">장소</label>
                        <input type="text" class="form-control" id="modalPlace" name="place">
                        <label for="taskId" class="col-form-label">일정 내용</label>
                        <textarea type="text" class="form-control" id="modalContent" name="content" rows="3"></textarea>
                        <label for="taskId" class="col-form-label">시작 날짜</label>
                        <input type="datetime-local" class="form-control" id="modalBegindate" name="begindate">
                        <label for="taskId" class="col-form-label">종료 날짜</label>
                        <input type="datetime-local" class="form-control" id="modalEnddate" name="enddate">
	                    <label class="form-check-label" for="eventAllDay" >종일 여부</label>
	                    <input class="form-check-input" type="checkbox" id="modalAlldayFlag" name="alldayFlag" />
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary px-4" id="editCalendar" type="submit">수정</button>
                    <button type="button" class="btn btn-primary px-4" id="deleteCalendar" onclick="delFunc(calendarNo)">삭제</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal" id="sprintSettingModalClose2">취소</button>
                </div>
    
            </div>
            </form>
        </div>
    </div>



<%@ include file="../inc/bottom.jsp"%>