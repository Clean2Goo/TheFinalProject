document.addEventListener("DOMContentLoaded", async () => {
    const contextPath = document.querySelector('meta[name="contextPath"]').getAttribute("content");
    const favoriteListContainer = document.getElementById("favorite-list");

    try {
        const response = await fetch(`${contextPath}/api/favorites`);
        if (!response.ok) throw new Error("즐겨찾기 목록을 가져오는데 실패했습니다.");

        const favorites = await response.json();
        renderFavorites(favorites);
    } catch (error) {
        console.error("Error loading favorite list:", error);
        favoriteListContainer.innerHTML = "<p>즐겨찾기를 불러오는 중 오류가 발생했습니다.</p>";
    }
});


function renderFavorites(favorites) {
    const favoriteListContainer = document.getElementById("favorite-list");
    const contextPath = document.querySelector('meta[name="contextPath"]').getAttribute("content");
    favoriteListContainer.innerHTML = ""; 

    if (favorites.length === 0) {
        favoriteListContainer.innerHTML = "<p>즐겨찾기가 없습니다.</p>";
        return;
    }

    favorites.forEach((favorite) => {
        const favoriteItem = document.createElement("div");
        favoriteItem.classList.add("favorite-item");

        favoriteItem.innerHTML = `
            <div class="favorite-card">
                <div class="clickable-area" onclick="redirectToDetailPage('${favorite.washId}')">
                    <img src="${favorite.washImg || `${contextPath}/resources/assets/images/default-carwash.jpg`}" 
                         alt="${favorite.washName || "이미지 없음"}" 
                         class="favorite-image">
                    <div class="favorite-info">
                        <h2>${favorite.washName || "이름 없음"}</h2>
                        <p>주소: ${favorite.washAddr || "주소 없음"}</p>
                        <p>전화번호: ${favorite.washTel || "전화번호 없음"}</p>
                    </div>
                </div>
                <div class="favorite-actions">
                    <button class="remove-favorite-btn" onclick="removeFavorite('${favorite.washId}')">즐겨찾기 삭제</button>
                    <button class="reserve-favorite-btn" onclick="redirectToReservationPage('${favorite.washId}')">예약하기</button>
                </div>
            </div>
        `;

        favoriteListContainer.appendChild(favoriteItem);
    });
}


async function removeFavorite(washId) {
    const contextPath = document.querySelector('meta[name="contextPath"]').getAttribute("content");
    try {
        const response = await fetch(`${contextPath}/api/favorites/remove`, {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify({ washId }),
            credentials: "include",
        });

        if (response.ok) {
            alert("즐겨찾기가 삭제되었습니다.");
            location.reload();
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

    fetch(`${contextPath}/carwash/reservationStep1.do`, {
        method: "POST",
        headers: { "Content-Type": "application/x-www-form-urlencoded" },
        body: new URLSearchParams({ washId }),
        credentials: "include"
    })
    .then((response) => {
        if (response.redirected) {
            // 서버가 리디렉션을 반환하면 해당 URL로 이동
            window.location.href = response.url;
        } else if (response.ok) {
            // 수동으로 페이지 이동 처리
            return response.text();
        } else {
            throw new Error("예약 요청 실패");
        }
    })
    .then((html) => {
        if (html) {
            // 서버가 HTML 페이지를 반환한 경우, 현재 페이지를 새로운 HTML로 덮어쓰기
            document.open();
            document.write(html);
            document.close();
        }
    })
    .catch((error) => {
        console.error("예약 처리 중 오류 발생:", error);
        alert("예약 처리 중 문제가 발생했습니다.");
    });
}
function redirectToDetailPage(washId) {
    const contextPath = document.querySelector('meta[name="contextPath"]').getAttribute("content");
    window.location.href = `${contextPath}/carwash/carWashDetail.do?washId=${washId}`;
}
