<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
    @import url(https://fonts.googleapis.com/css?family=Roboto:700);
    
    #holder {
        -moz-user-select: -moz-none;
        -khtml-user-select: none;
        -webkit-user-select: none;
        background: white;
        padding: 10px;
        width: 250px;
        margin: 0 auto;
        position: relative;
        top: 50%;
        transform: translateY(-65%);
        box-shadow: 0px 3px 8px rgba(0, 0, 0, 0.25);
        border-radius: 2px;
    }
    
    .button {
        line-height: 34px;
        background: #3D4C53;
        width: 40%;
        float: left;
        margin-left: 14px;
        height: 36px;
        overflow: hidden;
        text-align: center;
        transition: .2s;
        cursor: pointer;
        border-radius: 3px;
        box-shadow: 0px 1px 2px rgba(0, 0, 0, .2);
    }
    
    .btnTwo {
        position: relative;
        width: 170px;
        height: 100px;
        margin-top: -100px;
        padding-top: 2px;
        background: #26A69A;
        left: -250px;
        transition: .3s;
    }
    
    .btnText {
        color: white;
        transition: .3s;
    }
    
    .btnText2 {
        margin-top: 15px;
        margin-right: -130px;
        color: #FFF;
    }
</style>

<script type="text/javascript" src="<c:url value='/js/jquery-3.7.0.min.js'/>"></script>
<script>
    $(function() {
        // 출근 버튼 클릭 이벤트
        $("#workIn").click(function() {
            // AJAX 요청
            $.ajax({
                type: "POST", // 요청 메서드 (POST로 변경 가능)
                url: "<c:url value='/commute/workIn'/>", // 서버 요청 URL
                data: { empNo: "${empMap['EMP_NO']}" }, // 요청 데이터 (empNo 전송)
                success: function(result) {
                    var $workInButton = $("#workIn");
                    
                    if (result == 1) {
                        alert("출근처리 되었습니다.");
                        window.location.reload();
                    } else if (result == 2) {
                        alert("출근(지각)처리 되었습니다.");
                        window.location.reload();
                    } else {
                        alert("당일 출근처리가 이미 되어있습니다.");
                    }
                },
                error: function(jqXHR, textStatus, errorThrown) {
                    // 요청이 실패한 경우의 처리 (에러 핸들링)
                    alert("출근 요청 실패: " + textStatus, errorThrown);
                }
            });
        });
        
        // 퇴근 버튼 클릭 이벤트
        $("#workOut").click(function() {
            // AJAX 요청
            $.ajax({
                type: "POST", // 요청 메서드 (POST로 변경 가능)
                url: "<c:url value='/commute/workOut'/>", // 서버 요청 URL
                data: { empNo: "${empMap['EMP_NO']}" }, // 요청 데이터 (empNo 전송)
                success: function(result) {
                    // 성공적으로 요청이 처리된 경우의 처리 (추가 작업이 필요하다면 여기에 코드 추가)
                    if (result == 1) {
                        alert("퇴근처리 되었습니다.");
                        window.location.reload();
                    } else if (result == 2) {
                        alert("당일 퇴근처리가 이미 되어있습니다.");
                    } else if (result == 3) {
                        alert("퇴근(조퇴) 처리 되었습니다.");
                        window.location.reload();
                    } else if (result == 0) {
                        alert("당일 출근 기록이 없습니다. 출근 먼저 해주세요.");
                    }
                },
                error: function(jqXHR, textStatus, errorThrown) {
                    // 요청이 실패한 경우의 처리 (에러 핸들링)
                    alert("퇴근 요청 실패: " + textStatus, errorThrown);
                }
            });
        });
    });
</script>

<div class="row mb-3">
    <div class="col-md-12">
        <div class="card" style="background-color: white;">
            <div class="d-flex mb-2 ms-3 mt-3">
                <img class="rounded-3"
                    src="<c:url value='/images/${empMap["IMAGE"]}'/>" 
                    alt="사원 이미지" style="width:80px; height: 80px;"/>
                <table class="table table-borderless fs--1 fw-medium mb-0">
                    <tbody>
                        <tr>
                            <td class="p-1">${empMap['NAME']}</td>
                        </tr>
                        <tr>
                            <td class="p-1">${empMap['POSITION_NAME']}</td>
                        </tr>
                        <tr>
                            <td class="p-1">${empMap['DEPT_NAME']}</td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="mb-2" style="text-align: center;">
                <div class="button">
                    <p class="btnText" name="workIn" id="workIn">출근</p>
                    <div class="btnTwo">
                        <p class="btnText2">in</p>
                    </div>
                </div>
                
                <div class="button">
                    <p class="btnText" name="workOut" id="workOut">퇴근</p>
                    <div class="btnTwo">
                        <p class="btnText2">out</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
