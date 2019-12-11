	<!-- Search Wrapper Area Start -->
	<div class="search-wrapper">
			<div class="search-close">
					<i class="fa fa-close" aria-hidden="true"></i>
			</div>
			<div class="container">
				<div class="row">
					<form id="search-box-small" method="get" action="#">
						<div class="search-bar">
							<span class="search-type"> <label for="seller-name"
								class="label">Seller Name</label> <input id="seller-name"
								type="text" name="seller-name">
							</span>
						</div>
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
				<a href="index.jsp"><img src="img/core-img/logo.png" alt=""></a>
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
                <a href="index.jsp"><img src="img/core-img/logo.png" alt=""></a>
            </div>
            <!-- Amado Nav -->
            <nav class="amado-nav">
                <ul>
                	<% // TODO: [JW]Make class="active" according to current page %>
                    <li><a href="index.jsp">Home</a></li>
                    <li><a href="product_list_buyer.jsp">Product List</a></li>
                    <li><a href="product_registration.jsp">Product Registration</a></li>
                    <li><a href="product-details.jsp">Product Details</a></li>
                    <li><a href="product-details-auction.jsp">Product Details Auction</a></li>
                </ul>
            </nav>
            <!-- Button Group -->
            <div class="amado-btn-group mt-30 mb-100">
                <a href="#" class="btn amado-btn mb-15">%Discount%</a>
                <a href="#" class="btn amado-btn active">New this week</a>
            </div>
            <!-- Cart Menu -->
            <div class="cart-fav-search mb-100">
                <a href="cart_list.jsp" class="cart-nav"><img src="img/core-img/cart.png" alt=""> Cart <span>(0)</span></a>
                <a href="wish_list.jsp" class="fav-nav"><img src="img/core-img/wish-star.png" alt=""> Wish List </a>
            </div>
            <!-- Social Button -->
            <div class="social-info d-flex justify-content-between">
                <a href="https://www.pinterest.co.kr/"><i class="fa fa-pinterest" aria-hidden="true"></i></a>
                <a href="https://www.instagram.com/?hl=ko"><i class="fa fa-instagram" aria-hidden="true"></i></a>
                <a href="https://ko-kr.facebook.com/"><i class="fa fa-facebook" aria-hidden="true"></i></a>
                <a href="https://twitter.com/?lang=ko"><i class="fa fa-twitter" aria-hidden="true"></i></a>
            </div>
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
									<label for="seller-name" class="label">Seller Name</label>
									<input id="seller-name" type="text" name="seller-name">
								</span>
							</div>
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
						<a href="mypage.jsp"><img src="img/core-img/mypage-icon.png"></a>
					</div>
				</div>
	 		</div>
    <!-- ##### Main Content Wrapper Continue ##### -->
