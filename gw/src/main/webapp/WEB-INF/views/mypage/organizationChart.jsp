<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 
사원뷰 - 조직도 조회 뷰
내용 : 부서 클릭시 해당 소속 사원 목록 조회, 사원클릭시 해당 사원 정보보기 창 생성,
      사원검색 ajax 처리(페이징처리 포함) 
컨트롤러 : com.ez.gw.dept.controller.DeptController
		 com.ez.gw.employee.controller.EmployeeController  
작성자 : 송영은
작성일 : 2023.08
 -->        
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<link rel="stylesheet" href="<c:url value='/css/mypageempform.css'/>">
<script type="text/javascript" src="<c:url value='/js/jquery-3.7.0.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/paging.js'/>"></script>
<script type="text/javascript">
$(function(){
	//다른 부서 클릭시 기존 클릭한 부서 목록 아코디언 식으로 들어가도록 처리
    $('.btnDept').click(function () {
   	    var target = $(this).data('bs-target');
        var $targetElement = $(target);
        $('.collapse.show').not($targetElement).collapse('hide');
        $targetElement.collapse('toggle');
    });   
    //사원 검색시 1페이지 고정
    $('#btnSearch').click(function(){
    	send(1);
    });
    //검색시 enter로 버튼 클릭 키능 활성화
    $('input[type=search]').keyup(function(event) {
        if (event.keyCode === 13 || event.key === 'Enter') {
        	send(1);
        }
    });
    
});
//부서 열고 닫기 아코디언 연출
function btnCss(index) {
    var $btn = $('.btnDept').eq(index);
    
    if ($btn.find('span').text() === '▶') {
        $('.btnDept').each(function () {
            $(this).find('span').html('▶');
        });
        $btn.find('span').html('▼');
    } else {
        $btn.find('span').html('▶');
    }
}
//사원 정보보기
function empDetail(empNo) {
    window.open("<c:url value='/mypage/empDetail?empNo='/>"+empNo,'empDetail', 'width=320,height=550,top=300,left=700,location=yes,resizable=yes');
}
//사원 쪽지보내기
function messageWrite(empNo) {
    window.location.href = "<c:url value='/message/messageWrite?empNo='/>"+empNo;
}
//ajax 검색기능 처리
function send(curPage){
	$('#currentPage').val(curPage);
	
	var searchKeyword= $('input[type=search]').val();
	var currentPage=$('#currentPage').val();
	
	$.ajax({
    url: "<c:url value='/mypage/ajaxSearchEmp'/>",
    type: "get",
    data:{
		searchKeyword: searchKeyword,
		currentPage: currentPage
	},
	success: function (res) {
	 $('#searchEmp').empty();
    	if (res.searchList.length > 0) {
        var searchrs = "검색 결과 : 총 <b style='font-weight: bold; color:red;'>" + res.pagingInfo.totalRecord + "</b>건 입니다.<br>";
        var results = "";
        $.each(res.searchList, function (index, item) {
                results += "<a href='#' style='font-size: 18px;' class='list-group-item-action' onclick='empDetail(" + item.EMP_NO + ")'>" +
                    "[" + item.DEPT_NAME + "]" + " " + item.EMP_NO + " " + item.NAME + " " + item.POSITION_NAME +
                    "</a><br>";
            });
            $('#searchEmp').empty();
            $('#divPage').empty();
            $('#searchEmp').append(searchrs + results);
            
            $('#totalRecord').val(res.pagingInfo.totalRecord);
            $('#currentPage').val(res.pagingInfo.currentPage);
            $('#countPerPage').val(res.pagingInfo.recordCountPerPage);
            $('#firstRecordIndex').val(res.pagingInfo.firstRecordIndex);
            //페이징처리 포함
            pageMake(curPage);
        } else {
            var result = "검색결과가 없습니다.";
            $('#searchEmp').empty();
            $('#divPage').empty();
            $('#searchEmp').append(result);
        }
    },
    error: function(xhr, status, error) {
        alert(status + " : " + error);
    } 
    });
}

function pageMake(){
   //페이징 처리
   var blockSize=10;
      var countPerPage = $('#countPerPage').val();
      var currentPage = $('#currentPage').val(); 
      var totalRecord = $('#totalRecord').val();
      pagination(currentPage, countPerPage, blockSize, totalRecord);
   //이전 블럭으로
   var str="";
   if(firstPage>1){
	   str+="<a href='#' onclick='send("+(firstPage-1)+")'>";
	   str+="<img src='<c:url value='/images/first.JPG'/>'></a>";
   }
   //페이지 번호 출력
   for(var i=firstPage;i<=lastPage;i++){
	   if(i==currentPage){
		   str+="<span style='font-weight: bold; font-size:20px;'>"+ i +"</span>";
	   }else{
		   str+="<a href='#' onclick='send("+i+")' style='font-size: 20px; color:gray;'>["+ i +"]</a>";
	   }
   }//for
   //다음 블럭으로
   if(lastPage < totalPage){
	   str+="<a href='#' onclick='send("+(lastPage+1)+")'>";
	   str+="<img src='<c:url value='/images/last.JPG'/>'></a>"
   }
   $('#divPage').html(str);
}
</script>
<div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasRight" aria-labelledby="offcanvasRightLabel">
    <div class="offcanvas-header">
        <h5 class="offcanvas-title" id="offcanvasRightLabel">조직도</h5>
        <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
    </div>
    <div class="offcanvas-body">
        <c:if test="${empty list}">
            비어있음
        </c:if>
        <c:if test="${!empty list}">
        	<c:set var="i" value="0"></c:set>
            <c:forEach var="deptAllVo" items="${list}">
                <p>
                    <button class="btn btnDept" type="button"
                            data-bs-toggle="collapse" data-bs-target="#dept-${deptAllVo.deptVo.deptNo }"
                            data-dept-no="${deptAllVo.deptVo.deptNo}" onclick="btnCss(${i});">
                        <span id="btnDeptSpan${i }">▶</span>
                    </button>
                    <b>${deptAllVo.deptVo.name }</b>
                </p>
                <div class="row">
                    <div class="col">
                        <div class="collapse" id="dept-${deptAllVo.deptVo.deptNo }">
                            <div class="card card-body">
                                <div class="list-group" id="empList">
                                	<c:forEach var="map" items="${deptAllVo.empList }">
                                   		<button class="list-group-item-action mypageempbtncss" onclick="empDetail(${map.EMP_NO});" style="margin: 5px;">
                                   			${map['EMP_NO']} ${map['NAME']} ${map['POSITION_NAME']}
                                   		</button>
                                	</c:forEach>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
               <c:set var="i" value="${i+1 }"></c:set> 
            </c:forEach>
        </c:if>
		<div class="border-top border-200 py-x1">
			사원번호/이름/부서/직위 검색
			<div class="input-group">
				<input class="form-control shadow-none search"
					type="search" placeholder="검색어 입력" aria-label="search"/>
				<button id="btnSearch" class="btn btn-sm btn-outline-secondary border-300 hover-border-secondary">
					<span class="fa fa-search fs--1"></span>
				</button>
			</div>
		</div>
		<input type="hidden" name="currentPage" id="currentPage" value="1"/>
	  	<input type="hidden" id="countPerPage"/>
		<input type="hidden" id="totalRecord"/>
		<input type="hidden" id="firstRecordIndex"/>
		<div id="searchEmp"></div>
		<div id="divPage"></div>
		  </div>
		</div>