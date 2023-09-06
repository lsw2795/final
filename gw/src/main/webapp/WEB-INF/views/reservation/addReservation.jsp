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
	
	#message{
		color : red;
		font-weight:bold;
	}
	
	#bookOk{
		color:green;
		font-weight:bold;
	}
</style>
<script type="text/javascript">
	 $(function(){
		 $('#meetingRoomBox').hide();
		 $('#noteBookBox').hide();
		 $('#rentCarBox').hide();
		 
		 var selectedCategory = "";
		 var selectedResource = "";
		 var startTime = "";
		 var endTime = "";
		 var date = ""
		 
		 $('#category').change(function(){
		 	selectedCategory = $('#category option:selected').val();
			console.log(selectedCategory);
		 	
		 	if(selectedCategory.length<1){
				 $('#meetingRoomBox').hide();
				 $('#noteBookBox').hide();
				 $('#rentCarBox').hide();
			 }else if(selectedCategory === 'meetingRoom'){
				 $('#meetingRoomBox').show();
				 $('#noteBookBox').hide();
				 $('#rentCarBox').hide();
			 }else if(selectedCategory === 'noteBook'){
				 $('#meetingRoomBox').hide();
				 $('#noteBookBox').show();
				 $('#rentCarBox').hide();
			 }else if(selectedCategory === 'rentCar'){
				 $('#meetingRoomBox').hide();
				 $('#noteBookBox').hide();
				 $('#rentCarBox').show();
			 }
	 	});
		 
		 /* $('#meetingRoom, #noteBook, #rentCar').change(function(){
			 
		 	if (selectedCategory === 'meetingRoom') {
	            selectedResource = $('#meetingRoom option:selected').val();
	        } else if (selectedCategory === 'noteBook') {
	            selectedResource = $('#noteBook option:selected').val();
	        } else if (selectedCategory === 'rentCar') {
	            selectedResource = $('#rentCar option:selected').val();
	        }

	        console.log(selectedResource);
		 }); */
		 
		 
			 
		 $('#endtime , #startTime').change(function(){
			 startTime = $('#startTime').val();
			 endTime = $('#endtime').val();
			 
			 console.log(startTime);
			 console.log(endTime);
			 
			 if(endTime<= startTime){
				 $('#message').text("종료시간이 시작시간보다 전일 수 없습니다.");
				 event.preventDefault();
				 
			 }else{
				 $('#message').text("");
				
			 }
		 });
		 
		 $('#checkTime').click(function(){
			 startTime = $('#startTime').val();
			 endTime = $('#endtime').val();
			 date = new Date($('#bookDate').val());
			 var currentDate = new Date();
			 
			 console.log(startTime);
			 console.log(endTime);
			 console.log(date);
			 console.log(currentDate);
			 
			 if(date < currentDate){
				 $('#message').text("입력한 날짜는 오늘 이전입니다.");
				 return false;
			 }
			 
			 var selectedStartTime = parseInt(startTime.split(':')[0]); // 선택한 시작 시간
			    var currentHour = currentDate.getHours(); // 현재 시간
			    if (date.getDate() === currentDate.getDate() && selectedStartTime < currentHour) {
			        $('#message').text("선택한 시간은 현재 시간 이전입니다.");
			        return;
			    } 
			 
			 if(endTime<= startTime){
				 $('#message').text("종료시간이 시작시간보다 전일 수 없습니다.");
				 event.preventDefault();
				 
			 }
			 
			 $.ajax({
				 url:"<c:url value='/reservation/ajaxCheckBook'/>",
				 type: "get",
				 dataType: "JSON",
				 data:{startTime : startTime,
					 	endTime : endTime,
					 	remanNo : selectedResource,
					 	bookDate : date
					 	},
				 success:function(result){
					 if(result == 1){
						 $('#message').text("예약이 존재합니다.");
						 event.preventDefault();
					 }else{
						 $('#bookOk').text("예약 가능합니다.");
					 }
				 },
				 error:function(xhr, status, error){
					 alert(status + " : " + error);
				 }
			 });
		 });
		
	 });
</script>
<style type="text/css">
	#checkTime {
    margin-left: 50px;
    margin-top: 30px;
    height: 35px;
    border: none;
    color: white;
    background: #3D4C53;
    border-radius: 5px;
}
</style>
 	<h2>자원 예약</h2>
          <div class="modal-dialog">
            <div class="modal-content">
              <form id="addEventForm" autocomplete="on" method="post" action="<c:url value='/reservation/addReservation'/>">
                  <label class="form-label" for="product-name">종류</label> 
						<select class="form-select" aria-label="Default select example" id = "category" name = "category" style="width:20%">
							<option value="">선택하세요.</option>
							<option value="meetingRoom">회의실</option>
							<option value="noteBook">노트북</option>
							<option value="rentCar">차량</option>
						</select>
						<div id = "meetingRoomBox">
						<label class="form-label" for="product-name" >자원</label>
						<select class="form-select" aria-label="Default select example" id = "meetingRoom" name = "remanNo" style="width:30%">
							<option value="" disabled> 선택하세요.</option>
						<c:forEach var = "mr" items="${meetingRoom }"> 
							<option value="${mr.remanNo }">${mr.name }</option>
						</c:forEach>
						</select>
						</div>
						<div id = "noteBookBox">
						<label class="form-label" for="product-name" >자원</label>
						<select class="form-select" aria-label="Default select example" id = "noteBook" name = "remanNo" style="width:30%">
							<option value="" disabled> 선택하세요.</option>
						<c:forEach var = "nb" items="${noteBook }"> 
							<option value="${nb.remanNo }">${nb.name }</option>
						</c:forEach>
						</select>
						</div>
						<div id = "rentCarBox">
						<label class="form-label" for="product-name" >자원</label>
						<select class="form-select" aria-label="Default select example" id = "rentCar" name = "remanNo" style="width:30%">
							<option value="" disabled> 선택하세요.</option>
						<c:forEach var = "rc" items="${rentCar }"> 
							<option value="${rc.remanNo }">${rc.name }</option>
						</c:forEach>
						</select>
						</div>
                  <div class="divDay">
                  	<div class = "mb-3">
	                    <label class="fs-0" for="eventStartDate">예약 날짜</label>
	                    <input class="form-control datetimepicker" id="bookDate" type="date" required="required" name="bookDate"  data-options='{"static":"true","enableTime":"true","dateFormat":"Y-m-d H:i"}' />
                  	</div>
                  </div>
                   <div class="divDay">
                  	<div class = "mb-3" >
                  		<label class="form-label" for="product-name">시작 시간</label> 
						<select class="form-select" aria-label="Default select example" id = "startTime" name = "startTime">
							<option value="" >선택하세요.</option>
							<c:forEach var="i" begin="9" end = "18" step="1">
							<option value="${i }">${i } :00</option>
							</c:forEach>
						</select>
                  	</div>
                  	<div class = "mb-3" id = "setEndtime">
	                   <label class="form-label" for="product-name">종료 시간</label> 
						<select class="form-select" aria-label="Default select example" id = "endtime" name = "endTime">
							<option value="" >선택하세요.</option>
							<c:forEach var="i" begin="9" end = "18" step="1">
							<option value="${i }">${i } :00</option>
							</c:forEach>
						</select>
                  	</div>
                  	<input type="button" id="checkTime" value = "예약 가능 여부 확인">
                  </div>
                 <div id = "message"></div>
                 <div id = "bookOk"></div>
                <div class="modal-footer d-flex justify-content-end align-items-center border-0">
                  <button class="btn btn-primary px-4" type="submit">등록</button>
                </div>
              </form>
            </div>
          </div>
 <%@ include file="../inc/bottom.jsp" %>
    