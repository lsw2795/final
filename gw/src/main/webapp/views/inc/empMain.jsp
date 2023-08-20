<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="row mb-3">
	<div class="col-md-12">
		<div class="card" style="background-color: white;">
			<div class="d-flex mb-2 ms-3 mt-3">
				<img class="rounded-3"
					src="<c:url value='/images/${map["IMAGE"]}'/>" 
					alt="사원 이미지" style="width:80px; height: 80px;"/>
				<table class="table table-borderless fs--1 fw-medium mb-0">
					<tbody>
						<tr>
							<td class="p-1">${map['NAME']}</td>
						</tr>
						<tr>
							<td class="p-1">${map['POSITION_NAME']}</td>
						</tr>
						<tr>
							<td class="p-1">${map['DEPT_NAME']}</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="mb-2" style="text-align: center;">
				<input type="button" class="btn btn-sm btn-primary" value="버튼1"> <input
					type="button" class="btn btn-sm btn-primary" value="버튼2">
			</div>
		</div>
	</div>
</div>