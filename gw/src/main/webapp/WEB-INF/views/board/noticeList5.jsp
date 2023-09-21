<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 
사원뷰 - indexMain.jsp에 c:import 태그 이용한 공지사항 최신 5건 조회
내용 : 제목 클릭시 조회수 증가 ajax 처리 후 사원뷰 - 공지사항 상세뷰 이동
컨트롤러 : com.ez.gw.board.controller.NoticeController	  
작성자 : 송영은
작성일 : 2023.08
 -->  	    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script type="text/javascript">
	//조회수 증가 ajax
	function updateReadCount(boardNo){
		$.ajax({
	        url: "<c:url value='/board/updateReadCount'/>",
	        type:'get',
			data: {
				boardNo: boardNo
			},
			dataType:'json',
	        success: function (res) {
	        	if(res>0){
	        		location.href="<c:url value='/board/noticeDetail?boardNo="+boardNo+"'/>"
	        	}
	        },
	        error:function(xhr,status,error){
	            alert(status+" : "+error);
	        } 
	    });//ajax
	}
</script>
<div class="card-body" style="background: white;">
	<table summary="최근 공지사항 5건을 보여주는 표입니다.">
		<colgroup>
			<col style="width: 100%;" />
		</colgroup>	
		<tbody>
			<c:if test="${empty noticeList }">
				<tr>
					<td>데이터가 없습니다</td>
				</tr>
			</c:if>
			<c:if test="${!empty noticeList }">
				<c:forEach var="map" items="${noticeList }">
					<tr>
						<td>
							<img src="<c:url value='/images/last.JPG'/>">
							<a href="#" onclick="updateReadCount(${map.BOARD_NO});"
								style="text-decoration: none; color:#5e6e82;">
							<c:if test="${fn:length(map['TITLE'])>30}">
								${fn:substring(map['TITLE'],0,30)}...
							</c:if>
							<c:if test="${fn:length(map['TITLE'])<30}">
								${map['TITLE']}
							</c:if>		
							<c:if test="${map['timeNew']==1}">
								<img alt="New이미지" src="<c:url value='/images/new.jpg'/>">
							</c:if>
							</a>
						</td>
					</tr>
				</c:forEach>			
			</c:if>
		</tbody>
	</table>
</div>