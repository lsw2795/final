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
			initialView : 'dayGridMonth', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
			locale : 'ko',//한국어 설정
			headerToolbar : { // 헤더에 표시할 툴 바
				start : 'prev next today',
				center : 'title',
				end : 'dayGridMonth,dayGridWeek,dayGridDay'
			},customButtons: {
                addEventButton: { // 추가한 버튼 설정
                    text : "일정 추가",  // 버튼 내용
                    click : function(){ // 버튼 클릭 시 이벤트 추가
                        $("#calendarModal").modal("show"); // modal 나타내기

                        $("#addCalendar").on("click",function(){  // modal의 추가 버튼 클릭 시
                            var content = $("#content").val();
                            var start_date = $("#begindate").val();
                            var end_date = $("#enddate").val();
                            
                            //내용 입력 여부 확인
                            if(content == null || content == ""){
                                alert("내용을 입력하세요.");
                            }else if(new Date(end_date)- new Date(start_date) < 0){ // date 타입으로 변경 후 확인
                                alert("종료일이 시작일보다 먼저입니다.");
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
			droppable : true,
			editable : true,
			nowIndicator : true,
			events : [ 
	    	    <%List<Map<String, Object>> calendarList = (List<Map<String, Object>>)request.getAttribute("calendarList");%>
	            <%if (calendarList != null) {%>
	            <%for (Map<String, Object> map : calendarList) {%>
	            {
	            	title : '<%=map.get("TITLE") %>,
	                start : '<%=map.get("BEGINTIME")%>',
	                end : '<%=map.get("ENDTIME")%>',
	            	<%if(map.get("CATEGORYNO").equals(1)){%>
	            		color: '#DD6F66'
	            	<%}else if(map.get("CATEGORYNO").equals(2)){%>
	            		color : '#A9D18E',
	            	<%}else if(map.get("CATEGORYNO").equals(3)){%>
	            		color : '#5889F0',
	            	<%}%>
	            	
	             },
		<%}
	}%>
					]
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
	});
</script>
<style type="text/css">
	#calendar{
		background: white;
		padding : 20px;
	}
	
	.fc-event-title {
	    color: white !important;
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
	                      <option value="1">회의</option>
	                      <option value="2">출장</option>
	                      <option value="3">일정마감</option>
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
	                    <input class="form-check-input" type="checkbox" id="alldayFlag" name="alldayFlag" />
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



<%@ include file="../inc/bottom.jsp"%>