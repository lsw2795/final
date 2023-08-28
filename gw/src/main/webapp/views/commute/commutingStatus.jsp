<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.ez.gw.commute.model.CommuteVO"%>
<%@ include file="../inc/top.jsp"%>

<link href="<c:url value='/lib/fullcalendar/main.css'/>"
	rel='stylesheet' />
<script src="<c:url value='/lib/fullcalendar/main.js'/> "></script>
<script src="<c:url value='/lib/fullcalendar/locales-all.min.js'/> "></script>
<style>
div#calendar {
	background: white;
	padding: 20px;
}

.fc-event-time {
	color: black;
}

.fc-event-title {
	color: blue;
}
</style>

<div id='calendar'></div>

<script>
  document.addEventListener('DOMContentLoaded', function() {
		var calendarEl = document.getElementById('calendar');
		var calendar = new FullCalendar.Calendar(calendarEl, {
			initialView : 'dayGridMonth', //초기 캘린더 화면
			headerToolbar : {
				start : 'prev next today',
				center : 'title',
				end : 'dayGridMonth,dayGridWeek'
			},
			titleFormat : function(date) {
				return date.date.year + '년 ' + (parseInt(date.date.month) + 1) + '월';
			},
			//initialDate: '2023-08-01', // 초기 날짜 설정 (설정 x => 오늘날짜)
			selectable : false, // 달력 일자 드래그 가능
			droppable : false,
			editable : false,
			nowIndicator: true, 
			locale: 'ko', // 한국어로 변경해주기
			events : [
				<%List<CommuteVO> commuteList = (List<CommuteVO>)request.getAttribute("list");  %>
				<%if(commuteList != null && !commuteList.isEmpty()){ %>
				
						<%for(CommuteVO vo : commuteList){ %>
							<%if(vo.getCommuteState()==1){%>
								{
									title : '출근:지각',
									start : '<%=vo.getWorkIn()%>'
								},
								{
									title : '퇴근:',
									start : '<%=vo.getWorkOut()%>'
								},
							<%}else if(vo.getCommuteState()==5){%>
								{
									title : '출근' ,
									start : '<%=vo.getWorkIn()%>'
								},
								{
									title : '퇴근:조퇴',
									start : '<%=vo.getWorkOut()%>'
								},
							<%}else if(vo.getCommuteState()==1 && vo.getCommuteState()==5){%>
								{
									title : '출근:지각' ,
									start : '<%=vo.getWorkIn()%>'
								},
								{
									title : '퇴근:조퇴',
									start : '<%=vo.getWorkOut()%>'
								},
							<%}else{%>
								{
									title : '출근' ,
									start : '<%=vo.getWorkIn()%>'
								},
								{
									title : '퇴근',
									start : '<%=vo.getWorkOut()%>'
								},
							<%}%>
						<%}%>
					<%}%>
				
			]
			
		});
		calendar.render();
	});
</script>



<%@ include file="../inc/bottom.jsp"%>
