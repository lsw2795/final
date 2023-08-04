<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../inc/top.jsp" %>
<div class="container p-0">
	<div class="row g-0">
		<div class="col-lg pe-lg-2 mb-3">
			<div class="card h-lg-100 overflow-hidden">
				<div class="card-header bg-light">전자결재</div>
				<div class="card-body py-2 "></div>
			</div>
		</div>
	</div>
	<div class="row g-0">
		<div class="col-lg pe-lg-2 mb-3">
			<div class="card h-lg-100 overflow-hidden">
				<div class="card-body py-2 ">
					<c:import url="/views/approval/document/vacationPlan.jsp"></c:import>
				</div>
				<div class="card-footer py-2 "></div>
			</div>
		</div>
	</div>
</div>
<%@ include file = "../inc/bottom.jsp" %>