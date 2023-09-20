<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../inc/top.jsp" %>
<link rel="stylesheet" href="<c:url value='/css/PDScss.css' />">

<script type="text/javascript">
    function pageFunc(curPage) {
        $('input[name="currentPage"]').val(curPage);
        $('form[name="frmPage"]').submit();
    }
</script>

<form action="<c:url value='/pds/list' />" name="frmPage" method="post">
    <input type="hidden" name="currentPage">
    <input type="hidden" name="searchKeyword" value="${param.searchKeyword}">
    <input type="hidden" name="searchCondition" value="${param.searchCondition}">
</form>

<div class="board_wrap">
    <div class="board_title">
        <strong>자료실</strong>
        <p>사내 자료실입니다.</p>
    </div>
    <form action="<c:url value='/pds/list' />" method="post">
        <div class="search">
            <select id="search1" name="searchCondition" class="form-select">
                <option value="title" <c:if test="${param.searchCondition=='title'}">selected="selected"</c:if>>제목</option>
                <option value="name" <c:if test="${param.searchCondition=='name'}">selected="selected"</c:if>>작성자</option>
                <option value="content" <c:if test="${param.searchCondition=='content'}">selected="selected"</c:if>>내용</option>
                <option value="total" <c:if test="${param.searchCondition=='total'}">selected="selected"</c:if>>제목+내용
                </option>
            </select>
            <input id="search2" name="searchKeyword" class="form-control" value="${param.searchKeyword}" type="text"
                placeholder="검색어를 입력하세요">
            <input id="search3" type="submit" class="btn btn-outline-dark" value="검색" id="searchSubmit">
        </div>
    </form>
    <div class="board_list_wrap">
        <div class="board_list">
            <div class="top">
                <div class="num">번호</div>
                <div class="title">제목</div>
                <div class="writer">작성자</div>
                <div class="date">작성일</div>
                <div class="count">조회</div>
                <div class="file">첨부파일</div>
            </div>
            <div>
                <c:forEach var="map" items="${list}">
                    <div class="num">${map['BOARD_NO']}</div>
                    <div class="title">
                        <a href="<c:url value='/pds/detail?boardNo=${map["BOARD_NO"]}' />">
                            ${map['TITLE']}
                            <c:if test="${map['timeNew']==1}">
                                <img alt="new이미지" src="<c:url value='/images/new.jpg' />">
                            </c:if>
                        </a>
                    </div>
                    <div class="writer">${map['NAME']}</div>
                    <div class="date"><fmt:formatDate value="${map['REGDATE']}" pattern="yyyy-MM-dd" /></div>
                    <div class="count">${map['READCOUNT']}</div>
                    <div class="file">
                        <c:if test="${map['fileCount']>0}">
                            <img src="<c:url value='/images/fileClip.png' />" alt="파일 이미지">
                        </c:if>
                    </div>
                </c:forEach>
            </div>
        </div>

        <!-- 페이징 처리 -->
        <div class="board_page">
            <!-- 페이지 번호 추가 -->
            <!-- 이전 블럭으로 이동 -->
            <c:if test="${pagingInfo.firstPage>1}">
                <a href="#" class="bt first" onclick="pageFunc(${pagingInfo.firstPage-1})"><<</a>
            </c:if>

            <!-- 이전 페이지로 이동 -->
            <c:if test="${pagingInfo.currentPage>1}">
                <a href="#" class="bt prev" onclick="pageFunc(${pagingInfo.currentPage-1})"><</a>
            </c:if>

            <!-- [1][2][3][4][5][6][7][8][9][10] -->
            <c:forEach var="i" begin="${pagingInfo.firstPage}" end="${pagingInfo.lastPage}">
                <c:if test="${i == pagingInfo.currentPage }">
                    <a href="#" class="num on">${i}</a>
                </c:if>
                <c:if test="${i != pagingInfo.currentPage }">
                    <a href="#" class="num" onclick="pageFunc(${i})">${i}</a>
                </c:if>
            </c:forEach>

            <!-- 다음 페이지로 이동 -->
            <c:if test="${pagingInfo.totalRecord>0}">
                <c:if test="${pagingInfo.lastPage!=pagingInfo.currentPage}">
                    <a href="#" class="bt next" onclick="pageFunc(${pagingInfo.currentPage+1})">></a>
                </c:if>
            </c:if>

            <!-- 다음 블럭으로 이동 -->
            <c:if test="${pagingInfo.lastPage < pagingInfo.totalPage }">
                <a href="#" class="bt last" onclick="pageFunc(${pagingInfo.lastPage+1})">>></a>
            </c:if>
            <!-- 페이지 번호 끝 -->
        </div>

        <div class="bt_wrap">
            <a href="<c:url value='/pds/write' />" class="on">등록</a>
        </div>
    </div>
</div>

<%@ include file="../inc/bottom.jsp" %>