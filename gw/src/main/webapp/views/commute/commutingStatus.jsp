<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="com.ez.gw.commute.model.CommuteVO"%>
<%@ include file="../inc/top.jsp"%>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.css">
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/locales-all.js"></script>

<div id='calendar'></div>

<script>
document.addEventListener('DOMContentLoaded', function() {
	var calendarEl = document.getElementById('calendar');
	var calendar = new FullCalendar.Calendar(calendarEl, {
		initialView : 'dayGridMonth',
		locale : 'ko', // 한국어 설정
		headerToolbar : {
        	start : "",
            center : "prev title next",
            end : 'dayGridMonth,dayGridWeek,dayGridDay'
            },
	selectable : true,
	droppable : true,
	editable : true,
	events : [ 
    	    <%List<CommuteVO> calendarList = (List<CommuteVO>)request.getAttribute("calendarList");%>
            <%if (calendarList != null) {%>
            <%for (CommuteVO vo : calendarList) {%>
            {
            	title : '<%=vo.getCommuteState()%>',
                start : '<%=vo.getWorkIn()%>',
                end : '<%=vo.getWorkOut()%>',
                color : '#' + Math.round(Math.random() * 0xffffff).toString(16)
             },
	<%}
}%>
				]
				
			});
			calendar.render();
		});
</script>

<%@include file="../inc/bottom.jsp"%>

