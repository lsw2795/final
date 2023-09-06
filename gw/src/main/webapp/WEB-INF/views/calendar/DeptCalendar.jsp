<%@page import="java.math.BigDecimal"%>
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
	            <%for (Map<String, Object> list : calendarList) {
	            	BigDecimal categoryNoBig = (BigDecimal)list.get("CATEGORY_NO");
	            	int  categoryNo = categoryNoBig.intValue();
	            	String imageSrc = "/gw/images/" + list.get("IMAGE"); // 이미지 경로 생성%>
	            {
	            	title : '<%=list.get("TITLE")%>', 
	                start : '<%=list.get("BEGINDATE")%>',
	                end : '<%=list.get("ENDDATE")%>',
	                extendedProps : {
	                	name : '<%= list.get("NAME")%>',
	                	imageSrc : '<%= imageSrc%>',
	                	position : '<%= list.get("EMPLOYEE_POSITION_NAME")%>'
	                },
	                color:
	            	<%if(categoryNo== 1){%>
	            		 '#DD6F66'
	            	<%}else if(categoryNo== 2){%>
	            		 '#A9D18E'
	            	<%}else if(categoryNo == 3){%>
	            		 '#5889F0'
	            	<%}else if(categoryNo == 4){%>
	            		 '#FFD966'
	            	<%}%>
	             },
		<%}
	}%>
					],
	             eventMouseEnter:function(info){
	            	 // 이미지 경로를 변수로 저장
	            	    var imageSrc = '<c:url value="' + info.event.extendedProps.imageSrc + '"/>';
	            	    
	            	 // 툴팁 내용을 생성
	            	    var tooltip = '<div class="tooltipevent" style="width:auto;height:auto;background:#fff;position:absolute;z-index:10001;padding:10px;border:1px solid #ddd;">' +
	            	        '<div class="avatar-name rounded-circle">' +
	            	        '<img src="' + imageSrc + '" width="30px" height="30px" class="avatar-name rounded-circle">' +
	            	        "  "+ '<strong>'+info.event.extendedProps.position +'</strong>' + " " + info.event.extendedProps.name +
	            	        '</div>' +
	            	        '</div>';

	            	    // 툴팁을 body에 추가
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

<%@ include file="../inc/bottom.jsp"%>