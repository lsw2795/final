<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../../inc/adminTop.jsp" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<link rel="stylesheet" href="<c:url value='/css/adminempform.css' />">

<head>
    <meta charset="UTF-8">
    <title>전사원 근태 현황</title>

    <style type="text/css">
        .s-container {
            background: white;
            color: black;
            padding: 20px;
        }

        .s-container h2 {
            color: black;
        }

        .form-search {
            margin: 30px 0;
        }

        .t-search {
            margin: 20px 0 10px;
            width: 85%;
            margin-right: auto;
            text-align: center;
            border-collapse: collapse;
            border: 2px solid rgb(200, 200, 200);
            min-width: 430px;
            float: right;
        }

        .t-search tr {
            height: 45px;
        }

        .t-search-title {
            background-color: rgb(240, 240, 240);
            width: 200px;
        }

        .t-search input {
            vertical-align: middle;
        }

        .t-search select[name="date"] {
            height: 30px;
            font-size: 14px;
            border: 1px solid gray;
            border-radius: 4px;
            width: 80px;
            margin-right: 15px;
        }

        .t-search input[type="submit"] {
            background: white;
            border: 1px solid gray;
            border-radius: 4px;
            width: 55px;
            height: 31px;
            font-size: 14px;
        }

        .stats-List {
            width: 100%;
            margin-bottom: 20px;
            font-size: 17px;
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

        .t-List {
            width: 900px;
        }

        .t-List2 {
            width: 100%;
            font-size: 15px;
            text-align: center;
            border-collapse: collapse;
            border: 2px solid rgb(200, 200, 200);
            margin-top: 10px;
        }

        .t-List2 tr {
            border-top: 1px solid rgb(200, 200, 200);
            height: 45px;
        }

        .t-List2 tr:hover {
            background-color: rgb(250, 250, 250);
        }

        .t-List2 th {
            background-color: rgb(240, 240, 240);
        }

        .t-List2 .th-1 {
            width: 180px;
        }

        .t-List2 .th-2 {
            width: 630px;
        }

        .t-List2 .th-3 {
            width: 810px;
        }

        .t-List2 a {
            text-decoration: none;
            color: black;
            cursor: pointer;
        }

        .t-List2 span {
            padding: 5px 10px;
            border-radius: 4px;
            border: 1px;
            color: white;
        }

        input::placeholder {
            color: white;
            text-align: center;
        }

        /* 잘못된 입력 스타일을 지정합니다. */
        .invalid-time {
            border: 1px solid red; /* 잘못된 입력을 강조하기 위한 스타일 */
        }
    </style>

    <script type="text/javascript">
        $(function() {
            // date1 input 요소에 값이 변경될 때
            $("input[name='date1']").on("change", function() {
                var date1Value = $(this).val();
                $("input[name='date1']").val(date1Value);
            });

            // date2 input 요소에 값이 변경될 때
            $("input[name='date2']").on("change", function() {
                var date2Value = $(this).val();
                $("input[name='date2']").val(date2Value);
            });

            $("#searchForm").submit(function(event) {
                var date1 = $("input[name='date1']").val();
                var date2 = $("input[name='date2']").val();

                // 두 날짜 중 하나만 선택되었을 때
                if ((date1.length > 1 && date2.length < 1) || (date2.length > 1 && date1.length < 1)) {
                    event.preventDefault(); // 폼 제출 방지
                    alert('두 날짜 중 하나만 선택되었습니다. 다른 하나를 선택하세요.');
                }
            });

            $("#sprintSettingModalClose").click(function() {
                if (confirm("수정을 취소하시겠습니까?")) {
                    $("#commuteModal").modal("hide");
                }
            });

            // "editInTime" 및 "editOutTime" 입력 필드에 input 이벤트 리스너를 추가합니다.
            $('#editInTime, #editOutTime').on('input', function() {
                formatTimeInput($(this));
            });

            $("#editSubmit").click(function() {
                // "editInTime"과 "editOutTime" 입력 값 가져오기
                var editInTime = $("#editInTime").val();
                var editOutTime = $("#editOutTime").val();

                // 유효한 시간 형식 (hh:mm)을 위한 정규 표현식
                var timePattern = /^(0[0-9]|1[0-9]|2[0-3]):[0-5][0-9]$/;

                // "editInTime"과 "editOutTime" 입력 값이 유효한지 확인
                if (!timePattern.test(editInTime)) {
                    alert('출근 시간 형식이 잘못되었습니다. (예: 09:00)');
                    return; // 이벤트 중단
                }

                if (!timePattern.test(editOutTime)) {
                    alert('퇴근 시간 형식이 잘못되었습니다. (예: 18:00)');
                    return; // 이벤트 중단
                }

                // 유효성 검사를 통과한 경우 서브밋 실행
                $("#editWorkForm").submit();
            });

            $("#exelDown").click(function() {
                $('form[name="frmExel"]').submit();
            });

        }); //jquery

        function modal(commuteNo, workDate, workInTime, workOutTime) { // 출/퇴근 시간 수정을 위한 모달 띄우기
            $("#workDate").val(workDate);
            $("#workInTime").val(workInTime);
            $("#workOutTime").val(workOutTime);
            $("#editCommuteNo").val(commuteNo);

            $("#editInTime").val("");
            $("#editOutTime").val("");
            $("#commuteModal").modal("show");
        }

        function pageFunc(curPage) {
            $('input[name="currentPage"]').val(curPage);
            $('form[name="frmPage"]').submit();
        }

        // 시간 입력을 자동으로 포맷팅하는 함수
        function formatTimeInput(input) {
            var inputValue = input.val();
            var formattedValue = inputValue.replace(/[^0-9]/g, ''); // 숫자 이외의 문자 제거

            if (formattedValue.length >= 3) {
                // 입력 값이 3글자 이상인 경우 (예: "123")
                formattedValue = formattedValue.substring(0, 2) + ':' + formattedValue.substring(2);
            }

            input.val(formattedValue);
        }
    </script>

</head>

<!-- 페이징 처리 관련 form -->
<form action="<c:url value='/admin/commute/allCommute' />" name="frmPage" method="post">
    <input type="hidden" name="currentPage">
    <input type="hidden" name="date1" value="${param.date1}">
    <input type="hidden" name="date2" value="${param.date2}">
    <input type="hidden" name="deptNo" value="${param.deptNo}">
    <input type="hidden" name="emp" value="${param.emp}">
</form>

<div class="s-container">
    <div>
        <h2>전사원 근태 관리</h2>

        <form action="<c:url value='/commute/exportToExcel2' />" name="frmExel" method="post">
            <input type="hidden" name="currentPage" <c:if test="${empty param.currentPage}">
                    value="1" </c:if> <c:if test="${!empty param.currentPage}">
                    value="${param.currentPage}" </c:if>
            >
            <input type="hidden" name="date1" value="${param.date1}">
            <input type="hidden" name="date2" value="${param.date2}">
            <input type="hidden" name="deptNo" value="${param.deptNo}">
            <input type="hidden" name="emp" value="${param.emp}">
            <a id="exelDown" class="btn btn-dark" style="position:relative; bottom:10px; right:10px; float: right;" href="#">엑셀로 저장</a>
        </form>
    </div>
    <hr>

    <div>
        <table class="stats-List">
            <tr>
                <th class="th-1">출근</th>
                <th class="th-1">지각</th>
                <th class="th-1">조퇴</th>
                <th class="th-1">총 근무시간</th>
            </tr>
            <tr>
                <td>${attendance}</td>
                <td>${late}</td>
                <td>${ealry}</td>
                <td>${TotalWorkTimeOfMonth}
                    <c:if test="${!empty TotalWorkTimeOfMonth}">h</c:if>
                </td>
            </tr>
        </table>
    </div>

    <div class="search">
        <span style="margin-top:35px; float: left;">조회결과 ${totalRecord}건</span>
        <form id="searchForm" action="<c:url value='/admin/commute/allCommute' />" method="post" class="form-search">
            <table class="t-search">
                <tr>
                    <td class="t-search-title">
                        검색일
                    </td>
                    <td class="searchTD">
                        <input type="date" name="date1" value="${param.date1}"> ~
                        <input type="date" name="date2" value="${param.date2}">
                        <select name="deptNo">
                            <option value="">모든부서</option>
                            <c:forEach var="vo" items="${deptList}">
                                <option value="${vo.deptNo}" <c:if test="${vo.deptNo==param.deptNo}">
                                        selected="selected" </c:if>>${vo.name}</option>
                            </c:forEach>
                        </select>
                        <input type="text" name="emp" placeholder="사번/사원명 검색" value="${param.emp}">
                        <input type="submit" value="검색" style="color: black;">
                    </td>
                </tr>
            </table>
        </form>
    </div>

    <div class="list2">
        <table class="t-List2">
            <tr>
                <th class="th-1">사번</th>
                <th class="th-1">부서</th>
                <th class="th-1">직위</th>
                <th class="th-1">이름</th>
                <th class="th-1">근무일</th>
                <th class="th-1">출근시간</th>
                <th class="th-1">퇴근시간</th>
                <th class="th-1">근무시간</th>
                <th class="th-1">근무상태</th>
            </tr>
            <c:if test="${empty commuteList}">
                <tr>
                    <td colspan="9">조회된 근무이력이 없습니다.</td>
                </tr>
            </c:if>
            <c:if test="${!empty commuteList}">
                <c:forEach var="map" items="${commuteList}">
                    <tr onclick="modal(${map['COMMUTE_NO']}, '${map['workDate']}', '${map['workInTime']}', '${map['workOutTime']}')">
                        <td>${map['EMP_NO']}</td>
                        <td>${map['DEPT_NAME']}</td>
                        <td>${map['POSITION_NAME']}</td>
                        <td>${map['NAME']}</td>
                        <td>${map['workDate']}</td>
                        <td>${map['workInTime']}</td>
                        <td>${map['workOutTime']}</td>
                        <td>${map['workTime']}</td>
                        <c:choose>
                            <c:when test="${map['state']!='정상근무'}">
                                <td style="color: red;">${map['state']}</td>
                            </c:when>
                            <c:otherwise>
                                <td>${map['state']}</td>
                            </c:otherwise>
                        </c:choose>
                    </tr>
                </c:forEach>
            </c:if>
        </table>

        <div class="mt-3 card-footer d-flex justify-content-center admindefault">
            <div class="divPage" id="divPage">
                <!-- 페이지 번호 추가 -->
                <!-- 이전 블럭으로 이동 -->
                <c:if test="${pagingInfo.firstPage>1 }">
                    <a href="#" id="prevPage" onclick="pageFunc(${pagingInfo.firstPage-1})">
                        <img src="<c:url value='/images/first.JPG' />">
                    </a>
                </c:if>

                <!-- [1][2][3][4][5][6][7][8][9][10] -->
                <c:forEach var="i" begin="${pagingInfo.firstPage }" end="${pagingInfo.lastPage }">
                    <c:if test="${i == pagingInfo.currentPage }">
                        <span id="curPage">${i}</span>
                    </c:if>
                    <c:if test="${i != pagingInfo.currentPage }">
                        <a href="#" id="otherPage" onclick="pageFunc(${i})">${i}</a>
                    </c:if>
                </c:forEach>

                <!-- 다음 블럭으로 이동 -->
                <c:if test="${pagingInfo.lastPage < pagingInfo.totalPage }">
                    <a href="#" id="nextPage" onclick="pageFunc(${pagingInfo.lastPage+1})">
                        <img src="<c:url value='/images/last.JPG' />">
                    </a>
                </c:if>
                <!--  페이지 번호 끝 -->
            </div>
        </div>
    </div>
</div>

<!-- modal  -->
<div class="modal fade" id="commuteModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <form id="editWorkForm" autocomplete="on" action="<c:url value='/admin/commute/editWorkTime' />" method="post">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">근무시간 변경</h5>
                    <button type="button" onclick="$('#commuteModal').modal('hide');" class="close" data-dismiss="modal"
                        aria-label="Close" id="x">
                        <span aria-hidden="true">x</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="taskId" class="col-form-label">수정할 날짜</label>
                        <input readonly="readonly" type="text" class="form-control" id="workDate" name="workDate" size="5px;">

                        <label for="taskId" class="col-form-label">지정 출근시간</label>
                        <input readonly="readonly" type="text" class="form-control" id="workInTime" name="workInTime">

                        <label for="taskId" class="col-form-label">지정 퇴근시간</label>
                        <input readonly="readonly" type="text" class="form-control" id="workOutTime" name="workOutTime">

                        <hr>

                        <input type="hidden" name="commuteNo" id="editCommuteNo">
                        <label for="taskId" class="col-form-label">수정할 출근시간</label>
                        <input type="text" class="form-control" id="editInTime" name="editInTime">

                        <label for="taskId" class="col-form-label">수정할 퇴근시간</label>
                        <input type="text" class="form-control" id="editOutTime" name="editOutTime">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary px-4" id="editSubmit" type="button">수정</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal" id="sprintSettingModalClose">취소</button>
                </div>

            </div>
        </form>
    </div>
</div>

<%@ include file="../../inc/adminBottom.jsp" %>