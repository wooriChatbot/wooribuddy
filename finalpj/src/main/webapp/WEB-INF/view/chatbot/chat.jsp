<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Chatbot</title>
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>



<body id="page-top" style="background-color: #eee;">
	<!-- Navigation-->
	<%@include file="/WEB-INF/view/include/nav.jsp"%>
	<section style="background-color: #eee;">
		<div class="container py-5">

			<div class="row d-flex justify-content-center">
				<div class="col-md-8 col-lg-6 col-xl-4">
					<div class="card" id="chat1" style="border-radius: 15px;">

						<div
							class="card-header d-flex justify-content-between align-items-center p-3 bg-info text-white border-bottom-0"
							style="border-top-left-radius: 15px; border-top-right-radius: 15px;">
							<!-- <i class="fas fa-angle-left"></i> -->
							<p class="mb-0 fw-bold">WOORI BUDDY chatbot</p>
							<a href="/" type=button
								style="color: white; size =15px; text-decoration-line: none;">X</a>
						</div>

						<div class="card-body">

							<div class="d-flex flex-row justify-content-start mb-4">
								<img src="/resources/image/woori_robot.png" alt="avatar 1"
									style="width: 45px; height: 100%;">
								<div class="p-3 ms-3"
									style="border-radius: 15px; background-color: rgba(57, 192, 237, .2);">
									<p class="small mb-0">
										안녕하세요. WOORI BUDDY chatbot 입니다.<br> 궁금한 점이 있으신가요?
									</p>
								</div>
							</div>

							<c:if test="${!empty chatMessages}">
								<c:forEach items="${chatMessages}" var="message">
									<div class="chat-container">
										<c:choose>
											<c:when test="${message.sender eq 'user'}">
												<!-- User message -->
												<div class="d-flex flex-row justify-content-end mb-4">
													<div class="p-3 me-3 border"
														style="border-radius: 15px; background-color: #fbfbfb;">
														<p class="small mb-0">${message.content}</p>
													</div>
												</div>
											</c:when>
											<c:when test="${message.sender eq 'chatbot'}">
												<!-- Chatbot message -->
												<div class="d-flex flex-row justify-content-start mb-4"
													id="chat-message">
													<img src="/resources/image/woori_robot.png" alt="avatar 1"
														style="width: 45px; height: 100%;">
													<div class="p-3 ms-3"
														style="border-radius: 15px; background-color: rgba(57, 192, 237, .2);">
														<p class="small mb-0">${message.content}</p>
													</div>
												</div>
												<div class="d-flex flex-row justify-content-start mb-4">
													<img src="/resources/image/woori_robot.png" alt="avatar 1"
														style="width: 45px; height: 100%;">
													<div class="p-3 ms-3"
														style="border-radius: 15px; background-color: rgba(57, 192, 237, .2);">
														<p class="small mb-0">추가 답변이 필요하신가요?</p>

														<form action="/chatbot/gpt" method="post">
															<input type="hidden" name="question"
																value='${QAresponse }' />
															<input type="hidden" name="userId"
																value="${loginUser.id }" />
															<input type="hidden" name="input"
																value='${user_question }' />
															<input type="hidden" name="output"
																value='${message.content}' />
															<input type="hidden" name="bestContext"
																value='${best_context }' />
															<input type="radio" name="feedback" value="yes">
															no
															<input type="radio" name="feedback" value="no">
															yes
															<input type="submit" value="OK" id="submit"">
														</form>
													</div>
												</div>
											</c:when>

											<c:when test="${message.sender eq 'gpt'}">
												<!-- Chatbot message -->
												<div class="d-flex flex-row justify-content-start mb-4"
													id="chat-message">
													<img src="/resources/image/woori_robot.png" alt="avatar 1"
														style="width: 45px; height: 100%;">
													<div class="p-3 ms-3"
														style="border-radius: 15px; background-color: rgba(57, 192, 237, .2);">
														<p class="small mb-0">${message.content}</p>
													</div>
												</div>
											</c:when>

											<%-- Add more cases for different senders if needed --%>
										</c:choose>
									</div>
								</c:forEach>
							</c:if>



							<br>



							<div class="form-inline">
								<form action="/chatbot/chat" method="post" id="qaForm">
									<input type="text" class="form-control" id="question"
										name="question" placeholder="Type message"
										aria-label="Recipient's username"
										aria-describedby="button-addon2"
										style="width: 240px; height: 30px;" required />
									<button class="btn btn-warning" type="submit"
										id="button-addon2"
										style="border: rgba(57, 192, 237, .2); padding-top: .40rem; background-color: rgba(57, 192, 237, .2)">send</button>
								</form>
							</div>
						</div>
					</div>
				</div>
				</div>
			</div>
	</section>
</body>
</html>