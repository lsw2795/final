<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<link rel="stylesheet" href="<c:url value='/css/PDScss.css'/>">
<style>
	ul#navbarVerticalNav {
   		font-size: 17px;
	}	
</style>

    <div class="board_wrap">
        <div class="board_title">
            <strong>자료실</strong>
            <p>사내 자료실입니다.</p>
        </div>
        <form action="<c:url value='/pds/list'/>" method="post">	
	        <div class="search" >
	            <select id="search1" name="searchCondition" class="form-select">
	            	<option value="title">제목</option>
	            	<option value="name">작성자</option>
	            	<option value="content">내용</option>
	            	<option value="total">제목+내용</option>
		        </select>
		        <input id="search2" name="searchKeyword" class="form-control" value="" type="text" placeholder="검색어를 입력하세요">
		        <input id="search3" type="submit" class="btn btn-outline-dark" value="검색" id="searchSubmit">
	        </div>
	    </form>    
        <div class="board_list_wrap">
            <div class="board_list">
                <div class="top">
                    <div class="num">번호</div>
                    <div class="title">제목</div>
                    <div class="writer">글쓴이</div>
                    <div class="date">작성일</div>
                    <div class="count">조회</div>
                    <div class="file">첨부파일</div>
                </div>
                <div>
                	<c:forEach var="map" items="${list}">
	                    <div class="num">${map['BOARD_NO']}</div>
	                    <div class="title"><a href="<c:url value='/pds/detail?boardNo=${map["BOARD_NO"]}'/>">${map['TITLE']}</a></div>
	                    <div class="writer">${map['NAME']}</div>
	                    <div class="date"><fmt:formatDate value="${map['REGDATE']}" pattern="yyyy-MM-dd"/></div>
	                    <div class="count">${map['READCOUNT']}</div>
	                    <div class="file">
	                    	<c:if test="${!empty map['FILENAME']}">
	                    		<img src="<c:url value='/images/fileClip.png'/>" alt="파일 이미지">
	                    	</c:if>
	                    </div>
	                </c:forEach>    
                </div>
            </div>
            <div class="board_page">
                <a href="#" class="bt first"><<</a>
                <a href="#" class="bt prev"><</a>
                <a href="#" class="num on">1</a>
                <a href="#" class="num">2</a>
                <a href="#" class="num">3</a>
                <a href="#" class="num">4</a>
                <a href="#" class="num">5</a>
                <a href="#" class="bt next">></a>
                <a href="#" class="bt last">>></a>
            </div>
            <div class="bt_wrap">
                <a href="<c:url value='/pds/write'/>" class="on">등록</a>
                <!--<a href="#">수정</a>-->
            </div>
        </div>
    </div>
    
<%@ include file="../inc/bottom.jsp"%>