<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="card-header">
       <div class="row flex-between-end">
         <div class="col-auto align-self-center">
           <h5 class="mb-0" data-anchor="data-anchor" style="color: black;">사원 통계</h5>
         </div>
        <div class="col-auto ms-auto">
        <form name="frmYear" method="post" action="<c:url value='/admin/employee/empList'/>">
           <select class="form-select form-select admindefault" name="year">
             <option value="">선택하세요.</option>
	             <c:forEach var="empYearMap" items="${empCount }">
	             	<option value="${empYearMap['YEAR']}"
	             		<c:if test="${empYearMap['YEAR'] ==param.year}">
		            		selected="selected"
		            	</c:if>
	             	>${empYearMap['YEAR']}</option>
	             </c:forEach>
           </select>
          </form>
         </div>
       </div>
     </div>
      <div class="card-body admindefault">
        <div class="tab-content">
           <div class="tab-pane preview-tab-pane active" role="tabpanel" 
           	aria-labelledby="tab-dom-c5b10b85-baad-4da8-b18b-2973cbe42fac" 
           		id="dom-c5b10b85-baad-4da8-b18b-2973cbe42fac">
           <c:if test="${!empty empList}">
             <c:forEach var="listMap" items="${empList}">
             ${listMap['DEPT_NAME']} 
             </c:forEach>
             </c:if>
           </div>
        </div>
      </div>