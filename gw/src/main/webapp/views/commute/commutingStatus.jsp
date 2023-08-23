<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.ez.gw.commute.model.CommuteVO"%>
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
        initialView: 'dayGridMonth',
        locale: 'ko', // 한국어 설정
        headerToolbar: {
            start: "prev next today",
            center: "title",
            end: 'dayGridMonth,dayGridWeek,dayGridDay'
        },
        selectable: true,
        droppable: true,
        editable: false,
        events: [ 
            <% List<Map<String, Object>> calendarList = (List<Map<String, Object>>) request.getAttribute("calendarList"); %>
            <% if (calendarList != null) { %>
                <% for (Map<String, Object> event : calendarList) { %>
                    {
                        title: '출근',
                        start: new Date('<%= event.get("start") %>'),
                        end:  new Date('<%= event.get("end") %>'),
                        color: '#' + Math.round(Math.random() * 0xffffff).toString(16)
                    },
                    {
                        title: '퇴근',
                        start:  new Date('<%= event.get("end") %>'),
                        end:  new Date('<%= event.get("end") %>'),
                        color: '#' + Math.round(Math.random() * 0xffffff).toString(16)
                    },
                <% } %>
            <% } %>
        ]
    });
    calendar.render();
});
</script>

<%@ include file="../inc/bottom.jsp" %>
