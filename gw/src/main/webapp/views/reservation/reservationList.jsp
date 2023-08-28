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
				end : 'dayGridMonth,dayGridWeek,dayGridDay'
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
	    	    <%List<ReservationVO> reservationList = (List<ReservationVO>)request.getAttribute("reservationList");%>
	            <%if (reservationList != null) {%>
	            <%for (ReservationVO vo : reservationList) {%>
	            {
	            	title : '예약',
	                start : '<%=vo.getBookDate()%>',
	                end : '<%=vo.getEndTime()%>',
	                color : '#' + Math.round(Math.random() * 0xffffff).toString(16)
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
</style>


<div id='calendar'></div>

<%@ include file="../inc/bottom.jsp"%>