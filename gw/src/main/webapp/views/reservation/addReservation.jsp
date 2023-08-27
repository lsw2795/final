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
	
	#endtime{
		margin-left : 20px;
	}
</style>
<script type="text/javascript">
	 
</script>
 	<h2>자원 예약</h2>
          <div class="modal-dialog">
            <div class="modal-content">
              <form id="addEventForm" autocomplete="on" method="post" action="<c:url value='/reservation/addReservation'/>">
                  <label class="form-label" for="product-name">종류</label> 
						<select class="form-select" aria-label="Default select example" id = "category" name = "category">
							<option value="" disabled>선택하세요.</option>
							<option value="meetingRoom">회의실</option>
							<option value="noteBook">노트북</option>
							<option value="rentCar">차량</option>
						</select>
						<label class="form-label" for="product-name" id = "meetingRoom">종류</label>
						<select class="form-select" aria-label="Default select example" id = "category" name = "meetingRoom">
						<c:forEach var = "mr" items="${meetingRoom }"> 
							<option value="${mr.remanNo }">${mr.name }</option>
						</c:forEach>
						</select>
						<label class="form-label" for="product-name" id = "noteBook">자원</label>
						<select class="form-select" aria-label="Default select example" id = "category" name = "noteBook">
						<c:forEach var = "nb" items="${noteBook }"> 
							<option value="${nb.remanNo }">${nb.name }</option>
						</c:forEach>
						</select>
						<label class="form-label" for="product-name" id = "meetingRoom">자원</label>
						<select class="form-select" aria-label="Default select example" id = "category" name = "rentCar">
						<c:forEach var = "rc" items="${rentCar }"> 
							<option value="${rc.remanNo }">${rc.name }</option>
						</c:forEach>
						</select>
                  <div class="divDay">
                  	<div class = "mb-3">
	                    <label class="fs-0" for="eventStartDate">예약 날짜</label>
	                    <input class="form-control datetimepicker" id="eventStartDate" type="date" required="required" name="begindate"  data-options='{"static":"true","enableTime":"true","dateFormat":"Y-m-d H:i"}' />
                  	</div>
                  </div>
                   <div class="divDay">
                  	<div class = "mb-3" >
                  		<label class="form-label" for="product-name">시작 시간</label> 
						<select class="form-select" aria-label="Default select example" id = "category" name = "category">
							<option value="" disabled >선택하세요.</option>
							<c:forEach var="i" begin="9" end = "18" step="1">
							<option value="i">${i } :00</option>
							</c:forEach>
						</select>
                  	</div>
                  	<div class = "mb-3" id = "endtime">
	                   <label class="form-label" for="product-name">종료 시간</label> 
						<select class="form-select" aria-label="Default select example" id = "category" name = "category">
							<option value="" disabled>선택하세요.</option>
							<c:forEach var="i" begin="9" end = "18" step="1">
							<option value="i">${i } :00</option>
							</c:forEach>
						</select>
                  	</div>
                  </div>
                <div class="modal-footer d-flex justify-content-end align-items-center border-0">
                  <button class="btn btn-primary px-4" type="submit">등록</button>
                </div>
              </form>
            </div>
          </div>
 <%@ include file="../inc/bottom.jsp" %>
    