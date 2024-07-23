<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>

<!DOCTYPE html>
<html lang="ko">

<head>
<!-- Meta Tags -->
<meta charset="utf-8">
<meta name="viewport"
   content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description"
   content="Charity, Non Profit and NGO Website created with Bootstrap and Sass">
<meta name="author" content="Tariqul Islam">

<title>마이페이지</title>

<!-- Favicon Icon -->
<link rel="shortcut icon"
   href="${pageContext.request.contextPath}/resources/images/components/favicon.ico">

<!-- Plugins CSS -->
<link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
<link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/css/fontawesome/all.min.css">
<link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/css/font/flaticon.css">
<link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/css/owl.carousel.min.css">
<link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/css/animate.css">
<link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/css/magnific-popup.css">
<link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/css/nice-select.css">

<!-- Theme CSS -->
<link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/css/style.css">

<!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>
   <!-- Preloader -->
   <div id="preloader">
      <div class="preloader">
         <span></span> <span></span>
      </div>
   </div>
   <%@ include file="/WEB-INF/views/header.jsp"%>
   <!-- 배너영역 start -->
   <section class="promo-area" data-stellar-background-ratio="0.5"
      style="background-position: 50% 0%;">
      <div class="container">
         <div class="row">
            <div class="col-lg-12">
               <div class="promo-wrap">
                  <h1 class="promo-title">
                     <span>정보수정</span>
                  </h1>
                  <nav aria-label="breadcrumb"></nav>
               </div>
            </div>
         </div>
      </div>
   </section>
   <!-- 배너영역 end -->

   <!--정보수정역역 start -->
   <section class="donations-area section-padding">
      <div class="container">
         <div class="row">
            <div class="col-lg-12">
               <div class="section-intro intro-full">
                  <h2 class="section-title">
                     내 정보 <span class="color">수정</span>
                  </h2>
               </div>
            </div>
         </div>
         <div class="row">
            <div class="col-lg-10 offset-lg-1">
               <div class="bg-light donation-form rounded-3 shadow-sm">
                  <form class="donate-form" action="/donation" method="POST">
                     <div class="form-group">
                        <label for="name">Name</label> <input class="form-control"
                           type="text" id="name" name="name" required="">
                     </div>
                     <div class="form-group half-form">
                        <label for="email">Email</label> <input class="form-control"
                           type="email" id="email" name="email" required="">
                     </div>
                     <div class="form-group half-form">
                        <label for="number">Phone</label> <input class="form-control"
                           type="number" id="number" name="number" required="">
                     </div>
                     <div class="form-group clearfix">
                        <label for="email">Funding For</label> <select name="fund"
                           style="display: none;">
                           <option value="Educate Children" selected="">Food
                              Campaign</option>
                           <option value="Educate Children">Educate Children</option>
                           <option value="Child Camps">Campaign for Old</option>
                           <option value="Clean Water for Life">Clean Water</option>
                           <option value="Campaign for Child Poverty">Campaign
                              for Women</option>
                        </select>
                        <div class="nice-select" tabindex="0">
                           <span class="current">Food Campaign</span>
                           <ul class="list">
                              <li data-value="Educate Children" class="option selected">Food
                                 Campaign</li>
                              <li data-value="Educate Children" class="option">Educate
                                 Children</li>
                              <li data-value="Child Camps" class="option">Campaign for
                                 Old</li>
                              <li data-value="Clean Water for Life" class="option">Clean
                                 Water</li>
                              <li data-value="Campaign for Child Poverty" class="option">Campaign
                                 for Women</li>
                           </ul>
                        </div>
                     </div>
                     <div class="form-group mt-4">
                        <label for="email">Funding Amount</label>
                        <div class="donation-amount position-relative">
                           <span class="currency-sign position-absolute">$</span> <input
                              type="text" value="300" name="donate_amount"
                              id="donate_amount" placeholder="Amount"
                              class="donate-input form-control">
                        </div>
                        <!-- /.donate-form__amount__box -->
                     </div>

                     <div
                        class="donate-actions my-4 d-sm-flex justify-content-between">
                        <button type="button" class="button-amount">
                           $
                           <spann class="amount-inner"> 10</spann>
                        </button>

                        <button type="button" class="button-amount">
                           $<span class="amount-inner">50</span>
                        </button>
                        <button type="button" class="button-amount">
                           $<span class="amount-inner">100</span>
                        </button>
                        <button type="button" class="button-amount active">
                           $<span class="amount-inner">300</span>
                        </button>
                        <button type="button" class="button-amount">Custom</button>
                     </div>
                     <!-- /.donate-form__amount__buttons -->




                     <div class="form-group">
                        <label for="message">Message (optional)</label>
                        <textarea rows="6" class="form-control" id="message"
                           name="message"></textarea>
                     </div>

                     <button class="custom-btn mt-4" type="submit">Donate Now</button>
                  </form>
               </div>
            </div>
         </div>
      </div>
   </section>
   <!-- 정보수정내역 end -->


   <%@ include file="/WEB-INF/views/footer.jsp"%>

   <!--Javascript======================================================== -->

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
