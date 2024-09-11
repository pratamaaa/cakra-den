<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}" dir="ltr">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>{{ config('app.name') }}</title>

	<!-- Global stylesheets -->
	<link href="{{ URL::asset('assets/base/fonts/inter/inter.css'); }}" rel="stylesheet" type="text/css">
	<link href="{{ URL::asset('assets/base/icons/phosphor/styles.min.css'); }}" rel="stylesheet" type="text/css">
	<link href="{{ URL::asset('assets/css/ltr/all.min.css'); }}" id="stylesheet" rel="stylesheet" type="text/css">
	<!-- /global stylesheets -->

	<!-- Core JS files -->
	<script src="{{ URL::asset('assets/base/demo/demo_configurator.js'); }}"></script>
	<script src="{{ URL::asset('assets/base/js/bootstrap/bootstrap.bundle.min.js'); }}"></script>
	<!-- /core JS files -->

	<!-- Theme JS files -->
	<script src="{{ URL::asset('assets/js/app.js'); }}"></script>
	<!-- /theme JS files -->

</head>

<body>

	<!-- Main navbar -->
	<div class="navbar navbar-light navbar-expand-lg navbar-static border-bottom border-bottom-white border-opacity-10">
		<div class="container-fluid">
			<div class="d-flex d-lg-none me-2">
				<button type="button" class="navbar-toggler sidebar-mobile-main-toggle rounded-pill">
					<i class="ph-list"></i>
				</button>
			</div>

			<div class="navbar-brand flex-1 flex-lg-0">
				<a href="index.html" class="d-inline-flex align-items-center">
					<img src="{{ URL::asset('assets/base/images/logo_icon.svg'); }}" alt="">
					<img src="{{ URL::asset('assets/base/images/logo_text_light.svg'); }}" class="d-none d-sm-inline-block h-16px ms-3" alt="">
				</a>
			</div>

			<ul class="nav flex-row">
				<li class="nav-item d-lg-none">
					<a href="#navbar_search" class="navbar-nav-link navbar-nav-link-icon rounded-pill" data-bs-toggle="collapse">
						<i class="ph-magnifying-glass"></i>
					</a>
				</li>

				<li class="nav-item nav-item-dropdown-lg dropdown">
					<a href="#" class="navbar-nav-link navbar-nav-link-icon rounded-pill" data-bs-toggle="dropdown">
						<i class="ph-squares-four"></i>
					</a>

					<div class="dropdown-menu dropdown-menu-scrollable-sm wmin-lg-600 p-0">
						<div class="d-flex align-items-center border-bottom p-3">
							<h6 class="mb-0">Browse apps</h6>
							<a href="#" class="ms-auto">
								View all
								<i class="ph-arrow-circle-right ms-1"></i>
							</a>
						</div>

						<div class="row row-cols-1 row-cols-sm-2 g-0">
							<div class="col">
								<button type="button" class="dropdown-item text-wrap h-100 align-items-start border-end-sm border-bottom p-3">
									<div>
										<img src="{{ URL::asset('assets/base/images/demo/logos/1.svg'); }}" class="h-40px mb-2" alt="">
										<div class="fw-semibold my-1">Customer data platform</div>
										<div class="text-muted">Unify customer data from multiple sources</div>
									</div>
								</button>
							</div>

							<div class="col">
								<button type="button" class="dropdown-item text-wrap h-100 align-items-start border-bottom p-3">
									<div>
										<img src="{{ URL::asset('assets/base/images/demo/logos/2.svg'); }}" class="h-40px mb-2" alt="">
										<div class="fw-semibold my-1">Data catalog</div>
										<div class="text-muted">Discover, inventory, and organize data assets</div>
									</div>
								</button>
							</div>

							<div class="col">
								<button type="button" class="dropdown-item text-wrap h-100 align-items-start border-end-sm border-bottom border-bottom-sm-0 rounded-bottom-start p-3">
									<div>
										<img src="{{ URL::asset('assets/base/images/demo/logos/3.svg'); }}" class="h-40px mb-2" alt="">
										<div class="fw-semibold my-1">Data governance</div>
										<div class="text-muted">The collaboration hub and data marketplace</div>
									</div>
								</button>
							</div>

							<div class="col">
								<button type="button" class="dropdown-item text-wrap h-100 align-items-start rounded-bottom-end p-3">
									<div>
										<img src="{{ URL::asset('assets/base/images/demo/logos/4.svg'); }}" class="h-40px mb-2" alt="">
										<div class="fw-semibold my-1">Data privacy</div>
										<div class="text-muted">Automated provisioning of non-production datasets</div>
									</div>
								</button>
							</div>
						</div>
					</div>
				</li>

				<li class="nav-item nav-item-dropdown-lg dropdown ms-lg-2">
					<a href="#" class="navbar-nav-link navbar-nav-link-icon rounded-pill" data-bs-toggle="dropdown" data-bs-auto-close="outside">
						<i class="ph-chats"></i>
						<span class="badge bg-yellow text-black position-absolute top-0 end-0 translate-middle-top zindex-1 rounded-pill mt-1 me-1">8</span>
					</a>

					<div class="dropdown-menu wmin-lg-400 p-0">
						<div class="d-flex align-items-center p-3">
							<h6 class="mb-0">Messages</h6>
							<div class="ms-auto">
								<a href="#" class="text-body rounded-pill">
									<i class="ph-plus-circle"></i>
								</a>
								<a href="#search_messages" class="collapsed text-body rounded-pill ms-2" data-bs-toggle="collapse">
									<i class="ph-magnifying-glass"></i>
								</a>
							</div>
						</div>

						<div class="collapse" id="search_messages">
							<div class="px-3 mb-2">
								<div class="form-control-feedback form-control-feedback-start">
									<input type="text" class="form-control" placeholder="Search messages">
									<div class="form-control-feedback-icon">
										<i class="ph-magnifying-glass"></i>
									</div>
								</div>
							</div>
						</div>

						<div class="dropdown-menu-scrollable pb-2">
							<a href="#" class="dropdown-item align-items-start text-wrap py-2">
								<div class="status-indicator-container me-3">
									<img src="{{ URL::asset('assets/base/images/demo/users/face10.jpg'); }}" class="w-40px h-40px rounded-pill" alt="">
									<span class="status-indicator bg-warning"></span>
								</div>

								<div class="flex-1">
									<span class="fw-semibold">James Alexander</span>
									<span class="text-muted float-end fs-sm">04:58</span>
									<div class="text-muted">who knows, maybe that would be the best thing for me...</div>
								</div>
							</a>

							<a href="#" class="dropdown-item align-items-start text-wrap py-2">
								<div class="status-indicator-container me-3">
									<img src="{{ URL::asset('assets/base/images/demo/users/face3.jpg'); }}" class="w-40px h-40px rounded-pill" alt="">
									<span class="status-indicator bg-success"></span>
								</div>

								<div class="flex-1">
									<span class="fw-semibold">Margo Baker</span>
									<span class="text-muted float-end fs-sm">12:16</span>
									<div class="text-muted">That was something he was unable to do because...</div>
								</div>
							</a>

							<a href="#" class="dropdown-item align-items-start text-wrap py-2">
								<div class="status-indicator-container me-3">
									<img src="{{ URL::asset('assets/base/images/demo/users/face24.jpg'); }}" class="w-40px h-40px rounded-pill" alt="">
									<span class="status-indicator bg-success"></span>
								</div>
								<div class="flex-1">
									<span class="fw-semibold">Jeremy Victorino</span>
									<span class="text-muted float-end fs-sm">22:48</span>
									<div class="text-muted">But that would be extremely strained and suspicious...</div>
								</div>
							</a>

							<a href="#" class="dropdown-item align-items-start text-wrap py-2">
								<div class="status-indicator-container me-3">
									<img src="{{ URL::asset('assets/base/images/demo/users/face4.jpg'); }}" class="w-40px h-40px rounded-pill" alt="">
									<span class="status-indicator bg-grey"></span>
								</div>
								<div class="flex-1">
									<span class="fw-semibold">Beatrix Diaz</span>
									<span class="text-muted float-end fs-sm">Tue</span>
									<div class="text-muted">What a strenuous career it is that I've chosen...</div>
								</div>
							</a>

							<a href="#" class="dropdown-item align-items-start text-wrap py-2">
								<div class="status-indicator-container me-3">
									<img src="{{ URL::asset('assets/base/images/demo/users/face25.jpg'); }}" class="w-40px h-40px rounded-pill" alt="">
									<span class="status-indicator bg-danger"></span>
								</div>
								<div class="flex-1">
									<span class="fw-semibold">Richard Vango</span>
									<span class="text-muted float-end fs-sm">Mon</span>
									<div class="text-muted">Other travelling salesmen live a life of luxury...</div>
								</div>
							</a>
						</div>

						<div class="d-flex border-top py-2 px-3">
							<a href="#" class="text-body">
								<i class="ph-checks me-1"></i>
								Dismiss all
							</a>
							<a href="#" class="text-body ms-auto">
								View all
								<i class="ph-arrow-circle-right ms-1"></i>
							</a>
						</div>
					</div>
				</li>
			</ul>

			<div class="navbar-collapse justify-content-center flex-lg-1 order-2 order-lg-1 collapse" id="navbar_search">
				<div class="navbar-search flex-fill position-relative mt-2 mt-lg-0 mx-lg-3">
					<div class="form-control-feedback form-control-feedback-start flex-grow-1" data-color-theme="dark">
						<input type="text" class="form-control bg-transparent rounded-pill" placeholder="Search" data-bs-toggle="dropdown">
						<div class="form-control-feedback-icon">
							<i class="ph-magnifying-glass"></i>
						</div>
						<div class="dropdown-menu w-100" data-color-theme="light">
							<button type="button" class="dropdown-item">
								<div class="text-center w-32px me-3">
									<i class="ph-magnifying-glass"></i>
								</div>
								<span>Search <span class="fw-bold">"in"</span> everywhere</span>
							</button>

							<div class="dropdown-divider"></div>

							<div class="dropdown-menu-scrollable-lg">
								<div class="dropdown-header">
									Contacts
									<a href="#" class="float-end">
										See all
										<i class="ph-arrow-circle-right ms-1"></i>
									</a>
								</div>

								<div class="dropdown-item cursor-pointer">
									<div class="me-3">
										<img src="{{ URL::asset('assets/base/images/demo/users/face3.jpg'); }}" class="w-32px h-32px rounded-pill" alt="">
									</div>

									<div class="d-flex flex-column flex-grow-1">
										<div class="fw-semibold">Christ<mark>in</mark>e Johnson</div>
										<span class="fs-sm text-muted">c.johnson@awesomecorp.com</span>
									</div>

									<div class="d-inline-flex">
										<a href="#" class="text-body ms-2">
											<i class="ph-user-circle"></i>
										</a>
									</div>
								</div>

								<div class="dropdown-item cursor-pointer">
									<div class="me-3">
										<img src="{{ URL::asset('assets/base/images/demo/users/face24.jpg'); }}" class="w-32px h-32px rounded-pill" alt="">
									</div>

									<div class="d-flex flex-column flex-grow-1">
										<div class="fw-semibold">Cl<mark>in</mark>ton Sparks</div>
										<span class="fs-sm text-muted">c.sparks@awesomecorp.com</span>
									</div>

									<div class="d-inline-flex">
										<a href="#" class="text-body ms-2">
											<i class="ph-user-circle"></i>
										</a>
									</div>
								</div>

								<div class="dropdown-divider"></div>

								<div class="dropdown-header">
									Clients
									<a href="#" class="float-end">
										See all
										<i class="ph-arrow-circle-right ms-1"></i>
									</a>
								</div>

								<div class="dropdown-item cursor-pointer">
									<div class="me-3">
										<img src="{{ URL::asset('assets/base/images/brands/adobe.svg'); }}" class="w-32px h-32px rounded-pill" alt="">
									</div>

									<div class="d-flex flex-column flex-grow-1">
										<div class="fw-semibold">Adobe <mark>In</mark>c.</div>
										<span class="fs-sm text-muted">Enterprise license</span>
									</div>

									<div class="d-inline-flex">
										<a href="#" class="text-body ms-2">
											<i class="ph-briefcase"></i>
										</a>
									</div>
								</div>

								<div class="dropdown-item cursor-pointer">
									<div class="me-3">
										<img src="{{ URL::asset('assets/base/images/brands/holiday-inn.svg'); }}" class="w-32px h-32px rounded-pill" alt="">
									</div>

									<div class="d-flex flex-column flex-grow-1">
										<div class="fw-semibold">Holiday-<mark>In</mark>n</div>
										<span class="fs-sm text-muted">On-premise license</span>
									</div>

									<div class="d-inline-flex">
										<a href="#" class="text-body ms-2">
											<i class="ph-briefcase"></i>
										</a>
									</div>
								</div>

								<div class="dropdown-item cursor-pointer">
									<div class="me-3">
										<img src="{{ URL::asset('assets/base/images/brands/ing.svg'); }}" class="w-32px h-32px rounded-pill" alt="">
									</div>

									<div class="d-flex flex-column flex-grow-1">
										<div class="fw-semibold"><mark>IN</mark>G Group</div>
										<span class="fs-sm text-muted">Perpetual license</span>
									</div>

									<div class="d-inline-flex">
										<a href="#" class="text-body ms-2">
											<i class="ph-briefcase"></i>
										</a>
									</div>
								</div>
							</div>
						</div>
					</div>

					<a href="#" class="navbar-nav-link align-items-center justify-content-center w-40px h-32px rounded-pill position-absolute end-0 top-50 translate-middle-y p-0 me-1" data-bs-toggle="dropdown" data-bs-auto-close="outside">
						<i class="ph-faders-horizontal"></i>
					</a>

					<div class="dropdown-menu w-100 p-3">
						<div class="d-flex align-items-center mb-3">
							<h6 class="mb-0">Search options</h6>
							<a href="#" class="text-body rounded-pill ms-auto">
								<i class="ph-clock-counter-clockwise"></i>
							</a>
						</div>

						<div class="mb-3">
							<label class="d-block form-label">Category</label>
							<label class="form-check form-check-inline">
								<input type="checkbox" class="form-check-input" checked>
								<span class="form-check-label">Invoices</span>
							</label>
							<label class="form-check form-check-inline">
								<input type="checkbox" class="form-check-input">
								<span class="form-check-label">Files</span>
							</label>
							<label class="form-check form-check-inline">
								<input type="checkbox" class="form-check-input">
								<span class="form-check-label">Users</span>
							</label>
						</div>

						<div class="mb-3">
							<label class="form-label">Addition</label>
							<div class="input-group">
								<select class="form-select w-auto flex-grow-0">
									<option value="1" selected>has</option>
									<option value="2">has not</option>
								</select>
								<input type="text" class="form-control" placeholder="Enter the word(s)">
							</div>
						</div>

						<div class="mb-3">
							<label class="form-label">Status</label>
							<div class="input-group">
								<select class="form-select w-auto flex-grow-0">
									<option value="1" selected>is</option>
									<option value="2">is not</option>
								</select>
								<select class="form-select">
									<option value="1" selected>Active</option>
									<option value="2">Inactive</option>
									<option value="3">New</option>
									<option value="4">Expired</option>
									<option value="5">Pending</option>
								</select>
							</div>
						</div>

						<div class="d-flex">
							<button type="button" class="btn btn-light">Reset</button>

							<div class="ms-auto">
								<button type="button" class="btn btn-light">Cancel</button>
								<button type="button" class="btn btn-primary ms-2">Apply</button>
							</div>
						</div>
					</div>
				</div>
			</div>

			<ul class="nav flex-row justify-content-end order-1 order-lg-2">
				<li class="nav-item">
					<a href="#" class="navbar-nav-link navbar-nav-link-icon rounded-pill" data-bs-toggle="offcanvas" data-bs-target="#notifications">
						<i class="ph-bell"></i>
						<span class="badge bg-yellow text-black position-absolute top-0 end-0 translate-middle-top zindex-1 rounded-pill mt-1 me-1">2</span>
					</a>
				</li>

				<li class="nav-item nav-item-dropdown-lg dropdown ms-lg-2">
					<a href="#" class="navbar-nav-link align-items-center rounded-pill p-1" data-bs-toggle="dropdown">
						<div class="status-indicator-container">
							<img src="{{ URL::asset('assets/base/images/demo/users/face11.jpg'); }}" class="w-32px h-32px rounded-pill" alt="">
							<span class="status-indicator bg-success"></span>
						</div>
						<span class="d-none d-lg-inline-block mx-lg-2">Victoria</span>
					</a>

					<div class="dropdown-menu dropdown-menu-end">
						<a href="#" class="dropdown-item">
							<i class="ph-user-circle me-2"></i>
							My profile
						</a>
						<a href="#" class="dropdown-item">
							<i class="ph-currency-circle-dollar me-2"></i>
							My subscription
						</a>
						<a href="#" class="dropdown-item">
							<i class="ph-shopping-cart me-2"></i>
							My orders
						</a>
						<a href="#" class="dropdown-item">
							<i class="ph-envelope-open me-2"></i>
							My inbox
							<span class="badge bg-primary rounded-pill ms-auto">26</span>
						</a>
						<div class="dropdown-divider"></div>
						<a href="#" class="dropdown-item">
							<i class="ph-gear me-2"></i>
							Account settings
						</a>
						<a href="#" class="dropdown-item">
							<i class="ph-sign-out me-2"></i>
							Logout
						</a>
					</div>
				</li>
			</ul>
		</div>
	</div>
	<!-- /main navbar -->


	<!-- Page content -->
	<div class="page-content">

		<!-- Main sidebar -->
		<!-- Main sidebar -->
		<div class="sidebar sidebar-main sidebar-expand-lg">

			<!-- Sidebar content -->
			<div class="sidebar-content">

				<!-- Sidebar header -->
				<div class="sidebar-section">
					<div class="sidebar-section-body d-flex justify-content-center">
						<h5 class="sidebar-resize-hide flex-grow-1 my-auto">Navigation</h5>

						<div>
							<button type="button" class="btn btn-light btn-icon btn-sm rounded-pill border-transparent sidebar-control sidebar-main-resize d-none d-lg-inline-flex">
								<i class="ph-arrows-left-right"></i>
							</button>

							<button type="button" class="btn btn-light btn-icon btn-sm rounded-pill border-transparent sidebar-mobile-main-toggle d-lg-none">
								<i class="ph-x"></i>
							</button>
						</div>
					</div>
				</div>
				<!-- /sidebar header -->


				<!-- Main navigation -->
				<div class="sidebar-section">
					<ul class="nav nav-sidebar" data-nav-type="accordion">

						<!-- Main -->
						<li class="nav-item-header pt-0">
							<div class="text-uppercase fs-sm lh-sm opacity-50 sidebar-resize-hide">Main</div>
							<i class="ph-dots-three sidebar-resize-show"></i>
						</li>
						<li class="nav-item">
							<a href="index.html" class="nav-link">
								<i class="ph-house"></i>
								<span>
									Dashboard
									<span class="d-block fw-normal opacity-50">No pending orders</span>
								</span>
							</a>
						</li>
						<li class="nav-item nav-item-submenu">
							<a href="#" class="nav-link">
								<i class="ph-layout"></i>
								<span>Layouts</span>
							</a>
							<ul class="nav-group-sub collapse">
								<li class="nav-item"><a href="index.html" class="nav-link active">Default layout</a></li>
								<li class="nav-item"><a href="../../layout_2/full/index.html" class="nav-link">Layout 2</a></li>
								<li class="nav-item"><a href="../../layout_3/full/index.html" class="nav-link">Layout 3</a></li>
								<li class="nav-item"><a href="../../layout_4/full/index.html" class="nav-link">Layout 4</a></li>
								<li class="nav-item"><a href="../../layout_5/full/index.html" class="nav-link">Layout 5</a></li>
								<li class="nav-item"><a href="../../layout_6/full/index.html" class="nav-link">Layout 6</a></li>
								<li class="nav-item"><a href="../../layout_7/full/index.html" class="nav-link disabled">Layout 7 <span class="badge align-self-center ms-auto">Coming soon</span></a></li>
							</ul>
						</li>
						<li class="nav-item nav-item-submenu">
							<a href="#" class="nav-link">
								<i class="ph-swatches"></i>
								<span>Themes</span>
							</a>
							<ul class="nav-group-sub collapse">
								<li class="nav-item"><a href="index.html" class="nav-link active">Default</a></li>
								<li class="nav-item"><a href="../../../LTR/material/full/index.html" class="nav-link disabled">Material <span class="badge align-self-center ms-auto">Coming soon</span></a></li>
								<li class="nav-item"><a href="../../../LTR/clean/full/index.html" class="nav-link disabled">Clean <span class="badge align-self-center ms-auto">Coming soon</span></a></li>
							</ul>
						</li>
						<li class="nav-item nav-item-submenu">
							<a href="#" class="nav-link">
								<i class="ph-note-blank"></i>
								<span>Starter kit</span>
							</a>
							<ul class="nav-group-sub collapse">
								<li class="nav-item"><a href="../seed/layout_static.html" class="nav-link">Static layout</a></li>
								<li class="nav-item"><a href="../seed/layout_no_header.html" class="nav-link">No header</a></li>
								<li class="nav-item"><a href="../seed/layout_no_footer.html" class="nav-link">No footer</a></li>
								<li class="nav-item-divider"></li>
								<li class="nav-item"><a href="../seed/layout_fixed_header.html" class="nav-link">Fixed header</a></li>
								<li class="nav-item"><a href="../seed/layout_fixed_footer.html" class="nav-link">Fixed footer</a></li>
								<li class="nav-item-divider"></li>
								<li class="nav-item"><a href="../seed/layout_2_sidebars_1_side.html" class="nav-link">2 sidebars on 1 side</a></li>
								<li class="nav-item"><a href="../seed/layout_2_sidebars_2_sides.html" class="nav-link">2 sidebars on 2 sides</a></li>
								<li class="nav-item"><a href="../seed/layout_3_sidebars.html" class="nav-link">3 sidebars</a></li>
								<li class="nav-item-divider"></li>
								<li class="nav-item"><a href="../seed/layout_boxed_page.html" class="nav-link">Boxed page</a></li>
								<li class="nav-item"><a href="../seed/layout_boxed_content.html" class="nav-link">Boxed content</a></li>
							</ul>
						</li>
						<li class="nav-item">
							<a href="../../../../docs/other_changelog.html" class="nav-link">
								<i class="ph-list-numbers"></i>
								<span>Changelog</span>
								<span class="badge bg-primary align-self-center rounded-pill ms-auto">4.0</span>
							</a>
						</li>

						<!-- Forms -->
						<li class="nav-item-header">
							<div class="text-uppercase fs-sm lh-sm opacity-50 sidebar-resize-hide">Forms</div>
							<i class="ph-dots-three sidebar-resize-show"></i>
						</li>
						<li class="nav-item nav-item-submenu">
							<a href="#" class="nav-link">
								<i class="ph-note-pencil"></i>
								<span>Form components</span>
							</a>
							<ul class="nav-group-sub collapse">
								<li class="nav-item"><a href="form_autocomplete.html" class="nav-link">Autocomplete</a></li>
								<li class="nav-item"><a href="form_checkboxes_radios.html" class="nav-link">Checkboxes &amp; radios</a></li>
								<li class="nav-item"><a href="form_dual_listboxes.html" class="nav-link">Dual Listboxes</a></li>
								<li class="nav-item"><a href="form_controls_extended.html" class="nav-link">Extended controls</a></li>
								<li class="nav-item"><a href="form_floating_labels.html" class="nav-link">Floating labels</a></li>
								<li class="nav-item"><a href="form_actions.html" class="nav-link">Form actions</a></li>
								<li class="nav-item"><a href="form_wizard.html" class="nav-link">Form wizard</a></li>
								<li class="nav-item"><a href="form_inputs.html" class="nav-link">Input fields</a></li>
								<li class="nav-item"><a href="form_input_groups.html" class="nav-link">Input groups</a></li>
								<li class="nav-item"><a href="form_multiselect.html" class="nav-link">Multiselect</a></li>
								<li class="nav-item"><a href="form_select2.html" class="nav-link">Select2 selects</a></li>
								<li class="nav-item"><a href="form_tags.html" class="nav-link">Tags</a></li>
								<li class="nav-item"><a href="form_validation_styles.html" class="nav-link">Validation styles</a></li>
								<li class="nav-item"><a href="form_validation_library.html" class="nav-link">Validation library</a></li>
							</ul>
						</li>
						<li class="nav-item nav-item-submenu">
							<a href="#" class="nav-link">
								<i class="ph-text-aa"></i>
								<span>Text editors</span>
							</a>
							<ul class="nav-group-sub collapse">
								<li class="nav-item nav-item-submenu">
									<a href="#" class="nav-link">CKEditor</a>
									<ul class="nav-group-sub collapse">
										<li class="nav-item"><a href="editor_ckeditor_classic.html" class="nav-link">Classic</a></li>
										<li class="nav-item"><a href="editor_ckeditor_document.html" class="nav-link">Document</a></li>
										<li class="nav-item"><a href="editor_ckeditor_balloon.html" class="nav-link">Balloon</a></li>
									</ul>
								</li>
								<li class="nav-item"><a href="editor_quill.html" class="nav-link">Quill</a></li>
								<li class="nav-item"><a href="editor_trumbowyg.html" class="nav-link">Trumbowyg</a></li>
								<li class="nav-item"><a href="editor_code.html" class="nav-link">Code</a></li>
							</ul>
						</li>
						<li class="nav-item nav-item-submenu">
							<a href="#" class="nav-link">
								<i class="ph-hand-pointing"></i>
								<span>Pickers</span>
							</a>
							<ul class="nav-group-sub collapse">
								<li class="nav-item"><a href="picker_color.html" class="nav-link">Color pickers</a></li>
								<li class="nav-item"><a href="picker_date.html" class="nav-link">Date &amp; time pickers</a></li>
							</ul>
						</li>
						<li class="nav-item nav-item-submenu">
							<a href="#" class="nav-link">
								<i class="ph-browser"></i>
								<span>Form layouts</span>
							</a>
							<ul class="nav-group-sub collapse">
								<li class="nav-item"><a href="form_layout_horizontal.html" class="nav-link">Horizontal form</a></li>
								<li class="nav-item"><a href="form_layout_vertical.html" class="nav-link">Vertical form</a></li>
								<li class="nav-item-divider"></li>
								<li class="nav-item"><a href="form_layout_grid.html" class="nav-link">Input grid</a></li>
							</ul>
						</li>
						<!-- /forms -->

						<!-- Components -->
						<li class="nav-item-header">
							<div class="text-uppercase fs-sm lh-sm opacity-50 sidebar-resize-hide">Components</div>
							<i class="ph-dots-three sidebar-resize-show"></i>
						</li>
						<li class="nav-item nav-item-submenu">
							<a href="#" class="nav-link">
								<i class="ph-squares-four"></i>
								<span>Basic components</span>
							</a>
							<ul class="nav-group-sub collapse">
								<li class="nav-item"><a href="components_accordion.html" class="nav-link">Accordion</a></li>
								<li class="nav-item"><a href="components_alerts.html" class="nav-link">Alerts</a></li>
								<li class="nav-item"><a href="components_badges.html" class="nav-link">Badges</a></li>
								<li class="nav-item"><a href="components_breadcrumbs.html" class="nav-link">Breadcrumbs</a></li>
								<li class="nav-item"><a href="components_buttons.html" class="nav-link">Buttons</a></li>
								<li class="nav-item"><a href="components_carousel.html" class="nav-link">Carousel</a></li>
								<li class="nav-item"><a href="components_collapsible.html" class="nav-link">Collapsible</a></li>
								<li class="nav-item"><a href="components_dropdowns.html" class="nav-link">Dropdown menus</a></li>
								<li class="nav-item"><a href="components_list_group.html" class="nav-link">List group</a></li>
								<li class="nav-item"><a href="components_media.html" class="nav-link">Media objects</a></li>
								<li class="nav-item"><a href="components_modals.html" class="nav-link">Modals</a></li>
								<li class="nav-item"><a href="components_offcanvas.html" class="nav-link">Offcanvas</a></li>
								<li class="nav-item"><a href="components_pagination.html" class="nav-link">Pagination</a></li>
								<li class="nav-item"><a href="components_pills.html" class="nav-link">Pills</a></li>
								<li class="nav-item"><a href="components_placeholder.html" class="nav-link">Placeholder</a></li>
								<li class="nav-item"><a href="components_popovers.html" class="nav-link">Popovers</a></li>
								<li class="nav-item"><a href="components_progress.html" class="nav-link">Progress</a></li>
								<li class="nav-item"><a href="components_scrollspy.html" class="nav-link">Scrollspy</a></li>
								<li class="nav-item"><a href="components_tabs.html" class="nav-link">Tabs</a></li>
								<li class="nav-item"><a href="components_toasts.html" class="nav-link">Toasts</a></li>
								<li class="nav-item"><a href="components_tooltips.html" class="nav-link">Tooltips</a></li>
							</ul>
						</li>
						<li class="nav-item nav-item-submenu">
							<a href="#" class="nav-link">
								<i class="ph-article"></i>
								<span>Content styling</span>
							</a>
							<ul class="nav-group-sub collapse">
								<li class="nav-item"><a href="content_page_header.html" class="nav-link">Page header</a></li>
								<li class="nav-item-divider"></li>
								<li class="nav-item"><a href="content_cards.html" class="nav-link">Cards</a></li>
								<li class="nav-item"><a href="content_cards_header.html" class="nav-link">Card header elements</a></li>
								<li class="nav-item"><a href="content_cards_footer.html" class="nav-link">Card footer elements</a></li>
								<li class="nav-item"><a href="content_cards_content.html" class="nav-link">Card content</a></li>
								<li class="nav-item"><a href="content_cards_layouts.html" class="nav-link">Card layouts</a></li>
								<li class="nav-item"><a href="content_cards_draggable.html" class="nav-link">Draggable cards</a></li>
								<li class="nav-item-divider"></li>
								<li class="nav-item"><a href="content_helpers_flex.html" class="nav-link">Flex utilities</a></li>
								<li class="nav-item"><a href="content_helpers.html" class="nav-link">Helper classes</a></li>
								<li class="nav-item"><a href="content_grid.html" class="nav-link">Grid system</a></li>
								<li class="nav-item"><a href="content_syntax_highlighter.html" class="nav-link">Syntax highlighter</a></li>
								<li class="nav-item"><a href="content_text_styling.html" class="nav-link">Text styling</a></li>
								<li class="nav-item"><a href="content_typography.html" class="nav-link">Typography</a></li>
							</ul>
						</li>
						<li class="nav-item nav-item-submenu">
							<a href="#" class="nav-link">
								<i class="ph-dots-three-circle"></i>
								<span>Extra components</span>
							</a>
							<ul class="nav-group-sub collapse">
								<li class="nav-item"><a href="extra_noty.html" class="nav-link active">Noty notifications</a></li>
								<li class="nav-item"><a href="extra_sweetalert.html" class="nav-link">Sweet alert</a></li>
								<li class="nav-item"><a href="extra_sliders_noui.html" class="nav-link">NoUI sliders</a></li>
								<li class="nav-item"><a href="extra_sliders_ion.html" class="nav-link">Ion range sliders</a></li>
								<li class="nav-item"><a href="extra_trees.html" class="nav-link">Dynamic tree views</a></li>
								<li class="nav-item"><a href="extra_fab.html" class="nav-link">Floating action buttons</a></li>
								<li class="nav-item"><a href="extra_session_timeout.html" class="nav-link">Session timeout</a></li>
								<li class="nav-item"><a href="extra_idle_timeout.html" class="nav-link">Idle timeout</a></li>
							</ul>
						</li>
						<li class="nav-item nav-item-submenu">
							<a href="#" class="nav-link">
								<i class="ph-drop"></i>
								<span>Color system</span>
							</a>
							<ul class="nav-group-sub collapse">
								<li class="nav-item"><a href="colors_primary.html" class="nav-link">Primary palette</a></li>
								<li class="nav-item"><a href="colors_secondary.html" class="nav-link">Secondary palette</a></li>
								<li class="nav-item"><a href="colors_danger.html" class="nav-link">Danger palette</a></li>
								<li class="nav-item"><a href="colors_success.html" class="nav-link">Success palette</a></li>
								<li class="nav-item"><a href="colors_warning.html" class="nav-link">Warning palette</a></li>
								<li class="nav-item"><a href="colors_info.html" class="nav-link">Info palette</a></li>
								<li class="nav-item-divider"></li>
								<li class="nav-item"><a href="colors_pink.html" class="nav-link">Pink palette</a></li>
								<li class="nav-item"><a href="colors_purple.html" class="nav-link">Purple palette</a></li>
								<li class="nav-item"><a href="colors_indigo.html" class="nav-link">Indigo palette</a></li>
								<li class="nav-item"><a href="colors_teal.html" class="nav-link">Teal palette</a></li>
								<li class="nav-item"><a href="colors_yellow.html" class="nav-link">Yellow palette</a></li>
							</ul>
						</li>
						<li class="nav-item nav-item-submenu">
							<a href="#" class="nav-link">
								<i class="ph-spinner spinner"></i>
								<span>Animations</span>
							</a>
							<ul class="nav-group-sub collapse">
								<li class="nav-item"><a href="animations_css3.html" class="nav-link">CSS3 animations</a></li>
								<li class="nav-item nav-item-submenu">
									<a href="#" class="nav-link">Velocity animations</a>
									<ul class="nav-group-sub collapse">
										<li class="nav-item"><a href="animations_velocity_basic.html" class="nav-link">Basic usage</a></li>
										<li class="nav-item"><a href="animations_velocity_ui.html" class="nav-link">UI pack effects</a></li>
										<li class="nav-item"><a href="animations_velocity_examples.html" class="nav-link">Advanced examples</a></li>
									</ul>
								</li>
							</ul>
						</li>
						<li class="nav-item nav-item-submenu">
							<a href="#" class="nav-link">
								<i class="ph-smiley-wink"></i>
								<span>Icons</span>
							</a>
							<ul class="nav-group-sub collapse">
								<li class="nav-item"><a href="icons_phosphor.html" class="nav-link">Phosphor</a></li>
								<li class="nav-item"><a href="icons_icomoon.html" class="nav-link">Icomoon</a></li>
								<li class="nav-item"><a href="icons_material.html" class="nav-link">Material</a></li>
								<li class="nav-item"><a href="icons_fontawesome.html" class="nav-link">Font awesome</a></li>
							</ul>
						</li>
						<!-- /components -->

						<!-- Layout -->
						<li class="nav-item-header">
							<div class="text-uppercase fs-sm lh-sm opacity-50 sidebar-resize-hide">Layout</div>
							<i class="ph-dots-three sidebar-resize-show"></i>
						</li>
						<li class="nav-item nav-item-submenu">
							<a href="#" class="nav-link">
								<i class="ph-layout"></i>
								<span>Page layouts</span>
							</a>

							<ul class="nav-group-sub collapse">
								<li class="nav-item"><a href="layout_static.html" class="nav-link">Static layout</a></li>
								<li class="nav-item"><a href="layout_no_header.html" class="nav-link">No header</a></li>
								<li class="nav-item"><a href="layout_no_footer.html" class="nav-link">No footer</a></li>
								<li class="nav-item-divider"></li>
								<li class="nav-item"><a href="layout_fixed_header.html" class="nav-link">Fixed header</a></li>
								<li class="nav-item"><a href="layout_fixed_footer.html" class="nav-link">Fixed footer</a></li>
								<li class="nav-item-divider"></li>
								<li class="nav-item"><a href="layout_2_sidebars_1_side.html" class="nav-link">2 sidebars on 1 side</a></li>
								<li class="nav-item"><a href="layout_2_sidebars_2_sides.html" class="nav-link">2 sidebars on 2 sides</a></li>
								<li class="nav-item"><a href="layout_3_sidebars.html" class="nav-link">3 sidebars</a></li>
								<li class="nav-item-divider"></li>
								<li class="nav-item"><a href="layout_boxed_page.html" class="nav-link">Boxed page</a></li>
								<li class="nav-item"><a href="layout_boxed_content.html" class="nav-link">Boxed content</a></li>
							</ul>
						</li>
						<li class="nav-item nav-item-submenu nav-item-expanded nav-item-open">
							<a href="#" class="nav-link">
								<i class="ph-columns"></i>
								<span>Sidebars</span>
							</a>
							<ul class="nav-group-sub collapse show">
								<li class="nav-item nav-item-submenu nav-item-expanded nav-item-open">
									<a href="#" class="nav-link">Main sidebar</a>
									<ul class="nav-group-sub collapse show">
										<li class="nav-item"><a href="sidebar_default_resizable.html" class="nav-link">Resizable</a></li>
										<li class="nav-item"><a href="sidebar_default_resized.html" class="nav-link">Resized</a></li>
										<li class="nav-item"><a href="sidebar_default_collapsible.html" class="nav-link">Collapsible</a></li>
										<li class="nav-item"><a href="sidebar_default_collapsed.html" class="nav-link">Collapsed</a></li>
										<li class="nav-item"><a href="sidebar_default_hideable.html" class="nav-link">Hideable</a></li>
										<li class="nav-item"><a href="sidebar_default_hidden.html" class="nav-link">Hidden</a></li>
										<li class="nav-item-divider"></li>
										<li class="nav-item"><a href="sidebar_default_color_light.html" class="nav-link active">Light color</a></li>
									</ul>
								</li>
								<li class="nav-item nav-item-submenu">
									<a href="#" class="nav-link">Secondary sidebar</a>
									<ul class="nav-group-sub collapse">
										<li class="nav-item"><a href="sidebar_secondary_collapsible.html" class="nav-link">Collapsible</a></li>
										<li class="nav-item"><a href="sidebar_secondary_collapsed.html" class="nav-link">Collapsed</a></li>
										<li class="nav-item"><a href="sidebar_secondary_hideable.html" class="nav-link">Hideable</a></li>
										<li class="nav-item"><a href="sidebar_secondary_hidden.html" class="nav-link">Hidden</a></li>
										<li class="nav-item-divider"></li>
										<li class="nav-item"><a href="sidebar_secondary_color_dark.html" class="nav-link">Dark color</a></li>
									</ul>
								</li>
								<li class="nav-item nav-item-submenu">
									<a href="#" class="nav-link">Right sidebar</a>
									<ul class="nav-group-sub collapse">
										<li class="nav-item"><a href="sidebar_right_collapsible.html" class="nav-link">Collapsible</a></li>
										<li class="nav-item"><a href="sidebar_right_collapsed.html" class="nav-link">Collapsed</a></li>
										<li class="nav-item"><a href="sidebar_right_hideable.html" class="nav-link">Hideable</a></li>
										<li class="nav-item"><a href="sidebar_right_hidden.html" class="nav-link">Hidden</a></li>
										<li class="nav-item-divider"></li>
										<li class="nav-item"><a href="sidebar_right_color_dark.html" class="nav-link">Dark color</a></li>
									</ul>
								</li>
								<li class="nav-item nav-item-submenu">
									<a href="#" class="nav-link">Content sidebar</a>
									<ul class="nav-group-sub collapse">
										<li class="nav-item"><a href="sidebar_content_left.html" class="nav-link">Left aligned</a></li>
										<li class="nav-item"><a href="sidebar_content_left_stretch.html" class="nav-link">Left stretched</a></li>
										<li class="nav-item"><a href="sidebar_content_left_sections.html" class="nav-link">Left sectioned</a></li>
										<li class="nav-item"><a href="sidebar_content_right.html" class="nav-link">Right aligned</a></li>
										<li class="nav-item"><a href="sidebar_content_right_stretch.html" class="nav-link">Right stretched</a></li>
										<li class="nav-item"><a href="sidebar_content_right_sections.html" class="nav-link">Right sectioned</a></li>
										<li class="nav-item-divider"></li>
										<li class="nav-item"><a href="sidebar_content_color_dark.html" class="nav-link">Dark color</a></li>
									</ul>
								</li>
								<li class="nav-item-divider"></li>
								<li class="nav-item nav-item-submenu">
									<a href="#" class="nav-link">Sticky areas</a>
									<ul class="nav-group-sub collapse">
										<li class="nav-item"><a href="sidebar_sticky_header.html" class="nav-link">Header</a></li>
										<li class="nav-item"><a href="sidebar_sticky_footer.html" class="nav-link">Footer</a></li>
										<li class="nav-item"><a href="sidebar_sticky_header_footer.html" class="nav-link">Header and footer</a></li>
										<li class="nav-item"><a href="sidebar_sticky_custom.html" class="nav-link">Custom elements</a></li>
									</ul>
								</li>
								<li class="nav-item"><a href="sidebar_components.html" class="nav-link">Sidebar components</a></li>
							</ul>
						</li>
						<li class="nav-item nav-item-submenu">
							<a href="#" class="nav-link">
								<i class="ph-rows"></i>
								<span>Navbars</span>
							</a>
							<ul class="nav-group-sub collapse">
								<li class="nav-item nav-item-submenu">
									<a href="#" class="nav-link">Single navbar</a>
									<ul class="nav-group-sub collapse">
										<li class="nav-item"><a href="navbar_single_bottom_fixed.html" class="nav-link">Bottom fixed</a></li>
										<li class="nav-item"><a href="navbar_single_header_before.html" class="nav-link">Before page header</a></li>
										<li class="nav-item"><a href="navbar_single_header_before_fixed.html" class="nav-link">Before page header fixed</a></li>
										<li class="nav-item"><a href="navbar_single_header_after.html" class="nav-link">After page header</a></li>
										<li class="nav-item"><a href="navbar_single_header_after_sticky.html" class="nav-link">After page header sticky</a></li>
									</ul>
								</li>
								<li class="nav-item nav-item-submenu">
									<a href="#" class="nav-link">Multiple navbars</a>
									<ul class="nav-group-sub collapse">
										<li class="nav-item"><a href="navbar_multiple_top.html" class="nav-link">Multiple top</a></li>
										<li class="nav-item"><a href="navbar_multiple_bottom_static.html" class="nav-link">Multiple bottom static</a></li>
										<li class="nav-item"><a href="navbar_multiple_bottom_fixed.html" class="nav-link">Multiple bottom fixed</a></li>
										<li class="nav-item"><a href="navbar_multiple_top_bottom_fixed.html" class="nav-link">Top and bottom fixed</a></li>
									</ul>
								</li>
								<li class="nav-item nav-item-submenu">
									<a href="#" class="nav-link">Content navbar</a>
									<ul class="nav-group-sub collapse">
										<li class="nav-item"><a href="navbar_component_single.html" class="nav-link">Single navbar</a></li>
										<li class="nav-item"><a href="navbar_component_multiple.html" class="nav-link">Multiple navbars</a></li>
									</ul>
								</li>
								<li class="nav-item-divider"></li>
								<li class="nav-item"><a href="navbar_colors.html" class="nav-link">Color options</a></li>
								<li class="nav-item"><a href="navbar_sizes.html" class="nav-link">Sizing options</a></li>
								<li class="nav-item"><a href="navbar_components.html" class="nav-link">Navbar components</a></li>
							</ul>
						</li>
						<li class="nav-item nav-item-submenu">
							<a href="#" class="nav-link">
								<i class="ph-arrow-fat-lines-down"></i>
								<span>Vertical navigation</span>
							</a>
							<ul class="nav-group-sub collapse">
								<li class="nav-item"><a href="navigation_vertical_styles.html" class="nav-link">Navigation styles</a></li>
								<li class="nav-item"><a href="navigation_vertical_collapsible.html" class="nav-link">Collapsible menu</a></li>
								<li class="nav-item"><a href="navigation_vertical_accordion.html" class="nav-link">Accordion menu</a></li>
								<li class="nav-item"><a href="navigation_vertical_bordered.html" class="nav-link">Bordered navigation</a></li>
								<li class="nav-item"><a href="navigation_vertical_right_icons.html" class="nav-link">Right icons</a></li>
								<li class="nav-item"><a href="navigation_vertical_badges.html" class="nav-link">Badges</a></li>
								<li class="nav-item"><a href="navigation_vertical_disabled.html" class="nav-link">Disabled items</a></li>
							</ul>
						</li>
						<li class="nav-item nav-item-submenu">
							<a href="#" class="nav-link">
								<i class="ph-arrow-fat-lines-right"></i>
								<span>Horizontal navigation</span>
							</a>
							<ul class="nav-group-sub collapse">
								<li class="nav-item"><a href="navigation_horizontal_styles.html" class="nav-link">Navigation styles</a></li>
								<li class="nav-item"><a href="navigation_horizontal_elements.html" class="nav-link">Navigation elements</a></li>
								<li class="nav-item"><a href="navigation_horizontal_tabs.html" class="nav-link">Tabbed navigation</a></li>
								<li class="nav-item"><a href="navigation_horizontal_disabled.html" class="nav-link">Disabled navigation links</a></li>
								<li class="nav-item"><a href="navigation_horizontal_mega.html" class="nav-link">Horizontal mega menu</a></li>
							</ul>
						</li>
						<li class="nav-item nav-item-submenu">
							<a href="#" class="nav-link"><i class="ph-arrow-elbow-down-right"></i> <span>Menu levels</span></a>
							<ul class="nav-group-sub collapse">
								<li class="nav-item"><a href="#" class="nav-link">Second level</a></li>
								<li class="nav-item nav-item-submenu">
									<a href="#" class="nav-link">Second level with child</a>
									<ul class="nav-group-sub collapse">
										<li class="nav-item"><a href="#" class="nav-link">Third level</a></li>
										<li class="nav-item nav-item-submenu">
											<a href="#" class="nav-link">Third level with child</a>
											<ul class="nav-group-sub collapse">
												<li class="nav-item"><a href="#" class="nav-link">Fourth level</a></li>
												<li class="nav-item"><a href="#" class="nav-link">Fourth level</a></li>
											</ul>
										</li>
										<li class="nav-item"><a href="#" class="nav-link">Third level</a></li>
									</ul>
								</li>
								<li class="nav-item"><a href="#" class="nav-link">Second level</a></li>
							</ul>
						</li>
						<!-- /layout -->

						<!-- Data visualization -->
						<li class="nav-item-header">
							<div class="text-uppercase fs-sm lh-sm opacity-50 sidebar-resize-hide">Data visualization</div>
							<i class="ph-dots-three sidebar-resize-show"></i>
						</li>
						<li class="nav-item nav-item-submenu">
							<a href="#" class="nav-link">
								<i class="ph-chart-line"></i>
								<span>Echarts library</span>
							</a>
							<ul class="nav-group-sub collapse">
								<li class="nav-item"><a href="echarts_lines.html" class="nav-link">Line charts</a></li>
								<li class="nav-item"><a href="echarts_areas.html" class="nav-link">Area charts</a></li>
								<li class="nav-item"><a href="echarts_columns_waterfalls.html" class="nav-link">Columns and waterfalls</a></li>
								<li class="nav-item"><a href="echarts_bars_tornados.html" class="nav-link">Bars and tornados</a></li>
								<li class="nav-item"><a href="echarts_scatter.html" class="nav-link">Scatter charts</a></li>
								<li class="nav-item"><a href="echarts_pies_donuts.html" class="nav-link">Pies and donuts</a></li>
								<li class="nav-item"><a href="echarts_funnels_calendars.html" class="nav-link">Funnels and calendars</a></li>
								<li class="nav-item"><a href="echarts_candlesticks_others.html" class="nav-link">Candlesticks and others</a></li>
							</ul>
						</li>
						<li class="nav-item nav-item-submenu">
							<a href="#" class="nav-link">
								<i class="ph-chart-bar"></i>
								<span>D3 library</span>
							</a>
							<ul class="nav-group-sub collapse">
								<li class="nav-item"><a href="d3_lines_basic.html" class="nav-link">Simple lines</a></li>
								<li class="nav-item"><a href="d3_lines_advanced.html" class="nav-link">Advanced lines</a></li>
								<li class="nav-item"><a href="d3_bars_basic.html" class="nav-link">Simple bars</a></li>
								<li class="nav-item"><a href="d3_bars_advanced.html" class="nav-link">Advanced bars</a></li>
								<li class="nav-item"><a href="d3_pies.html" class="nav-link">Pie charts</a></li>
								<li class="nav-item"><a href="d3_circle_diagrams.html" class="nav-link">Circle diagrams</a></li>
								<li class="nav-item"><a href="d3_tree.html" class="nav-link">Tree layout</a></li>
								<li class="nav-item"><a href="d3_other.html" class="nav-link">Other charts</a></li>
							</ul>
						</li>
						<li class="nav-item nav-item-submenu">
							<a href="#" class="nav-link">
								<i class="ph-chart-pie-slice"></i>
								<span>C3 library</span>
							</a>
							<ul class="nav-group-sub collapse">
								<li class="nav-item"><a href="c3_lines_areas.html" class="nav-link">Lines and areas</a></li>
								<li class="nav-item"><a href="c3_bars_pies.html" class="nav-link">Bars and pies</a></li>
								<li class="nav-item"><a href="c3_advanced.html" class="nav-link">Advanced examples</a></li>
								<li class="nav-item"><a href="c3_axis.html" class="nav-link">Chart axis</a></li>
								<li class="nav-item"><a href="c3_grid.html" class="nav-link">Grid options</a></li>
							</ul>
						</li>
						<li class="nav-item nav-item-submenu">
							<a href="#" class="nav-link">
								<i class="ph-google-logo"></i>
								<span>Google charts</span>
							</a>
							<ul class="nav-group-sub collapse">
								<li class="nav-item"><a href="google_lines.html" class="nav-link">Line charts</a></li>
								<li class="nav-item"><a href="google_bars.html" class="nav-link">Bar charts</a></li>
								<li class="nav-item"><a href="google_pies.html" class="nav-link">Pie charts</a></li>
								<li class="nav-item"><a href="google_scatter_bubble.html" class="nav-link">Bubble &amp; scatter charts</a></li>
								<li class="nav-item"><a href="google_other.html" class="nav-link">Other charts</a></li>
							</ul>
						</li>
						<li class="nav-item nav-item-submenu">
							<a href="#" class="nav-link">
								<i class="ph-map-pin"></i>
								<span>Maps integration</span>
							</a>
							<ul class="nav-group-sub collapse">
								<li class="nav-item"><a href="maps_leaflet.html" class="nav-link">Leaflet maps</a></li>
								<li class="nav-item"><a href="maps_echarts.html" class="nav-link">ECharts maps</a></li>
								<li class="nav-item"><a href="maps_vector.html" class="nav-link disabled">D3.js maps <span class="badge bg-transparent align-self-center ms-auto">Coming soon</span></a></li>
							</ul>
						</li>
						<!-- /data visualization -->

						<!-- Extensions -->
						<li class="nav-item-header">
							<div class="text-uppercase fs-sm lh-sm opacity-50 sidebar-resize-hide">Extensions</div>
							<i class="ph-dots-three sidebar-resize-show"></i>
						</li>
						<li class="nav-item nav-item-submenu">
							<a href="#" class="nav-link">
								<i class="ph-circles-three"></i>
								<span>Extensions</span>
							</a>
							<ul class="nav-group-sub collapse">
								<li class="nav-item"><a href="extension_image_cropper.html" class="nav-link">Image cropper</a></li>
								<li class="nav-item"><a href="extension_mark.html" class="nav-link">Mark</a></li>
								<li class="nav-item"><a href="extension_dnd.html" class="nav-link">Drag and drop</a></li>
							</ul>
						</li>
						<li class="nav-item nav-item-submenu">
							<a href="#" class="nav-link">
								<i class="ph-cloud-arrow-up"></i>
								<span>File uploaders</span>
							</a>
							<ul class="nav-group-sub collapse">
								<li class="nav-item"><a href="uploader_plupload.html" class="nav-link">Plupload</a></li>
								<li class="nav-item"><a href="uploader_bootstrap.html" class="nav-link">Bootstrap file uploader</a></li>
								<li class="nav-item"><a href="uploader_dropzone.html" class="nav-link">Dropzone</a></li>
							</ul>
						</li>
						<li class="nav-item nav-item-submenu">
							<a href="#" class="nav-link">
								<i class="ph-calendar-check"></i>
								<span>Event calendars</span>
							</a>
							<ul class="nav-group-sub collapse">
								<li class="nav-item"><a href="fullcalendar_views.html" class="nav-link">Basic views</a></li>
								<li class="nav-item"><a href="fullcalendar_styling.html" class="nav-link">Event styling</a></li>
								<li class="nav-item"><a href="fullcalendar_formats.html" class="nav-link">Language and time</a></li>
								<li class="nav-item"><a href="fullcalendar_advanced.html" class="nav-link">Advanced usage</a></li>
							</ul>
						</li>
						<li class="nav-item nav-item-submenu">
							<a href="#" class="nav-link">
								<i class="ph-globe"></i>
								<span>Internationalization</span>
							</a>
							<ul class="nav-group-sub collapse">
								<li class="nav-item"><a href="internationalization_switch_direct.html" class="nav-link">Direct translation</a></li>
								<li class="nav-item"><a href="internationalization_switch_query.html" class="nav-link">Querystring parameter</a></li>
								<li class="nav-item"><a href="internationalization_fallback.html" class="nav-link">Language fallback</a></li>
								<li class="nav-item"><a href="internationalization_callbacks.html" class="nav-link">Callbacks</a></li>
							</ul>
						</li>
						<!-- /extensions -->

						<!-- Tables -->
						<li class="nav-item-header">
							<div class="text-uppercase fs-sm lh-sm opacity-50 sidebar-resize-hide">Tables</div>
							<i class="ph-dots-three sidebar-resize-show"></i>
						</li>
						<li class="nav-item nav-item-submenu">
							<a href="#" class="nav-link">
								<i class="ph-table"></i>
								<span>Basic tables</span>
							</a>
							<ul class="nav-group-sub collapse">
								<li class="nav-item"><a href="table_basic.html" class="nav-link">Basic examples</a></li>
								<li class="nav-item"><a href="table_sizing.html" class="nav-link">Table sizing</a></li>
								<li class="nav-item"><a href="table_borders.html" class="nav-link">Table borders</a></li>
								<li class="nav-item"><a href="table_styling.html" class="nav-link">Table styling</a></li>
								<li class="nav-item"><a href="table_elements.html" class="nav-link">Table elements</a></li>
							</ul>
						</li>
						<li class="nav-item nav-item-submenu">
							<a href="#" class="nav-link">
								<i class="ph-square-half-bottom"></i>
								<span>Grid.js tables</span>
							</a>
							<ul class="nav-group-sub collapse">
								<li class="nav-item"><a href="gridjs_basic.html" class="nav-link">Basic</a></li>
								<li class="nav-item"><a href="gridjs_data_source.html" class="nav-link">Data source</a></li>
								<li class="nav-item"><a href="gridjs_server_side.html" class="nav-link">Server side</a></li>
								<li class="nav-item"><a href="gridjs_customizing.html" class="nav-link">Customizing</a></li>
								<li class="nav-item"><a href="gridjs_advanced.html" class="nav-link">Advanced</a></li>
							</ul>
						</li>
						<li class="nav-item nav-item-submenu">
							<a href="#" class="nav-link">
								<i class="ph-square-half"></i>
								<span>Data tables</span>
							</a>
							<ul class="nav-group-sub collapse">
								<li class="nav-item"><a href="datatable_basic.html" class="nav-link">Basic initialization</a></li>
								<li class="nav-item"><a href="datatable_styling.html" class="nav-link">Basic styling</a></li>
								<li class="nav-item"><a href="datatable_advanced.html" class="nav-link">Advanced examples</a></li>
								<li class="nav-item"><a href="datatable_sorting.html" class="nav-link">Sorting options</a></li>
								<li class="nav-item"><a href="datatable_api.html" class="nav-link">Using API</a></li>
								<li class="nav-item"><a href="datatable_data_sources.html" class="nav-link">Data sources</a></li>
							</ul>
						</li>
						<li class="nav-item nav-item-submenu">
							<a href="#" class="nav-link">
								<i class="ph-puzzle-piece"></i>
								<span>Data tables extensions</span>
							</a>
							<ul class="nav-group-sub collapse">
								<li class="nav-item"><a href="datatable_extension_reorder.html" class="nav-link">Columns reorder</a></li>
								<li class="nav-item"><a href="datatable_extension_row_reorder.html" class="nav-link">Row reorder</a></li>
								<li class="nav-item"><a href="datatable_extension_fixed_columns.html" class="nav-link">Fixed columns</a></li>
								<li class="nav-item"><a href="datatable_extension_autofill.html" class="nav-link">Auto fill</a></li>
								<li class="nav-item"><a href="datatable_extension_key_table.html" class="nav-link">Key table</a></li>
								<li class="nav-item"><a href="datatable_extension_scroller.html" class="nav-link">Scroller</a></li>
								<li class="nav-item"><a href="datatable_extension_select.html" class="nav-link">Select</a></li>
								<li class="nav-item"><a href="datatable_extension_responsive.html" class="nav-link">Responsive</a></li>
								<li class="nav-item nav-item-submenu">
									<a href="#" class="nav-link">Buttons</a>
									<ul class="nav-group-sub collapse">
										<li class="nav-item"><a href="datatable_extension_buttons_init.html" class="nav-link">Initialization</a></li>
										<li class="nav-item"><a href="datatable_extension_buttons_pdf.html" class="nav-link">PDF buttons</a></li>
										<li class="nav-item"><a href="datatable_extension_buttons_excel.html" class="nav-link">Excel buttons</a></li>
										<li class="nav-item"><a href="datatable_extension_buttons_print.html" class="nav-link">Print buttons</a></li>
										<li class="nav-item"><a href="datatable_extension_buttons_html5.html" class="nav-link">HTML5 buttons</a></li>
									</ul>
								</li>
								<li class="nav-item"><a href="datatable_extension_colvis.html" class="nav-link">Columns visibility</a></li>
							</ul>
						</li>
						<!-- /tables -->

						<!-- Page kits -->
						<li class="nav-item-header">
							<div class="text-uppercase fs-sm lh-sm opacity-50 sidebar-resize-hide">Page kits</div>
							<i class="ph-dots-three sidebar-resize-show"></i>
						</li>
						<li class="nav-item nav-item-submenu">
							<a href="#" class="nav-link">
								<i class="ph-cards"></i>
								<span>General pages</span>
							</a>
							<ul class="nav-group-sub collapse">
								<li class="nav-item"><a href="general_feed.html" class="nav-link">Feed</a></li>
								<li class="nav-item"><a href="general_embeds.html" class="nav-link">Embeds</a></li>
								<li class="nav-item"><a href="general_faq.html" class="nav-link">FAQ page</a></li>
								<li class="nav-item"><a href="general_knowledgebase.html" class="nav-link">Knowledgebase</a></li>
								<li class="nav-item nav-item-submenu">
									<a href="#" class="nav-link">Blog</a>
									<ul class="nav-group-sub collapse">
										<li class="nav-item"><a href="blog_classic_v.html" class="nav-link">Classic vertical</a></li>
										<li class="nav-item"><a href="blog_classic_h.html" class="nav-link">Classic horizontal</a></li>
										<li class="nav-item"><a href="blog_grid.html" class="nav-link">Grid</a></li>
										<li class="nav-item"><a href="blog_single.html" class="nav-link">Single post</a></li>
										<li class="nav-item-divider"></li>
										<li class="nav-item"><a href="blog_sidebar_left.html" class="nav-link">Left sidebar</a></li>
										<li class="nav-item"><a href="blog_sidebar_right.html" class="nav-link">Right sidebar</a></li>
									</ul>
								</li>
								<li class="nav-item nav-item-submenu">
									<a href="#" class="nav-link">Timelines</a>
									<ul class="nav-group-sub collapse">
										<li class="nav-item"><a href="timelines_left.html" class="nav-link">Left timeline</a></li>
										<li class="nav-item"><a href="timelines_right.html" class="nav-link">Right timeline</a></li>
										<li class="nav-item"><a href="timelines_center.html" class="nav-link">Centered timeline</a></li>
									</ul>
								</li>
								<li class="nav-item nav-item-submenu">
									<a href="#" class="nav-link">Gallery</a>
									<ul class="nav-group-sub collapse">
										<li class="nav-item"><a href="gallery_grid.html" class="nav-link">Media grid</a></li>
										<li class="nav-item"><a href="gallery_titles.html" class="nav-link">Media with titles</a></li>
										<li class="nav-item"><a href="gallery_description.html" class="nav-link">Media with description</a></li>
										<li class="nav-item"><a href="gallery_library.html" class="nav-link">Media library</a></li>
									</ul>
								</li>
							</ul>
						</li>
						<li class="nav-item nav-item-submenu">
							<a href="#" class="nav-link">
								<i class="ph-wrench"></i>
								<span>Service pages</span>
							</a>
							<ul class="nav-group-sub collapse">
								<li class="nav-item"><a href="service_sitemap.html" class="nav-link">Sitemap</a></li>
								<li class="nav-item nav-item-submenu">
									<a href="#" class="nav-link">Invoicing</a>
									<ul class="nav-group-sub collapse">
										<li class="nav-item"><a href="invoice_template.html" class="nav-link">Invoice template</a></li>
										<li class="nav-item"><a href="invoice_grid.html" class="nav-link">Invoice grid</a></li>
										<li class="nav-item"><a href="invoice_archive.html" class="nav-link">Invoice archive</a></li>
									</ul>
								</li>
								<li class="nav-item nav-item-submenu">
									<a href="#" class="nav-link">Authentication</a>
									<ul class="nav-group-sub collapse">
										<li class="nav-item"><a href="login_simple.html" class="nav-link">Simple login</a></li>
										<li class="nav-item"><a href="login_advanced.html" class="nav-link">More login info</a></li>
										<li class="nav-item"><a href="login_registration.html" class="nav-link">Simple registration</a></li>
										<li class="nav-item"><a href="login_registration_advanced.html" class="nav-link">More registration info</a></li>
										<li class="nav-item"><a href="login_unlock.html" class="nav-link">Unlock user</a></li>
										<li class="nav-item"><a href="login_password_recover.html" class="nav-link">Reset password</a></li>
										<li class="nav-item"><a href="login_hide_navbar.html" class="nav-link">Hide navbar</a></li>
										<li class="nav-item"><a href="login_transparent.html" class="nav-link">Transparent box</a></li>
										<li class="nav-item"><a href="login_background.html" class="nav-link">Background option</a></li>
										<li class="nav-item"><a href="login_validation.html" class="nav-link">With validation</a></li>
										<li class="nav-item"><a href="login_tabbed.html" class="nav-link">Tabbed form</a></li>
										<li class="nav-item"><a href="login_modals.html" class="nav-link">Inside modals</a></li>
									</ul>
								</li>
								<li class="nav-item nav-item-submenu">
									<a href="#" class="nav-link">Error pages</a>
									<ul class="nav-group-sub collapse">
										<li class="nav-item"><a href="error_403.html" class="nav-link">Error 403</a></li>
										<li class="nav-item"><a href="error_404.html" class="nav-link">Error 404</a></li>
										<li class="nav-item"><a href="error_405.html" class="nav-link">Error 405</a></li>
										<li class="nav-item"><a href="error_500.html" class="nav-link">Error 500</a></li>
										<li class="nav-item"><a href="error_503.html" class="nav-link">Error 503</a></li>
										<li class="nav-item"><a href="error_offline.html" class="nav-link">Offline page</a></li>
									</ul>
								</li>
							</ul>
						</li>
						<li class="nav-item nav-item-submenu">
							<a href="#" class="nav-link">
								<i class="ph-user-focus"></i>
								<span>User pages</span>
							</a>
							<ul class="nav-group-sub collapse">
								<li class="nav-item"><a href="user_pages_list.html" class="nav-link">User list</a></li>
								<li class="nav-item"><a href="user_pages_cards.html" class="nav-link">User cards</a></li>
								<li class="nav-item"><a href="user_pages_profile.html" class="nav-link">Simple profile</a></li>
								<li class="nav-item"><a href="user_pages_profile_tabbed.html" class="nav-link">Tabbed profile</a></li>
								<li class="nav-item"><a href="user_pages_profile_cover.html" class="nav-link">Profile with cover</a></li>
							</ul>
						</li>
						<li class="nav-item nav-item-submenu">
							<a href="#" class="nav-link">
								<i class="ph-circles-four"></i>
								<span>Application pages</span>
							</a>
							<ul class="nav-group-sub collapse">
								<li class="nav-item nav-item-submenu">
									<a href="#" class="nav-link">Task manager</a>
									<ul class="nav-group-sub collapse">
										<li class="nav-item"><a href="task_manager_grid.html" class="nav-link">Task grid</a></li>
										<li class="nav-item"><a href="task_manager_list.html" class="nav-link">Task list</a></li>
										<li class="nav-item"><a href="task_manager_detailed.html" class="nav-link">Task detailed</a></li>
									</ul>
								</li>
								<li class="nav-item nav-item-submenu">
									<a href="#" class="nav-link">Inbox</a>
									<ul class="nav-group-sub collapse">
										<li class="nav-item"><a href="mail_list.html" class="nav-link">Mail list</a></li>
										<li class="nav-item"><a href="mail_list_detached.html" class="nav-link">Mail list (detached)</a></li>
										<li class="nav-item"><a href="mail_read.html" class="nav-link">Read mail</a></li>
										<li class="nav-item"><a href="mail_write.html" class="nav-link">Write mail</a></li>
										<li class="nav-item-divider"></li>
										<li class="nav-item"><a href="chat_layouts.html" class="nav-link">Chat layouts</a></li>
										<li class="nav-item"><a href="chat_options.html" class="nav-link">Chat options</a></li>
									</ul>
								</li>
								<li class="nav-item nav-item-submenu">
									<a href="#" class="nav-link">Search</a>
									<ul class="nav-group-sub collapse">
										<li class="nav-item"><a href="search_basic.html" class="nav-link">Basic search results</a></li>
										<li class="nav-item"><a href="search_users.html" class="nav-link">User search results</a></li>
										<li class="nav-item"><a href="search_images.html" class="nav-link">Image search results</a></li>
										<li class="nav-item"><a href="search_videos.html" class="nav-link">Video search results</a></li>
									</ul>
								</li>
								<li class="nav-item nav-item-submenu">
									<a href="#" class="nav-link">Job search</a>
									<ul class="nav-group-sub collapse">
										<li class="nav-item"><a href="job_list_cards.html" class="nav-link">Cards view</a></li>
										<li class="nav-item"><a href="job_list_list.html" class="nav-link">List view</a></li>
										<li class="nav-item"><a href="job_detailed.html" class="nav-link">Job detailed</a></li>
										<li class="nav-item"><a href="job_apply.html" class="nav-link">Apply</a></li>
									</ul>
								</li>
								<li class="nav-item nav-item-submenu">
									<a href="#" class="nav-link">Learning</a>
									<ul class="nav-group-sub collapse">
										<li class="nav-item"><a href="learning_list.html" class="nav-link">List view</a></li>
										<li class="nav-item"><a href="learning_grid.html" class="nav-link">Grid view</a></li>
										<li class="nav-item"><a href="learning_detailed.html" class="nav-link">Detailed course</a></li>
									</ul>
								</li>
								<li class="nav-item nav-item-submenu">
									<a href="#" class="nav-link">Ecommerce set</a>
									<ul class="nav-group-sub collapse">
										<li class="nav-item"><a href="ecommerce_product_list.html" class="nav-link">Product list</a></li>
										<li class="nav-item"><a href="ecommerce_product_grid.html" class="nav-link">Product grid</a></li>
										<li class="nav-item"><a href="ecommerce_orders_history.html" class="nav-link">Orders history</a></li>
										<li class="nav-item"><a href="ecommerce_customers.html" class="nav-link">Customers</a></li>
										<li class="nav-item"><a href="ecommerce_pricing.html" class="nav-link">Pricing tables</a></li>
									</ul>
								</li>
							</ul>
						</li>
						<li class="nav-item nav-item-submenu">
							<a href="#" class="nav-link">
								<i class="ph-gift"></i>
								<span>Widgets</span>
							</a>
							<ul class="nav-group-sub collapse">
								<li class="nav-item"><a href="widgets_content.html" class="nav-link">Content widgets</a></li>
								<li class="nav-item"><a href="widgets_stats.html" class="nav-link">Statistics widgets</a></li>
								<li class="nav-item"><a href="widgets_menu.html" class="nav-link disabled">Menu widgets <span class="badge bg-transparent align-self-center ms-auto">Coming soon</span></a></li>
								<li class="nav-item"><a href="widgets_form.html" class="nav-link disabled">Form widgets <span class="badge bg-transparent align-self-center ms-auto">Coming soon</span></a></li>
							</ul>
						</li>
						<!-- /page kits -->

					</ul>
				</div>
				<!-- /main navigation -->

			</div>
			<!-- /sidebar content -->
			
		</div>
		<!-- /main sidebar -->
		<!-- /main sidebar -->


		<!-- Main content -->
		<div class="content-wrapper">

			<!-- Inner content -->
			<div class="content-inner">

				<!-- Page header -->
				<div class="page-header page-header-light shadow">
					<div class="page-header-content d-lg-flex">
						<div class="d-flex">
							<h4 class="page-title mb-0">
								Content - <span class="fw-normal">Cards</span>
							</h4>

							<a href="#page_header" class="btn btn-light align-self-center collapsed d-lg-none border-transparent rounded-pill p-0 ms-auto" data-bs-toggle="collapse">
								<i class="ph-caret-down collapsible-indicator ph-sm m-1"></i>
							</a>
						</div>

						<div class="collapse d-lg-block my-lg-auto ms-lg-auto" id="page_header">
							<div class="d-sm-flex align-items-center mb-3 mb-lg-0 ms-lg-3">
								<div class="dropdown w-100 w-sm-auto">
									<a href="#" class="d-flex align-items-center text-body lh-1 dropdown-toggle py-sm-2" data-bs-toggle="dropdown" data-bs-display="static">
										<img src="{{ URL::asset('assets/base/images/brands/tesla.svg'); }}" class="w-32px h-32px me-2" alt="">
										<div class="me-auto me-lg-1">
											<div class="fs-sm text-muted mb-1">Customer</div>
											<div class="fw-semibold">Tesla Motors Inc</div>
										</div>
									</a>

									<div class="dropdown-menu dropdown-menu-lg-end w-100 w-lg-auto wmin-300 wmin-sm-350 pt-0">
										<div class="d-flex align-items-center p-3">
											<h6 class="fw-semibold mb-0">Customers</h6>
											<a href="#" class="ms-auto">
												View all
												<i class="ph-arrow-circle-right ms-1"></i>
											</a>
										</div>
										<a href="#" class="dropdown-item active py-2">
											<img src="{{ URL::asset('assets/base/images/brands/tesla.svg'); }}" class="w-32px h-32px me-2" alt="">
											<div>
												<div class="fw-semibold">Tesla Motors Inc</div>
												<div class="fs-sm text-muted">42 users</div>
											</div>
										</a>
										<a href="#" class="dropdown-item py-2">
											<img src="{{ URL::asset('assets/base/images/brands/debijenkorf.svg'); }}" class="w-32px h-32px me-2" alt="">
											<div>
												<div class="fw-semibold">De Bijenkorf</div>
												<div class="fs-sm text-muted">49 users</div>
											</div>
										</a>
										<a href="#" class="dropdown-item py-2">
											<img src="{{ URL::asset('assets/base/images/brands/klm.svg'); }}" class="w-32px h-32px me-2" alt="">
											<div>
												<div class="fw-semibold">Royal Dutch Airlines</div>
												<div class="fs-sm text-muted">18 users</div>
											</div>
										</a>
										<a href="#" class="dropdown-item py-2">
											<img src="{{ URL::asset('assets/base/images/brands/shell.svg'); }}" class="w-32px h-32px me-2" alt="">
											<div>
												<div class="fw-semibold">Royal Dutch Shell</div>
												<div class="fs-sm text-muted">54 users</div>
											</div>
										</a>
										<a href="#" class="dropdown-item py-2">
											<img src="{{ URL::asset('assets/base/images/brands/bp.svg'); }}" class="w-32px h-32px me-2" alt="">
											<div>
												<div class="fw-semibold">BP plc</div>
												<div class="fs-sm text-muted">23 users</div>
											</div>
										</a>
									</div>
								</div>

								<div class="vr d-none d-sm-block flex-shrink-0 my-2 mx-3"></div>

								<div class="d-inline-flex mt-3 mt-sm-0">
									<a href="#" class="status-indicator-container ms-1">
										<img src="{{ URL::asset('assets/base/images/demo/users/face24.jpg'); }}" class="w-32px h-32px rounded-pill" alt="">
										<span class="status-indicator bg-warning"></span>
									</a>
									<a href="#" class="status-indicator-container ms-1">
										<img src="{{ URL::asset('assets/base/images/demo/users/face1.jpg'); }}" class="w-32px h-32px rounded-pill" alt="">
										<span class="status-indicator bg-success"></span>
									</a>
									<a href="#" class="status-indicator-container ms-1">
										<img src="{{ URL::asset('assets/base/images/demo/users/face3.jpg'); }}" class="w-32px h-32px rounded-pill" alt="">
										<span class="status-indicator bg-danger"></span>
									</a>
									<a href="#" class="btn btn-outline-primary btn-icon w-32px h-32px rounded-pill ms-3">
										<i class="ph-plus"></i>
									</a>
								</div>
							</div>
						</div>
					</div>

					<div class="page-header-content d-lg-flex border-top">
						<div class="d-flex">
							<div class="breadcrumb py-2">
								<a href="index.html" class="breadcrumb-item"><i class="ph-house"></i></a>
								<a href="#" class="breadcrumb-item">Content</a>
								<span class="breadcrumb-item active">Cards</span>
							</div>

							<a href="#breadcrumb_elements" class="btn btn-light align-self-center collapsed d-lg-none border-transparent rounded-pill p-0 ms-auto" data-bs-toggle="collapse">
								<i class="ph-caret-down collapsible-indicator ph-sm m-1"></i>
							</a>
						</div>

						<div class="collapse d-lg-block ms-lg-auto" id="breadcrumb_elements">
							<div class="d-lg-flex mb-2 mb-lg-0">
								<a href="#" class="d-flex align-items-center text-body py-2">
									<i class="ph-lifebuoy me-2"></i>
									Support
								</a>

								<div class="dropdown ms-lg-3">
									<a href="#" class="d-flex align-items-center text-body dropdown-toggle py-2" data-bs-toggle="dropdown">
										<i class="ph-gear me-2"></i>
										<span class="flex-1">Settings</span>
									</a>

									<div class="dropdown-menu dropdown-menu-end w-100 w-lg-auto">
										<a href="#" class="dropdown-item">
											<i class="ph-shield-warning me-2"></i>
											Account security
										</a>
										<a href="#" class="dropdown-item">
											<i class="ph-chart-bar me-2"></i>
											Analytics
										</a>
										<a href="#" class="dropdown-item">
											<i class="ph-lock-key me-2"></i>
											Privacy
										</a>
										<div class="dropdown-divider"></div>
										<a href="#" class="dropdown-item">
											<i class="ph-gear me-2"></i>
											All settings
										</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- /page header -->


				<!-- Content area -->
				<div class="content">

					<!-- Card titles and subtitles -->
					<div class="mb-3">
						<h6 class="mb-0">Card titles and subtitles</h6>
						<span class="text-muted">Titles, subtitles and header elements</span>
					</div>

					<div class="row">
						<div class="col-lg-6">
							<div class="card">
								<div class="card-header">
									<h6 class="mb-0">Card title</h6>
								</div>
								
								<div class="card-body">
									Basic card example without header elements
								</div>
							</div>

							<div class="card">
								<div class="card-header d-flex flex-wrap">
									<h6 class="mb-0">Card title</h6>
									<span class="ms-2">With inline subtitle</span>
								</div>
								
								<div class="card-body">
									Card header with title and inline subtitle
								</div>
							</div>

							<div class="card">
								<div class="card-header">
									<h6 class="mb-0">Card title</h6>
									With block subtitle
								</div>
								
								<div class="card-body">
									Card header with title and block subtitle
								</div>
							</div>
						</div>

						<div class="col-lg-6">
							<div class="card">
								<div class="card-header d-flex flex-wrap">
									<h6 class="mb-0">Card title</h6>
									<div class="d-inline-flex ms-auto">
										<a class="text-body" data-card-action="collapse">
											<i class="ph-caret-down"></i>
										</a>
										<a class="text-body mx-2" data-card-action="reload">
											<i class="ph-arrows-clockwise"></i>
										</a>
										<a class="text-body" data-card-action="remove">
											<i class="ph-x"></i>
										</a>
									</div>
								</div>

								<div class="collapse show">
									<div class="card-body">
										Basic card with card controls
									</div>
								</div>
							</div>

							<div class="card">
								<div class="card-header d-flex flex-wrap">
									<h6 class="mb-0">Card title</h6>
									<span class="ms-2">With inline subtitle</span>
									<div class="d-inline-flex ms-auto">
										<a class="text-body" data-card-action="collapse">
											<i class="ph-caret-down"></i>
										</a>
										<a class="text-body mx-2" data-card-action="reload">
											<i class="ph-arrows-clockwise"></i>
										</a>
										<a class="text-body" data-card-action="remove">
											<i class="ph-x"></i>
										</a>
									</div>
			                	</div>

			                	<div class="collapse show">
									<div class="card-body">
										Card with inline header subtitle and card controls
									</div>
								</div>
							</div>

							<div class="card">
								<div class="card-header d-flex flex-wrap">
									<div>
										<h6 class="mb-0">Card title</h6>
										With block subtitle
									</div>
									<div class="d-inline-flex ms-auto">
										<a class="text-body" data-card-action="collapse">
											<i class="ph-caret-down"></i>
										</a>
										<a class="text-body mx-2" data-card-action="reload">
											<i class="ph-arrows-clockwise"></i>
										</a>
										<a class="text-body" data-card-action="remove">
											<i class="ph-x"></i>
										</a>
									</div>
								</div>

								<div class="collapse show">
									<div class="card-body">
										Card with block header subtitle and card controls
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- /card titles and subtitles -->


					<!-- Card titles -->
					<div class="mb-3 mt-2">
						<h6 class="mb-0">Card title options</h6>
						<span class="text-muted">Card heading font options for titles</span>
					</div>

					<div class="row">
						<div class="col-lg-6">
							<div class="card">
								<div class="card-header">
									<h6 class="fw-lighter mb-0">Card title</h6>
								</div>
								
								<div class="card-body">
									Card title with lighter font weight
								</div>
							</div>

							<div class="card">
								<div class="card-header">
									<h6 class="fw-light mb-0">Card title</h6>
								</div>
								
								<div class="card-body">
									Card title with light font weight
								</div>
							</div>

							<div class="card">
								<div class="card-header">
									<h6 class="fw-normal mb-0">Card title</h6>
								</div>
								
								<div class="card-body">
									Card title with regular font weight
								</div>
							</div>

							<div class="card">
								<div class="card-header">
									<h6 class="mb-0">Card title</h6>
								</div>
								
								<div class="card-body">
									Card title with semibold font weight (default)
								</div>
							</div>

							<div class="card">
								<div class="card-header">
									<h6 class="fw-bold mb-0">Card title</h6>
								</div>
								
								<div class="card-body">
									Card title with bold font weight
								</div>
							</div>

							<div class="card">
								<div class="card-header">
									<h6 class="fw-bold mb-0">Card <span class="fw-normal">title</span></h6>
								</div>
								
								<div class="card-body">
									Mixing font weights in card title
								</div>
							</div>

							<div class="card">
								<div class="card-header">
									<h6 class="text-uppercase mb-0">Card title</h6>
								</div>
								
								<div class="card-body">
									Card title in uppercase
								</div>
							</div>
						</div>

						<div class="col-lg-6">
							<div class="card">
								<div class="card-header">
									<h6 class="mb-0">Default <span class="text-muted">Muted</span></h6>
								</div>
								
								<div class="card-body">
									Mixing default color with muted color
								</div>
							</div>

							<div class="card">
								<div class="card-header">
									<h6 class="mb-0">Default <span class="text-primary">Primary</span></h6>
								</div>
								
								<div class="card-body">
									Mixing default color with primary color
								</div>
							</div>

							<div class="card">
								<div class="card-header">
									<h6 class="mb-0">Default <span class="text-danger">Danger</span></h6>
								</div>
								
								<div class="card-body">
									Mixing default color with danger color
								</div>
							</div>

							<div class="card">
								<div class="card-header">
									<h6 class="mb-0">Default <span class="text-success">Success</span></h6>
								</div>
								
								<div class="card-body">
									Mixing default color with success color
								</div>
							</div>

							<div class="card">
								<div class="card-header">
									<h6 class="mb-0">Default <span class="text-warning">Warning</span></h6>
								</div>
								
								<div class="card-body">
									Mixing default color with warning color
								</div>
							</div>

							<div class="card">
								<div class="card-header">
									<h6 class="mb-0">Default <span class="text-info">Info</span></h6>
								</div>
								
								<div class="card-body">
									Mixing default color with info color
								</div>
							</div>

							<div class="card">
								<div class="card-header">
									<h6 class="mb-0">Default <span class="text-teal">Teal</span></h6>
								</div>
								
								<div class="card-body">
									Mixing default color with custom color
								</div>
							</div>
						</div>
					</div>
					<!-- /card titles -->


					<!-- Card title sizes -->
					<div class="mb-3 mt-2">
						<h6 class="mb-0">Card title sizing</h6>
						<span class="text-muted">Card title font colors using standard html headings</span>
					</div>

					<div class="row">
						<div class="col-lg-6">
							<div class="card">
								<div class="card-header">
									<h1 class="mb-0">H1 title</h1>
								</div>
								
								<div class="card-body">
									H1 title heading using <code>&lt;h1 class="mb-0"></code> markup
								</div>
							</div>

							<div class="card">
								<div class="card-header">
									<h3 class="mb-0">H3 title</h3>
								</div>
								
								<div class="card-body">
									H3 title heading using <code>&lt;h3 class="mb-0"></code> markup
								</div>
							</div>

							<div class="card">
								<div class="card-header">
									<h5 class="mb-0">H5 title</h5>
								</div>
								
								<div class="card-body">
									H5 title heading using <code>&lt;h5 class="mb-0"></code> markup
								</div>
							</div>
						</div>

						<div class="col-lg-6">
							<div class="card">
								<div class="card-header">
									<h2 class="mb-0">H2 title</h2>
								</div>
								
								<div class="card-body">
									H2 title heading using <code>&lt;h2 class="mb-0"></code> markup
								</div>
							</div>

							<div class="card">
								<div class="card-header">
									<h4 class="mb-0">H4 title</h4>
								</div>
								
								<div class="card-body">
									H4 title heading using <code>&lt;h4 class="mb-0"></code> markup
								</div>
							</div>

							<div class="card">
								<div class="card-header">
									<h6 class="mb-0">H6 title</h6>
								</div>
								
								<div class="card-body">
									H6 title heading using <code>&lt;h6 class="mb-0"></code> markup
								</div>
							</div>
						</div>
					</div>
					<!-- /card title sizes -->


					<!-- Header options -->
					<div class="mb-3 mt-2">
						<h6 class="mb-0">Card header options</h6>
						<span class="text-muted">Background, text and border colors</span>
					</div>

					<div class="row">
						<div class="col-lg-6">
							<div class="card">
								<div class="card-header">
									<h6 class="mb-0">Transparent header</h6>
								</div>

								<div class="card-body">
									Default flat card style using <code>.card</code> class
								</div>
							</div>
						</div>

						<div class="col-lg-6">
							<div class="card">
								<div class="card-header border-bottom-0 pb-0">
									<h6 class="mb-0">Card title</h6>
								</div>
								<div class="card-body">
									Display card header without bottom border
								</div>
							</div>
						</div>
					</div>

					<div class="row">
						<div class="col-lg-6">
							<div class="card">
								<div class="card-header bg-light">
									<h6 class="mb-0">Light header</h6>
								</div>

								<div class="card-body">
									Card with light header color - add <code>.bg-light</code> class to card header container
								</div>
							</div>
						</div>

						<div class="col-lg-6">
							<div class="card">
								<div class="card-header bg-dark border-bottom-0 text-white">
									<h6 class="mb-0">Dark header</h6>
								</div>

								<div class="card-body">
									Card with dark header color - add <code>.bg-dark</code> class to card header container
								</div>
							</div>
						</div>
					</div>

					<div class="row">
						<div class="col-lg-6">
							<div class="card">
								<div class="card-header bg-primary text-white border-bottom-0">
									<h6 class="mb-0">Primary header</h6>
								</div>

								<div class="card-body">
									Card with primary header color - add <code>.bg-primary</code> class to card header container
								</div>
							</div>
						</div>

						<div class="col-lg-6">
							<div class="card">
								<div class="card-header bg-secondary text-white border-bottom-0">
									<h6 class="mb-0">Secondary header</h6>
								</div>

								<div class="card-body">
									Card with secondary header color - add <code>.bg-secondary</code> class to card header container
								</div>
							</div>
						</div>
					</div>

					<div class="row">
						<div class="col-lg-6">
							<div class="card">
								<div class="card-header bg-success text-white border-bottom-0">
									<h6 class="mb-0">Green (success) header</h6>
								</div>

								<div class="card-body">
									Card with green (success context) header - add <code>.bg-success</code> class to card header container
								</div>
							</div>
						</div>

						<div class="col-lg-6">
							<div class="card">
								<div class="card-header bg-warning text-white border-bottom-0">
									<h6 class="mb-0">Orange (warning) header</h6>
								</div>

								<div class="card-body">
									Card with orange (warning context) header - add <code>.bg-warning</code> class to card header container
								</div>
							</div>
						</div>
					</div>

					<div class="row">
						<div class="col-lg-6">
							<div class="card">
								<div class="card-header bg-danger text-white border-bottom-0">
									<h6 class="mb-0">Red (danger) header</h6>
								</div>

								<div class="card-body">
									Card with red (danger context) header - add <code>.bg-danger</code> class to card header container
								</div>
							</div>
						</div>

						<div class="col-lg-6">
							<div class="card">
								<div class="card-header bg-info text-white border-bottom-0">
									<h6 class="mb-0">Blue (info) header</h6>
								</div>

								<div class="card-body">
									Card with blue (info context) header - add <code>.bg-info</code> class to card header container
								</div>
							</div>
						</div>
					</div>

					<div class="row">
						<div class="col-lg-6">
							<div class="card">
								<div class="card-header bg-success bg-opacity-10 text-success">
									<h6 class="mb-0">Custom light color</h6>
								</div>

								<div class="card-body">
									Card header with custom light colors - add <code>.bg-[color].bg-opacity-10</code> class to card header container
								</div>
							</div>
						</div>

						<div class="col-lg-6">
							<div class="card">
								<div class="card-header bg-teal text-white border-bottom-0">
									<h6 class="mb-0">Custom dark color</h6>
								</div>

								<div class="card-body">
									Card header with custom dark colors - add <code>.bg-*</code> class to card header container
								</div>
							</div>
						</div>
					</div>
					<!-- /header options -->


					<!-- Bordered cards title -->
					<div class="mb-3 mt-2">
						<h6 class="mb-0">Bordered cards</h6>
						<span class="text-muted">Available card styles and colors</span>
					</div>

					<div class="row">
						<div class="col-lg-6">
							<div class="card border shadow-sm">
								<div class="card-header">
									<h6 class="mb-0">Transparent header</h6>
								</div>

								<div class="card-body">
									Default flat card style using <code>.card</code> class
								</div>
							</div>
						</div>

						<div class="col-lg-6">
							<div class="card border shadow-sm">
								<div class="card-header border-bottom-0 pb-0">
									<h6 class="mb-0">Card title</h6>
								</div>
								<div class="card-body">
									Display card header without bottom border
								</div>
							</div>
						</div>
					</div>

					<div class="row">
						<div class="col-lg-6">
							<div class="card border shadow-sm">
								<div class="card-header bg-light">
									<h6 class="mb-0">Light header</h6>
								</div>

								<div class="card-body">
									Card with light header color - add <code>.bg-light</code> class to card header container
								</div>
							</div>
						</div>

						<div class="col-lg-6">
							<div class="card border border-dark shadow-sm">
								<div class="card-header bg-dark text-white border-bottom-0">
									<h6 class="mb-0">Dark header</h6>
								</div>

								<div class="card-body">
									Card with dark header color - add <code>.bg-dark</code> class to card header container
								</div>
							</div>
						</div>
					</div>

					<div class="row">
						<div class="col-lg-6">
							<div class="card border border-primary shadow-sm">
								<div class="card-header bg-primary text-white border-bottom-0">
									<h6 class="mb-0">Primary header</h6>
								</div>

								<div class="card-body">
									Card with primary header color - add <code>.bg-primary</code> class to card header container
								</div>
							</div>
						</div>

						<div class="col-lg-6">
							<div class="card border border-secondary shadow-sm">
								<div class="card-header bg-secondary text-white border-bottom-0">
									<h6 class="mb-0">Secondary header</h6>
								</div>

								<div class="card-body">
									Card with secondary header color - add <code>.bg-secondary</code> class to card header container
								</div>
							</div>
						</div>
					</div>

					<div class="row">
						<div class="col-lg-6">
							<div class="card border border-success shadow-sm">
								<div class="card-header bg-success text-white border-bottom-0">
									<h6 class="mb-0">Green (success) header</h6>
								</div>

								<div class="card-body">
									Card with green (success context) header - add <code>.bg-success</code> class to card header container
								</div>
							</div>
						</div>

						<div class="col-lg-6">
							<div class="card border border-warning shadow-sm">
								<div class="card-header bg-warning text-white border-bottom-0">
									<h6 class="mb-0">Orange (warning) header</h6>
								</div>

								<div class="card-body">
									Card with orange (warning context) header - add <code>.bg-warning</code> class to card header container
								</div>
							</div>
						</div>
					</div>

					<div class="row">
						<div class="col-lg-6">
							<div class="card border border-danger shadow-sm">
								<div class="card-header bg-danger text-white border-bottom-0">
									<h6 class="mb-0">Red (danger) header</h6>
								</div>

								<div class="card-body">
									Card with red (danger context) header - add <code>.bg-danger</code> class to card header container
								</div>
							</div>
						</div>

						<div class="col-lg-6">
							<div class="card border border-info shadow-sm">
								<div class="card-header bg-info text-white border-bottom-0">
									<h6 class="mb-0">Blue (info) header</h6>
								</div>

								<div class="card-body">
									Card with blue (info context) header - add <code>.bg-info</code> class to card header container
								</div>
							</div>
						</div>
					</div>

					<div class="row">
						<div class="col-lg-6">
							<div class="card border border-success shadow-sm">
								<div class="card-header bg-success bg-opacity-10 text-success border-success">
									<h6 class="mb-0">Custom light color</h6>
								</div>

								<div class="card-body">
									Card header with custom light colors - add <code>.bg-[color]-100</code> class to card header container
								</div>
							</div>
						</div>

						<div class="col-lg-6">
							<div class="card border border-teal shadow-sm">
								<div class="card-header bg-teal text-white border-bottom-0">
									<h6 class="mb-0">Custom dark color</h6>
								</div>

								<div class="card-body">
									Card header with custom dark colors - add <code>.bg-*</code> class to card header container
								</div>
							</div>
						</div>
					</div>
					<!-- /bordered cards -->


					<!-- Card borders -->
					<div class="mb-3 mt-2">
						<h6 class="mb-0">Card borders</h6>
						<span class="text-muted">Custom 4 side borders for content cards</span>
					</div>

					<div class="row">
						<div class="col-lg-6">
							<div class="card border-top border-top-success rounded-top-0">
								<div class="card-header">
									<h6 class="mb-0">Top custom border</h6>
								</div>
								
								<div class="card-body">
									Custom color of the <strong>top</strong> border. Use optional <code>.rounded-top-0</code> class to remove rounded top corners
								</div>
							</div>

							<div class="card border-start border-start-danger rounded-start-0">
								<div class="card-header">
									<h6 class="mb-0">Left custom border</h6>
								</div>
								
								<div class="card-body">
									Custom color of the <strong>left</strong> border. Use optional <code>.rounded-start-0</code> class to remove rounded left corners
								</div>
							</div>

							<div class="card border-top border-top-info border-bottom border-bottom-info rounded-0">
								<div class="card-header">
									<h6 class="mb-0">Top and bottom borders</h6>
								</div>
								
								<div class="card-body">
									Custom color of the <strong>top</strong> and <strong>bottom</strong> borders. Use optional <code>.rounded-0</code> class to remove rounded corners
								</div>
							</div>
						</div>

						<div class="col-lg-6">
							<div class="card border-bottom border-bottom-success rounded-bottom-0">
								<div class="card-header">
									<h6 class="mb-0">Bottom custom border</h6>
								</div>
								
								<div class="card-body">
									Custom color of the <strong>bottom</strong> border. Use optional <code>.rounded-bottom-0</code> class to remove rounded bottom corners
								</div>
							</div>

							<div class="card border-end border-end-danger rounded-end-0">
								<div class="card-header">
									<h6 class="mb-0">Right custom border</h6>
								</div>
								
								<div class="card-body">
									Custom color of the <strong>right</strong> border. Use optional <code>.rounded-end-0</code> class to remove rounded right corners
								</div>
							</div>

							<div class="card border-start border-start-info border-end border-end-info rounded-0">
								<div class="card-header">
									<h6 class="mb-0">Left and right borders</h6>
								</div>
								
								<div class="card-body">
									Custom color of the <strong>left</strong> and <strong>right</strong> borders. Use optional <code>.rounded-0</code> class to remove rounded corners
								</div>
							</div>
						</div>
					</div>
					<!-- /card borders -->


					<!-- Bordered cards border width -->
					<div class="mb-3 mt-2">
						<h6 class="mb-0">Border sizing</h6>
						<span class="text-muted">Available in 1 default and 2 optional sizes</span>
					</div>

					<div class="row">
						<div class="col-lg-6">
							<div class="card border-top border-top-warning border-bottom border-bottom-warning rounded-0">
								<div class="card-header">
									<h6 class="mb-0">Basic size</h6>
								</div>
								
								<div class="card-body">
									Basic border size of the element, defined in core variables. Any card border can be highlighted with proper class name
								</div>
							</div>

							<div class="card border-top border-top-width-2 border-top-secondary border-bottom border-bottom-width-2 border-bottom-secondary rounded-0">
								<div class="card-header">
									<h6 class="mb-0">Double size</h6>
								</div>
								
								<div class="card-body">
									Double border size using <code>.border-*-width-2</code> class, where "*" is border direction. Use <code>.border-width-2</code> class to make all borders thicker
								</div>
							</div>

							<div class="card border-top border-top-width-3 border-top-success border-bottom border-bottom-width-3 border-bottom-success rounded-0">
								<div class="card-header">
									<h6 class="mb-0">Tripple size</h6>
								</div>
								
								<div class="card-body">
									Tripple border size using <code>.border-*-width-3</code> class, where "*" is border direction. Use <code>.border-width-3</code> class to make all borders thicker
								</div>
							</div>
						</div>

						<div class="col-lg-6">
							<div class="card border-start border-start-primary border-end border-end-primary rounded-0">
								<div class="card-header">
									<h6 class="mb-0">Basic size</h6>
								</div>
								
								<div class="card-body">
									Basic border size of the element, defined in core variables. Any card border can be highlighted with proper class name
								</div>
							</div>

							<div class="card border-start border-start-width-2 border-start-indigo border-end border-end-width-2 border-end-indigo rounded-0">
								<div class="card-header">
									<h6 class="mb-0">Double size</h6>
								</div>
								
								<div class="card-body">
									Double border size using <code>.border-*-width-2</code> class, where "*" is border direction. Use <code>.border-width-2</code> class to make all borders thicker
								</div>
							</div>

							<div class="card border-start border-start-width-3 border-start-pink border-end border-end-width-3 border-end-pink rounded-0">
								<div class="card-header">
									<h6 class="mb-0">Tripple size</h6>
								</div>
								
								<div class="card-body">
									Tripple border size using <code>.border-*-width-3</code> class, where "*" is border direction. Use <code>.border-width-3</code> class to make all borders thicker
								</div>
							</div>
						</div>
					</div>
					<!-- /bordered cards border width -->


					<!-- Card backgrounds -->
					<div class="mb-3 mt-2">
						<h6 class="mb-0">Card backgrounds</h6>
						<span class="text-muted">Optional default and custom background colors</span>
					</div>

					<div class="row">
						<div class="col-lg-6">
							<div class="card bg-light">
								<div class="card-header">
									<h6 class="mb-0">Light background</h6>
								</div>

								<div class="card-body">
									Card with light background color using <code>.bg-light</code> class
								</div>
							</div>

							<div class="card bg-primary text-white" data-color-theme="dark">
								<div class="card-header border-white border-opacity-20">
									<h6 class="mb-0">Primary background</h6>
								</div>

								<div class="card-body">
									Card with primary background color using <code>.bg-primary</code> class
								</div>
							</div>

							<div class="card bg-danger text-white" data-color-theme="dark">
								<div class="card-header border-white border-opacity-20">
									<h6 class="mb-0">Red (danger) background</h6>
								</div>

								<div class="card-body">
									Card with red (danger) background color using <code>.bg-danger</code> class
								</div>
							</div>

							<div class="card bg-success text-white" data-color-theme="dark">
								<div class="card-header border-white border-opacity-20">
									<h6 class="mb-0">Green (success) background</h6>
								</div>

								<div class="card-body">
									Card with green (success) background color using <code>.bg-success</code> class
								</div>
							</div>

							<div class="card bg-success bg-opacity-10 border-success">
								<div class="card-header border-success">
									<h6 class="mb-0">Alpha backgrounds</h6>
								</div>

								<div class="card-body">
									Card with custom light background color using <code>.bg-[color].bg-opacity-10</code> class
								</div>
							</div>
						</div>

						<div class="col-lg-6">
							<div class="card bg-dark text-white" data-color-theme="dark">
								<div class="card-header border-white border-opacity-20">
									<h6 class="mb-0">Dark background</h6>
								</div>

								<div class="card-body">
									Card with dark background color using <code>.bg-dark</code> class
								</div>
							</div>

							<div class="card bg-secondary text-white" data-color-theme="dark">
								<div class="card-header border-white border-opacity-20">
									<h6 class="mb-0">Secondary background</h6>
								</div>

								<div class="card-body">
									Card with secondary background color using <code>.bg-secondary</code> class
								</div>
							</div>

							<div class="card bg-warning text-white" data-color-theme="dark">
								<div class="card-header border-white border-opacity-20">
									<h6 class="mb-0">Orange (warning) background</h6>
								</div>

								<div class="card-body">
									Card with orange (warning) background color using <code>.bg-warning</code> class
								</div>
							</div>

							<div class="card bg-info text-white" data-color-theme="dark">
								<div class="card-header border-white border-opacity-20">
									<h6 class="mb-0">Blue (info) background</h6>
								</div>

								<div class="card-body">
									Card with blue (info) background color using <code>.bg-info</code> class
								</div>
							</div>

							<div class="card bg-purple text-white" data-color-theme="dark">
								<div class="card-header border-white border-opacity-20">
									<h6 class="mb-0">Custom background</h6>
								</div>

								<div class="card-body">
									Card with custom background color using <code>.bg-*</code> classes
								</div>
							</div>
						</div>
					</div>
					<!-- /card backgrounds -->

				</div>
				<!-- /content area -->


				<!-- Footer -->
				@include('layout.footer')
				<!-- /footer -->

			</div>
			<!-- /inner content -->

		</div>
		<!-- /main content -->

	</div>
	<!-- /page content -->


	<!-- Notifications -->
	<div class="offcanvas offcanvas-end" tabindex="-1" id="notifications">
		<div class="offcanvas-header py-0">
			<h5 class="offcanvas-title py-3">Activity</h5>
			<button type="button" class="btn btn-light btn-sm btn-icon border-transparent rounded-pill" data-bs-dismiss="offcanvas">
				<i class="ph-x"></i>
			</button>
		</div>

		<div class="offcanvas-body p-0">
			<div class="bg-light fw-medium py-2 px-3">New notifications</div>
			<div class="p-3">
				<div class="d-flex align-items-start mb-3">
					<a href="#" class="status-indicator-container me-3">
						<img src="{{ URL::asset('assets/base/images/demo/users/face1.jpg'); }}" class="w-40px h-40px rounded-pill" alt="">
						<span class="status-indicator bg-success"></span>
					</a>
					<div class="flex-fill">
						<a href="#" class="fw-semibold">James</a> has completed the task <a href="#">Submit documents</a> from <a href="#">Onboarding</a> list

						<div class="bg-light rounded p-2 my-2">
							<label class="form-check ms-1">
								<input type="checkbox" class="form-check-input" checked disabled>
								<del class="form-check-label">Submit personal documents</del>
							</label>
						</div>

						<div class="fs-sm text-muted mt-1">2 hours ago</div>
					</div>
				</div>

				<div class="d-flex align-items-start mb-3">
					<a href="#" class="status-indicator-container me-3">
						<img src="{{ URL::asset('assets/base/images/demo/users/face3.jpg'); }}" class="w-40px h-40px rounded-pill" alt="">
						<span class="status-indicator bg-warning"></span>
					</a>
					<div class="flex-fill">
						<a href="#" class="fw-semibold">Margo</a> has added 4 users to <span class="fw-semibold">Customer enablement</span> channel

						<div class="d-flex my-2">
							<a href="#" class="status-indicator-container me-1">
								<img src="{{ URL::asset('assets/base/images/demo/users/face10.jpg'); }}" class="w-32px h-32px rounded-pill" alt="">
								<span class="status-indicator bg-danger"></span>
							</a>
							<a href="#" class="status-indicator-container me-1">
								<img src="{{ URL::asset('assets/base/images/demo/users/face11.jpg'); }}" class="w-32px h-32px rounded-pill" alt="">
								<span class="status-indicator bg-success"></span>
							</a>
							<a href="#" class="status-indicator-container me-1">
								<img src="{{ URL::asset('assets/base/images/demo/users/face12.jpg'); }}" class="w-32px h-32px rounded-pill" alt="">
								<span class="status-indicator bg-success"></span>
							</a>
							<a href="#" class="status-indicator-container me-1">
								<img src="{{ URL::asset('assets/base/images/demo/users/face13.jpg'); }}" class="w-32px h-32px rounded-pill" alt="">
								<span class="status-indicator bg-success"></span>
							</a>
							<button type="button" class="btn btn-light btn-icon d-inline-flex align-items-center justify-content-center w-32px h-32px rounded-pill p-0">
								<i class="ph-plus ph-sm"></i>
							</button>
						</div>

						<div class="fs-sm text-muted mt-1">3 hours ago</div>
					</div>
				</div>

				<div class="d-flex align-items-start">
					<div class="me-3">
						<div class="bg-warning bg-opacity-10 text-warning rounded-pill">
							<i class="ph-warning p-2"></i>
						</div>
					</div>
					<div class="flex-1">
						Subscription <a href="#">#466573</a> from 10.12.2021 has been cancelled. Refund case <a href="#">#4492</a> created
						<div class="fs-sm text-muted mt-1">4 hours ago</div>
					</div>
				</div>
			</div>

			<div class="bg-light fw-medium py-2 px-3">Older notifications</div>
			<div class="p-3">
				<div class="d-flex align-items-start mb-3">
					<a href="#" class="status-indicator-container me-3">
						<img src="{{ URL::asset('assets/base/images/demo/users/face25.jpg'); }}" class="w-40px h-40px rounded-pill" alt="">
						<span class="status-indicator bg-success"></span>
					</a>
					<div class="flex-fill">
						<a href="#" class="fw-semibold">Nick</a> requested your feedback and approval in support request <a href="#">#458</a>

						<div class="my-2">
							<a href="#" class="btn btn-success btn-sm me-1">
								<i class="ph-checks ph-sm me-1"></i>
								Approve
							</a>
							<a href="#" class="btn btn-light btn-sm">
								Review
							</a>
						</div>

						<div class="fs-sm text-muted mt-1">3 days ago</div>
					</div>
				</div>

				<div class="d-flex align-items-start mb-3">
					<a href="#" class="status-indicator-container me-3">
						<img src="{{ URL::asset('assets/base/images/demo/users/face24.jpg'); }}" class="w-40px h-40px rounded-pill" alt="">
						<span class="status-indicator bg-grey"></span>
					</a>
					<div class="flex-fill">
						<a href="#" class="fw-semibold">Mike</a> added 1 new file(s) to <a href="#">Product management</a> project

						<div class="bg-light rounded p-2 my-2">
							<div class="d-flex align-items-center">
								<div class="me-2">
									<img src="{{ URL::asset('assets/base/images/icons/pdf.svg'); }}" width="34" height="34" alt="">
								</div>
								<div class="flex-fill">
									new_contract.pdf
									<div class="fs-sm text-muted">112KB</div>
								</div>
								<div class="ms-2">
									<button type="button" class="btn btn-flat-dark text-body btn-icon btn-sm border-transparent rounded-pill">
										<i class="ph-arrow-down"></i>
									</button>
								</div>
							</div>
						</div>

						<div class="fs-sm text-muted mt-1">1 day ago</div>
					</div>
				</div>

				<div class="d-flex align-items-start mb-3">
					<div class="me-3">
						<div class="bg-success bg-opacity-10 text-success rounded-pill">
							<i class="ph-calendar-plus p-2"></i>
						</div>
					</div>
					<div class="flex-fill">
						All hands meeting will take place coming Thursday at 13:45.

						<div class="my-2">
							<a href="#" class="btn btn-primary btn-sm">
								<i class="ph-calendar-plus ph-sm me-1"></i>
								Add to calendar
							</a>
						</div>

						<div class="fs-sm text-muted mt-1">2 days ago</div>
					</div>
				</div>

				<div class="d-flex align-items-start mb-3">
					<a href="#" class="status-indicator-container me-3">
						<img src="{{ URL::asset('assets/base/images/demo/users/face4.jpg'); }}" class="w-40px h-40px rounded-pill" alt="">
						<span class="status-indicator bg-danger"></span>
					</a>
					<div class="flex-fill">
						<a href="#" class="fw-semibold">Christine</a> commented on your community <a href="#">post</a> from 10.12.2021

						<div class="fs-sm text-muted mt-1">2 days ago</div>
					</div>
				</div>

				<div class="d-flex align-items-start mb-3">
					<div class="me-3">
						<div class="bg-primary bg-opacity-10 text-primary rounded-pill">
							<i class="ph-users-four p-2"></i>
						</div>
					</div>
					<div class="flex-fill">
						<span class="fw-semibold">HR department</span> requested you to complete internal survey by Friday

						<div class="fs-sm text-muted mt-1">3 days ago</div>
					</div>
				</div>

				<div class="text-center">
					<div class="spinner-border" role="status">
						<span class="visually-hidden">Loading...</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- /notifications -->


	<!-- Demo config -->
	<div class="offcanvas offcanvas-end" tabindex="-1" id="demo_config">
		<div class="position-absolute top-50 end-100 visible">
			<button type="button" class="btn btn-primary btn-icon translate-middle-y rounded-end-0" data-bs-toggle="offcanvas" data-bs-target="#demo_config">
				<i class="ph-gear"></i>
			</button>
		</div>

		<div class="offcanvas-header border-bottom py-0">
			<h5 class="offcanvas-title py-3">Demo configuration</h5>
			<button type="button" class="btn btn-light btn-sm btn-icon border-transparent rounded-pill" data-bs-dismiss="offcanvas">
				<i class="ph-x"></i>
			</button>
		</div>

		<div class="offcanvas-body">
			<div class="fw-semibold mb-2">Color mode</div>
			<div class="list-group mb-3">
				<label class="list-group-item list-group-item-action form-check border-width-1 rounded mb-2">
					<div class="d-flex flex-fill my-1">
						<div class="form-check-label d-flex me-2">
							<i class="ph-sun ph-lg me-3"></i>
							<div>
								<span class="fw-bold">Light theme</span>
								<div class="fs-sm text-muted">Set light theme or reset to default</div>
							</div>
						</div>
						<input type="radio" class="form-check-input cursor-pointer ms-auto" name="main-theme" value="light" checked>
					</div>
				</label>

				<label class="list-group-item list-group-item-action form-check border-width-1 rounded mb-2">
					<div class="d-flex flex-fill my-1">
						<div class="form-check-label d-flex me-2">
							<i class="ph-moon ph-lg me-3"></i>
							<div>
								<span class="fw-bold">Dark theme</span>
								<div class="fs-sm text-muted">Switch to dark theme</div>
							</div>
						</div>
						<input type="radio" class="form-check-input cursor-pointer ms-auto" name="main-theme" value="dark">
					</div>
				</label>

				<label class="list-group-item list-group-item-action form-check border-width-1 rounded mb-0">
					<div class="d-flex flex-fill my-1">
						<div class="form-check-label d-flex me-2">
							<i class="ph-translate ph-lg me-3"></i>
							<div>
								<span class="fw-bold">Auto theme</span>
								<div class="fs-sm text-muted">Set theme based on system mode</div>
							</div>
						</div>
						<input type="radio" class="form-check-input cursor-pointer ms-auto" name="main-theme" value="auto">
					</div>
				</label>
			</div>

			<div class="fw-semibold mb-2">Direction</div>
			<div class="list-group mb-3">
				<label class="list-group-item list-group-item-action form-check border-width-1 rounded mb-0">
					<div class="d-flex flex-fill my-1">
						<div class="form-check-label d-flex me-2">
							<i class="ph-translate ph-lg me-3"></i>
							<div>
								<span class="fw-bold">RTL direction</span>
								<div class="text-muted">Toggle between LTR and RTL</div>
							</div>
						</div>
						<input type="checkbox" name="layout-direction" value="rtl" class="form-check-input cursor-pointer m-0 ms-auto">
					</div>
				</label>
			</div>

			<div class="fw-semibold mb-2">Layouts</div>
			<div class="row">
				<div class="col-12">
					<a href="index.html" class="d-block mb-3">
						<img src="https://demo.interface.club/limitless/assets/images/layouts/layout_1.png" class="img-fluid img-thumbnail bg-primary bg-opacity-20 border-primary" alt="">
					</a>
				</div>
				<div class="col-12">
					<a href="../../layout_2/full/index.html" class="d-block mb-3">
						<img src="https://demo.interface.club/limitless/assets/images/layouts/layout_2.png" class="img-fluid img-thumbnail" alt="">
					</a>
				</div>
				<div class="col-12">
					<a href="../../layout_3/full/index.html" class="d-block mb-3">
						<img src="https://demo.interface.club/limitless/assets/images/layouts/layout_3.png" class="img-fluid img-thumbnail" alt="">
					</a>
				</div>
				<div class="col-12">
					<a href="../../layout_4/full/index.html" class="d-block mb-3">
						<img src="https://demo.interface.club/limitless/assets/images/layouts/layout_4.png" class="img-fluid img-thumbnail" alt="">
					</a>
				</div>
				<div class="col-12">
					<a href="../../layout_5/full/index.html" class="d-block mb-3">
						<img src="https://demo.interface.club/limitless/assets/images/layouts/layout_5.png" class="img-fluid img-thumbnail" alt="">
					</a>
				</div>
				<div class="col-12">
					<a href="../../layout_6/full/index.html" class="d-block">
						<img src="https://demo.interface.club/limitless/assets/images/layouts/layout_6.png" class="img-fluid img-thumbnail" alt="">
					</a>
				</div>
			</div>
		</div>

		<div class="border-top text-center py-2 px-3">
			<a href="https://themeforest.net/item/limitless-responsive-web-application-kit/13080328?ref=kopyov" class="btn btn-yellow fw-semibold w-100 my-1" target="_blank">
				<i class="ph-shopping-cart me-2"></i>
				Purchase Limitless
			</a>
		</div>
	</div>
	<!-- /demo config -->

</body>
</html>