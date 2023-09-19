<%@page import="java.util.List"%>
<%@page import="com.ez.gw.commute.model.CommuteVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../inc/top.jsp" %>

<link href="<c:url value='/lib/fullcalendar/main.css'/>" rel='stylesheet' />
<script src="<c:url value='/lib/fullcalendar/main.js'/> "></script>
<script src="<c:url value='/lib/fullcalendar/locales-all.min.js'/> "></script>

<style>
    div#calendar {
        background: white;
        padding: 10px;
    }

    .fc-event-time {
        color: black;
    }

    .fc-event-title {
        color: blue;
    }

    .fc .fc-daygrid-event-dot {
        border-color: red !important;
    }

    .fc-day-sun a {
        color: red !important;
        text-decoration: none !important;
    }

    .stats-List {
        font-size: 14px;
        text-align: center;
        border-collapse: collapse;
        border-top: 2px solid rgb(200, 200, 200);
        border-bottom: 2px solid rgb(200, 200, 200);
    }

    .stats-List tr {
        border-top: 1px solid rgb(200, 200, 200);
        height: 45px;
    }

    .stats-List tr:hover {
        background-color: rgb(250, 250, 250);
    }

    .stats-List th {
        background-color: rgb(240, 240, 240);
    }

    .stats-List .th-1 {
        width: 180px;
    }

    .stats-List .th-2 {
        width: 630px;
    }

    .stats-List .th-3 {
        width: 810px;
    }

    .stats-List a {
        text-decoration: none;
        color: black;
        cursor: pointer;
    }

    .stats-List span {
        padding: 5px 10px;
        border-radius: 4px;
        border: 1px;
        color: white;
    }

    .div-stats {
        width: 60%;
        height: 100%;
        float: right;
        display: inline-flex;
        align-items: flex-end;
        min-width: 515px;
    }

    .div-wrap {
        background: white;
    }

    .main {
        padding: 20px;
    }
</style>

<div class="main" style="background: white;">
    <h2 style="margin-left: 20px; padding-top: 10px;">출/퇴근 현황</h2>
    <a class="btn btn-dark"
        style="position:relative;  bottom:30px; right:10px; float: right;"
        href="<c:url value='/commute/exportToExcel'/>">엑셀로 저장</a>
    <hr>

    <div style="clear: both;" id='calendar'></div>
</div>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
            initialView: 'dayGridMonth', // 초기 캘린더 화면
            headerToolbar: {
                start: 'prev next today',
                center: 'title',
                end: 'dayGridMonth,dayGridWeek'
            },
            titleFormat: function(date) {
                return date.date.year + '년 ' + (parseInt(date.date.month) + 1) + '월';
            },
            //initialDate: '2023-08-01', // 초기 날짜 설정 (설정 x => 오늘날짜)
            selectable: false, // 달력 일자 드래그 가능
            droppable: false,
            editable: false,
            nowIndicator: true,
            locale: 'ko', // 한국어로 변경해주기
            events: [
                <%
                List<CommuteVO> commuteList = (List<CommuteVO>) request.getAttribute("list");
                if (commuteList != null && !commuteList.isEmpty()) {
                    for (CommuteVO vo : commuteList) {
                        if (vo.getCommuteState() == 1) {
                %>
                {
                    title: '지각',
                    start: '<%= vo.getWorkIn()%>'
                },
                {
                    title: '퇴근',
                    start: '<%= vo.getWorkOut()%>'
                },
                <%
                        } else if (vo.getCommuteState() == 2) {
                %>
                {
                    title: '출근',
                    start: '<%= vo.getWorkIn()%>'
                },
                {
                    title: '조퇴',
                    start: '<%= vo.getWorkOut()%>'
                },
                <%
                        } else if (vo.getCommuteState() == 3) {
                %>
                {
                    title: '지각',
                    start: '<%= vo.getWorkIn()%>'
                },
                {
                    title: '조퇴',
                    start: '<%= vo.getWorkOut()%>'
                },
                <%
                        } else {
                %>
                {
                    title: '출근',
                    start: '<%= vo.getWorkIn()%>'
                },
                {
                    title: '퇴근',
                    start: '<%= vo.getWorkOut()%>'
                },
                <%
                        }
                    }
                }
                %>
            ]
        });
        calendar.render();
    });
</script>

<%@ include file="../inc/bottom.jsp"%>
