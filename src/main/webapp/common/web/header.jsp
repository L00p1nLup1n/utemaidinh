<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url value="/" var="URL"></c:url>


<!-- BEGIN TOP BAR -->
<div class="pre-header">
	<div class="container">
		<div class="row">
			<!-- BEGIN TOP BAR LEFT PART -->
			<div class="col-md-6 col-sm-6 additional-shop-info">
				<ul class="list-unstyled list-inline">
					<li><i class="fa fa-phone"></i><span>+113</span></li>
					<!-- BEGIN CURRENCIES -->
					<li class="shop-currencies"><a href="javascript:void(0);">€</a>
						<a href="javascript:void(0);">£</a> <a href="javascript:void(0);"
						class="current">$</a></li>
					<!-- END CURRENCIES -->
					<!-- BEGIN LANGS -->
					<li class="langs-block"><a href="javascript:void(0);"
						class="current">English </a>
						<div class="langs-block-others-wrapper">
							<div class="langs-block-others">
								<a href="javascript:void(0);">French</a> <a
									href="javascript:void(0);">Germany</a> <a
									href="javascript:void(0);">Turkish</a>
							</div>
						</div></li>
					<!-- END LANGS -->
				</ul>
			</div>
			<!-- END TOP BAR LEFT PART -->
			<!-- BEGIN TOP BAR MENU -->
			<div class="col-md-6 col-sm-6 additional-nav">
				<ul class="list-unstyled list-inline pull-right">

					<c:choose>
						<c:when test="${sessionScope.account == null }">
							<li><a href="${pageContext.request.contextPath }/login">Login
							</a></li>
							<li><a href="${pageContext.request.contextPath }/register">Register
							</a></li>
						</c:when>
						<c:otherwise>
							<li><a
								href="${pageContext.request.contextPath }/member/myaccount">${sessionScope.account.fullname }</a></li>
							<li><a href="${pageContext.request.contextPath }/logout">Logout
							</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
			<!-- END TOP BAR MENU -->
		</div>
	</div>
</div>
<!-- END TOP BAR -->
<!-- BEGIN HEADER -->
<div class="header">
	<div class="container">
		<a class="site-logo"
			href="${pageContext.request.contextPath}/views/admin/home.jsp"><img
			src="${URL}/assets/frontend/layout/img/logos/iu_store_logo.png"
			alt="IU SHOP UI"></a> <a href="javascript:void(0);"></a> <a
			href="javascript:void(0);" class="mobi-toggler"><i
			class="fa fa-bars"></i></a>

		<!-- BEGIN CART -->
		<div class="top-cart-block">
			<div class="top-cart-info">
				<a href="javascript:void(0);" class="top-cart-info-count">3
					items</a> <a href="javascript:void(0);" class="top-cart-info-value">$1260</a>
			</div>
			<i class="fa fa-shopping-cart"></i>

			<div class="top-cart-content-wrapper">
				<div class="top-cart-content">
					<ul class="scroller" style="height: 250px;">
						<li><a href="shop-item.html"><img
								src="${URL}/assets/frontend/pages/img/cart-img.jpg"
								alt="Rolex Classic Watch" width="37" height="34"></a> <span
							class="cart-content-count">x 1</span> <strong><a
								href="shop-item.html">Rolex Classic Watch</a></strong> <em>$1230</em> <a
							href="javascript:void(0);" class="del-goods">&nbsp;</a></li>
						<li><a href="shop-item.html"><img
								src="${URL}/assets/frontend/pages/img/cart-img.jpg"
								alt="Rolex Classic Watch" width="37" height="34"></a> <span
							class="cart-content-count">x 1</span> <strong><a
								href="shop-item.html">Rolex Classic Watch</a></strong> <em>$1230</em> <a
							href="javascript:void(0);" class="del-goods">&nbsp;</a></li>
						<li><a href="shop-item.html"><img
								src="${URL}/assets/frontend/pages/img/cart-img.jpg"
								alt="Rolex Classic Watch" width="37" height="34"></a> <span
							class="cart-content-count">x 1</span> <strong><a
								href="shop-item.html">Rolex Classic Watch</a></strong> <em>$1230</em> <a
							href="javascript:void(0);" class="del-goods">&nbsp;</a></li>
						<li><a href="shop-item.html"><img
								src="${URL}/assets/frontend/pages/img/cart-img.jpg"
								alt="Rolex Classic Watch" width="37" height="34"></a> <span
							class="cart-content-count">x 1</span> <strong><a
								href="shop-item.html">Rolex Classic Watch</a></strong> <em>$1230</em> <a
							href="javascript:void(0);" class="del-goods">&nbsp;</a></li>
						<li><a href="shop-item.html"><img
								src="${URL}/assets/frontend/pages/img/cart-img.jpg"
								alt="Rolex Classic Watch" width="37" height="34"></a> <span
							class="cart-content-count">x 1</span> <strong><a
								href="shop-item.html">Rolex Classic Watch</a></strong> <em>$1230</em> <a
							href="javascript:void(0);" class="del-goods">&nbsp;</a></li>
						<li><a href="shop-item.html"><img
								src="${URL}/assets/frontend/pages/img/cart-img.jpg"
								alt="Rolex Classic Watch" width="37" height="34"></a> <span
							class="cart-content-count">x 1</span> <strong><a
								href="shop-item.html">Rolex Classic Watch</a></strong> <em>$1230</em> <a
							href="javascript:void(0);" class="del-goods">&nbsp;</a></li>
						<li><a href="shop-item.html"><img
								src="${URL}/assets/frontend/pages/img/cart-img.jpg"
								alt="Rolex Classic Watch" width="37" height="34"></a> <span
							class="cart-content-count">x 1</span> <strong><a
								href="shop-item.html">Rolex Classic Watch</a></strong> <em>$1230</em> <a
							href="javascript:void(0);" class="del-goods">&nbsp;</a></li>
						<li><a href="shop-item.html"><img
								src="${URL}/assets/frontend/pages/img/cart-img.jpg"
								alt="Rolex Classic Watch" width="37" height="34"></a> <span
							class="cart-content-count">x 1</span> <strong><a
								href="shop-item.html">Rolex Classic Watch</a></strong> <em>$1230</em> <a
							href="javascript:void(0);" class="del-goods">&nbsp;</a></li>
					</ul>
					<div class="text-right">
						<a href="shop-shopping-cart.html" class="btn btn-default">View
							Cart</a> <a
							href="${pageContext.request.contextPath}/views/Checkout.jsp"
							class="btn btn-primary">Checkout</a>
					</div>
				</div>
			</div>
		</div>
		<!--END CART -->

		<!-- BEGIN NAVIGATION -->
		<div class="header-navigation">
			<ul>
				<li><a> Home </a></li>
				<li><a> Suspensions </a></li>
				<li><a> Filters </a></li>
				<li><a> Spark plugs </a></li>
				<li><a> Tires </a></li>
				<li><a> Brake pads </a></li>
				<li><a> Services </a></li>

				<!-- BEGIN TOP SEARCH -->
				<li class="menu-search"><span class="sep"></span> <i
					class="fa fa-search search-btn"></i>
					<div class="search-box">
						<form action="#">
							<div class="input-group">
								<input type="text" placeholder="Search" class="form-control">
								<span class="input-group-btn">
									<button class="btn btn-primary" type="submit">Search</button>
								</span>
							</div>
						</form>
					</div></li>
				<!-- END TOP SEARCH -->
			</ul>
		</div>
		<!-- END NAVIGATION -->
	</div>
</div>
<!-- Header END -->