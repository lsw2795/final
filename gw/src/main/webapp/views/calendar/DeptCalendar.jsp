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
			},
			titleFormat : function(date) {
				return date.date.year + '년 ' + (parseInt(date.date.month) + 1) + '월';
			},
			//initialDate: '2021-07-15', // 초기 날짜 설정 (설정하지 않으면 오늘 날짜가 보인다.)
			selectable : true, // 달력 일자 드래그 설정가능
			droppable : false,
			editable : false,
			nowIndicator : true,
			events : [ 
	    	    <%List<Map<String, Object>> calendarList = (List<Map<String, Object>>)request.getAttribute("map");%>
	            <%if (calendarList != null) {%>
	            <%for (Map<String, Object> list : calendarList) {%>
	            {
	            	title : '<%=list.get("TITLE")%>', 
	                start : '<%=list.get("BEGINDATE")%>',
	                end : '<%=list.get("ENDDATE")%>',
	            	<%if(list.get("CATEGORY_NO").equals(1)){%>
	            		color: '#DD6F66'
	            	<%}else if(list.get("CATEGORY_NO").equals(2)){%>
	            		color : '#A9D18E'
	            	<%}else if(list.get("CATEGORY_NO").equals(3)){%>
	            		color : '#5889F0'
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

<%@ include file="../inc/bottom.jsp"%>