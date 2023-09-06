<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.7.0/chart.min.js"></script>
<div class="card-header">
       <div class="row flex-between-end">
         <div class="col-auto align-self-center">
           <h5 class="mb-0" data-anchor="data-anchor" style="color: black;">사원 통계</h5>
         </div>
        <div class="col-auto ms-auto">
         <a href="<c:url value='/admin/employee/employeeList'/>" 
         	style="color: black; font-size: 14px;">더보기 ▶</a>
        </div>
       </div>
     </div>
      <div class="card-body admindefault">
        <div class="tab-content">
           <div class="tab-pane preview-tab-pane active" role="tabpanel" 
           	aria-labelledby="tab-dom-c5b10b85-baad-4da8-b18b-2973cbe42fac" 
           		id="dom-c5b10b85-baad-4da8-b18b-2973cbe42fac">
         
          <canvas id="myBarChart" width="400" height="150"></canvas>
           <script type="text/javascript">
               var barChartData = {
			        labels: [
			        	<c:forEach var="map" items="${empList}">
	            		"${map['DEPT_NAME']}",
	            		</c:forEach>
			        ],
			        datasets: [{
		            label: '부서별 사원 수',
		            data: [ 
		            	<c:forEach var="map" items="${empList}">
		            		${map['CNT']},
		            	</c:forEach>
            			],
			            backgroundColor: 'rgba(0, 0, 255, 0.2)',
			            borderColor: 'blue',
			            borderWidth: 1
			        }]
			    };
                
                
            // 막대 그래프 생성
			    var ctx = document.getElementById('myBarChart').getContext('2d');
			    var myBarChart = new Chart(ctx, {
			        type: 'bar',  // 막대 그래프
			        data: barChartData,
			        options: {
			            scales: {
			                y: {
			                    beginAtZero: true
			                }
			            }
			        }
			    });
			</script>

           </div>
        </div>
      </div>