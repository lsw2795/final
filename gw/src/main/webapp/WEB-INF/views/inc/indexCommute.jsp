<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
    #liveclock {
        font-size: 400%;
        margin: 40px 0;
    }
    
    #punchInBtn, #workOutBtn, #comeBackBtn, #punchOutBtn {
        cursor: pointer;
        border: 1px solid #ddd !important;
    }
    
    .tbC1 {
        border-collapse: collapse;
        width: 100%;
        margin: 1rem auto;
        border-top: 1px solid #ddd;
        border-bottom: 1px solid #ddd;
        background-color: white;
    }
    
    .thC, .tdC {
        padding: 8px;
        text-align: left;
        border-bottom: 1px solid #ddd;
        border-top: 1px solid #ddd;
        text-align: center;
    }
    
    .thC {
        background-color: #404c52;
        color: #ddd;
    }
    
    .tbodyC tr:hover {
        background-color: #d3d3d3;
        opacity: 0.9;
        cursor: pointer;
    }
    
    .thC:nth-child(1),
    .tdC:nth-child(1) {
        width: 15%;
    }
    
    .thC:nth-child(2),
    .tdC:nth-child(2) {
        width: 55%;
    }
    
    .thC:nth-child(3),
    .tdC:nth-child(3) {
        width: 30%;
    }
</style>

<script>
    $(function() {
        printClock();
    });

    function printClock() {
        var clock = document.getElementById("clock"); // 출력할 장소 선택
        var todayDate = document.getElementById("todayDate"); // 오늘 날짜 출력할 장소 선택
        var currentDate = new Date(); // 현재시간
        var calendar = currentDate.getFullYear() + "년 " + (currentDate.getMonth() + 1) + "월 " + currentDate.getDate() + "일 "; // 현재 날짜
        var days = ['일', '월', '화', '수', '목', '금', '토']; // 요일 배열
        var dayOfWeek = days[currentDate.getDay()]; // 현재 요일 구하기

        var amPm = 'AM'; // 초기값 AM
        var currentHours = addZeros(currentDate.getHours(), 2);
        var currentMinute = addZeros(currentDate.getMinutes(), 2);
        var currentSeconds = addZeros(currentDate.getSeconds(), 2);

        if (currentHours >= 12) { // 시간이 12보다 클 때 PM으로 세팅, 12를 빼줌
            amPm = 'PM';
            currentHours = addZeros(currentHours - 12, 2);
        }

        clock.innerHTML = currentHours + ":" + currentMinute + ":" + currentSeconds + " <span style='font-size:27px;'>" + amPm + "</span>"; // 날짜를 출력해 줌
        todayDate.innerHTML = calendar + dayOfWeek + '요일'; // 오늘 날짜와 요일을 출력해 줌

        setTimeout("printClock()", 1000); // 1초마다 printClock() 함수 호출
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

<table class="tbC1">
    <thead>
        <tr class="trC">
            <th class="thC" style="font-size: 27px; color: white" colspan="2">현재시간 : 
                <span style=" color:white; text-align:center;" id="clock"></span>
            </th>
        </tr>
    </thead>
    <tbody class="tbodyC">
        <tr>
            <td colspan="2" style="text-align:center; font-weight: bold; font-size: 27px;" id="todayDate"></td>
        </tr>

        <tr class="trC">
            <td class="tdC">
                <strong>출근</strong>
            </td>

            <td class="tdC">             
                <c:if test="${!empty commuteVo.workIn}">
                    <strong>${commuteVo.workIn}</strong>
                </c:if>
                <c:if test="${empty commuteVo.workIn}">
                    <strong>미출근</strong>
                </c:if>
            </td>
        </tr>
        <tr class="trC">
            <td class="tdC"><strong>퇴근</strong></td>
            <td class="tdC">
                <c:if test="${!empty commuteVo.workOut}">
                    <strong>${commuteVo.workOut}</strong>
                </c:if>

                <c:if test="${!empty commuteVo.workIn}">
                    <c:if test="${empty commuteVo.workOut}">
                        <strong>미퇴근</strong>
                    </c:if>
                </c:if>
            </td>
        </tr>
        <tr>
            <td class="tdC"><strong>근태상태</strong></td>
            <td class="tdC">
                <c:if test="${commuteVo.commuteState==0}">
                    <strong>정상출근<Strong>
                </c:if>
                <c:if test="${commuteVo.commuteState==1}">
                    <strong>지각<Strong>
                </c:if>
                <c:if test="${commuteVo.commuteState==2}">
                    <strong>조퇴
                </c:if>
                <c:if test="${commuteVo.commuteState==3}">
                    <strong>지각 & 조퇴
                </c:if>
            </td>
        </tr>
    </tbody>
</table>
