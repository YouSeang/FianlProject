<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="관리자 쿠폰 관리">
<meta name="author" content="Your Name">

<title>LocKB - 쿠폰 관리</title>

<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/resources/images/components/favicon.ico">
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
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style.css">
<link rel="preconnect" href="https://statics.goorm.io"
	crossorigin="anonymous" />
<link rel="preload" as="style" crossorigin
	href="https://statics.goorm.io/fonts/GoormSans/v1.0.0/GoormSans.min.css" />
<link rel="stylesheet"
	href="https://statics.goorm.io/fonts/GoormSans/v1.0.0/GoormSans.min.css" />

<style>
@font-face {
	font-family: 'Goorm Sans';
	font-weight: normal;
	font-style: normal;
}

body, h1, h2, h3, p, a {
	font-family: 'Goorm Sans' !important;
}

/* 테이블 스타일 */
.table-bordered {
	border: 1px solid #dee2e6;
	margin-bottom: 20px;
	border-radius: 5px;
	overflow: hidden;
}

.table-bordered th, .table-bordered td {
	padding: 12px;
	text-align: center;
	vertical-align: middle;
	border: 1px solid #dee2e6;
	background-color: #f9f9f9;
}

.table-bordered th {
	background-color: #f1f1f1;
	font-weight: bold;
	color: #333;
}

/* 이미지 스타일 */
.table img {
	width: 80px;
	height: auto;
	border-radius: 5px;
}

/* 버튼 스타일 */
.btn {
	border-radius: 20px;
	padding: 10px 20px;
	font-size: 14px;
}

.btn-warning, .btn-danger {
	margin-left: 5px;
}

/* 쿠폰 추가 폼 스타일 */
#addCoupon {
	max-width: 400px;
	margin: 0 auto;
	display: none;
}

#addCoupon .card {
	border-radius: 10px;
	box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
}

#addCoupon .card-header {
	background-color: #f1f1f1;
	text-align: center;
	font-weight: bold;
}

#addCoupon .card-body {
	padding: 20px;
}

#addCoupon .form-control {
	border-radius: 10px;
}
</style>
</head>
<body>
	<div id="preloader">
		<div class="preloader">
			<span></span> <span></span>
		</div>
	</div>

	<%@ include file="/WEB-INF/views/header0802.jsp"%>

	<main class="main-content">
		<div class="container mt-5">
			<h2>쿠폰 관리</h2>
			<a class="btn btn-primary" onclick="toggleForm('add')">쿠폰 추가</a>
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>쿠폰 타입</th>
						<th>이미지</th>
						<th>관리</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="coupon" items="${coupon_list}">
						<tr>
							<td>${coupon.coupon_type}</td>
							<td><img
								src="${pageContext.request.contextPath}${coupon.coupon_image}"
								alt="Coupon Image"></td>
							<td><a
								href="${pageContext.request.contextPath}/admin/updateCouponForm?couponId=${coupon.id}"
								class="btn btn-warning">수정</a>
								<form
									action="${pageContext.request.contextPath}/admin/deleteCoupon"
									method="post" style="display: inline;">
									<input type="hidden" name="couponId" value="${coupon.id}">
									<button type="submit" class="btn btn-danger">삭제</button>
								</form></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>

		<div id="addCoupon">
			<div class="card">
				<div class="card-header">
					<h5>쿠폰 추가</h5>
				</div>
				<div class="card-body">
					<form action="${pageContext.request.contextPath}/admin/addCoupon"
						method="post">
						<div class="mb-3">
							<label for="typeNew" class="form-label">쿠폰 타입</label> <input
								type="text" class="form-control" id="typeNew" name="coupon_type"
								required>
						</div>
						<div class="mb-3">
							<label for="imageNew" class="form-label">이미지 경로</label> <input
								type="text" class="form-control" id="imageNew"
								name="coupon_image" required>
						</div>
						<button type="submit" class="btn btn-primary">저장</button>
					</form>
				</div>
			</div>
		</div>
	</main>

	<%@ include file="/WEB-INF/views/footer.jsp"%>

	<script src="<c:url value='/resources/js/jquery.min.js'/>"></script>
	<script src="<c:url value='/resources/js/bootstrap.bundle.min.js'/>"></script>
	<script src="<c:url value='/resources/js/owl.carousel.min.js'/>"></script>
	<script src="<c:url value='/resources/js/custom.js'/>"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

	<script>
		function toggleForm(formType) {
			if (formType === 'add') {
				$('#addCoupon').toggle();
			}
		}

		function deleteCoupon(couponId) {
			if (confirm("정말로 이 쿠폰을 삭제하시겠습니까?")) {
				$
						.ajax({
							url : '${pageContext.request.contextPath}/admin/deleteCoupon',
							type : 'POST',
							data : {
								couponId : couponId
							},
							success : function(response) {
								alert("쿠폰이 삭제되었습니다.");
								location.reload();
							},
							error : function(xhr, status, error) {
								alert("쿠폰 삭제에 실패했습니다. 다시 시도해 주세요.");
							}
						});
			}
		}
	</script>
</body>
</html>
