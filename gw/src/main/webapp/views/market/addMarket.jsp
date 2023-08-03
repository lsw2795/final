<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>

<link href="<c:url value='/vendors/choices/choices.min.css'/>" rel="stylesheet">
<link href="<c:url value='/vendors/flatpickr/flatpickr.min.css'/>" rel="stylesheet">
<link href="<c:url value='/vendors/dropzone/dropzone.min.c.css'/>" rel="stylesheet">

 <div class="content">
          <div class="card mb-3">
            <div class="card-body">
              <div class="row flex-between-center">
                <div class="col-md">
                  <h5 class="mb-2 mb-md-0">물건 팔기</h5>
                </div>
                <div class="col-auto">
                </div>
              </div>
            </div>
          </div>
          <div class="row g-0">
              <div class="card mb-3">
                <div class="card-body">
                  <form>
                    <div class="row gx-2">
                      <div class="col-12 mb-3">
                        <label class="form-label" for="product-name">제목</label>
                        <input class="form-control" id="product-name" type="text" />
                      </div>
                      <div class="col-12 mb-3">
                        <label class="form-label" for="identification-no">상품명</label>
                        <input class="form-control" id="identification-no" type="text" />
                      </div>
                      <div class="col-12 mb-3">
                        <label class="form-label" for="product-summary">가격</label>
                        <input class="form-control" id="product-summary" type="text" />
                      </div>
                      <div class="col-12 mb-3">
                      <label class="form-label" for="product-description">자세한 설명</label>
                      <div class="create-product-description-textarea">
                      	<input class="form-control" id="product-summary" type = "text"  style="height:150px"/>
                        <textarea class="tinymce d-none" data-tinymce="data-tinymce" name="product-description" id="product-description"></textarea>
                      </div>
                    </div>
                    </div>
                  </form>
                </div>
              </div>
              <div class="card mb-3">
                <div class="card-header bg-light">
                  <h6 class="mb-0">이미지 추가</h6>
                </div>
                <div class="card-body">
                  <form class="dropzone dropzone-multiple p-0" id="dropzoneMultipleFileUpload" data-dropzone="data-dropzone" action="#!" data-options='{"acceptedFiles":"image/*"}'>
                    <div class="fallback">
                      <input name="file" type="file" multiple="multiple" />
                    </div>
                    <div class="dz-message" data-dz-message="data-dz-message"> <img class="me-2" src="../../../assets/img/icons/cloud-upload.svg" width="25" alt="" /><span class="d-none d-lg-inline">파일을 드래그하세요.<br/>or, </span><span class="btn btn-link p-0 fs--1">Browse</span></div>
                    <div class="dz-preview dz-preview-multiple m-0 d-flex flex-column">
                      <div class="d-flex media align-items-center mb-3 pb-3 border-bottom btn-reveal-trigger"><img class="dz-image" src="../../../assets/img/icons/cloud-upload.svg" alt="..." data-dz-thumbnail="data-dz-thumbnail" />
                        <div class="flex-1 d-flex flex-between-center">
                          <div>
                            <h6 data-dz-name="data-dz-name"></h6>
                            <div class="d-flex align-items-center">
                              <p class="mb-0 fs--1 text-400 lh-1" data-dz-size="data-dz-size"></p>
                              <div class="dz-progress"><span class="dz-upload" data-dz-uploadprogress=""></span></div>
                            </div>
                          </div>
                          <div class="dropdown font-sans-serif">
                            <button class="btn btn-link text-600 btn-sm dropdown-toggle btn-reveal dropdown-caret-none" type="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><span class="fas fa-ellipsis-h"></span></button>
                            <div class="dropdown-menu dropdown-menu-end border py-2"><a class="dropdown-item" href="#!" data-dz-remove="data-dz-remove">Remove File</a></div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </form>
                </div>
              </div>
              
          </div>
          <div class="card mt-3">
            <div class="card-body">
              <div class="row justify-content-between align-items-center">
                <div class="col-auto">
                  <button class="btn btn-link text-secondary p-0 me-3 fw-medium" role="button">취소</button>
                  <button class="btn btn-primary" role="button">등록 </button>
                </div>
              </div>
            </div>
          </div>
          <footer class="footer">
            <div class="row g-0 justify-content-between fs--1 mt-4 mb-3">
              <div class="col-12 col-sm-auto text-center">
                <p class="mb-0 text-600">Thank you for creating with Falcon <span class="d-none d-sm-inline-block">| </span><br class="d-sm-none" /> 2023 &copy; <a href="https://themewagon.com">Themewagon</a></p>
              </div>
              <div class="col-12 col-sm-auto text-center">
                <p class="mb-0 text-600">v3.17.0</p>
              </div>
            </div>
          </footer>
        </div>
<%@ include file="../inc/bottom.jsp" %>