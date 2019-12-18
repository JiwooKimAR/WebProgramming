	<!-- Search Wrapper Area Start -->
	<div class="search-wrapper">
			<div class="search-close">
					<i class="fa fa-close" aria-hidden="true"></i>
			</div>
			<div class="container">
				<div class="row">
					<form id="search-box-small" method="get" action="#">
						<div class="search-bar">
							<span class="search-type"> <label for="product-name"
								class="label">Product Name</label> <input id="product-name"
								type="text" name="product-name">
							</span>
						</div>
						<div class="search-btn">
							<label for="search-btn-id" class="label"></label>
							<button id="search-btn-id" type="submit" class="search-btn"
								value="BTN"></button>
						</div>
					</form>
				</div>
			</div>
	</div>
	<!-- Search Wrapper Area End -->

    <!-- ##### Main Content Wrapper Start ##### -->
    <div class="main-content-wrapper d-flex clearfix">

        <!-- Mobile Nav (max width 767px)-->
        <div class="mobile-nav">
            <!-- Navbar Brand -->
			<div class="amado-navbar-brand">
				<a href="product_list_seller.jsp"><img src="img/core-img/logo.png" alt=""></a>
			</div>
			<div class="search-area-small">
				<a href="#" class="search-nav"><img
					src="img/core-img/search-icon.png" alt=""></a>
			</div>
			<!-- Navbar Toggler -->
			<div class="amado-navbar-toggler">
                <span></span><span></span><span></span>
            </div>
        </div>

        <!-- Header Area Start -->
        <header class="header-area clearfix">
            <!-- Close Icon -->
            <div class="nav-close">
                <i class="fa fa-close" aria-hidden="true"></i>
            </div>
            <!-- Logo -->
            <div class="logo">
                <a href="product_list_seller.jsp"><img src="img/core-img/logo.png" alt=""></a>
            </div>
            <!-- Amado Nav -->
            <nav class="amado-nav">
                <ul>
                	<% // TODO: [JW]Make class="active" according to current page %>
                    <li><a href="product_list_seller.jsp">Product List</a></li>
                    <li><a href="product_registration.jsp">Product Registration</a></li>
                </ul>
            </nav>
            <!-- Cart Menu -->
            <div style="height: 24rem;"></div>
        </header>
        <!-- Header Area End -->

		<div class="main-wrapper">
			<div class="top-area">
				<div class="top-area-line">
					<div class="search-space"></div>
					<div class="search-area">
						<form id="search-box" method="get">
							<div class="search-bar">
								<span class="search-type">
									<label for="product-name" class="label">Product Name</label>
									<input id="product-name" type="text" name="product-name">
								</span>
							</div>
							<div class="search-btn">
								<label for="search-btn-id" class="label"></label>
								<button id = "search-btn-id" type="submit" class="search-btn" value="BTN">
								</button>
							</div>
						</form>
					</div>
					<div class="search-area-small">
						<a href="#" class="search-nav"><img src="img/core-img/search-icon.png" alt=""></a>
					</div>
					<div class="user-specific">
						<% //TODO: [JW] connect seller mypage %>
						<a href="mypage_seller.jsp"><img src="img/core-img/mypage-icon.png"></a>
					</div>
				</div>
	 		</div>
    <!-- ##### Main Content Wrapper Continue ##### -->
