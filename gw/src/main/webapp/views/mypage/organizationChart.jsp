<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<link rel="stylesheet" href="<c:url value='/css/mypageempform.css'/>">
<script type="text/javascript" src="<c:url value='/js/jquery-3.7.0.min.js'/>"></script>
<script type="text/javascript">
$(function(){
    $('.btnDept').click(function () {
    	var deptNo = $(this).data('dept-no');
      	/* alert("부서번호 : " + deptNo); */

        $.ajax({
            url: "<c:url value='/mypage/ajaxOrganizationChart'/>",
            type: "get",
            data: { deptNo: deptNo },
            success: function (res) {
                if (res.length > 0) {
                    $('#empList').empty();
                    $.each(res, function (index, item) {
                        var result = "<a href='#' class='list-group-item-action'>" +
                                     item.EMP_NO + " " + item.NAME + " " + item.POSITION_NAME +
                                     "</a>";
                        $('#empList').append(result);
                    });
                }
            },
            error:function(xhr,status,error){
                alert(status+" : "+error);
            } 
        });
    });
});
</script>
<div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasRight" aria-labelledby="offcanvasRightLabel">
    <div class="offcanvas-header">
        <h5 class="offcanvas-title" id="offcanvasRightLabel">조직도</h5>
        <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
    </div>
    <div class="offcanvas-body">
        <c:if test="${empty deptList}">
            비어있음
        </c:if>
        <c:if test="${!empty deptList}">
            <c:forEach var="deptVo" items="${deptList}">
                <p>
                    <button class="btn btn-primary btnDept" type="button"
                            data-bs-toggle="collapse" data-bs-target="#dept-${deptVo.deptNo }"
                            data-dept-no="${deptVo.deptNo}">
                        <span class="fas fa-plus" data-fa-transform="shrink-3"></span>
                    </button>
                    <span>${deptVo.name }</span>
                </p>
                <div class="row">
                    <div class="col">
                        <div class="collapse" id="dept-${deptVo.deptNo }">
                            <div class="card card-body">
                                <div class="list-group" id="empList">
                                   <!--  <a href="#" class="list-group-item-action">사원1</a> -->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </c:if>
 
				<div class="border-top border-200 py-x1">
					<small>사원번호/이름/부서/직급 검색</small>
					<div class="input-group">
						<input class="form-control shadow-none search"
							type="search" placeholder="검색어 입력" aria-label="search"/>
						<button class="btn btn-sm btn-outline-secondary border-300 hover-border-secondary">
							<span class="fa fa-search fs--1"></span>
						</button>
					</div>
				</div>
		  </div>
		</div>