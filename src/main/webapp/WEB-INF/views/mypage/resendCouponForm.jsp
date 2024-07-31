<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="쿠폰 재발송 폼">
<meta name="author" content="Tariqul Islam">
<title>쿠폰 재발송</title>
<!-- Plugins CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/fontawesome/all.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style.css">
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<h2>쿠폰 재발송</h2>
				<form id="couponForm">
					<input type="hidden" id="selectedCouponId" name="selectedCouponId"
						value="${param.couponId}">
					<div class="form-group">
						<label for="to">전송받을 휴대폰번호:</label> <input type="text"
							class="form-control" id="to" name="to" required>
					</div>
					<div class="form-group">
						<label for="text">함께 보낼 메시지:</label>
						<textarea class="form-control" id="text" name="text" required></textarea>
					</div>
					<button type="button" class="btn btn-primary"
						onclick="resendCoupon()">쿠폰 발송</button>
					<input type="hidden" id="selectedCouponId" name="selectedCouponId"
						value=""> <input type="hidden" id="couponImageUrl"
						name="couponImageUrl" value="">
				</form>
			</div>
		</div>
	</div>

	<!-- Javascript -->
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<script src="<c:url value="/resources/js/jquery.min.js"/>"></script>
	<script src="<c:url value="/resources/js/bootstrap.bundle.min.js"/>"></script>
	<script src="<c:url value="/resources/js/custom.js"/>"></script>

	<script>
        function resendCoupon() {
            const form = document.getElementById('couponForm');
            const formData = new FormData(form);

            $.ajax({
                url: "${pageContext.request.contextPath}/sendMms",
                method: "POST",
                data: formData,
                processData: false,
                contentType: false,
                success: function(response) {
                    Swal.fire({
                        title: '쿠폰 발송 완료!',
                        text: '쿠폰이 성공적으로 발송되었습니다.',
                        icon: 'success',
                        confirmButtonText: '확인'
                    }).then(() => {
                        window.close();
                    });
                },
                error: function(xhr, status, error) {
                    Swal.fire({
                        title: '쿠폰 발송 실패',
                        text: `쿠폰 발송 중 오류가 발생했습니다: ${error}`,
                        icon: 'error',
                        confirmButtonText: '확인'
                    });
                }
            });
        }
    </script>
</body>
</html>
