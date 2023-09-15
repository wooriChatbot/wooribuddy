<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<style>
div {
	text-align: center;
}
</style>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Woori Buddy</title>
</head>
<body id="page-top" style="background-color: #eee;">
	<!-- Navigation-->
	<%@include file="/WEB-INF/view/include/nav.jsp"%>
	<!-- Masthead-->
	<header class="masthead bg-primary text-white text-center">
		<div class="container d-flex align-items-center flex-column">

			<!-- Masthead Heading-->
			<h1 class="masthead-heading text-uppercase mb-0">Woori Buddy</h1>
			<!-- Icon Divider-->
			<div class="divider-custom divider-light">
				<div class="divider-custom-line"></div>
				<div class="divider-custom-icon">
					<i class="fas fa-star"></i>
				</div>
				<div class="divider-custom-line"></div>
			</div>
			<!-- Masthead Subheading-->
			<p class="masthead-subheading font-weight-light mb-0">Your Buddy
				- My Buddy - Woori Buddy</p>
		</div>
	</header>
	<!-- home Section-->
	<section class="page-section portfolio" id="home">
		<div class="container">
			<!-- home Section Heading-->
			<h2
				class="page-section-heading text-center text-uppercase text-secondary mb-0">member</h2>
			<!-- Icon Divider-->
			<div class="divider-custom">
				<div class="divider-custom-line"></div>
				<div class="divider-custom-icon">
					<i class="fas fa-star"></i>
				</div>
				<div class="divider-custom-line"></div>
			</div>
			<div class="center">
				<img class="img-fluid" src="/resources/image/6_princess.png"
					style="width: 65%; height: 65%;" />
				<p class="mb-4">
					<b>Your Buddy - My Buddy - Woori Buddy</b> <br> 안녕하세요. 절미네 가족들
					입니다. <br> 첫 통장 만드는 날, 저금통에 있는 돈을 은행에 넣으러 간 날, 기억하시나요? <br>
					저희는 어린이들, 10대들이 접하기 어려운 금융을 쉽게 접할 수 있도록 만든사이트(앱)입니다. <br> 가계부를
					통해 효율적으로 돈관리는 하는 법, <br> 금융튜터를 활용해서 금융에 대한 지식을 얻고 공부를 할 수
					있습니다. <br> <b>세살 버릇 여든까지 간다</b>는 속담처럼 금융에 대한 습관을 만들어보는건 어떨까요?<br>
					우리 모두 저축에 대한 습관을 길러보아요.<br>
				</p>
				<!-- About Section Content-->


			</div>
		</div>
	</section>

	<!-- intro Section-->
	<section class="page-section portfolio" id="#intro">
		<div class="container">
			<!-- intro Section Heading-->
			<h2
				class="page-section-heading text-center text-uppercase text-secondary mb-0">intro</h2>
			<!-- Icon Divider-->
			<div class="divider-custom">
				<div class="divider-custom-line"></div>
				<div class="divider-custom-icon">
					<i class="fas fa-star"></i>
				</div>
				<div class="divider-custom-line"></div>
			</div>

			<!-- intro Item 1-->
			<div class="row">
				<div class="col-lg-4 col-sm-6 mb-4">
					<div class="portfolio-item mx-auto" data-bs-toggle="modal"
						data-bs-target="#portfolioModal2">
						<div
							class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100">
							<div
								class="portfolio-item-caption-content text-center text-white">
								<i class="fas fa-plus fa-3x"></i>
							</div>
						</div>
						<img class="img-fluid" src="/resources/image/cabin.png" />
					</div>
				</div>

				<!-- intro Item 2-->
				<div class="col-lg-4 col-sm-6 mb-4">
					<div class="portfolio-item mx-auto" data-bs-toggle="modal"
						data-bs-target="#portfolioModal3">
						<div
							class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100">
							<div
								class="portfolio-item-caption-content text-center text-white">
								<i class="fas fa-plus fa-3x"></i>
							</div>
						</div>
						<img class="img-fluid" src="/resources/image/safe.png" />
					</div>
				</div>
				<!-- intro Item 3-->
				<div class="col-lg-4 col-sm-6 mb-4">
					<div class="portfolio-item mx-auto" data-bs-toggle="modal"
						data-bs-target="#portfolioModal4">
						<div
							class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100">
							<div
								class="portfolio-item-caption-content text-center text-white">
								<i class="fas fa-plus fa-3x"></i>
							</div>
						</div>
						<img class="img-fluid" src="/resources/image/game.png" />
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- Footer-->
	<footer class="footer text-center">
		<div class="container">
			<div class="row">
				<!-- Footer Location-->
				<div class="col-lg-4 mb-5 mb-lg-0">
					<h4 class="text-uppercase mb-4">name</h4>
					<p class="lead mb-0">
						Jeolmi's family <br />
					</p>
				</div>

				<!-- Footer Social Icons-->
				<div class="col-lg-4 mb-5 mb-lg-0">
					<h4 class="text-uppercase mb-4">member</h4>
					Modeling: Bae J.W, Sin Y.J, Lee S.W <br> Web: Kim H.J, Woo
					M.R, Jeong Soie
				</div>
				<!-- Footer About Text-->
				<div class="col-lg-4">
					<h4 class="text-uppercase mb-4">created by</h4>
					<p class="lead mb-0">Jeolmi's family Website 2023</p>
				</div>
			</div>
		</div>
	</footer>

	<!-- intro Modal -->
	<!-- intro Modal 2-->
	<div class="portfolio-modal modal fade" id="portfolioModal2"
		tabindex="-1" aria-labelledby="portfolioModal2" aria-hidden="true">
		<div class="modal-dialog modal-xl">
			<div class="modal-content">
				<div class="modal-header border-0">
					<a href="#intro"></a>
					<button class="btn-close" type="button" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body text-black text-center pb-5">
					<div class="container-center">
						<div class="row justify-content-center">
							<div class="col-lg-8">
								<!-- intro Modal - Title-->
								<h2
									class="portfolio-modal-title text-secondary text-uppercase mb-0">board</h2>
								<!-- Icon Divider-->
								<div class="divider-custom">
									<div class="divider-custom-line"></div>
									<div class="divider-custom-icon">
										<i class="fas fa-star"></i>
									</div>
									<div class="divider-custom-line"></div>
								</div>
								<!-- intro Modal - Image-->
								<img class="img-fluid rounded mb-5"
									src="/resources/image/icon.png" width=150px />
								<!-- intro Modal - Text-->
								<p class="mb-4">
									사용자들이 사용하는 가계부와 챗봇에 관한 업데이트 및 이벤트 <br>내용을 알려주는 서비스입니다.
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- intro Modal 3-->
	<div class="portfolio-modal modal fade" id="portfolioModal3"
		tabindex="-1" aria-labelledby="portfolioModal3" aria-hidden="true">
		<div class="modal-dialog modal-xl">
			<div class="modal-content">
				<div class="modal-header border-0">
					<a href="#intro"></a>
					<button class="btn-close" type="button" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body text-black text-center pb-5">
					<div class="container">
						<div class="row justify-content-center">
							<div class="col-lg-8">
								<!-- intro Modal - Title-->
								<h2
									class="portfolio-modal-title text-secondary text-uppercase mb-0">Money</h2>
								<!-- Icon Divider-->
								<div class="divider-custom">
									<div class="divider-custom-line"></div>
									<div class="divider-custom-icon">
										<i class="fas fa-star"></i>
									</div>
									<div class="divider-custom-line"></div>
								</div>
								<!-- intro Modal - Image-->
								<img class="img-fluid rounded mb-5"
									src="/resources/image/money.png" width=150px />
								<!-- intro Modal - Text-->
								<p class="mb-4">계획을 세움으로써 돈을 사용하는 습관과 돈의 중요성을 일깨워주는 가계부 서비스
									입니다.</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Portfolio Modal 4-->
	<div class="portfolio-modal modal fade" id="portfolioModal4"
		tabindex="-1" aria-labelledby="portfolioModal4" aria-hidden="true">
		<div class="modal-dialog modal-xl">
			<div class="modal-content">
				<div class="modal-header border-0">
					<a href="#intro"></a>
					<button class="btn-close" type="button" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body text-black text-center pb-5">
					<div class="container">
						<div class="row justify-content-center">
							<div class="col-lg-8">
								<!-- Portfolio Modal - Title-->
								<h2
									class="portfolio-modal-title text-secondary text-uppercase mb-0">Chatbot</h2>
								<!-- Icon Divider-->
								<div class="divider-custom">
									<div class="divider-custom-line"></div>
									<div class="divider-custom-icon">
										<i class="fas fa-star"></i>
									</div>
									<div class="divider-custom-line"></div>
								</div>
								<!-- Portfolio Modal - Image-->
								<img class="img-fluid rounded mb-5"
									src="/resources/image/robot.png" width=150px />
								<!-- Portfolio Modal - Text-->
								<p class="mb-4">어린이들과 10대들이 금융에 대한 지식을 얻을 수 있는 챗봇 서비스 입니다.</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>