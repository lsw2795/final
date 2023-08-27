<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>
 <meta http-equiv="X-UA-Compatible" content="IE=edge">
 <meta name="viewport" content="width=device-width, initial-scale=1">
 
 	<!-- ===============================================-->
    <!--    Stylesheets-->
    <!-- ===============================================-->
    <link href="<c:url value='/vendors/fullcalendar/main.min.css'/>" rel="stylesheet">
    <link href="<c:url value='/vendors/flatpickr/flatpickr.min.css'/>" rel="stylesheet">
	<!-- =============================================== -->
<style type="text/css">
	.divDay {
	    display: flex;
	    justify-content: flex-start;
	    flex-wrap: nowrap;
	}
</style>
<script type="text/javascript">
	 
</script>
 	<h2>일정 등록</h2>
          <div class="modal-dialog">
            <div class="modal-content">
              <form id="addEventForm" autocomplete="on" method="post" action="<c:url value='/calendar/addSchedule'/>">
                  <div class="mb-3">
                    <label class="fs-0" for="eventTitle">제목</label>
                    <input class="form-control" id="eventTitle" type="text" name="title" required="required" />
                  </div>
                  <div class="divDay">
                  	<div class = "mb-3">
	                    <label class="fs-0" for="eventStartDate">시작일</label>
	                    <input class="form-control datetimepicker" id="eventStartDate" type="datetime-local" required="required" name="begindate"  data-options='{"static":"true","enableTime":"true","dateFormat":"Y-m-d H:i"}' />
                  	</div>
                  	<label>&nbsp&nbsp&nbsp&nbsp</label>
	                <div class="mb-3">
	                   <label class="fs-0" for="eventEndDate">종료일</label>
	                   <input class="form-control datetimepicker" id="eventEndDate" type="datetime-local" name="enddate" placeholder="yyyy/mm/dd hh:mm" data-options='{"static":"true","enableTime":"true","dateFormat":"Y-m-d H:i"}' />
	                </div>
                  </div>
                  <div class="form-check">
                    <input class="form-check-input" type="checkbox" id="eventAllDay" name="alldayFlag" />
                    <label class="form-check-label" for="eventAllDay">종일 여부
                    </label>
                  </div>
                  <div class="mb-3">
                    <label class="fs-0" for="eventTitle">참석자</label>
                    <input class="form-control" id="attendee" type="text" name="attendee" required="required" />
                  </div>
                  <div class="mb-3">
                    <label class="fs-0" for="eventTitle">회의장소</label>
                    <input class="form-control" id="place" type="text" name="place" required="required" />
                  </div>
                   <div class="mb-3">
                    <label class="fs-0" for="eventDescription">내용</label>
                    <textarea class="form-control" rows="3" name="content" id="eventDescription"></textarea>
                  </div>
                  <div class="mb-3">
                    <label class="fs-0" for="eventLabel">구분</label>
                    <select class="form-select" id="categoryNo" name="categoryNo">
                      <option value="" selected="selected">선택</option>
                      <option value="1">회의</option>
                      <option value="2">출장</option>
                      <option value="3">일정마감</option>
                    </select>
                </div>
                <div class="modal-footer d-flex justify-content-end align-items-center border-0">
                  <button class="btn btn-primary px-4" type="submit">등록</button>
                </div>
              </form>
            </div>
          </div>
 <%@ include file="../inc/bottom.jsp" %>
    