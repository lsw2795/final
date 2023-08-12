<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<link rel="stylesheet" href="<c:url value='/css/PDScss.css'/>">
<style>

</style>

<body>
    <div class="board_wrap">
        <div class="board_title">
            <strong>자료실</strong>
            <p>사내 자료실입니다.</p>

        </div>
        <div class="search">
     	            <select name="searchCondition" class="form-select">
            	<option value="title">제목</option>
            	<option value="name">작성자</option>
            	<option value="content">내용</option>
            	<option value="total">제목+내용</option>
	        </select>
	        <input name="searchKeyword" class="form-control" value="" type="text" placeholder="검색어를 입력하세요">
	        <input type="submit" class="btn btn-outline-dark" value="검색" id="searchSubmit">
        
        </div>
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
                    <div class="num">글번호</div>
                    <div class="title"><a href="<c:url value='/pds/detail?boardNo=1'/>">제목</a></div>
                    <div class="writer">이름</div>
                    <div class="date">2023-0811</div>
                    <div class="count">33</div>
                    <div class="file">
                    	<img src="<c:url value='/images/fileClip.png'/>" alt="파일 이미지">
                    </div>
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