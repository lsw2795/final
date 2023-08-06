<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<div class="card mb-3">
	<div class="bg-holder d-none d-lg-block bg-card"
		style="background-image: url(../assets/img/icons/spot-illustrations/corner-4.png);">
	</div>
	<div class="card-body position-relative">
		<div class="row">
			<div class="col-lg-8">
				<h3>FAQ</h3>
				<div class="col-auto">
					<div class="input-group admindefault">
						<input class="form-control shadow-none search admindefault"
							type="search" placeholder="궁금한 내용을 입력해주세요." aria-label="search" />
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
	<div class="card-body">
		<div class="accordion border rounded overflow-hidden"
			id="accordionFaq">
			<div class="card shadow-none rounded-bottom-0 border-bottom">
				<div class="accordion-item border-0">
					<div class="card-header p-0" id="faqAccordionHeading1">
						<button
							class="accordion-button btn btn-link text-decoration-none d-block w-100 py-2 px-3 collapsed border-0 text-start rounded-0 shadow-none"
							data-bs-toggle="collapse" data-bs-target="#collapseFaqAccordion1"
							aria-expanded="false" aria-controls="collapseFaqAccordion1">
							<span class="fas fa-caret-right accordion-icon me-3"
								data-fa-transform="shrink-2"></span><span
								class="fw-medium font-sans-serif text-900">How to start
								working with Falcon?</span>
						</button>
					</div>
					<div class="accordion-collapse collapse" id="collapseFaqAccordion1"
						aria-labelledby="faqAccordionHeading1" data-parent="#accordionFaq">
						<div class="accordion-body p-0">
							<div class="card-body pt-2">
								<div class="ps-3 mb-0">
									<p>
										<b>You will find HTML pages in the public directory</b>. If
										you want, you can include the file over there and make the
										project live. You can write SCSS which is generated to the CSS
										file in the
										<code>public/assets</code>
										directory. We also used a pug template engine to generate all
										HTML files which one is very helpful for easy customization.
									</p>
									<p class='mb-0'>
										For detailed documentation, check the following link: <a
											href='https://prium.github.io/falcon/v3.17.0/documentation/getting-started.jsp'>
											https://prium.github.io/falcon/v3.17.0/documentation/getting-started.jsp</a>.
									</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="card shadow-none rounded-0 border-bottom">
				<div class="accordion-item border-0">
					<div class="card-header p-0" id="faqAccordionHeading2">
						<button
							class="accordion-button btn btn-link text-decoration-none d-block w-100 py-2 px-3 collapsed border-0 text-start rounded-0 shadow-none"
							data-bs-toggle="collapse" data-bs-target="#collapseFaqAccordion2"
							aria-expanded="false" aria-controls="collapseFaqAccordion2">
							<span class="fas fa-caret-right accordion-icon me-3"
								data-fa-transform="shrink-2"></span><span
								class="fw-medium font-sans-serif text-900">What is the
								minimum requirement to run Falcon?</span>
						</button>
					</div>
					<div class="accordion-collapse collapse" id="collapseFaqAccordion2"
						aria-labelledby="faqAccordionHeading2" data-parent="#accordionFaq">
						<div class="accordion-body p-0">
							<div class="card-body pt-2">
								<div class="ps-3 mb-0">
									<p class='mb-0'>
										Minimum requirements to run Falcon
										<code>v3.17.0</code>
									</p>
									<ul class='mb-0'>
										<li>Node v14.18.1</li>
										<li>npm v6.14.5</li>
										<li>Bootstrap v5.1.3</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="card shadow-none rounded-0 border-bottom">
				<div class="accordion-item border-0">
					<div class="card-header p-0" id="faqAccordionHeading3">
						<button
							class="accordion-button btn btn-link text-decoration-none d-block w-100 py-2 px-3 collapsed border-0 text-start rounded-0 shadow-none"
							data-bs-toggle="collapse" data-bs-target="#collapseFaqAccordion3"
							aria-expanded="false" aria-controls="collapseFaqAccordion3">
							<span class="fas fa-caret-right accordion-icon me-3"
								data-fa-transform="shrink-2"></span><span
								class="fw-medium font-sans-serif text-900">What to do
								with Falcon after running Gulp?</span>
						</button>
					</div>
					<div class="accordion-collapse collapse" id="collapseFaqAccordion3"
						aria-labelledby="faqAccordionHeading3" data-parent="#accordionFaq">
						<div class="accordion-body p-0">
							<div class="card-body pt-2">
								<div class="ps-3 mb-0">
									<p>
										After running gulp you can start customizing the Falcon using
										Pug. You can start customizing from
										<code>src/pug/pages/starter.pug</code>
										where minimum styles and scripts are included to run Falcon
										theme.
									</p>
									<p class='mb-0'>Or you can update html files directly from
										the public directory.</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="card shadow-none rounded-0 border-bottom">
				<div class="accordion-item border-0">
					<div class="card-header p-0" id="faqAccordionHeading4">
						<button
							class="accordion-button btn btn-link text-decoration-none d-block w-100 py-2 px-3 collapsed border-0 text-start rounded-0 shadow-none"
							data-bs-toggle="collapse" data-bs-target="#collapseFaqAccordion4"
							aria-expanded="false" aria-controls="collapseFaqAccordion4">
							<span class="fas fa-caret-right accordion-icon me-3"
								data-fa-transform="shrink-2"></span><span
								class="fw-medium font-sans-serif text-900">Do I need to
								work with Pug/Gulp/Node if I want to build with Falcon?</span>
						</button>
					</div>
					<div class="accordion-collapse collapse" id="collapseFaqAccordion4"
						aria-labelledby="faqAccordionHeading4" data-parent="#accordionFaq">
						<div class="accordion-body p-0">
							<div class="card-body pt-2">
								<div class="ps-3 mb-0">
									<p class='mb-0'>
										You are not required to use pug, gulp, node, or any other
										workflow tools.All the HTML files are ready to use under the
										<code>public</code>
										folder. Just take a fresh copy of Falcon, open any HTML files
										in the
										<code>public</code>
										folder, and you can edit it as you like. Plane and simple
										HTML.
									</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="card shadow-none rounded-0 border-bottom">
				<div class="accordion-item border-0">
					<div class="card-header p-0" id="faqAccordionHeading5">
						<button
							class="accordion-button btn btn-link text-decoration-none d-block w-100 py-2 px-3 collapsed border-0 text-start rounded-0 shadow-none"
							data-bs-toggle="collapse" data-bs-target="#collapseFaqAccordion5"
							aria-expanded="false" aria-controls="collapseFaqAccordion5">
							<span class="fas fa-caret-right accordion-icon me-3"
								data-fa-transform="shrink-2"></span><span
								class="fw-medium font-sans-serif text-900">How to update
								this template to the latest version of Falcon?</span>
						</button>
					</div>
					<div class="accordion-collapse collapse" id="collapseFaqAccordion5"
						aria-labelledby="faqAccordionHeading5" data-parent="#accordionFaq">
						<div class="accordion-body p-0">
							<div class="card-body pt-2">
								<div class="ps-3 mb-0">
									<p>
										<b>Updating from any earlier version of 3.x to v3.17.0:</b><br />
										Check out the following link and follow the changes: <a
											href='https://prium.github.io/falcon/v3.17.0/changelog.jsp'>https://prium.github.io/falcon/v3.17.0/changelog.jsp</a>
									</p>
									<p class='mb-0'>
										<b>Updating from version 2 to version 3:</b><br /> As the
										latest versions of templates and all their packages have
										different structures behind their components, you have to
										update all the components manually into your project.<br>
										So, it would be better to start building applications with the
										Bootstrap 5 version of Falcon from scratch. You can include
										any components from Bootstrap 5 version to your project. Bring
										the component and its required SCSS and place it into your
										current project.
									</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="card shadow-none rounded-0 border-bottom">
				<div class="accordion-item border-0">
					<div class="card-header p-0" id="faqAccordionHeading6">
						<button
							class="accordion-button btn btn-link text-decoration-none d-block w-100 py-2 px-3 collapsed border-0 text-start rounded-0 shadow-none"
							data-bs-toggle="collapse" data-bs-target="#collapseFaqAccordion6"
							aria-expanded="false" aria-controls="collapseFaqAccordion6">
							<span class="fas fa-caret-right accordion-icon me-3"
								data-fa-transform="shrink-2"></span><span
								class="fw-medium font-sans-serif text-900">Where to get
								the Figma Files?</span>
						</button>
					</div>
					<div class="accordion-collapse collapse" id="collapseFaqAccordion6"
						aria-labelledby="faqAccordionHeading6" data-parent="#accordionFaq">
						<div class="accordion-body p-0">
							<div class="card-body pt-2">
								<div class="ps-3 mb-0">
									<p>
										You will find the Figma link in the
										<code>README.md</code>
										file on your downloaded copy of Falcon. Here is the detailed
										documentation: <a target='_blank'
											href='https://prium.github.io/falcon/v3.17.0/documentation/design-file.jsp'>
											https://prium.github.io/falcon/v3.17.0/documentation/design-file.jsp</a>.
									</p>
									<p class='mb-0'>
										If you still have any problem with the link, reach us out with
										your purchase ID at <a href="mailto:support@themewagon.com">support@themewagon.com</a>
									</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="card shadow-none rounded-0 border-bottom">
				<div class="accordion-item border-0">
					<div class="card-header p-0" id="faqAccordionHeading7">
						<button
							class="accordion-button btn btn-link text-decoration-none d-block w-100 py-2 px-3 collapsed border-0 text-start rounded-0 shadow-none"
							data-bs-toggle="collapse" data-bs-target="#collapseFaqAccordion7"
							aria-expanded="false" aria-controls="collapseFaqAccordion7">
							<span class="fas fa-caret-right accordion-icon me-3"
								data-fa-transform="shrink-2"></span><span
								class="fw-medium font-sans-serif text-900">Is it possible
								to build a mobile app using Falcon components?</span>
						</button>
					</div>
					<div class="accordion-collapse collapse" id="collapseFaqAccordion7"
						aria-labelledby="faqAccordionHeading7" data-parent="#accordionFaq">
						<div class="accordion-body p-0">
							<div class="card-body pt-2">
								<div class="ps-3 mb-0">
									<p class='mb-0'>Falcon is made out of HTML, CSS, and JS.
										You can not use Falcon as a "Native" component library for an
										android or iOS app. But if you use a web-view for your app or
										use a framework that uses HTML, CSS, and JS for mobile app UI,
										yes, you can use Falcon in that case</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="card shadow-none rounded-0 border-bottom">
				<div class="accordion-item border-0">
					<div class="card-header p-0" id="faqAccordionHeading8">
						<button
							class="accordion-button btn btn-link text-decoration-none d-block w-100 py-2 px-3 collapsed border-0 text-start rounded-0 shadow-none"
							data-bs-toggle="collapse" data-bs-target="#collapseFaqAccordion8"
							aria-expanded="false" aria-controls="collapseFaqAccordion8">
							<span class="fas fa-caret-right accordion-icon me-3"
								data-fa-transform="shrink-2"></span><span
								class="fw-medium font-sans-serif text-900">Can one use
								Falcon with Django?</span>
						</button>
					</div>
					<div class="accordion-collapse collapse" id="collapseFaqAccordion8"
						aria-labelledby="faqAccordionHeading8" data-parent="#accordionFaq">
						<div class="accordion-body p-0">
							<div class="card-body pt-2">
								<div class="ps-3 mb-0">
									<p>Many of our customers are using Falcon with Django.
										Using Falcon is like using Bootstrap with Django, just with
										some extra features.</p>
									<p>
										For a starter, you need to take all the CSS and JS file from
										Falcon's
										<code>public/assets</code>
										folder to your project and link them to your view files. You
										can find all the required scripts and styles on the source of
										the starter page.
									</p>
									<p class='mb-0'>It is also possible to compile the SCSS and
										use the ES6 JavaScript partial files with Django using
										Falcon's built-in gulp based workflow.</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="card shadow-none rounded-0 border-bottom">
				<div class="accordion-item border-0">
					<div class="card-header p-0" id="faqAccordionHeading9">
						<button
							class="accordion-button btn btn-link text-decoration-none d-block w-100 py-2 px-3 collapsed border-0 text-start rounded-0 shadow-none"
							data-bs-toggle="collapse" data-bs-target="#collapseFaqAccordion9"
							aria-expanded="false" aria-controls="collapseFaqAccordion9">
							<span class="fas fa-caret-right accordion-icon me-3"
								data-fa-transform="shrink-2"></span><span
								class="fw-medium font-sans-serif text-900">Is it possible
								to use this template with Blazor?</span>
						</button>
					</div>
					<div class="accordion-collapse collapse" id="collapseFaqAccordion9"
						aria-labelledby="faqAccordionHeading9" data-parent="#accordionFaq">
						<div class="accordion-body p-0">
							<div class="card-body pt-2">
								<div class="ps-3 mb-0">
									<p class='mb-0'>We are afraid, there is no Blazor version
										of Falcon and no Blazor expert in our team at this moment. But
										we think, you would be able to use it just like Bootstrap,
										only an extended version.</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="card shadow-none rounded-0 border-bottom">
				<div class="accordion-item border-0">
					<div class="card-header p-0" id="faqAccordionHeading10">
						<button
							class="accordion-button btn btn-link text-decoration-none d-block w-100 py-2 px-3 collapsed border-0 text-start rounded-0 shadow-none"
							data-bs-toggle="collapse"
							data-bs-target="#collapseFaqAccordion10" aria-expanded="false"
							aria-controls="collapseFaqAccordion10">
							<span class="fas fa-caret-right accordion-icon me-3"
								data-fa-transform="shrink-2"></span><span
								class="fw-medium font-sans-serif text-900">How can one
								switch to the top navbar and combo navbar layout?</span>
						</button>
					</div>
					<div class="accordion-collapse collapse"
						id="collapseFaqAccordion10"
						aria-labelledby="faqAccordionHeading10"
						data-parent="#accordionFaq">
						<div class="accordion-body p-0">
							<div class="card-body pt-2">
								<div class="ps-3 mb-0">
									<p class='mb-0'>
										In Falcon live demo, we are previewing both combo nav and top
										nav together. To apply top nav layout to any page, check the
										documentation in Falcon <a
											href='https://prium.github.io/falcon/v3.17.0/modules/components/navs-and-tabs/top-navbar.jsp'>
											https://prium.github.io/falcon/v3.17.0/modules/components/navs-and-tabs/top-navbar.jsp</a>.
									</p>
									<p>
										You will also get the example of navbar top layout page in
										public/demo/navbar-top.jsp. Also check the following link for
										top nav: <a
											href='https://prium.github.io/falcon/v3.17.0/demo/navbar-top.jsp'>https://prium.github.io/falcon/v3.17.0/demo/navbar-top.jsp</a>.
									</p>
									<p class='mb-0'>
										In the same way, you can implement the Combo nav layout. Here
										is the documentation of combo nav layout: <a
											href="https://prium.github.io/falcon/v3.17.0/modules/components/navs-and-tabs/combo-navbar.jsp">
											https://prium.github.io/falcon/v3.17.0/modules/components/navs-and-tabs/combo-navbar.jsp</a>.
									</p>
									<p>
										Example page:<br> <a
											href="https://prium.github.io/falcon/v3.17.0/demo/combo-nav.jsp">https://prium.github.io/falcon/v3.17.0/demo/combo-nav.jsp</a>.
									</P>
									<p class='mb-0'>Why did we keep it different? Because in
										the demo, we included HTML codes for all the Navs on every
										page. But most of our users need to use only one nav and do
										not want their users to give the option to change the nav.
										Thatâ€™s why we redirected the settings to the corresponding
										documentation page to see how they can configure it</P>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="card shadow-none rounded-0 border-bottom">
				<div class="accordion-item border-0">
					<div class="card-header p-0" id="faqAccordionHeading11">
						<button
							class="accordion-button btn btn-link text-decoration-none d-block w-100 py-2 px-3 collapsed border-0 text-start rounded-0 shadow-none"
							data-bs-toggle="collapse"
							data-bs-target="#collapseFaqAccordion11" aria-expanded="false"
							aria-controls="collapseFaqAccordion11">
							<span class="fas fa-caret-right accordion-icon me-3"
								data-fa-transform="shrink-2"></span><span
								class="fw-medium font-sans-serif text-900">Does Falcon
								incorporate properly with Laravel?</span>
						</button>
					</div>
					<div class="accordion-collapse collapse"
						id="collapseFaqAccordion11"
						aria-labelledby="faqAccordionHeading11"
						data-parent="#accordionFaq">
						<div class="accordion-body p-0">
							<div class="card-body pt-2">
								<div class="ps-3 mb-0">
									<p>Falcon works nicely with Laravel.</P>
									<p class='mb-0'>Good news is we have a starter project made
										with laravel mix and Falcon. This project is privately
										available. If you are interested, after purchasing Falcon,
										please send your purchase ID and we will send you the starter
										project.</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="card shadow-none rounded-0 border-bottom">
				<div class="accordion-item border-0">
					<div class="card-header p-0" id="faqAccordionHeading12">
						<button
							class="accordion-button btn btn-link text-decoration-none d-block w-100 py-2 px-3 collapsed border-0 text-start rounded-0 shadow-none"
							data-bs-toggle="collapse"
							data-bs-target="#collapseFaqAccordion12" aria-expanded="false"
							aria-controls="collapseFaqAccordion12">
							<span class="fas fa-caret-right accordion-icon me-3"
								data-fa-transform="shrink-2"></span><span
								class="fw-medium font-sans-serif text-900">With which
								version of Laravel Falcon works fine?</span>
						</button>
					</div>
					<div class="accordion-collapse collapse"
						id="collapseFaqAccordion12"
						aria-labelledby="faqAccordionHeading12"
						data-parent="#accordionFaq">
						<div class="accordion-body p-0">
							<div class="card-body pt-2">
								<div class="ps-3 mb-0">Falcon works fine with Laravel 9x.</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="card shadow-none rounded-0 border-bottom">
				<div class="accordion-item border-0">
					<div class="card-header p-0" id="faqAccordionHeading13">
						<button
							class="accordion-button btn btn-link text-decoration-none d-block w-100 py-2 px-3 collapsed border-0 text-start rounded-0 shadow-none"
							data-bs-toggle="collapse"
							data-bs-target="#collapseFaqAccordion13" aria-expanded="false"
							aria-controls="collapseFaqAccordion13">
							<span class="fas fa-caret-right accordion-icon me-3"
								data-fa-transform="shrink-2"></span><span
								class="fw-medium font-sans-serif text-900"> How to use
								Falcon with Angular?</span>
						</button>
					</div>
					<div class="accordion-collapse collapse"
						id="collapseFaqAccordion13"
						aria-labelledby="faqAccordionHeading13"
						data-parent="#accordionFaq">
						<div class="accordion-body p-0">
							<div class="card-body pt-2">
								<div class="ps-3 mb-0">
									<p>The project is still a work in process, and we are
										updating it quite often to match with the industry best
										practices. If you are interested, after purchasing Falcon,
										please send your purchase ID and we will send you the starter
										pack.</P>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="card shadow-none rounded-0 border-bottom">
				<div class="accordion-item border-0">
					<div class="card-header p-0" id="faqAccordionHeading14">
						<button
							class="accordion-button btn btn-link text-decoration-none d-block w-100 py-2 px-3 collapsed border-0 text-start rounded-0 shadow-none"
							data-bs-toggle="collapse"
							data-bs-target="#collapseFaqAccordion14" aria-expanded="false"
							aria-controls="collapseFaqAccordion14">
							<span class="fas fa-caret-right accordion-icon me-3"
								data-fa-transform="shrink-2"></span><span
								class="fw-medium font-sans-serif text-900">Tried running
								npm install but getting a bunch of errors.</span>
						</button>
					</div>
					<div class="accordion-collapse collapse"
						id="collapseFaqAccordion14"
						aria-labelledby="faqAccordionHeading14"
						data-parent="#accordionFaq">
						<div class="accordion-body p-0">
							<div class="card-body pt-2">
								<div class="ps-3 mb-0">
									<a href="../assets/img/doc/error.png" data-gallery="gallery-2">
										<img class="img-fluid rounded"
										src="../assets/img/doc/error.png" alt="" width="300" />
									</a>
									<p class='mb-0'>
										Try deleting the
										<code>package-lock.json</code>
										and
										<code>node_modules</code>
										folder and then run
										<code>npm i</code>
										again.
									</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="card shadow-none rounded-0 ">
				<div class="accordion-item border-0">
					<div class="card-header p-0" id="faqAccordionHeading15">
						<button
							class="accordion-button btn btn-link text-decoration-none d-block w-100 py-2 px-3 collapsed border-0 text-start rounded-0 shadow-none"
							data-bs-toggle="collapse"
							data-bs-target="#collapseFaqAccordion15" aria-expanded="false"
							aria-controls="collapseFaqAccordion15">
							<span class="fas fa-caret-right accordion-icon me-3"
								data-fa-transform="shrink-2"></span><span
								class="fw-medium font-sans-serif text-900">Does Falcon
								work fine with Ruby?</span>
						</button>
					</div>
					<div class="accordion-collapse collapse"
						id="collapseFaqAccordion15"
						aria-labelledby="faqAccordionHeading15"
						data-parent="#accordionFaq">
						<div class="accordion-body p-0">
							<div class="card-body pt-2">
								<div class="ps-3 mb-0">
									<p class='mb-0'>
										I'm afraid we do not have any documentation on rails
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
<%@ include file="../inc/bottom.jsp"%>