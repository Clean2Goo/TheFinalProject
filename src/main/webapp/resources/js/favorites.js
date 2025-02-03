document.addEventListener("DOMContentLoaded", async () => {
    const contextPath = document.querySelector('meta[name="contextPath"]').getAttribute("content");
    const favoriteListContainer = document.getElementById("favorite-list");

    try {
        // API를 통해 즐겨찾기 목록 가져오기
        const response = await fetch(`${contextPath}/api/favorites`);
        if (!response.ok) {
            throw new Error("즐겨찾기 목록을 가져오는데 실패했습니다.");
        }

        const favorites = await response.json(); // API로부터 즐겨찾기 목록 데이터 받기
        renderFavorites(favorites); // 목록 렌더링
    } catch (error) {
        console.error("Error loading favorite list:", error);
        favoriteListContainer.innerHTML = "<p>즐겨찾기를 불러오는 중 오류가 발생했습니다.</p>";
    }
});

// 즐겨찾기 목록 렌더링 함수
function renderFavorites(favorites) {
    const favoriteListContainer = document.getElementById("favorite-list");
    favoriteListContainer.innerHTML = ""; // 기존 목록 초기화

    if (favorites.length === 0) {
        favoriteListContainer.innerHTML = "<p>즐겨찾기가 없습니다.</p>";
        return;
    }

    favorites.forEach((favorite) => {
        const favoriteItem = document.createElement("div");
        favoriteItem.classList.add("favorite-item");
        favoriteItem.innerHTML = `
            <div class="favorite-card">
                <img src="${favorite.washImg || `${contextPath}/resources/assets/images/default-carwash.jpg`}" 
                     alt="${favorite.washName || "이미지 없음"}" 
                     class="favorite-image">
                <div class="favorite-info">
                    <h2>${favorite.washName || "이름 없음"}</h2>
                    <p>주소: ${favorite.washAddr || "주소 없음"}</p>
                    <p>전화번호: ${favorite.washTel || "전화번호 없음"}</p>
                </div>
                <button class="remove-favorite-btn" onclick="removeFavorite('${favorite.washId}')">즐겨찾기 삭제</button>
                <button class="reserve-favorite-btn" onclick="redirectToReservationPage('${favorite.washId}')">예약하기</button>
            </div>
        `;

        // 상세 페이지로 이동 이벤트 추가
        favoriteItem.addEventListener("click", () => {
            redirectToDetailPage(favorite.washId); // 상세 페이지로 이동
        });

        favoriteListContainer.appendChild(favoriteItem);
    });
}

// 즐겨찾기 삭제 함수
async function removeFavorite(washId) {
    const contextPath = document.querySelector('meta[name="contextPath"]').getAttribute("content");
    try {
        const response = await fetch(`${contextPath}/api/favorites/remove`, {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify({ washId }),
            credentials: "include", // 세션 쿠키 포함
        });

        if (response.ok) {
            alert("즐겨찾기가 삭제되었습니다.");
            location.reload(); // 페이지 새로고침하여 목록 갱신
        } else {
            const errorMsg = await response.text();
            console.error("Error removing favorite:", errorMsg);
            alert("즐겨찾기 삭제 중 오류가 발생했습니다.");
        }
    } catch (error) {
        console.error("Error removing favorite:", error);
        alert("네트워크 오류가 발생했습니다.");
    }
}

function redirectToReservationPage(washId) {
    const contextPath = document.querySelector('meta[name="contextPath"]').getAttribute("content");
    const redirectUrl = `${contextPath}/carwash/reservationStep1.do`;

    fetch(redirectUrl, {
        method: "POST",
        headers: {
            "Content-Type": "application/x-www-form-urlencoded",
        },
        body: new URLSearchParams({ washId }),
    })
    .then((response) => {
        if (response.redirected) {
            window.location.href = response.url; // 서버에서 리디렉션된 URL로 이동
        } else {
            console.log("POST request succeeded without redirection.");
        }
    })
    .catch((error) => {
        console.error("Error during reservation POST request:", error);
        alert("예약 처리 중 오류가 발생했습니다.");
    });
}


// 상세 페이지로 리디렉션하는 함수
function redirectToDetailPage(washId) {
    const contextPath = document.querySelector('meta[name="contextPath"]').getAttribute("content");
    window.location.href = `${contextPath}/carwash/carWashDetail.do?washId=${washId}`;
}