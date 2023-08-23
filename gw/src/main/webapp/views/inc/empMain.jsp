<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
	@import url(https://fonts.googleapis.com/css?family=Roboto:700);
	#holder{
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
	  box-shadow: 0px 3px 8px rgba(0,0,0,0.25);
	  border-radius: 2px;
	}
	.button {
		background: #3D4C53;
	    margin: 20px auto;
	    width: 40%;
	    height: 50px;
	    overflow: hidden;
	    text-align: center;
	    transition: .2s;
	    cursor: pointer;
	    border-radius: 3px;
	    box-shadow: 0px 1px 2px rgba(0,0,0,.2);
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
	  color : white;
	  transition : .3s;
	}
	.btnText2 {
	  margin-top : 63px;
	  margin-right : -130px;
	  color : #FFF;
	}
	.button:hover .btnTwo{ /*When hovering over .button change .btnTwo*/
	  left: -130px;
	}
	.button:hover .btnText{ /*When hovering over .button change .btnText*/
	  margin-left : 65px;
	}
	.button:active { /*Clicked and held*/
	  box-shadow: 0px 5px 6px rgba(0,0,0,0.3);
	}
</style>

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
					    <p class="btnText">출근</p>
					    <div class="btnTwo">
					      <p class="btnText2">in</p>
					    </div>
					 </div>
					
					<div class="button">
					    <p class="btnText">퇴근</p>
					    <div class="btnTwo">
					      <p class="btnText2">out</p>
					    </div>
					</div>
			</div>
		</div>
	</div>
</div>