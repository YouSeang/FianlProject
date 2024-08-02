package snippet;

public class Snippet {
	body {
	    overflow-x: hidden;
	}
	
	.mobile-nav {
	    position: fixed;
	    top: 0;
	    left: -250px;
	    width: 250px;
	    height: 100%;
	    background-color: #fff;
	    box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
	    z-index: 2000;
	    transition: left 0.3s ease;
	    overflow-y: auto;
	}
	
	.mobile-nav.active {
	    left: 0;
	}
	
	.mobile-nav-header {
	    display: flex;
	    justify-content: space-between;
	    align-items: center;
	    padding: 1rem;
	    border-bottom: 1px solid #eaeaea;
	}
	
	.mobile-nav-close {
	    font-size: 1.5rem;
	    cursor: pointer;
	}
	
	.mobile-nav ul {
	    list-style: none;
	    padding: 0;
	    margin: 0;
	}
	
	.mobile-nav ul li {
	    border-bottom: 1px solid #eaeaea;
	}
	
	.mobile-nav ul li a {
	    display: block;
	    padding: 1rem;
	    text-decoration: none;
	    color: #333;
	}
	
	.mobile-nav ul li a:hover {
	    background-color: #f5f5f5;
	}
	
	.mobile-nav ul li .dropdown-menu {
	    display: none;
	    padding-left: 1rem;
	    position: relative;
	    z-index: 1000;
	}
	
	.mobile-nav ul li.active .dropdown-menu {
	    display: block;
	}
	
	.mobile-nav-backdrop {
	    position: fixed;
	    top: 0;
	    left: 0;
	    width: 100%;
	    height: 100%;
	    background-color: rgba(0, 0, 0, 0.5);
	    z-index: 1000;
	    display: none;
	}
	
	.mobile-nav-backdrop.active {
	    display: block;
	}
	
	/* Custom CSS for Desktop Navigation */
	@media (min-width: 992px) {
	    .mobile-nav, .mobile-nav-backdrop {
	        display: none;
	    }
	}
	
	@media (max-width: 991px) {
	    .navbar-nav {
	        display: none;
	    }
	}
	</style>
	</head>
	
	<body>
	<!-- Header Start -->
	<header class="header">
	    <nav class="navbar navbar-expand-lg navbar-light bg-light">
	        <div class="container-fluid">
	            <a class="navbar-brand" href="${pageContext.request.contextPath}/">
	                <img src="${pageContext.request.contextPath}/resources/images/components/logo.png" alt="Logo">
	            </a>
	            <button class="navbar-toggler" type="button" id="mobile-nav-toggle">
	                <span class="navbar-toggler-icon"></span>
	            </button>
	            <div class="collapse navbar-collapse">
	                <ul class="navbar-nav mx-auto">
	                    <li class="nav-item"><a href="./about.html" class="nav-link" style="color: #333333;">Ů����Ұ�</a></li>
	                    <li class="nav-item dropdown">
	                        <a class="nav-link dropdown-toggle" href="${pageContext.request.contextPath}/voice/incidentsOverview" role="button" data-bs-toggle="dropdown" aria-expanded="false" style="color: #333333;">�����</a>
	                        <ul class="dropdown-menu" style="background-color: rgba(255, 255, 255, 0.9);">
	                            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/voice/incidentsOverview">���������Ȳ</a></li>
	                            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/voice/recentIncidents">�ֽ��ǽ̱�� �� ���</a></li>
	                            <li class="dropdown-submenu dropend">
	                                <a class="dropdown-item dropdown-toggle" href="${pageContext.request.contextPath}/voice/smishing">��������� �ùķ��̼�</a>
	                                <ul class="dropdown-menu" style="background-color: rgba(255, 255, 255, 0.9);">
	                                    <li class="dropdown-header">��������� �ùķ��̼�</li>
	                                    <li><a class="dropdown-item" href="${pageContext.request.contextPath}/voice/voicePhishing">���̽��ǽ�</a></li>
	                                    <li><a class="dropdown-item" href="${pageContext.request.contextPath}/voice/smishing">���̽�</a></li>
	                                    <li><a class="dropdown-item" href="${pageContext.request.contextPath}/voice/messagePhishing">�޽����ǽ�</a></li>
	                                </ul>
	                            </li>
	                        </ul>
	                    </li>
	                    <li class="nav-item dropdown">
	                        <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false" style="color: #333333;">��������</a>
	                        <ul class="dropdown-menu" style="background-color: rgba(255, 255, 255, 0.9);">
	                            <li class="dropdown-submenu dropend">
	                                <a class="dropdown-item dropdown-toggle" href="${pageContext.request.contextPath}/edu/sbjoin">KB��Ÿ��ŷ ü��</a>
	                                <ul class="dropdown-menu" style="background-color: rgba(255, 255, 255, 0.9);">
	                                    <li class="dropdown-header">KB��Ÿ��ŷ ü��</li>
	                                    <li><a class="dropdown-item" href="${pageContext.request.contextPath}/edu/sbjoin">ȸ������</a></li>
	                                    <li><a class="dropdown-item" href="${pageContext.request.contextPath}/edu/sbtransfer">��ü</a></li>
	                                    <li><a class="dropdown-item" href="${pageContext.request.contextPath}/edu/sbsavings">��ǰ����</a></li>
	                                </ul>
	                            </li>
	                            <li class="dropdown-submenu dropend">
	                                <a class="dropdown-item dropdown-toggle" href="${pageContext.request.contextPath}/edu/ibjoin">���ͳݹ�ŷ ü��</a>
	                                <ul class="dropdown-menu" style="background-color: rgba(255, 255, 255, 0.9);">
	                                    <li class="dropdown-header">KB���ͳݹ�ŷ ü��</li>
	                                    <li><a class="dropdown-item" href="${pageContext.request.contextPath}/edu/ibtransfer">��ü</a></li>
	                                    <li><a class="dropdown-item" href="${pageContext.request.contextPath}/edu/ibsavings">��ǰ����</a></li>
	                                </ul>
	                            </li>
	                            <li class="dropdown-submenu dropend">
	                                <a class="dropdown-item dropdown-toggle" href="${pageContext.request.contextPath}/game/quiz">��������</a>
	                                <ul class="dropdown-menu" style="background-color: rgba(255, 255, 255, 0.9);">
	                                    <li class="dropdown-header">��������</li>
	                                    <li><a class="dropdown-item" href="${pageContext.request.contextPath}/game/quiz">OX����</a></li>
	                                    <li><a class="dropdown-item" href="${pageContext.request.contextPath}/game/findcrime">������ ���</a></li>
	                                </ul>
	                            </li>
	                            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/edu/eduvideo">��������</a></li>
	                        </ul>
	                    </li>
	                    <li class="nav-item dropdown">
	                        <a class="nav-link dropdown-toggle" href="${pageContext.request.contextPath}/security/securityTemp" role="button" data-bs-toggle="dropdown" aria-expanded="false" style="color: #333333;">���Ǻ���</a>
	                        <ul class="dropdown-menu" style="background-color: rgba(255, 255, 255, 0.9);">
	                            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/security/securityTemp">���� ��������</a></li>
	                            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/security/securityGuide">���� ��ȭ���</a></li>
	                        </ul>
	                    </li>
	                    <li class="nav-item dropdown">
	                        <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false" style="color: #333333;">����â��</a>
	                        <ul class="dropdown-menu" style="background-color: rgba(255, 255, 255, 0.9);">
	                            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/board/attendance">�⼮üũ</a></li>
	                            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/board/notice">��������</a></li>
	                            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/board/share">��ʰ���</a></li>
	                        </ul>
	                    </li>
	                </ul>
	                <div class="mt-3 mt-lg-0 d-flex align-items-center header-actions justify-content-between">
	                    <c:choose>
	                        <c:when test="${not empty sessionScope.user}">
	                            <a href="${pageContext.request.contextPath}/logout" class="custom-btn">�α׾ƿ�</a>
	                            <a class="text-reset icon" href="#" data-bs-toggle="offcanvas" data-bs-target="#offcanvas-search"><i class="fa fa-search"></i></a>
	                            <c:choose>
	                                <c:when test="${sessionScope.user.role eq 'admin'}">
	                                    <a href="${pageContext.request.contextPath}/admin/admin" class="text-reset icon position-relative me-2"><i class="fa fa-user"></i></a>
	                                </c:when>
	                                <c:otherwise>
	                                    <a href="${pageContext.request.contextPath}/mypage" class="text-reset icon position-relative me-2"><i class="fa fa-user"></i></a>
	                                </c:otherwise>
	                            </c:choose>
	                        </c:when>
	                        <c:otherwise>
	                            <a href="${pageContext.request.contextPath}/loginView" class="custom-btn">�α���</a>
	                            <a class="text-reset icon" href="#" data-bs-toggle="offcanvas" data-bs-target="#offcanvas-search"><i class="fa fa-search"></i></a>
	                            <a href="${pageContext.request.contextPath}/loginView" class="text-reset icon position-relative me-2" onclick="alert('�α����� �ʿ��մϴ�. \n�α���ȭ������ �̵��մϴ�.');"><i class="fa fa-user"></i></a>
	                        </c:otherwise>
	                    </c:choose>
	                </div>
	            </div>
	        </div>
	    </nav>
	</header>
	<!-- Header End -->
	
	<!-- Mobile Navigation -->
	<div class="mobile-nav" id="mobile-nav">
	    <div class="mobile-nav-header">
	        <h5 class="mb-0">�޴�</h5>
	        <span class="mobile-nav-close" id="mobile-nav-close">&times;</span>
	    </div>
	    <ul>
	        <li><a href="./about.html">Ů����Ұ�</a></li>
	        <li>
	            <a href="#" class="dropdown-toggle">�����</a>
	            <ul class="dropdown-menu">
	                <li><a href="${pageContext.request.contextPath}/voice/incidentsOverview">���������Ȳ</a></li>
	                <li><a href="${pageContext.request.contextPath}/voice/recentIncidents">�ֽ��ǽ̱�� �� ���</a></li>
	                <li>
	                    <a href="#" class="dropdown-toggle">��������� �ùķ��̼�</a>
	                    <ul class="dropdown-menu">
	                        <li><a href="${pageContext.request.contextPath}/voice/voicePhishing">���̽��ǽ�</a></li>
	                        <li><a href="${pageContext.request.contextPath}/voice/smishing">���̽�</a></li>
	                        <li><a href="${pageContext.request.contextPath}/voice/messagePhishing">�޽����ǽ�</a></li>
	                    </ul>
	                </li>
	            </ul>
	        </li>
	        <li>
	            <a href="#" class="dropdown-toggle">��������</a>
	            <ul class="dropdown-menu">
	                <li>
	                    <a href="#" class="dropdown-toggle">KB��Ÿ��ŷ ü��</a>
	                    <ul class="dropdown-menu">
	                        <li><a href="${pageContext.request.contextPath}/edu/sbjoin">ȸ������</a></li>
	                        <li><a href="${pageContext.request.contextPath}/edu/sbtransfer">��ü</a></li>
	                        <li><a href="${pageContext.request.contextPath}/edu/sbsavings">��ǰ����</a></li>
	                    </ul>
	                </li>
	                <li>
	                    <a href="#" class="dropdown-toggle">���ͳݹ�ŷ ü��</a>
	                    <ul class="dropdown-menu">
	                        <li><a href="${pageContext.request.contextPath}/edu/ibtransfer">��ü</a></li>
	                        <li><a href="${pageContext.request.contextPath}/edu/ibsavings">��ǰ����</a></li>
	                    </ul>
	                </li>
	                <li>
	                    <a href="#" class="dropdown-toggle">��������</a>
	                    <ul class="dropdown-menu">
	                        <li><a href="${pageContext.request.contextPath}/game/quiz">OX����</a></li>
	                        <li><a href="${pageContext.request.contextPath}/game/findcrime">������ ���</a></li>
	                    </ul>
	                </li>
	                <li><a href="${pageContext.request.contextPath}/edu/eduvideo">��������</a></li>
	            </ul>
	        </li>
	        <li>
	            <a href="#" class="dropdown-toggle">���Ǻ���</a>
	            <ul class="dropdown-menu">
	                <li><a href="${pageContext.request.contextPath}/security/securityTemp">���� ��������</a></li>
	                <li><a href="${pageContext.request.contextPath}/security/securityGuide">���� ��ȭ���</a></li>
	            </ul>
	        </li>
	        <li>
	            <a href="#" class="dropdown-toggle">����â��</a>
	            <ul class="dropdown-menu">
	                <li><a href="${pageContext.request.contextPath}/board/attendance">�⼮üũ</a></li>
	                <li><a href="${pageContext.request.contextPath}/board/notice">��������</a></li>
	                <li><a href="${pageContext.request.contextPath}/board/share">��ʰ���</a></li>
	            </ul>
	        </li>
	    </ul>
	</div>
	<div class="mobile-nav-backdrop" id="mobile-nav-backdrop"></div>
	
	<!-- Scripts -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
	<script>
	$(document).ready(function () {
	    $('#mobile-nav-toggle').click(function () {
	        $('#mobile-nav').addClass('active');
	        $('#mobile-nav-backdrop').addClass('active');
	    });
	
	    $('#mobile-nav-close, #mobile-nav-backdrop').click(function () {
	        $('#mobile-nav').removeClass('active');
	        $('#mobile-nav-backdrop').removeClass('active');
	    });
	
	    $('.mobile-nav .dropdown-toggle').click(function (e) {
	        e.preventDefault();
	        $(this).siblings('.dropdown-menu').slideToggle();
	        $(this).parent().toggleClass('active');
	    });
	});
	</script>
	</body>
}

