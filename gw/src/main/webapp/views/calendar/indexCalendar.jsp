<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import = "java.util.List" %>
<%@ page import = "com.ez.gw.calendar.model.CalendarVO" %>

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
			navLinks : true,
			titleFormat : function(date) {
				return date.date.year + '년 ' + (parseInt(date.date.month) + 1) + '월';
			},
			//initialDate: '2021-07-15', // 초기 날짜 설정 (설정하지 않으면 오늘 날짜가 보인다.)
			selectable : false, // 달력 일자 드래그 설정가능
			select : true,
			droppable : false,
			editable : false,
			nowIndicator : true,
	        dayMaxEventRows: 3, // 각 날짜에 표시할 최대 이벤트 행 수	
	        displayEventTime: false,
	        events : [ 
	    	    <%List<CalendarVO> calendarList = (List<CalendarVO>)request.getAttribute("calendarList");%>
	            <%if (calendarList != null) {%>
	            <%for (CalendarVO vo : calendarList) {%>
	            {
	            	title : '<%=vo.getTitle()%>',
		            allDaySlot : false,
	                start : '<%=vo.getBegindate()%>',
	                end : '<%=vo.getEnddate()%>',
	                extendedProps : {
	                	calendarNo : '<%= vo.getCalendarNo()%>'
	                },
	            	<%if(vo.getCategoryNo() == 1){%>
	            		color: '#DD6F66'
	            	<%}else if(vo.getCategoryNo() == 2){%>
	            		color : '#A9D18E'
	            	<%}else if(vo.getCategoryNo() == 3){%>
	            		color : '#5889F0'
	            	<%}else if(vo.getCategoryNo() == 4){%>
	            		color : '#FFD966'
	            	<%}%>
	             },
		<%}
	}%>
					]
		});
		calendar.render();
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
