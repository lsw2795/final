<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../inc/top.jsp" %>
<link rel="stylesheet" href="<c:url value='/css/mypageempform.css' />">
<script type="text/javascript">
    function pageFunc(curPage) {
        $('input[name="currentPage"]').val(curPage);
        $('form[name="frmPage"]').submit();
    }
</script>

<style>
    .avatar img {
        size: 10px;
    }

    .d-flex.align-items-center.gap-2.position-relative {
        margin-left: 10px;
    }

    .trSize {
        height: 100px;
        font-size: 17px;
    }

    .col-lg-12.pe-lg-2.mb-3 {
        width: 1200px;
    }

    thead.text-800.bg-light {
        font-size: 17px;
    }
</style>

<!-- 페이징 처리 관련 form -->
<form action="<c:url value='/qna/list' />" name="frmPage" method="post">
    <input type="hidden" name="currentPage">
    <input type="hidden" name="searchKeyword" value="${param.searchKeyword}">
    <input type="hidden" name="searchCondition" value="${param.searchCondition}">
</form>

<h2>Q&A 게시판</h2>
<div class="col-lg-12 pe-lg-2 mb-3">
    <div class="card" id="allContactTable"
        data-list='{"valueNames":["name","phone-number","report","subscription","social"],"page":10,"pagination":true,"fallback":"contact-table-fallback"}'>
        <div class="card-header border-bottom border-200 px-0">
            <div class="d-lg-flex justify-content-between">
                <div class="row flex-between-center gy-2 px-x1">
                    <div class="col-auto pe-0">
                        <form action='<c:url value='/qna/list' />'>
                            <select name="searchCondition" class="form-select form-select-sm"
                                aria-label="Bulk actions">
                                <option value="title"
                                    <c:if test="${param.searchCondition=='title'}"> selected="selected" </c:if>
                                >제목</option>
                                <option value="name"
                                    <c:if test="${param.searchCondition=='name'}"> selected="selected" </c:if>
                                >이름</option>
                                <option value="content"
                                    <c:if test="${param.searchCondition=='content'}"> selected="selected" </c:if>
                                >내용</option>
                            </select>
                    </div>
                    <div class="col-auto">
                        <div class="input-group input-search-width">
                            <input name="searchKeyword" class="form-control form-control-sm shadow-none search"
                                value='${param.searchKeyword}' type="search" placeholder="검색어 입력" aria-label="search" />
                            <button class="btn btn-sm btn-outline-secondary border-300 hover-border-secondary"><span
                                    class="fa fa-search fs--1"></span></button>
                        </div>
                        </form>
                    </div>
                </div>
                <div class="border-bottom border-200 my-3"></div>
                <div class="d-flex align-items-center justify-content-between justify-content-lg-end px-x1">
                    <button class="btn btn-sm btn-falcon-default d-xl-none" type="button" data-bs-toggle="offcanvas"
                        data-bs-target="#allContactOffcanvas" aria-controls="allContactOffcanvas"><span
                            class="fas fa-filter" data-fa-transform="shrink-4"></span><span class="ms-1 d-none d-sm-inline-block">Filter</span></button>
                    <div class="bg-300 mx-3 d-none d-lg-block d-xl-none"
                        style="width:1px; height:29px"></div>
                    <div class="d-none" id="table-contact-actions">
                        <div class="d-flex">
                            <button class="btn btn-falcon-default btn-sm ms-2" type="button">질문 삭제</button>
                        </div>
                    </div>
                    <div class="d-flex align-items-center" id="table-contact-replace-element">
                        <a href='<c:url value='/qna/write' />'><button class="btn btn-falcon-default btn-sm" type="button"><span
                                    class="fas fa-plus" data-fa-transform="shrink-3"></span><span class="d-none d-sm-inline-block d-xl-none d-xxl-inline-block ms-1">질문 등록</span></button>
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <div class="card-body p-0">
            <div class="table-responsive scrollbar">
                <table class="table table-sm fs--1 mb-0">
                    <thead class="text-800 bg-light">
                        <tr>
                            <th class="sort align-middle ps-5" data-sort="name">작성자</th>
                            <th class="sort align-middle pe-5" data-sort="userid">직급</th>
                            <th class="sort align-middle pe-5" data-sort="title">제목</th>
                            <th class="sort align-middle text-end" data-sort="regdate">등록일</th>
                            <th class="sort align-middle text-end" data-sort="readcount">조회수</th>
                        </tr>
                    </thead>
                    <tbody class="list" id="table-contact-body">
                        <!-- 반복 시작 -->
                        <c:forEach var="map" items="${list}">
                            <tr class="trSize">
                                <td class="align-middle name white-space-nowrap pe-5 ps-2">
                                    <div class="d-flex align-items-center gap-2 position-relative">
                                        <div class="avatar avatar-xl">
                                            <c:if test="${!empty map['IMAGE']}">
                                                <div class="avatar-name rounded-circle">
                                                    <img class="rounded-circle"
                                                        src="<c:url value='/images/${map["IMAGE"]}' />" alt="no">
                                                </div>
                                            </c:if>

                                            <c:if test="${empty map['IMAGE']}">
                                                <div class="avatar avatar-2xl">
                                                    <img class="rounded-circle" style="position:relative; right: 5px;"
                                                        class="rounded-circle"
                                                        src="<c:url value='/images/noImage.jpg' />" />
                                                </div>
                                            </c:if>
                                        </div>
                                        <h6 class="mb-0"><span>${map['NAME']}</span></h6>
                                    </div>
                                </td>
                                <td class="align-middle phone-number font-sans-serif white-space-nowrap"><span>사원</span>
                                </td>
                                <td class="align-middle report">
                                    <a href="<c:url value='/qna/detail?boardNo=${map.BOARD_NO}' />"><span
                                            style="color: black">${map['TITLE']}</span>
                                        <!-- 답변 갯수 표시 -->
                                        <c:if test="${map['countReply']>0}">
                                            <span style="color: red">[${map['countReply']}]</span>
                                        </c:if>
                                        <c:if test="${map['timeNew']==1}">
                                            <img alt="new이미지" src="<c:url value='/images/new.jpg' />">
                                        </c:if>
                                    </a>
                                </td>
                                <td class="align-middle subscription fs-0 text-end"><small
                                        class="badge rounded badge-subtle-success"><fmt:formatDate
                                            value="${map['REGDATE']}" pattern="yyyy-MM-dd" /></small></td>
                                <td class="align-middle social text-end ps-4">${map['READCOUNT']}</td>
                            </tr>
                        </c:forEach>
                        <!-- 반복 끝 -->
                    </tbody>
                </table>
                <div class="text-center d-none" id="contact-table-fallback">
                    <p class="fw-bold fs-1 mt-3">검색결과가 없습니다.</p>
                </div>
            </div>
        </div>

        <div class="card-footer d-flex justify-content-center ">
            <div class="divPage" id="divPage">
                <!-- 페이지 번호 추가 -->
                <!-- 이전 블럭으로 이동 -->
                <c:if test="${pagingInfo.firstPage>1 }">
                    <a href="#" id="prevPage" onclick="pageFunc(${pagingInfo.firstPage-1})">
                        <img src="<c:url value='/images/first.JPG' />">
                    </a>
                </c:if>

                <!-- [1][2][3][4][5][6][7][8][9][10] -->
                <c:forEach var="i" begin="${pagingInfo.firstPage }" end="${pagingInfo.lastPage }">
                    <c:if test="${i == pagingInfo.currentPage }">
                        <span id="curPage">${i}</span>
                    </c:if>
                    <c:if test="${i != pagingInfo.currentPage }">
                        <a href="#" id="otherPage" onclick="pageFunc(${i})">${i}</a>
                    </c:if>
                </c:forEach>

                <!-- 다음 블럭으로 이동 -->
                <c:if test="${pagingInfo.lastPage < pagingInfo.totalPage }">
                    <a href="#" id="nextPage" onclick="pageFunc(${pagingInfo.lastPage+1})">
                        <img src="<c:url value='/images/last.JPG' />">
                    </a>
                </c:if>
                <!-- 페이지 번호 끝 -->
            </div>
        </div>
    </div>
</div>
<%@ include file="../inc/bottom.jsp" %>
