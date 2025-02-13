document.addEventListener("DOMContentLoaded", () => {
	// const contextPath = document.querySelector('meta[name="contextPath"]').getAttribute('content') || '';
	const reviewPopup = document.getElementById("review-popup");
	const closeReviewPopup = document.getElementById("close-review-popup");
	const reviewForm = document.getElementById("review-form");
	const reviewList = document.getElementById("review-list");
	const prevReviewButton = document.getElementById("prev-review-button");
	const nextReviewButton = document.getElementById("next-review-button");
	const reviewPageInfo = document.getElementById("review-page-info");

	let currentReviews = [];
	let currentReviewPage = 1;
	const reviewsPerPage = 3;
	let currentReviewButton = null;

	// 팝업 닫기
	closeReviewPopup.addEventListener("click", () => {
		reviewPopup.style.display = "none";
	});

	// 특정 예약 ID(rsvId2)의 리뷰 존재 여부 확인
	async function checkReviewStatus(rsvId2, button) {
		try {
			const response = await fetch(`${contextPath}/api/reviews/${rsvId2}/exists`);
			if (!response.ok) throw new Error("Failed to check review status");
			const exists = await response.json();
			const label = button.querySelector(".label"); // beaver 버튼 내의 span 요소 선택

			label.textContent = exists ? "작성 완료" : "리뷰 작성";
			button.disabled = exists;
			button.classList.toggle("primary", !exists);
			button.classList.toggle("disabled", exists);
		} catch (error) {
			console.error("Error checking review status:", error);
		}
	}

	// 리뷰 작성 팝업 열기
	function openReviewPopup(rsvId2, washName, button) {
		const washNameElement = document.getElementById("popup-wash-name");
		const reservationIdInput = document.getElementById("popup-reservation-id");

		if (!washNameElement || !reservationIdInput) {
			console.error("팝업 관련 요소가 존재하지 않습니다.");
			return;
		}

		washNameElement.innerText = `${washName} 리뷰 작성`;
		reservationIdInput.value = rsvId2;
		reviewPopup.style.display = "block";

		currentReviewButton = button;
		fetchReviewsForRsvId2(rsvId2);
	}

	// 특정 예약 ID(rsvId2)의 리뷰 가져오기
	async function fetchReviewsForRsvId2(rsvId2) {
		try {
			const response = await fetch(`${contextPath}/api/reviews/byRsvId2/${rsvId2}`);
			if (!response.ok) throw new Error("Failed to fetch reviews");
			currentReviews = await response.json();
			currentReviewPage = 1;
			updateReviewList();
		} catch (error) {
			console.error("Error fetching reviews:", error);
		}
	}

	// 리뷰 리스트 업데이트 (페이지네이션)
	function updateReviewList() {
		reviewList.innerHTML = "";
		const start = (currentReviewPage - 1) * reviewsPerPage;
		const end = start + reviewsPerPage;
		const reviewsToDisplay = currentReviews.slice(start, end);

		reviewsToDisplay.forEach((review) => {
			const listItem = document.createElement("li");
			listItem.textContent = `${review.content} - ${review.rwvScore}점`;
			reviewList.appendChild(listItem);
		});

		const totalPages = Math.ceil(currentReviews.length / reviewsPerPage);
		prevReviewButton.disabled = currentReviewPage === 1;
		nextReviewButton.disabled = currentReviewPage === totalPages;
		reviewPageInfo.textContent = `${currentReviewPage} / ${totalPages}`;
	}

	prevReviewButton.addEventListener("click", () => {
		if (currentReviewPage > 1) {
			currentReviewPage--;
			updateReviewList();
		}
	});

	nextReviewButton.addEventListener("click", () => {
		const totalPages = Math.ceil(currentReviews.length / reviewsPerPage);
		if (currentReviewPage < totalPages) {
			currentReviewPage++;
			updateReviewList();
		}
	});

	// 리뷰 삭제
	async function deleteReview(reviewId, rsvId2, button) {
		try {
			const response = await fetch(`${contextPath}/api/reviews/${reviewId}`, { method: "DELETE" });

			if (response.ok) {
				alert("리뷰가 삭제되었습니다.");
				fetchReviewsForRsvId2(rsvId2);
				checkReviewStatus(rsvId2, button);
			} else {
				const error = await response.text();
				throw new Error(`리뷰 삭제 실패: ${error}`);
			}
		} catch (error) {
			console.error("Error deleting review:", error);
			alert(`리뷰 삭제 중 문제가 발생했습니다: ${error.message}`);
		}
	}

	// 리뷰 작성
	reviewForm.addEventListener("submit", async (event) => {
		event.preventDefault();
		const rsvId2Input = document.getElementById("popup-reservation-id");
		const rsvId2 = rsvId2Input ? rsvId2Input.value : null;
		const reviewContent = document.getElementById("review-content").value.trim();
		const reviewScore = document.getElementById("review-score").value;

		if (!rsvId2 || !reviewContent || !reviewScore) {
			alert("예약 정보가 없거나, 리뷰 내용을 작성하고 점수를 선택해주세요.");
			return;
		}

		const reviewData = {
			rsvId2: rsvId2,
			rwvScore: parseInt(reviewScore, 10),
			content: reviewContent,
			crtDate: new Date().toISOString(),
		};

		try {
			const response = await fetch(`${contextPath}/api/reviews`, {
				method: "POST",
				headers: { "Content-Type": "application/json" },
				body: JSON.stringify(reviewData),
			});

			if (response.ok) {
				alert("리뷰가 성공적으로 저장되었습니다.");
				reviewPopup.style.display = "none";
				reviewForm.reset();
				fetchReviewsForRsvId2(rsvId2);

				if (currentReviewButton) {
					checkReviewStatus(rsvId2, currentReviewButton);
				}
			} else {
				const error = await response.text();
				console.error("Failed to submit review:", error);
				alert("리뷰 저장에 실패했습니다.");
			}
		} catch (error) {
			console.error("Error submitting review:", error);
		}
	});

	// 리뷰 버튼 이벤트 처리
	document.querySelectorAll(".review-button").forEach((button) => {
		const rsvId2 = button.getAttribute("data-reservation-id2");
		checkReviewStatus(rsvId2, button);
	});

	document.addEventListener("click", (event) => {
		const button = event.target.closest(".review-button");
		if (button) {
			const rsvId2 = button.getAttribute("data-reservation-id2");
			const washName = button.getAttribute("data-wash-name");
			openReviewPopup(rsvId2, washName, button);
		}
	});
});
