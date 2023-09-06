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
    
	<div class="card overflow-hidden">
            <div class="card-header">
              <div class="row gx-0 align-items-center">
                <div class="col-auto d-flex justify-content-end order-md-1">
                  <button class="btn icon-item icon-item-sm shadow-none p-0 me-1 ms-md-2" type="button" data-event="prev" data-bs-toggle="tooltip" title="Previous"><span class="fas fa-arrow-left"></span></button>
                  <button class="btn icon-item icon-item-sm shadow-none p-0 me-1 me-lg-2" type="button" data-event="next" data-bs-toggle="tooltip" title="Next"><span class="fas fa-arrow-right"></span></button>
                </div>
                <div class="col-auto col-md-auto order-md-2">
                  <h4 class="mb-0 fs-0 fs-sm-1 fs-lg-2 calendar-title"></h4>
                </div>
                <div class="col col-md-auto d-flex justify-content-end order-md-3">
                  <button class="btn btn-falcon-primary btn-sm" type="button" data-event="today">Today</button>
                </div>
                <div class="col-md-auto d-md-none">
                  <hr />
                </div>
                <div class="col-auto d-flex order-md-0">
                  <button class="btn btn-primary btn-sm" type="button" data-bs-toggle="modal" data-bs-target="#addEventModal"> <span class="fas fa-plus me-2"></span>자원 예약</button>
                </div>
                <div class="col d-flex justify-content-end order-md-2">
                  <div class="dropdown font-sans-serif me-md-2">
                    <button class="btn btn-falcon-default text-600 btn-sm dropdown-toggle dropdown-caret-none" type="button" id="email-filter" data-bs-toggle="dropdown" data-boundary="viewport" aria-haspopup="true" aria-expanded="false"><span data-view-title="data-view-title">Month View</span><span class="fas fa-sort ms-2 fs--1"></span></button>
                    <div class="dropdown-menu dropdown-menu-end border py-2" aria-labelledby="email-filter"><a class="active dropdown-item d-flex justify-content-between" href="#!" data-fc-view="dayGridMonth">Month View<span class="icon-check"><span class="fas fa-check" data-fa-transform="down-4 shrink-4"></span></span></a><a class="dropdown-item d-flex justify-content-between" href="#!" data-fc-view="timeGridWeek">Week View<span class="icon-check"><span class="fas fa-check" data-fa-transform="down-4 shrink-4"></span></span></a><a class="dropdown-item d-flex justify-content-between" href="#!" data-fc-view="timeGridDay">Day View<span class="icon-check"><span class="fas fa-check" data-fa-transform="down-4 shrink-4"></span></span></a><a class="dropdown-item d-flex justify-content-between" href="#!" data-fc-view="listWeek">List View<span class="icon-check"><span class="fas fa-check" data-fa-transform="down-4 shrink-4"></span></span></a><a class="dropdown-item d-flex justify-content-between" href="#!" data-fc-view="listYear">Year View<span class="icon-check"><span class="fas fa-check" data-fa-transform="down-4 shrink-4"></span></span></a>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="card-body p-0 scrollbar">
              <div class="calendar-outline" id="appCalendar"></div>
            </div>
          </div>
          <div class="modal fade" id="addEventModal" tabindex="-1">
          <div class="modal-dialog">
            <div class="modal-content border">
              <form id="addEventForm" autocomplete="off">
                <div class="modal-header px-x1 bg-light border-bottom-0">
                  <h5 class="modal-title">자원 예약</h5>
                  <button class="btn-close me-n1" type="button" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body p-x1">
                  <div class="mb-3">
                    <label class="fs-0" for="eventTitle">예약내용</label>
                    <input class="form-control" id="eventTitle" type="text" name="title" required="required" />
                  </div>
                  <div class="mb-3">
                    <label class="fs-0" for="eventStartDate">예약 시작일</label>
                    <input class="form-control datetimepicker" id="eventStartDate" type="text" required="required" name="startDate" placeholder="yyyy/mm/dd hh:mm" data-options='{"static":"true","enableTime":"true","dateFormat":"Y-m-d H:i"}' />
                  </div>
                  <div class="mb-3">
                    <label class="fs-0" for="eventEndDate">예약종료일</label>
                    <input class="form-control datetimepicker" id="eventEndDate" type="text" name="endDate" placeholder="yyyy/mm/dd hh:mm" data-options='{"static":"true","enableTime":"true","dateFormat":"Y-m-d H:i"}' />
                  </div>
                  <div class="mb-3">
                    <label class="fs-0" for="eventDescription">예약 내용</label>
                    <textarea class="form-control" rows="3" name="description" id="eventDescription"></textarea>
                  </div>
                  <div class="mb-3">
                    <label class="fs-0" for="eventLabel">자원</label>
                    <select class="form-select" id="eventLabel" name="label">
                      <option value="" selected="selected">선택</option>
                      <option value="primary">회의실</option>
                      <option value="danger">노트북</option>
                      <option value="success">Personal</option>
                      <option value="warning">Must Attend</option>
                    </select>
                  </div>
                </div>
                <div class="modal-footer d-flex justify-content-end align-items-center bg-light border-0">
                  <a class="me-3 text-600" href="../app/events/create-an-event.jsp">자원 추가 및 문의는 Q&A로 해주세요</a>
                  <button class="btn btn-primary px-4" type="submit">등록</button>
                </div>
              </form>
            </div>
          </div>
        </div>
		  <footer class="footer">
            <div class="row g-0 justify-content-between fs--1 mt-4 mb-3">
              <div class="col-12 col-sm-auto text-center">
                <p class="mb-0 text-600">Thank you for creating with Falcon <span class="d-none d-sm-inline-block">| </span><br class="d-sm-none" /> 2023 &copy; <a href="https://themewagon.com">Themewagon</a></p>
              </div>
              <div class="col-12 col-sm-auto text-center">
                <p class="mb-0 text-600">v3.17.0</p>
              </div>
            </div>
          </footer>
<%@ include file="../inc/bottom.jsp"%>
<!-- ===============================================-->
    <!--    JavaScripts-->
    <!-- ===============================================-->
    <script src="<c:url value='/vendors/popper/popper.min.js'/>"></script>
    <script src="<c:url value='/vendors/bootstrap/bootstrap.min.js'/>"></script>
    <script src="<c:url value='/vendors/anchorjs/anchor.min.js'/>"></script>
    <script src="<c:url value='/vendors/is/is.min.js'/>"></script>
    <script src="<c:url value='/vendors/fullcalendar/main.min.js'/>"></script>
    <script src="<c:url value='/assets/js/flatpickr.js'/>"></script>
    <script src="<c:url value='/vendors/dayjs/dayjs.min.js'/>"></script>
    <script src="<c:url value='/vendors/fontawesome/all.min.js'/>"></script>
    <script src="<c:url value='/vendors/lodash/lodash.min.js'/>"></script>
    <script src="https://polyfill.io/v3/polyfill.min.js?features=window.scroll"></script>
    <script src="<c:url value='/vendors/list.js/list.min.js'/>"></script>
    <script src="<c:url value='/assets/js/theme.js'/>"></script>