<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../inc/top.jsp" %>

<style>
    .title {
        position: absolute;
        left: 100px;
        top: 10px;
    }
</style>

<script type="text/javascript">
    function deleteQna() {
        if (confirm("질문을 삭제하시겠습니까?")) {
            location.href = "<c:url value='/qna/delete?boardNo=${map.BOARD_NO}'/>";
        }
    }

    function deleteComment(commentNo, boardNo) {
        if (confirm("답변을 삭제하시겠습니까?")) {
            location.href = "<c:url value='/qna/commentDelete?commentNo=" + commentNo + "&boardNo=" + boardNo + "'/>";
        }
    }

    var clickCount = 0;

    function editComment(textDivId, commentNo) {
        $('#btEdit').hide();
        // 생성할 form 요소를 jQuery를 사용하여 생성합니다.
        var formHtml = '<form id="editComment" name="editForm" method="post" action="<c:url value="/qna/editComment"/> ">' +
            '<input type="hidden" name="commentNo" value="' + commentNo + '" />' +
            '<input type="hidden" name="boardNo" value="${map["BOARD_NO"]}" />' +
            '<textarea id="editArea" name="content" form="editComment" cols="40" rows="5" placeholder="수정할 답변을 입력해주세요."></textarea>' +
            '<div><input type="submit" value="수정"></div>' +
            '</form>';

        // moveComment 요소에 formHtml을 추가합니다.
        $('#' + textDivId).html(formHtml);
    }
</script>

<style>
    .titleSize {
        font-size: 25px;
        font-weight: bold;
    }
</style>

<div class="row g-3">
    <div class="col-xxl-12 col-xl-8">
        <div class="card">
            <div class="card-header d-flex flex-between-center">
                <button class="btn btn-falcon-default btn-sm" type="button"><a href="<c:url value='/qna/list'/>"><span
                            class="fas fa-arrow-left"></span></a></button>
                <div class="d-flex">
                    <h2 class="title">Q&A 게시판</h2>

                    <!-- 로그인한 사원과 게시글 작성자와 같을 경우에만 질문수정 버튼이 보임  -->
                    <c:if test="${sessionScope.empNo==map['EMP_NO'] }">
                        <a href="<c:url value='/qna/edit?boardNo=${map.BOARD_NO}'/>">
                            <button class="btn btn-falcon-default btn-sm" type="button">
                                <span class="fas fa-pen" data-fa-transform="shrink-2 down-1"></span>
                                <span class="d-none d-md-inline-block ms-1">질문 수정</span>
                            </button>
                        </a>
                        <button onclick="deleteQna()" class="btn btn-falcon-default btn-sm ms-2 d-none d-sm-block"
                            type="button">
                            <span class="fas fa-trash-alt" data-fa-transform="shrink-2 down-1"></span>
                            <span class="d-none d-md-inline-block ms-1">삭제</span>
                        </button>
                    </c:if>
                    <div class="dropdown font-sans-serif ms-2">
                    </div>
                </div>
            </div>
        </div>
        <div class="card mt-3">
            <div class="card-header bg-light">
                <h1><span class="fas me-2 fa-question-circle"></span><span
                        class="titleSize">${map['TITLE']}</span></h1>
            </div>
            <div class="card-body">

                <!-- 질문 글  -->
                <div
                    class="d-md-flex d-xl-inline-block d-xxl-flex align-items-center justify-content-between mb-x1">
                    <div class="d-flex align-items-center gap-2"><a href="../../app/support-desk/contact-details.jsp">
                            <div class="avatar avatar-2xl">
                                <c:if test="${!empty map['IMAGE']}">
                                    <img class="rounded-circle"
                                        src="<c:url value='/images/${map["IMAGE"]}'/>"
                                        alt="글쓴 사원 이미지" />
                                </c:if>
                                <c:if test="${empty map['IMAGE']}">
                                    <div class="avatar avatar-2xl">
                                        <img class="rounded-circle"
                                            src="<c:url value='/images/noImage.jpg'/>" />
                                    </div>
                                </c:if>
                            </div>
                        </a>
                        <p class="mb-0"><a class="fw-semi-bold mb-0 text-800"
                                href="../../app/support-desk/contact-details.jsp">${map['NAME']}</a><a
                                class="mb-0 fs--1 d-block text-500"
                                href="mailto:emma@watson.com">${map['EMAIL']}</a></p>
                    </div>
                    <p class="mb-0 fs--2 fs-sm--1 fw-semi-bold mt-2 mt-md-0 mt-xl-2 mt-xxl-0 ms-5"><fmt:formatDate
                            value="${map['REGDATE']}" pattern="yyyy-MM-dd" /><span class="mx-1">|</span><span
                            class="fst-italic"><fmt:formatDate
                                value="${map['REGDATE']}" pattern="a h:mm" /></span><span
                            class="fas fa-star ms-2 text-warning"></span></p>
                </div>

                <!-- 글 줄바꿈 처리  -->
                <% pageContext.setAttribute("newLine", "\r\n"); %>
                <c:set var="content" value="${fn:replace(map['CONTENT'], newLine, '<br>')}" />

                <div id="content">
                    ${content}
                </div>
                <!-- 질문 글 끝  -->

                <div class="my-5 position-relative text-center">
                    <hr class="position-absolute top-50 border-300 w-100 my-0" /><span
                        class="position-relative bg-white dark__bg-card-dark px-3 z-1">
                        <button class="btn btn-sm btn-outline-secondary rounded-pill border-300 px-lg-5">답변 내용</button>
                    </span>
                </div>

                <!-- 답변 반복 시작 -->
                <c:forEach var="replyMap" items="${replyList}" varStatus="status">
                    <div
                        class="d-md-flex d-xl-inline-block d-xxl-flex align-items-center justify-content-between mb-x1">
                        <div class="d-flex align-items-center gap-2">
                            <c:if test="${!empty replyMap['IMAGE']}">
                                <div class="avatar avatar-2xl">
                                    <img class="rounded-circle"
                                        src="<c:url value='/images/${replyMap["IMAGE"]}'/>" />
                                </div>
                            </c:if>
                            <c:if test="${empty replyMap['IMAGE']}">
                                <div class="avatar avatar-2xl">
                                    <img class="rounded-circle"
                                        src="<c:url value='/images/noImage.jpg'/>" />
                                </div>
                            </c:if>
                            </a>
                            <p class="mb-0"><a class="fw-semi-bold mb-0 text-800"
                                    href="../../app/support-desk/contact-details.jsp">${replyMap['NAME']}</a>
                                <a class="mb-0 fs--1 d-block text-500"
                                    href="mailto:mike@support.com">${replyMap['EMAIL']}</a></p>
                        </div>
                        <p class="mb-0 fs--2 fs-sm--1 fw-semi-bold mt-2 mt-md-0 mt-xl-2 mt-xxl-0 ms-5"><fmt:formatDate
                                value="${replyMap['REGDATE']}" pattern="yyyy-MM-dd" /><span class="mx-1">|</span><span
                                class="fst-italic"><fmt:formatDate
                                    value="${replyMap['REGDATE']}" pattern="a h:mm" /></span><span
                                class="fas fa-star ms-2 text-warning"></span></p>
                    </div>

                    <div class="border-bottom mb-5 pb-5">
                        <!-- 답변 글 줄바꿈 처리  -->
                        <% pageContext.setAttribute("newLine", "\r\n"); %>
                        <c:set var="content" value="${fn:replace(replyMap['CONTENT'], newLine, '<br>')}" />

                        <div id="content${status.index}">
                            ${content}
                        </div>

                        <c:if test="${sessionScope.empNo == replyMap['EMP_NO']}">
                            <div style="float: right;">
                                <button style="float: right;"
                                    onclick="deleteComment(${replyMap['COMMENT_NO']}, ${map['BOARD_NO']});"
                                    class="btn btn-falcon-default btn-sm ms-2 d-none d-sm-block" type="button">
                                    <svg class="svg-inline--fa fa-trash-alt fa-w-14"
                                        data-fa-transform="shrink-2 down-1" aria-hidden="true"
                                        focusable="false" data-prefix="fas" data-icon="trash-alt" role="img"
                                        xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"
                                        data-fa-i2svg=""
                                        style="transform-origin: 0.4375em 0.5625em;"><g
                                            transform="translate(224 256)"><g
                                                transform="translate(0, 32)  scale(0.875, 0.875)  rotate(0 0 0)"><path
                                                    fill="currentColor"
                                                    d="M32 464a48 48 0 0 0 48 48h288a48 48 0 0 0 48-48V128H32zm272-256a16 16 0 0 1 32 0v224a16 16 0 0 1-32 0zm-96 0a16 16 0 0 1 32 0v224a16 16 0 0 1-32 0zm-96 0a16 16 0 0 1 32 0v224a16 16 0 0 1-32 0zM432 32H312l-9.4-18.7A24 24 0 0 0 281.1 0H166.8a23.72 23.72 0 0 0-21.4 13.3L136 32H16A16 16 0 0 0 0 48v32a16 16 0 0 0 16 16h416a16 16 0 0 0 16-16V48a16 16 0 0 0-16-16z"
                                                    transform="translate(-224 -256)"></path></g></g></svg><!-- <span class="fas fa-trash-alt" data-fa-transform="shrink-2 down-1"></span> Font Awesome fontawesome.com -->
                                    <span class="d-none d-md-inline-block ms-1">삭제</span>
                                </button>

                                <button style="float: right;" id="btEdit"
                                    onclick="editComment('moveComment${status.index}', ${replyMap['COMMENT_NO']});"
                                    class="btn btn-falcon-default btn-sm" type="button">
                                    <span class="fas fa-pen" data-fa-transform="shrink-2 down-1"></span>
                                    <span class="d-none d-md-inline-block ms-1">답변 수정</span>
                                </button>
                            </div>
                        </c:if>
                        <div id="moveComment${status.index}"></div>
                    </div>
                </c:forEach>
                <!-- 답변 반복 끝  -->
            </div>

            <!-- 답변 등록  -->
            <form id="replyForm" method="post" action="<c:url value='/qna/reply'/>">
                <div class="collapse transition-none" id="previewMailForm">
                    <h5 class="mb-0 p-x1 bg-light">답변</h5>
                    <div class="border border-y-0 border-200">
                        <input name="boardNo" type="hidden" value="${param.boardNo}">
                        <input name="empNo" type="hidden" value="${sessionScope.empNo}">
                        <textarea class="form-control" id="commentContent" name="content" cols="50" rows="15"
                            placeholder="내용" form="replyForm"></textarea>
                    </div>

                    <div class="d-flex align-items-center justify-content-between px-x1 py-3">
                        <div class="d-flex align-items-center">
                            <button class="btn btn-primary btn-sm px-4 me-2" type="submit">답변 등록</button>
                            <button class="btn btn-primary btn-sm px-4 me-2" type="button" data-bs-toggle="tooltip"
                                data-bs-placement="top" title="취소" data-dismiss="collapse">취소</button>
                        </div>

                        <div class="d-flex align-items-center">
                            <div class="dropdown font-sans-serif me-2 btn-reveal-trigger">
                                <div class="dropdown-menu dropdown-menu-end border py-2"
                                    aria-labelledby="email-options">
                                    <a class="dropdown-item" href="#!">Print</a><a class="dropdown-item"
                                        href="#!">Check spelling</a><a class="dropdown-item" href="#!">Plain text mode</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card-footer bg-light" id="preview-footer">
                    <button class="btn btn-falcon-default btn-sm fs--1" type="button" data-bs-toggle="collapse"
                        data-bs-target="#previewMailForm" aria-expanded="false" aria-controls="previewMailForm"><span
                            class="fas fa-reply"></span><span class="d-none d-sm-inline-block ms-1">답변</span></button>
                </div>
            </form>
            <!-- 답변 등록 끝 -->
        </div>
    </div>
</div>

<%@ include file="../inc/bottom.jsp" %>
