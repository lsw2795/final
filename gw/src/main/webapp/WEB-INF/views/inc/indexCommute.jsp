<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
	#liveclock {
	font-size: 400%;
	margin: 40px 0;
	}
	#punchInBtn, #workOutBtn, #comeBackBtn, #punchOutBtn{
		cursor: pointer;
		border: 1px solid #ddd !important; 
	}

</style>


<script>
function printClock() {
    
    var clock = document.getElementById("clock");            // 출력할 장소 선택
    var currentDate = new Date();                                     // 현재시간
    var calendar = currentDate.getFullYear() + "-" + (currentDate.getMonth()+1) + "-" + currentDate.getDate() // 현재 날짜
    var amPm = '오전'; // 초기값 AM
    var currentHours = addZeros(currentDate.getHours(),2); 
    var currentMinute = addZeros(currentDate.getMinutes() ,2);
    var currentSeconds =  addZeros(currentDate.getSeconds(),2);
    
    if(currentHours >= 12){ // 시간이 12보다 클 때 PM으로 세팅, 12를 빼줌
    	amPm = '오후';
    	currentHours = addZeros(currentHours - 12,2);
    }

    if(currentSeconds >= 50){// 50초 이상일 때 색을 변환해 준다.
       currentSeconds = '<span style="color:#de1951;">'+currentSeconds+'</span>'
    }
    clock.innerHTML = currentHours+":"+currentMinute+":"+currentSeconds +" <span style='font-size:50px;'>"+ amPm+"</span>"; //날짜를 출력해 줌
    
    setTimeout("printClock()",1000);         // 1초마다 printClock() 함수 호출
}

function addZeros(num, digit) { // 자릿수 맞춰주기
	  var zero = '';
	  num = num.toString();
	  if (num.length < digit) {
	    for (i = 0; i < digit - num.length; i++) {
	      zero += '0';
	    }
	  }
	  return zero + num;
}
</script>

<body onload="printClock()">
	<h6 style=" color:#666;font-size:100px; text-align:center;" id="clock"></h3>
	<div>
		<h4>출근시간 :
		 	<c:if test="${!empty commuteVo.workIn}">
			 	${commuteVo.workIn} 
		 	</c:if>
		 	<c:if test="${empty commuteVo.workIn}">
		 		미출근
		 	</c:if>
		</h4>
	</div>
	<div>
		<h4>퇴근시간 :
			 <c:if test="${!empty commuteVo.workOut}">
				${commuteVo.workOut}
			 </c:if>
			 
			 <c:if test="${!empty commuteVo.workIn}">
				 <c:if test="${empty commuteVo.workOut}">
				 	미퇴근
				 </c:if>
			 </c:if>
		</h4>
	</div>
	<div>
		<h4>근태상태 :
			 <c:if test="${commuteVo.commuteState==0}">
				정상출근
			 </c:if>
			 <c:if test="${commuteVo.commuteState==1}">
				지각
			 </c:if>
			 <c:if test="${commuteVo.commuteState==2}">
				조퇴
			 </c:if>
			 <c:if test="${commuteVo.commuteState==3}">
				지각 & 조퇴
			 </c:if>
		</h4>
	</div>
</body>




