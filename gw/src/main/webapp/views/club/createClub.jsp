<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>
<!DOCTYPE html>
<html data-bs-theme="light" lang="en-US" dir="ltr">

  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">


    <!-- ===============================================-->
    <!--    Document Title-->
    <!-- ===============================================-->
    <title>create CLUB</title>

 
  	<body>
          <div class="card mb-3">
            <div class="card-body">
              <div class="row flex-between-center">
                <div class="col-md">
                  <h5 class="mb-2 mb-md-0">동호회 개설</h5>
                </div>
                <div class="col-auto">
                  <button class="btn btn-falcon-default btn-sm me-2" role="button">저장</button>
                </div>
              </div>
            </div>
          </div>
          <div class="row g-0">
              <div class="card mb-3">
                <div class="card-header">
                  <h5 class="mb-0">Club Details</h5>
                </div>
                <div class="card-body bg-light">
                  <form>
                    <div class="row gx-2">
                      <div class="col-12 mb-3">
                        <label class="form-label" for="event-name">동호희 이름</label>
                        <input class="form-control" id="event-name" type="text" placeholder="Club Title" />
                      </div>
                      <div class="col-sm-6 mb-3">
                        <label class="form-label" for="start-date">모집 시작</label>
                        <input class="form-control datetimepicker" id="start-date" type="text" placeholder="d/m/y" data-options='{"dateFormat":"d/m/y","disableMobile":true}' />
                      </div>
                      <div class="col-sm-6 mb-3">
                        <label class="form-label" for="end-date">모집 마감</label>
                        <input class="form-control datetimepicker" id="end-date" type="text" placeholder="d/m/y" data-options='{"dateFormat":"d/m/y","disableMobile":true}' />
                      </div>
                      <div class="col-12">
                        <div class="border-bottom border-dashed my-3"></div>
                      </div>
                      <div class="col-12">
                        <label class="form-label" for="event-description">Description</label>
                        <textarea class="form-control" id="event-description" rows="6"></textarea>
                      </div>
                    </div>
                  </form>
                </div>
              </div>
              <div class="card mb-3">
                <div class="card-header">
                  <h5 class="mb-0">Upload Files</h5>
                </div>
                <div class="card-body bg-light">
                  <form class="dropzone dropzone-multiple p-0" id="my-awesome-dropzone" data-dropzone="data-dropzone" action="#!">
                    <div class="fallback">
                      <input name="file" type="file" multiple="multiple" />
                    </div>
                    <div class="dz-message" data-dz-message="data-dz-message"> <img class="me-2" src="../../assets/img/icons/cloud-upload.svg" width="25" alt="" />Drop your files here</div>
                    <div class="dz-preview dz-preview-multiple m-0 d-flex flex-column">
                      <div class="d-flex media align-items-center mb-3 pb-3 border-bottom btn-reveal-trigger"><img class="dz-image" src="../../assets/img/generic/image-file-2.png" alt="..." data-dz-thumbnail="data-dz-thumbnail" />
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
                <div class="col-md">
                  <h5 class="mb-2 mb-md-0"></h5>
                </div>
                <div class="col-auto">
                  <button class="btn btn-falcon-default btn-sm me-2">Save</button>
                </div>
              </div>
            </div>
          </div>
    
    </body>
    </html>
    
<%@ include file="../inc/bottom.jsp" %>