document.addEventListener("DOMContentLoaded", () => {
    const contextPath = document.querySelector('meta[name="contextPath"]').getAttribute("content");

    // 모달 요소 가져오기
    const editModal = document.getElementById("edit-modal");
    const closeEditModal = document.getElementById("close-edit-modal");
    const editForm = document.getElementById("edit-form");
    const editContent = document.getElementById("edit-content");
    const editScore = document.getElementById("edit-score");

    let currentReviewId = null; // 수정할 리뷰 ID 저장

    // 모달 닫기 이벤트
    closeEditModal.addEventListener("click", () => {
        editModal.style.display = "none";
        editForm.reset();
    });

    // 리뷰 데이터를 불러오는 함수
    async function fetchReviews() {
        try {
            const response = await fetch(`${contextPath}/api/reviews/myReviews`);
            const reviews = await response.json();
            console.log("Fetched Reviews:", reviews); // 응답 데이터 로그 출력
            renderReviewList(reviews);
        } catch (error) {
            console.error("Error fetching reviews:", error);
            alert(`리뷰 데이터를 불러오는 중 문제가 발생했습니다: ${error.message}`);
        }
    }

    // 리뷰 데이터를 렌더링하는 함수
    function renderReviewList(reviews) {
        const reviewList = document.getElementById("review-list");
        reviewList.innerHTML = ""; // 기존 데이터를 초기화

        if (!reviews || reviews.length === 0) {
            reviewList.innerHTML = `<tr><td colspan="5">작성된 리뷰가 없습니다.</td></tr>`;
            return;
        }

        reviews.forEach((review) => {
            const row = document.createElement("tr");

            const formattedDate = review.crtDate
                ? new Date(review.crtDate).toLocaleDateString()
                : "작성일 없음";

            row.innerHTML = `
                <td>${review.washName || "세차장 이름 없음"}</td>
                <td>${review.content || "내용 없음"}</td>
                <td>${review.rwvScore || "평점 없음"}점</td>
                <td>${formattedDate}</td>
                <td>
                    <button class="edit-button" data-id="${review.rwId}">수정</button>
                    <button class="delete-button" data-id="${review.rwId}">삭제</button>
                </td>
            `;
            reviewList.appendChild(row);
        });

        attachEventListeners();
    }

    // 수정 및 삭제 버튼에 이벤트 리스너 추가
    function attachEventListeners() {
        document.querySelectorAll(".edit-button").forEach((button) => {
            button.addEventListener("click", handleEdit);
        });
        document.querySelectorAll(".delete-button").forEach((button) => {
            button.addEventListener("click", handleDelete);
        });
    }

    // 리뷰 수정 핸들러
    function handleEdit(event) {
        currentReviewId = event.target.getAttribute("data-id");
        const reviewRow = event.target.closest("tr");

        // 기존 리뷰 데이터 가져오기
        const existingContent = reviewRow.querySelector("td:nth-child(2)").textContent.trim();
        const existingScore = reviewRow.querySelector("td:nth-child(3)").textContent.trim().replace("점", "");

        // 모달에 데이터 설정
        editContent.value = existingContent;
        editScore.value = existingScore;

        // 모달 표시
        editModal.style.display = "block";
    }

    // 수정 요청 보내기
    editForm.addEventListener("submit", async (event) => {
        event.preventDefault();

        const newContent = editContent.value.trim();
        const newScore = parseInt(editScore.value.trim(), 10);

        if (!newContent || !newScore || isNaN(newScore) || newScore < 1 || newScore > 5) {
            alert("유효한 데이터를 입력하세요.");
            return;
        }

        const updatedReview = {
            content: newContent,
            rwvScore: newScore,
        };

        try {
            const response = await fetch(`${contextPath}/api/reviews/${currentReviewId}`, {
                method: "PUT",
                headers: {
                    "Content-Type": "application/json",
                },
                body: JSON.stringify(updatedReview),
            });

            if (!response.ok) {
                const errorMessage = await response.text();
                throw new Error(`리뷰 수정 실패: ${errorMessage}`);
            }

            alert("리뷰가 수정되었습니다.");
            fetchReviews(); // 새로고침
            editModal.style.display = "none"; // 모달 닫기
            editForm.reset(); // 폼 초기화
        } catch (error) {
            console.error("Error updating review:", error);
            alert(`리뷰 수정 중 문제가 발생했습니다: ${error.message}`);
        }
    });

    // 리뷰 삭제 핸들러
    function handleDelete(event) {
        const reviewId = event.target.getAttribute("data-id");
        const confirmDelete = confirm("이 리뷰를 삭제하시겠습니까?");
        if (confirmDelete) {
            deleteReview(reviewId);
        }
    }

    // 리뷰 삭제 요청
    async function deleteReview(reviewId) {
        try {
            const response = await fetch(`${contextPath}/api/reviews/${reviewId}`, {
                method: "DELETE",
            });

            if (!response.ok) {
                const errorMessage = await response.text();
                throw new Error(`리뷰 삭제 실패: ${errorMessage}`);
            }

            alert("리뷰가 삭제되었습니다.");
            fetchReviews(); // 새로고침
        } catch (error) {
            console.error("Error deleting review:", error);
            alert(`리뷰 삭제 중 문제가 발생했습니다: ${error.message}`);
        }
    }

    // 초기 리뷰 데이터를 로드
    fetchReviews();
});
