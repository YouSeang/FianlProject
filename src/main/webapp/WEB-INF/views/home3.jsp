<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>



<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Tariqul Islam">

    <!-- Template Title
    ==================================================================-->
    <title>HelpPlus</title>

    <!-- Favicon Icon
    ==================================================-->
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/images/components/favicon.ico">

    <!-- Style Libraries
    ==================================================================-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/fontawesome/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font/flaticon.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.carousel.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/nice-select.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/animate.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/magnific-popup.css">

    <!-- Style css
    ==================================================================== -->
    <link rel="stylesheet" href="css/style.css">

    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>
    <!-- Preloader -->
    <div id="preloader">
        <div class="preloader">
            <span></span>
            <span></span>
        </div>
    </div>
    <!-- Header Start -->
    <header class="hearer header-2">
        <!-- Header Top End -->
        <div class="offcanvas offcanvas-top bg-info" id="offcanvas-search" data-bs-scroll="true">
            <div class="container d-flex flex-row py-5">
                <form class="search-form w-100">
                    <input id="search-form" type="text" class="form-control" placeholder="Type keyword and hit enter">
                </form>
                <button type="button" class="btn-close icon-xs bg-light rounded-5" data-bs-dismiss="offcanvas"
                    aria-label="Close"></button>
            </div>
        </div>
        <nav class="navbar navbar-expand-lg">
            <div class="container px-lg-0">
                <a class="navbar-brand" href="./index.html"><img src="${pageContext.request.contextPath}/resources/images/components/logo.png" alt="Logo"></a>
                <button class="navbar-toggler offcanvas-nav-btn" type="button">
                    <i class="fa fa-bars"></i>
                </button>
                <div class="offcanvas offcanvas-start offcanvas-nav">
                    <div class="offcanvas-header">
                        <a href="./index.html" class="text-inverse"><img src="${pageContext.request.contextPath}/resources/images/components/logo.png"
                                alt="Logo"></a>
                        <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
                    </div>
                    <div class="offcanvas-body pt-0 align-items-center">
                        <ul class="navbar-nav mx-auto align-items-lg-center">
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
                                    aria-expanded="false">Home</a>
                                <ul class="dropdown-menu">
                                    <li><a class="dropdown-item" href="./index.html">Home 1</a></li>
                                    <li><a class="dropdown-item" href="./index-2.html">Home 2</a></li>
                                    <li><a class="dropdown-item" href="./index-3.html">Home 3</a></li>
                                    <li><a class="dropdown-item" href="./index-4.html">Home 4
                                            <span class="badge text-bg-success ms-2">New</span>
                                        </a></li>
                                </ul>
                            </li>
                            <li class="nav-item"><a href="./about.html" class="nav-link">About</a></li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
                                    aria-expanded="false">Pages</a>
                                <ul class="dropdown-menu">
                                    <li><a class="dropdown-item" href="./about.html">About Us</a></li>
                                    <li class="dropdown-submenu dropend">
                                        <a class="dropdown-item dropdown-toggle" href="./volunteer.html">Volunteer</a>
                                        <ul class="dropdown-menu">
                                            <li class="dropdown-header">Volunteer </li>
                                            <li><a class="dropdown-item" href="./volunteer.html">Volunteer</a></li>
                                            <li><a class="dropdown-item" href="./volunteer-single.html">Volunteer
                                                    Details</a></li>
                                        </ul>
                                    </li>
                        
                                    <li class="dropdown-submenu dropend">
                                        <a class="dropdown-item dropdown-toggle" href="#">Gallery</a>
                                        <ul class="dropdown-menu">
                                            <li class="dropdown-header">Gallery </li>
                                            <li><a class="dropdown-item" href="./gallery.html">Gallery 1</a></li>
                                            <li><a class="dropdown-item" href="./gallery-2.html">Gallery 2</a></li>
                                        </ul>
                                    </li>
                                    <li class="dropdown-submenu dropend">
                                        <a class="dropdown-item dropdown-toggle" href="#">Event</a>
                                        <ul class="dropdown-menu">
                                            <li class="dropdown-header">Event </li>
                                            <li><a class="dropdown-item" href="./event.html">Event</a></li>
                                            <li><a class="dropdown-item" href="./single-event.html">Event Details</a></li>
                                        </ul>
                                    </li>
                                    <li><a href="./testimonial.html" class="dropdown-item">Testimonial</a></li>
                                    <li><a href="./donate.html" class="dropdown-item">Donation</a></li>
                                    <li><a href="./faq.html" class="dropdown-item">FAQ</a></li>
                                    <li class="dropdown-submenu dropend">
                                        <a class="dropdown-item dropdown-toggle" href="#">Authentication</a>
                                        <ul class="dropdown-menu">
                                            <li class="dropdown-header">Account</li>
                                            <li>
                                                <a class="dropdown-item" href="./signin.html">Sign In</a>
                                            </li>
                                            <li>
                                                <a class="dropdown-item" href="./signup.html">Sign Up</a>
                                            </li>
                                        </ul>
                                    </li>
                                    <li><a href="./error.html" class="dropdown-item">404 Error</a></li>
                                </ul>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
                                    aria-expanded="false">Causes</a>
                                <ul class="dropdown-menu">
                                    <li><a class="dropdown-item" href="./causes.html">Causes</a></li>
                                    <li><a class="dropdown-item" href="./single-cause.html">Single Cause</a></li>
                                </ul>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
                                    aria-expanded="false">Shop</a>
                                <ul class="dropdown-menu">
                                    <li><a class="dropdown-item" href="./shop.html">Shop</a></li>
                                    <li><a class="dropdown-item" href="./single-product.html">Single Product</a></li>
                                    <li><a class="dropdown-item" href="./cart.html">Cart</a></li>
                                    <li><a class="dropdown-item" href="./checkout.html">Checkout</a></li>
                                </ul>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
                                    aria-expanded="false">Blog</a>
                                <ul class="dropdown-menu">
                                    <li><a class="dropdown-item" href="./blog.html">Blog</a></li>
                                    <li><a class="dropdown-item" href="./blog-sidebar.html">Blog with Sidebar</a></li>
                                    <li><a class="dropdown-item" href="./single-post.html">Single Post</a></li>
                                </ul>
                            </li>
                            <li class="nav-item"><a href="./contact.html" class="nav-link">Contact</a></li>
                        </ul>
                        <div class="mt-3 mt-lg-0 d-flex align-items-center header-actions justify-content-between">
                            <a class="text-reset icon" href="#" data-bs-toggle="offcanvas"
                                data-bs-target="#offcanvas-search"><i class="fa fa-search"></i></a>
                            <a href="./cart.html" class="text-reset icon position-relative me-2"><i
                                    class="fa fa-shopping-cart"></i> <span class="cart-num">2</span></a>
                            <a href="./donate.html" class="custom-btn">Donate Us</a>
                        </div>
                    </div>
                </div>
            </div>
        </nav>
    </header>
    <!-- Header End -->

    <!-- Banner Area Start -->
    <section class="banner-area">
        <div class="banner-2 owl-carousel">
            <div class="single-banner" style="background-image: url('${pageContext.request.contextPath}/resources/images/banner/cta-bg.jpg')">
                <div class="container">
                    <div class="banner-info">
                        <h1 class="banner-title text-white">Expand your <span>Helping</span> Hand</h1>
                        <p>We all want to make better Planet.</p>
                        <div class="banner-btn">
                            <a href="#" class="custom-btn">Get Started</a>
                            <a href="#" class="custom-btn unfill">Donate Now</a>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Single Banner End -->
            <div class="single-banner" style="background-image: url('${pageContext.request.contextPath}/resources/images/banner/banner5.jpg')">
                <div class="container">
                    <div class="banner-info">
                        <h1 class="banner-title text-white">Child future <span>Goal</span> Shaping </h1>
                        <p>We all want to make better Planet.</p>
                        <div class="banner-btn">
                            <a href="#" class="custom-btn">Get Started</a>
                            <a href="#" class="custom-btn unfill">Donate Now</a>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Single Banner End -->
            <div class="single-banner" style="background-image: url('${pageContext.request.contextPath}/resources/images/banner/banner4.jpg')">
                <div class="container">
                    <div class="banner-info">
                        <h1 class="banner-title text-white">We are <span>Ready</span> for the Future</h1>
                        <p>We all want to make better Planet.</p>
                        <div class="banner-btn">
                            <a href="#" class="custom-btn">Get Started</a>
                            <a href="#" class="custom-btn unfill">Donate Now</a>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Single Banner End -->
        </div>
    </section>
    <!-- Banner Area End -->

    <!-- Mission Area Start -->
    <section class="inspiration-area section-padding">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-intro">
                        <p>We are spreading all most all over the world soon. voluptas ut molestiae tempora nisi
                            ratione,
                            ipsa, dignissimos reprehenderit voluptatem.</p>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-4 col-sm-4">
                    <div class="single-inspiration">
                        <span><img src="images/components/mis1.png" alt=""></span>
                        <h3>Become A Volunteer</h3>
                        <p> Numquam maiores perferendis adipisci ipsum assumenda laboriosam, mollitia ipsa fuga, sed
                            consectetur, similique aliquam.</p>
                        <a href="#">Read more <i class="fa fa-long-arrow-right"></i></a>
                    </div>
                </div>
                <!-- Single Mission End -->
                <div class="col-lg-4 col-sm-4">
                    <div class="single-inspiration">
                        <span><img src="images/components/mis2.png" alt=""></span>
                        <h3>Give us Inspiration</h3>
                        <p> Numquam maiores perferendis adipisci ipsum assumenda laboriosam, mollitia ipsa fuga, sed
                            consectetur, similique aliquam.</p>
                        <a href="#">Read more <i class="fa fa-long-arrow-right"></i></a>
                    </div>
                </div>
                <!-- Single Mission End -->
                <div class="col-lg-4 col-sm-4">
                    <div class="single-inspiration">
                        <span><img src="images/components/mis3.png" alt=""></span>
                        <h3>Call for Donation</h3>
                        <p> Numquam maiores perferendis adipisci ipsum assumenda laboriosam, mollitia ipsa fuga, sed
                            consectetur, similique aliquam.</p>
                        <a href="#">Read more <i class="fa fa-long-arrow-right"></i></a>
                    </div>
                </div>
                <!-- Single Mission End -->
            </div>
        </div>
    </section>
    <!-- Mission Area End -->

    <!-- Feature Cause Area Start -->
    <div class="feature-cause-area section-padding">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-sm-6">
                    <div class="f-cause-txt">
                        <h2 class="section-title">Crisis of <span>Myanmar</span></h2>
                        <p> Adipisicing elit. Itaque debitis modi doloremque love rem sed asperiores suscipit, ullam
                            minima
                            sunt.
                            Maxime unde tenetur consequatur dolores illum id quos repudiandae. excepturi
                            our
                            placeat, assumenda eveniet, provident voluptatem magni sint voluptates
                            sit.</p>
                        <a href="#" class="custom-btn">Read More <i class="fa fa-long-arrow-right"></i></a>
                    </div>
                </div>
                <div class="col-lg-6 col-sm-6">
                    <div class="f-cause-wrap owl-carousel">
                        <div class="f-cause-img">
                            <a href="#"><img class="img-rounded" src="${pageContext.request.contextPath}/resources/images/causes/cs4.jpg" alt=""></a>
                        </div>
                        <div class="f-cause-img">
                            <a href="#"><img class="img-rounded" src="${pageContext.request.contextPath}/resources/images/causes/cs5.jpg" alt=""></a>
                        </div>
                        <div class="f-cause-img">
                            <a href="#"><img class="img-rounded" src="${pageContext.request.contextPath}/resources/images/causes/cs6.jpg" alt=""></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Feature Cause Area End -->

    <!-- Our Project Area Start -->
    <section class="project-area section-padding">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-intro">
                        <h2 class="section-title">Our <span class="color">projects</span></h2>
                        <p>The cause is very clear is to help the helpless. assumenda delectus quaerat incidunt. Saepe,
                            sed
                            optio eum.</p>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-4 col-sm-4">
                    <div class="single-project rounded-2 shadow">
                        <figure class="project-thumb">
                            <img src="${pageContext.request.contextPath}/resources/images/causes/cause1.jpg" alt="">
                        </figure>
                        <div class="project-info p-lg-4 p-3">
                            <h3><a href="#">World Health, Care Senior Citizen Project.</a></h3>
                            <p> We want to maxime aliquid eveniet et vitae repellendus ab fugit error. Lorem ipsum dolor
                                sit
                                amet, consectetur adipisicing elit. Velit, quasi.</p>
                            <a href="#" class="custom-btn mt-3">View Project</a>
                        </div>
                    </div>
                    <!-- Single Project End -->
                </div>
                <!-- Single Cause End -->
                <div class="col-lg-4 col-sm-4">
                    <div class="single-project rounded-2 shadow">
                        <figure class="project-thumb">
                            <img src="${pageContext.request.contextPath}/resources/images/causes/cs3.jpg" alt="">
                        </figure>
                        <div class="project-info p-lg-4 p-3">
                            <h3><a href="#">We wish to ensure primary education mandatory.</a></h3>
                            <p> We want to maxime aliquid eveniet et vitae repellendus ab fugit error. Lorem ipsum dolor
                                sit
                                amet, consectetur adipisicing elit. Velit, quasi.</p>
                            <a href="#" class="custom-btn mt-3">View Project</a>
                        </div>

                    </div>
                    <!-- Single Project End -->
                </div>
                <!-- Single Cause End -->
                <div class="col-lg-4 col-sm-4">
                    <div class="single-project rounded-2 shadow">
                        <figure class="project-thumb">
                            <img src="${pageContext.request.contextPath}/resources/images/project/pr1.jpg" alt="">
                        </figure>
                        <div class="project-info p-lg-4 p-3">
                            <h3><a href="#">Africa'n Food Deficiency Project is running.</a></h3>
                            <p> We want to maxime aliquid eveniet et vitae repellendus ab fugit error. Lorem ipsum dolor
                                sit
                                amet, consectetur adipisicing elit. Velit, quasi.</p>
                            <a href="#" class="custom-btn mt-3">View Project</a>
                        </div>
                    </div>
                    <!-- Single Project End -->
                </div>
                <!-- Single Cause End -->
            </div>
        </div>
    </section>
    <!-- Our Project Area End -->

    <!-- Volunteer Area Start -->
    <section class="donation-area section-padding" style="background-image: url('${pageContext.request.contextPath}/resources/images/banner/donation.jpg');"
        data-stellar-background-ratio="0.3">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 offset-lg-2">
                    <div class="volunteer-wrap">
                        <h2 class="section-title">Make a <span class="color">Donnation ?</span></h2>
                        <form action="#" class="volunteer-form row">
                            <div class="col-lg-6 col-sm-6">
                                <div class="form-group">
                                    <label for="name">*Name</label>
                                    <input type="text" id="name">
                                </div>
                                <div class="form-group">
                                    <label for="amount">*Amount(USD)</label>
                                    <input type="text" id="amount">
                                </div>

                            </div>
                            <div class="col-lg-6 col-sm-6">
                                <div class="form-group">
                                    <label for="email">*Email</label>
                                    <input type="text" id="email">
                                </div>
                                <div class="form-group">
                                    <label for="email">Fund Option</label>
                                    <select name="fund">
                                        <option value="Educate Children" selected>Food Campaign</option>
                                        <option value="Educate Children">Educate Children</option>
                                        <option value="Child Camps">Campaign for Old</option>
                                        <option value="Clean Water for Life">Clean Water</option>
                                        <option value="Campaign for Child Poverty">Campaign for Women</option>
                                    </select>
                                </div>

                            </div>
                            <div class="col-lg-12">
                                <div class="form-group">
                                    <label for="comment">*Message</label>
                                    <textarea name="comment" id="comment"></textarea>
                                </div>
                                <button class="custom-btn">Submit</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Volunteer Area End -->

    <!-- Blog Area Start -->
    <section class="blog-area section-padding">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-intro">
                        <h2 class="section-title">Our <span class="color">Journals</span></h2>
                        <p>Our Blogs is to help the helpless. assumenda delectus quaerat incidunt. Saepe, sed optio eum.
                        </p>
                    </div>
                </div>
            </div>
            <div class="row g-4">
                <div class="col-lg-6">
                    <div class="list-entry d-sm-flex bg-light rounded-3 border">
                        <a href="single-post.html" class="entry-media bg-cover"
                            style="background-image: url('${pageContext.request.contextPath}/resources/images/blog/blog-1.jpg');">
                        </a>
                        <div class="entry-content p-lg-4 p-3">
                            <h3 class="entry-title mb-2"><a href="single-blog.html" class="text-reset">Togather we all
                                    want to remove illiteracy.
                                </a></h3>
                            <div class="entry-meta mb-3">
                                <span><a href="#"><i class="fa-regular fa-user"></i>Tariqul Islam</a></span>
                                <span><i class="fa-regular fa-calendar"></i>5 May 2025</span>
                                <span><i class="fa-regular fa-heart"></i>19</span>
                            </div>
                            <p>Lorem ipsum dolor sit amet, adipiscing elit. Aenean commodo ligula eget dolor.</p>
                            <a href="single-blog.html" class="fw-bold text-reset">Read more <i
                                    class="fa fa-long-arrow-right ms-2"></i></a>
                        </div>
                    </div>
                </div>
                <!-- Single Article End -->
                <div class="col-lg-6">
                    <div class="list-entry d-sm-flex bg-light rounded-3 border">
                        <a href="single-post.html" class="entry-media bg-cover"
                            style="background-image: url('${pageContext.request.contextPath}/resources/images/blog/blog-2.jpg');">
                        </a>
                        <div class="entry-content p-lg-4 p-3">
                            <h3 class="entry-title mb-2"><a href="single-blog.html" class="text-reset">We are fighting
                                    againest malnutrition.
                                </a></h3>
                            <div class="entry-meta mb-3">
                                <span><a href="#"><i class="fa-regular fa-user"></i>Tariqul Islam</a></span>
                                <span><i class="fa-regular fa-calendar"></i>5 May 2025</span>
                                <span><i class="fa-regular fa-heart"></i>19</span>
                            </div>
                            <p>Lorem ipsum dolor sit amet, adipiscing elit. Aenean commodo ligula eget dolor. </p>
                            <a href="single-blog.html" class="fw-bold text-reset">Read more <i
                                    class="fa fa-long-arrow-right ms-2"></i></a>
                        </div>
                    </div>
                </div>
                <!-- Single Article End -->
                <div class="col-lg-6">
                    <div class="list-entry d-sm-flex bg-light rounded-3 border">
                        <a href="single-post.html" class="entry-media bg-cover"
                            style="background-image: url('images/blog/blog-3.jpg');">
                        </a>
                        <div class="entry-content p-lg-4 p-3">
                            <h3 class="entry-title mb-2"><a href="single-blog.html" class="text-reset">Togather we all
                                    want to remove illiteracy.
                                </a></h3>
                            <div class="entry-meta mb-3">
                                <span><a href="#"><i class="fa-regular fa-user"></i>Tariqul Islam</a></span>
                                <span><i class="fa-regular fa-calendar"></i>5 May 2025</span>
                                <span><i class="fa-regular fa-heart"></i>19</span>
                            </div>
                            <p>Lorem ipsum dolor sit amet, adipiscing elit. Aenean commodo ligula eget dolor.</p>
                            <a href="single-blog.html" class="fw-bold text-reset">Read more <i
                                    class="fa fa-long-arrow-right ms-2"></i></a>
                        </div>
                    </div>
                </div>
                <!-- Single Article End -->
                <div class="col-lg-6">
                    <div class="list-entry d-sm-flex bg-light rounded-3 border">
                        <a href="single-post.html" class="entry-media bg-cover"
                            style="background-image: url('${pageContext.request.contextPath}/resources/images/blog/blog-4.jpg');">
                        </a>
                        <div class="entry-content p-lg-4 p-3">
                            <h3 class="entry-title mb-2"><a href="single-blog.html" class="text-reset">Togather we all
                                    want to remove
                                    illiteracy.
                                </a></h3>
                            <div class="entry-meta mb-3">
                                <span><a href="#"><i class="fa-regular fa-user"></i>Tariqul Islam</a></span>
                                <span><i class="fa-regular fa-calendar"></i>5 May 2025</span>
                                <span><i class="fa-regular fa-heart"></i>19</span>
                            </div>
                            <p>Lorem ipsum dolor sit amet, adipiscing elit. Aenean commodo ligula eget dolor. </p>
                            <a href="single-blog.html" class="fw-bold text-reset">Read more <i
                                    class="fa fa-long-arrow-right ms-2"></i></a>
                        </div>
                    </div>
                </div>
                <!-- Single Article End -->
            </div>
        </div>
    </section>
    <!-- Blog Area End -->

    <!-- Team Area Start -->
    <section class="team-area section-padding" data-stellar-background-ratio=".3">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-intro">
                        <h2 class="section-title">Our <span class="color">Team</span></h2>
                        <p>Our Blogs is to help the helpless. assumenda delectus quaerat incidunt. Saepe, sed optio eum.
                        </p>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="team-wrap owl-carousel">
                        <div class="team-member">
                            <figure class="team-thumb">
                                <img src="${pageContext.request.contextPath}/resources/images/team/tm3.jpg" alt="">
                                <div class="member-social">
                                    <a href="#"><i class="fa-brands fa-facebook-f"></i></a>
                                    <a href="#"><i class="fa-brands fa-twitter"></i></a>
                                    <a href="#"><i class="fa-brands fa-linkedin-in"></i></a>
                                    <a href="#"><i class="fa-brands fa-instagram"></i></a>
                                </div>
                            </figure>
                            <div class="member-name">
                                <h4><a href="volunteer-single.html">Elezabeth Rosa</a></h4>
                                <small>Head of Ideas</small>
                            </div>
                        </div> <!-- Team Member End -->
                        <div class="team-member">
                            <figure class="team-thumb">
                                <img src="images/team/tm4.jpg" alt="">
                                <div class="member-social">
                                    <a href="#"><i class="fa-brands fa-facebook-f"></i></a>
                                    <a href="#"><i class="fa-brands fa-twitter"></i></a>
                                    <a href="#"><i class="fa-brands fa-linkedin-in"></i></a>
                                    <a href="#"><i class="fa-brands fa-instagram"></i></a>
                                </div>
                            </figure>
                            <div class="member-name">
                                <h4><a href="volunteer-single.html">Angela Megan</a></h4>
                                <small>Head of Ideas</small>
                            </div>
                        </div> <!-- Team Member End -->
                        <div class="team-member">
                            <figure class="team-thumb">
                                <img src="${pageContext.request.contextPath}/resources/images/team/tm1.jpg" alt="">
                                <div class="member-social">
                                    <a href="#"><i class="fa-brands fa-facebook-f"></i></a>
                                    <a href="#"><i class="fa-brands fa-twitter"></i></a>
                                    <a href="#"><i class="fa-brands fa-linkedin-in"></i></a>
                                    <a href="#"><i class="fa-brands fa-instagram"></i></a>
                                </div>
                            </figure>
                            <div class="member-name">
                                <h4><a href="volunteer-single.html">Phillip</a></h4>
                                <small>Head of Ideas</small>
                            </div>
                        </div> <!-- Team Member End -->
                        <div class="team-member">
                            <figure class="team-thumb">
                                <img src="${pageContext.request.contextPath}/resources/images/team/tm2.jpg" alt="">
                                <div class="member-social">
                                    <a href="#"><i class="fa-brands fa-facebook-f"></i></a>
                                    <a href="#"><i class="fa-brands fa-twitter"></i></a>
                                    <a href="#"><i class="fa-brands fa-linkedin-in"></i></a>
                                    <a href="#"><i class="fa-brands fa-instagram"></i></a>
                                </div>
                            </figure>
                            <div class="member-name">
                                <h4><a href="volunteer-single.html">Jonh Trudo</a></h4>
                                <small>Head of Ideas</small>
                            </div>
                        </div> <!-- Team Member End -->
                        <div class="team-member">
                            <figure class="team-thumb">
                                <img src="${pageContext.request.contextPath}/resources/images/team/tm3.jpg" alt="">
                                <div class="member-social">
                                    <a href="#"><i class="fa-brands fa-facebook-f"></i></a>
                                    <a href="#"><i class="fa-brands fa-twitter"></i></a>
                                    <a href="#"><i class="fa-brands fa-linkedin-in"></i></a>
                                    <a href="#"><i class="fa-brands fa-instagram"></i></a>
                                </div>
                            </figure>
                            <div class="member-name">
                                <h4><a href="volunteer-single.html">Elezabeth Rosa</a></h4>
                                <small>Head of Ideas</small>
                            </div>
                        </div> <!-- Team Member End -->
                        <div class="team-member">
                            <figure class="team-thumb">
                                <img src="${pageContext.request.contextPath}/resources/images/team/tm4.jpg" alt="">
                                <div class="member-social">
                                    <a href="#"><i class="fa-brands fa-facebook-f"></i></a>
                                    <a href="#"><i class="fa-brands fa-twitter"></i></a>
                                    <a href="#"><i class="fa-brands fa-linkedin-in"></i></a>
                                    <a href="#"><i class="fa-brands fa-instagram"></i></a>
                                </div>
                            </figure>
                            <div class="member-name">
                                <h4><a href="volunteer-single.html">Angela Megan</a></h4>
                                <small>Head of Ideas</small>
                            </div>
                        </div> <!-- Team Member End -->
                        <div class="team-member">
                            <figure class="team-thumb">
                                <img src="${pageContext.request.contextPath}/resources/images/team/tm1.jpg" alt="">
                                <div class="member-social">
                                    <a href="#"><i class="fa-brands fa-facebook-f"></i></a>
                                    <a href="#"><i class="fa-brands fa-twitter"></i></a>
                                    <a href="#"><i class="fa-brands fa-linkedin-in"></i></a>
                                    <a href="#"><i class="fa-brands fa-instagram"></i></a>
                                </div>
                            </figure>
                            <div class="member-name">
                                <h4><a href="volunteer-single.html">Phillip</a></h4>
                                <small>Head of Ideas</small>
                            </div>
                        </div> <!-- Team Member End -->
                        <div class="team-member">
                            <figure class="team-thumb">
                                <img src="${pageContext.request.contextPath}/resources/images/team/tm2.jpg" alt="">
                                <div class="member-social">
                                    <a href="#"><i class="fa-brands fa-facebook-f"></i></a>
                                    <a href="#"><i class="fa-brands fa-twitter"></i></a>
                                    <a href="#"><i class="fa-brands fa-linkedin-in"></i></a>
                                    <a href="#"><i class="fa-brands fa-instagram"></i></a>
                                </div>
                            </figure>
                            <div class="member-name">
                                <h4><a href="volunteer-single.html">Jonh Trudo</a></h4>
                                <small>Head of Ideas</small>
                            </div>
                        </div> <!-- Team Member End -->
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Team Area End -->

    <!-- Become Volunteer Area Start -->
    <div class="volunteer-area bg-cover section-padding" data-stellar-background-ratio="0.4"
        style="background-image: url('${pageContext.request.contextPath}/resources/images/banner/volunteer.jpg');">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="volunteer-wrap text-center">
                        <span>Become a Volunteer</span>
                        <p>Join us to participate yourself for mankind</p>
                        <a href="#" class="custom-btn">join now</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Become Volunteer Area End -->

    <!-- Footer Area Start -->
    <footer class="footer-area">
        <div class="footer-top">
            <div class="newsletter">
                <h4>SignUp Our Newsletter</h4>
                <!-- Mailchimp From Start -->
                <form class="mailchimp inputSubscribeDiv">
                    <input type="email" name="subscribe" id="subscriber-email" placeholder="Your Mail"
                        class="form-control">
                    <button type="submit" id="subscribe-button"><i class="fa fa-paper-plane"></i></button>
                    <div class="subscription-success"> </div>
                    <div class="subscription-error"> </div>
                    <label class="subscription-label" for="subscriber-email"></label>
                </form>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-sm-6">
                    <div class="footer-widget footer-about">
                        <div class="f-logo"><a href="#">
                                <img src="${pageContext.request.contextPath}/resources/images/components/f-logo.png" alt="Logo">
                            </a></div>
                        <p>Help us to save lifes during a natural disaster, get clean water running in the most remote
                            areas, and much more.</p>
                        <div class="footer-social">
                            <a href="#"><i class="fa-brands fa-facebook-f"></i></a>
                            <a href="#"><i class="fa-brands fa-twitter"></i></a>
                            <a href="#"><i class="fa-brands fa-youtube"></i></a>
                            <a href="#"><i class="fa-brands fa-pinterest"></i></a>
                            <a href="#"><i class="fa-brands fa-instagram"></i></a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-2 offset-lg-1 col-sm-5 offset-sm-1">
                    <div class="footer-widget">
                        <h3 class="widget-title">about us</h3>
                        <ul>
                            <li><a href="#">About Employee</a></li>
                            <li><a href="#">About Carrier</a></li>
                            <li><a href="#">How it works</a></li>
                            <li><a href="#">Blog</a></li>
                            <li><a href="#">Contact</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-2 col-sm-6">
                    <div class="footer-widget">
                        <h3 class="widget-title">Useful Links</h3>
                        <ul>
                            <li><a href="#">Project</a></li>
                            <li><a href="#">Donner</a></li>
                            <li><a href="#">Relief</a></li>
                            <li><a href="#">Sanitaion</a></li>
                            <li><a href="#">News</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-3 col-sm-5 offset-sm-1 offset-lg-0">
                    <div class="footer-widget">
                        <h3 class="widget-title">Contact Us</h3>
                        <ul class="footer-contact">
                            <li><i class="fa fa-home"></i> <span>129, London Street, South London UK.</span></li>
                            <li><i class="fa fa-phone"></i><span><a href="tel:+6494461709.7890">+00- 123.456.7890</a>
                                    <br><a href="tel:+6494461709.7890">+00- 223.456.7890</a></span></li>
                            <li><i class="fa fa-envelope"></i> <span><a
                                        href="mailto:help@gmail.com">help@gmail.com</a></span></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="row copy-right g-0">
                <div class="col-xl-6 col-md-7 order-2 order-md-1">
                    <p>Copyright © 2024. All Rights Reserved by <a href="#">theme-village</a></p>
                </div>
                <div class="col-xl-6 col-md-5 order-1 order-md-2">
                    <nav class="quick-link text-lg-end">
                        <ul>
                            <li><a href="#" class="nav-link">Terms & Conditions</a></li>
                            <li><a href="#" class="nav-link">Privacy Policy</a></li>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
    </footer>
    <!-- Footer Area Start -->

    <!--
Javascript
======================================================== -->
   <script src="<c:url value="/resources/js/jquery.min.js"/>"></script>
	<script src="<c:url value="/resources/js/bootstrap.bundle.min.js"/>"></script>
	<script src="<c:url value="/resources/js/owl.carousel.min.js"/>"></script>
	<script src="<c:url value="/resources/js/jquery.stellar.js"/>"></script>
	<script src="<c:url value="/resources/js/jquery.scrollUp.min.js"/>"></script>
	<script src="<c:url value="/resources/js/jquery.easing.1.3.js"/>"></script>
	<script
		src="<c:url value="/resources/js/jquery.magnific-popup.min.js"/>"></script>
	<script src="<c:url value="/resources/js/jquery.syotimer.min.js"/>"></script>
	<script src="<c:url value="/resources/js/wow.js"/>"></script>
	<script src="<c:url value="/resources/js/jquery.counterup.min.js"/>"></script>
	<script src="<c:url value="/resources/js/jquery.waypoints.min.js"/>"></script>
	<script src="<c:url value="/resources/js/isotope.pkgd.min.js"/>"></script>
	<script src="<c:url value="/resources/js/jquery.ajaxchimp.min.js"/>"></script>
	<script src="<c:url value="/resources/js/form.js"/>"></script>
	<script src="<c:url value="/resources/js/jquery.nice-select.min.js"/>"></script>
	<script src="<c:url value="/resources/js/custom.js"/>"></script>

</body>

</html>