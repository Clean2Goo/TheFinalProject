document.addEventListener("DOMContentLoaded", () => {
    const contextPath = document.querySelector('meta[name="contextPath"]').getAttribute('content') || '';
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

    closeReviewPopup.addEventListener("click", () => {
        reviewPopup.style.display = "none";
    });

    async function checkReviewStatus(washId, button) {
        try {
            const response = await fetch(`${contextPath}/api/reviews/${washId}/exists?timestamp=${new Date().getTime()}`);
            if (!response.ok) throw new Error("Failed to check review status");
            const exists = await response.json();

            if (exists) {
                button.textContent = "작성 완료";
                button.disabled = true;
                button.classList.remove("primary");
                button.classList.add("disabled");
            } else {
                button.textContent = "리뷰 작성";
                button.disabled = false;
                button.classList.remove("disabled");
                button.classList.add("primary");
            }
        } catch (error) {
            console.error("Error checking review status:", error);
        }
    }

    function openReviewPopup(washId, washName, button) {
        const washNameElement = document.getElementById("popup-wash-name");
        const reservationIdInput = document.getElementById("popup-reservation-id");

        if (!washNameElement || !reservationIdInput) {
            console.error("Required elements for the popup are missing.");
            return;
        }

        washNameElement.innerText = `${washName} 리뷰 작성`;
        reservationIdInput.value = washId;
        reviewPopup.style.display = "block";

        currentReviewButton = button;
        fetchReviewsForWash(washId);
    }

    async function fetchReviewsForWash(washId) {
        try {
            const response = await fetch(`${contextPath}/api/reviews/${washId}`);
            if (!response.ok) throw new Error("Failed to fetch reviews");
            currentReviews = await response.json();
            currentReviewPage = 1;
            updateReviewList();
        } catch (error) {
            console.error("Error fetching reviews:", error);
        }
    }

    function updateReviewList() {
        reviewList.innerHTML = '';
        const start = (currentReviewPage - 1) * reviewsPerPage;
        const end = start + reviewsPerPage;
        const reviewsToDisplay = currentReviews.slice(start, end);

        reviewsToDisplay.forEach(review => {
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

    async function deleteReview(reviewId, washId, button) {
        try {
            const response = await fetch(`${contextPath}/api/reviews/${reviewId}`, {
                method: "DELETE",
            });

            if (response.ok) {
                alert("리뷰가 삭제되었습니다.");
                fetchReviewsForWash(washId);
                checkReviewStatus(washId, button);
            } else {
                const error = await response.text();
                throw new Error(`리뷰 삭제 실패: ${error}`);
            }
        } catch (error) {
            console.error("Error deleting review:", error);
            alert(`리뷰 삭제 중 문제가 발생했습니다: ${error.message}`);
        }
    }

    reviewForm.addEventListener("submit", async (event) => {
        event.preventDefault();
        const washId = document.getElementById("popup-reservation-id").value;
        const reviewContent = document.getElementById("review-content").value;
        const reviewScore = document.getElementById("review-score").value;

        if (!reviewContent.trim() || !reviewScore) {
            alert("리뷰 내용을 작성하고 점수를 선택해주세요.");
            return;
        }

        const reviewData = {
            rsvId: washId,
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
                fetchReviewsForWash(washId);

                if (currentReviewButton) {
                    currentReviewButton.textContent = "작성 완료";
                    currentReviewButton.disabled = true;
                    currentReviewButton.classList.remove("primary");
                    currentReviewButton.classList.add("disabled");
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

    const reviewButtons = document.querySelectorAll(".review-button");
    reviewButtons.forEach(button => {
        const washId = button.getAttribute("data-wash-id");
        checkReviewStatus(washId, button);
    });

    document.addEventListener("click", (event) => {
        const button = event.target.closest(".review-button");
        if (button) {
            const washId = button.getAttribute("data-wash-id");
            const washName = button.getAttribute("data-wash-name");
            openReviewPopup(washId, washName, button);
        }
    });
});