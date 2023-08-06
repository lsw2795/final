<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file='../../inc/adminTop.jsp'%>
<link rel="stylesheet" href="<c:url value='/css/adminempform.css'/>">
<div class="card mb-3">
	
	<div class="card-body admindefault position-relative">
		<div class="row">
			<div class="col-lg-8">
				<h3 class="admindefault">FAQ</h3>
				<div class="col-auto">
					<div class="input-group admindefault">
						<input class="form-control shadow-none search admindefault"
							type="search" placeholder="내용 검색" aria-label="search" />
						<button class="btn btn-sm btn-outline-secondary border-300 hover-border-secondary">
							<span class="fa fa-search fs--1"></span>
						</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="card">
	<div class="card-body admindefault">
		<div class="accordion border rounded overflow-hidden" id="accordionFaq">
		<div class="card shadow-none rounded-0">
		
			<div class="d-flex justify-content-lg-end admindefault">
				<div class="admindefault adminempdiv13" id="table-contact-replace-element">
					<input type="button" value="등록" class="btn btn-primary"/>
					<span class="adminhyphen"></span>
					<input type="button" value="삭제" class="btn btn-primary"/>
					<span class="adminhyphen"></span>
					<input type="button" value="수정" class="btn btn-primary"/>
				</div>
			</div>
		
		
		
		
		
		
		
		
		
		
		
		    <div class="accordion-item border-0">
		        <div class="card-header p-0 d-flex align-items-center adminempdiv12" id="faqAccordionHeading1">
		            <input class="form-check-input me-2" type="checkbox"/>
		            <button
		                class="accordion-button btn btn-link text-decoration-none d-block w-100 py-2 px-3 collapsed border-0 text-start rounded-0 shadow-none"
		                data-bs-toggle="collapse"
		                data-bs-target="#collapseFaqAccordion1" aria-expanded="false"
		                aria-controls="collapseFaqAccordion1">
		                <span class="fas fa-caret-right accordion-icon me-3"
		                    data-fa-transform="shrink-2"></span><span
		                    class="fw-medium font-sans-serif text-900">Does Falcon
		                    work fine with Ruby?</span>
		            </button>
		        </div>
		        <div class="accordion-collapse collapse admindefault"
		            id="collapseFaqAccordion1"
		            aria-labelledby="faqAccordionHeading1"
		            data-parent="#accordionFaq">
		            <div class="accordion-body p-0">
		                <div class="card-body pt-2">
		                    <div class="ps-3 mb-0">
		                        <p class='mb-0'>
		                            I'm afraid we do not have any documentation on Rails
		                            integration yet or any version for Ruby. But you may find the
		                            following link useful. Since all the Bootstrap themes are
		                            structured in a similar fashion, you may find it helpful: <a
		                                target='_blank'
		                                href='https://rubyyagi.com/how-to-integrate-html-bootstrap-theme-into-rails-6/'>https://rubyyagi.com/how-to-integrate-html-bootstrap-theme-into-rails-6/</a>.
		                        </p>
		                    </div>
		                </div>
		            </div>
		        </div>
		    </div>
		</div>
		<div class="card shadow-none rounded-0">
    <div class="accordion-item border-0">
        <div class="card-header p-0 d-flex align-items-center adminempdiv12" id="faqAccordionHeading2">
            <input class="form-check-input me-2" type="checkbox"/>
            <button
                class="accordion-button btn btn-link text-decoration-none d-block w-100 py-2 px-3 collapsed border-0 text-start rounded-0 shadow-none"
                data-bs-toggle="collapse"
                data-bs-target="#collapseFaqAccordion2" aria-expanded="false"
                aria-controls="collapseFaqAccordion2">
                <span class="fas fa-caret-right accordion-icon me-3"
                    data-fa-transform="shrink-2"></span><span
                    class="fw-medium font-sans-serif text-900">Does Falcon
                    work fine with Ruby?</span>
            </button>
        </div>
        <div class="accordion-collapse collapse admindefault"
            id="collapseFaqAccordion2"
            aria-labelledby="faqAccordionHeading2"
            data-parent="#accordionFaq">
            <div class="accordion-body p-0">
                <div class="card-body pt-2">
                    <div class="ps-3 mb-0">
                        <p class='mb-0'>
                            I'm afraid we do not have any documentation on Rails
                            integration yet or any version for Ruby. But you may find the
                            following link useful. Since all the Bootstrap themes are
                            structured in a similar fashion, you may find it helpful: <a
                                target='_blank'
                                href='https://rubyyagi.com/how-to-integrate-html-bootstrap-theme-into-rails-6/'>https://rubyyagi.com/how-to-integrate-html-bootstrap-theme-into-rails-6/</a>.
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>	
			
			
			
			
			
			
		</div>
	</div>
</div>
<%@ include file='../../inc/adminBottom.jsp'%>