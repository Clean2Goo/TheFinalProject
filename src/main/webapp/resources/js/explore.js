// 기본 변수 설정
let currentPage = 1;
const itemsPerPage = 6; // 한 페이지에 표시할 세차장 개수
let allCarWashes = []; // DB에서 가져온 세차장 데이터
let favoriteList = new Set(); // 즐겨찾기 상태를 저장
let markers = {}; // 마커를 저장할 객체 (key: carId)
let activeInfoWindow = null;
let map; // 전역 변수로 선언

// 리뷰 페이지네이션 변수
let currentReviewPage = 1;
const reviewsPerPage = 3;
let currentReviews = []; // 현재 팝업에 표시할 리뷰 데이터

// contextPath를 동적으로 가져오기  !! layout.jsp 에서 단 한번 선언
// const contextPath = document.querySelector('meta[name="contextPath"]')?.getAttribute('content') || '';

// 로컬 스토리지에서 즐겨찾기 로드
function loadFavoritesFromLocalStorage() {
	const storedFavorites = JSON.parse(localStorage.getItem("favoriteList"));
	if (storedFavorites) {
		favoriteList = new Set(storedFavorites);
	}
}

// 필터 이벤트 설정 함수
function setupFilterEvent() {
    const filterOptions = document.querySelectorAll(".filter-options input[type='checkbox']");
    filterOptions.forEach((checkbox) => {
        checkbox.addEventListener("change", applyFilters);
    });
}

// 필터 적용 함수
function applyFilters() {
    const selectedFilters = Array.from(document.querySelectorAll(".filter-options input[type='checkbox']:checked"))
        .map((checkbox) => checkbox.value);

    const filteredCarWashes = allCarWashes.filter((carWash) => {
        // 세차장의 WASHTYPE 데이터를 배열로 변환
        const washTypes = carWash.washType ? carWash.washType.split(',').map(type => type.trim()) : [];
        
        // 모든 선택된 필터가 세차장의 WASHTYPE에 포함되어 있는지 확인
        return selectedFilters.every((filter) => washTypes.includes(filter));
    });

    // 필터링 결과 업데이트
    displayCarWashMarkers(filteredCarWashes); // 지도 마커 업데이트
    updateRecommendedList(filteredCarWashes); // 추천 리스트 업데이트
}



// 로컬 스토리지에 즐겨찾기 저장
function saveFavoritesToLocalStorage() {
	localStorage.setItem("favoriteList", JSON.stringify([...favoriteList]));
}

// 세차장 데이터를 API로부터 가져오는 함수
async function fetchCarWashes() {
	try {
		const response = await fetch(`${contextPath}/api/carwashes`);
		if (!response.ok) throw new Error(`HTTP error! Status: ${response.status}`);
		allCarWashes = await response.json();
		initMap(); // 데이터를 가져온 후 맵 초기화
	} catch (error) {
		console.error("Failed to fetch car washes:", error);
	}
}

function initMap() {
    const container = document.getElementById("map");
    const options = {
        center: new kakao.maps.LatLng(37.5665, 126.978), // 서울 중심 좌표
        level: 7, // 초기 줌 레벨
    };

    try {
        map = new kakao.maps.Map(container, options);
        if (!map) throw new Error("Map failed to initialize.");

        // 마커 표시
        displayCarWashMarkers(allCarWashes);

        // 추천 리스트 업데이트
        updateRecommendedList(allCarWashes);

        // 페이지네이션 버튼 이벤트 등록
        setupPaginationEvents();

        // 검색 이벤트 설정 추가
        setupSearchEvent();

        // 필터 이벤트 설정 추가
        setupFilterEvent();
    } catch (error) {
        console.error("Map initialization error:", error);
    }
}

// 검색 이벤트 설정 함수
function setupSearchEvent() {
	const searchInput = document.getElementById("search");
	searchInput.addEventListener("input", function () {
		const searchTerm = this.value.trim().toLowerCase();
		const filteredCarWashes = allCarWashes.filter((carWash) => carWash.washName.toLowerCase().includes(searchTerm) || carWash.washAddr.toLowerCase().includes(searchTerm));

		// 검색 결과 업데이트
		displayCarWashMarkers(filteredCarWashes);
		updateRecommendedList(filteredCarWashes);
	});
}

// 세차장 마커를 지도에 표시하는 함수
function displayCarWashMarkers(carWashList) {
	if (!map) {
		console.error("Map is not initialized");
		return;
	}

	// 기존 마커 제거
	Object.values(markers).forEach((marker) => marker.setMap(null));
	markers = {}; // 마커 초기화

	carWashList.forEach((carWash) => {
		const markerPosition = new kakao.maps.LatLng(carWash.washLat, carWash.washLng);
		const marker = new kakao.maps.Marker({
			position: markerPosition,
			map: map,
			clickable: true,
		});

		markers[carWash.washId] = marker;

		const carWashInfo = `
            <div class="kakao-info-window">
                <strong>${carWash.washName}</strong><br/>
                <p>주소: ${carWash.washAddr}</p>
                <p>전화번호: ${carWash.washTel}</p>
            </div>`;
		const infowindow = new kakao.maps.InfoWindow({ content: carWashInfo });

		kakao.maps.event.addListener(marker, "mouseover", function () {
			if (activeInfoWindow) activeInfoWindow.close();
			infowindow.open(map, marker);
			activeInfoWindow = infowindow;
		});

		kakao.maps.event.addListener(marker, "mouseout", function () {
			infowindow.close();
			activeInfoWindow = null;
		});

		kakao.maps.event.addListener(marker, "click", function () {
			openPopup(carWash);
		});
	});
}

// 팝업을 열고 세차장 정보를 표시하는 함수
function openPopup(carWash) {
    const popup = document.getElementById("sliding-popup");

    // 데이터 채우기
    document.getElementById("popup-carwash-name").innerText = carWash.washName || "데이터없음";
    document.getElementById("popup-carwash-name").setAttribute("data-id", carWash.washId);
    document.getElementById("popup-carwash-address").innerText = carWash.washAddr || "데이터없음";
    document.getElementById("popup-carwash-phone").innerText = carWash.washTel || "데이터없음";

    const popupImage = document.getElementById("popup-carwash-image");
    popupImage.src = carWash.washImg || `${contextPath}/resources/assets/images/default-carwash.jpg`;
    popupImage.alt = carWash.washName || "세차장 이미지";

    popup.style.display = "block";
    popup.classList.add("open");

    // 상세보기 버튼 클릭 이벤트 추가
    const detailButton = document.getElementById("popup-detail-button");
    detailButton.onclick = function () {
        console.log(`Redirecting to detail page for washId: ${carWash.washId}`);
        redirectToDetailPage(carWash.washId); // 리디렉션 함수 호출
    };

    // 디버깅 로그 추가
    console.log("Popup opened with carWash:", carWash);

    // 세차장 리뷰 목록 불러오기
    fetchReviewsForCarWash(carWash.washId);
}


// 팝업을 닫는 함수
function closePopup() {
	const popup = document.getElementById("sliding-popup");
	popup.style.display = "none";
	popup.classList.remove("open");
}

document.querySelector(".close-btn").addEventListener("click", closePopup);

// 상세 페이지로 리디렉션하는 함수
function redirectToDetailPage(washId) {
    const contextPathMeta = document.querySelector('meta[name="contextPath"]');
    if (!contextPathMeta) {
        console.error("meta[name='contextPath'] 태그를 찾을 수 없습니다.");
        return;
    }

    const contextPath = contextPathMeta.getAttribute("content");
    if (!contextPath) {
        console.error("contextPath 값이 비어 있습니다.");
        return;
    }

    const redirectUrl = `${contextPath}/carwash/carWashDetail.do?washId=${washId}`;
    console.log("Redirecting to:", redirectUrl);
    window.location.href = redirectUrl; // 리디렉션
}






// 특정 세차장의 리뷰 목록 가져오기
async function fetchReviewsForCarWash(carWashId) {
	try {
		const response = await fetch(`${contextPath}/api/reviews/${carWashId}`);
		if (!response.ok) throw new Error(`Failed to fetch reviews: ${response.status}`);

		currentReviews = await response.json(); // 전체 리뷰 데이터를 클라이언트에 저장
		currentReviewPage = 1; // 리뷰 페이지 초기화
		updateReviewList();
	} catch (error) {
		console.error("Failed to fetch reviews:", error);
	}
}

// 리뷰 목록 UI 업데이트 (페이지네이션 포함)
function updateReviewList() {
	const reviewList = document.getElementById("review-list");
	reviewList.innerHTML = "";

	const totalPages = Math.ceil(currentReviews.length / reviewsPerPage);
	const startIndex = (currentReviewPage - 1) * reviewsPerPage;
	const endIndex = startIndex + reviewsPerPage;
	const reviewsToDisplay = currentReviews.slice(startIndex, endIndex);

	reviewsToDisplay.forEach((review) => {
		const userImg = review.userImg || `${contextPath}/resources/assets/images/profile.png`;

		const reviewItem = document.createElement("div");
		reviewItem.classList.add("review-item");
		reviewItem.innerHTML = `
            <div class="review-header">
                <img src="${userImg}" alt="프로필 이미지" class="profile-img">
                <div>
                    <p class="username">${review.userId || "익명 사용자"}</p>
                    <p class="review-date">${new Date(review.crtDate).toLocaleString()}</p>
                </div>
            </div>
            <p class="review-content">${review.content}</p>
            <p class="review-score">점수: ${review.rwvScore}</p>
        `;
		reviewList.appendChild(reviewItem);
	});

	// 페이지네이션 버튼 활성화/비활성화
	document.getElementById("prev-review-button").disabled = currentReviewPage === 1;
	document.getElementById("next-review-button").disabled = currentReviewPage === totalPages;

	// 페이지 정보 업데이트
	document.getElementById("review-page-info").innerText = `${currentReviewPage} / ${totalPages}`;
}

// 이전 리뷰 페이지로 이동
document.getElementById("prev-review-button").addEventListener("click", () => {
	if (currentReviewPage > 1) {
		currentReviewPage--;
		updateReviewList();
	}
});

// 다음 리뷰 페이지로 이동
document.getElementById("next-review-button").addEventListener("click", () => {
	const totalPages = Math.ceil(currentReviews.length / reviewsPerPage);
	if (currentReviewPage < totalPages) {
		currentReviewPage++;
		updateReviewList();
	}
});

// 추천 세차장 리스트를 업데이트하는 함수
function updateRecommendedList(carWashList) {
    const recommendedList = document.getElementById("recommended-list");
    recommendedList.innerHTML = ""; // 기존 리스트 초기화

    if (carWashList.length === 0) {
        recommendedList.innerHTML = "<p>추천할 세차장이 없습니다.</p>";
        return;
    }

    const totalPages = Math.ceil(carWashList.length / itemsPerPage);
    const startIndex = (currentPage - 1) * itemsPerPage;
    const endIndex = startIndex + itemsPerPage;
    const currentCarWashes = carWashList.slice(startIndex, endIndex);

    currentCarWashes.forEach((carWash) => {
        const carWashCard = document.createElement("div");
        carWashCard.classList.add("recommend-item");

        const isFavorite = favoriteList.has(carWash.washId) ? "active" : "";

        carWashCard.innerHTML = `
            <div class="recommend-item-content">
                <h3>${carWash.washName}</h3>
                <p>주소: ${carWash.washAddr || "정보 없음"}</p>
                <p>전화번호: ${carWash.washTel || "정보 없음"}</p>
                <p>영업시간: ${carWash.openHrs || "정보 없음"}</p>
                <button id="favorite-${carWash.washId}" class="favorite-button ${isFavorite}">
                    <span class="star-icon">★</span>
                </button>
            </div>`;

        // 즐겨찾기 버튼의 클릭 이벤트 처리
        const favoriteButton = carWashCard.querySelector(`#favorite-${carWash.washId}`);
        favoriteButton.addEventListener("click", (event) => {
            event.stopPropagation(); // 클릭 이벤트 버블링 중단
            toggleFavorite(carWash.washId); // 즐겨찾기 토글
        });

        // 세차장 카드를 클릭했을 때 지도 이동 및 확대
        carWashCard.addEventListener("click", (e) => {
            e.preventDefault();

            // 지도 중심 이동
            const targetPosition = new kakao.maps.LatLng(carWash.washLat, carWash.washLng);
            map.setLevel(2); // 줌 레벨을 4로 설정 (더 가까운 확대)
            map.setCenter(targetPosition);

            // 마커 클릭과 동일한 팝업 열기
            openPopup(carWash);
        });

        recommendedList.appendChild(carWashCard);
    });

    // 페이지네이션 버튼 업데이트
    const pagination = document.getElementById("pagination");
    pagination.innerHTML = `
        <button class="pagination-button" id="prevPage" ${currentPage === 1 ? "disabled" : ""}>이전</button>
        <span class="pagination-info">페이지 ${currentPage} / ${totalPages}</span>
        <button class="pagination-button" id="nextPage" ${currentPage === totalPages ? "disabled" : ""}>다음</button>`;

    // 페이지네이션 버튼 이벤트 설정
    setupPaginationEvents();
}



function redirectToReservation(carWashId) {
	window.location.href = `${contextPath}/reservation.do?carWashId=${carWashId}`;
}

// 페이지 변경 함수
function changePage(direction) {
	currentPage += direction;
	updateRecommendedList(allCarWashes);
}

// 페이지네이션 이벤트 설정
function setupPaginationEvents() {
	document.getElementById("prevPage").addEventListener("click", () => changePage(-1));
	document.getElementById("nextPage").addEventListener("click", () => changePage(1));
}

// 초기화 및 데이터 로드
document.addEventListener("DOMContentLoaded", async () => {
	try {
		// 로그인된 사용자의 즐겨찾기 데이터 불러오기
		const response = await fetch(`${contextPath}/api/favorites`);
		if (response.ok) {
			const favorites = await response.json();
			favoriteList = new Set(favorites.map((fav) => fav.washId)); // 현재 사용자 즐겨찾기 로드
			updateFavoriteUI(); // UI 업데이트
		} else {
			console.error("Failed to load favorites");
		}
	} catch (error) {
		console.error("Error loading favorites:", error);
	}

	// 세차장 데이터 로드
	await fetchCarWashes();
});

// 즐겨찾기 토글 함수
async function toggleFavorite(washId) {
	const isFavorite = favoriteList.has(washId);
	const endpoint = isFavorite ? `${contextPath}/api/favorites/remove` : `${contextPath}/api/favorites/add`;

	try {
		const response = await fetch(endpoint, {
			method: "POST",
			headers: { "Content-Type": "application/json" },
			body: JSON.stringify({ washId }),
			credentials: "include", // 세션 쿠키 포함
		});

		if (response.ok) {
			if (isFavorite) {
				favoriteList.delete(washId);
			} else {
				favoriteList.add(washId);
			}
			updateFavoriteButton(washId); // UI 업데이트
			alert(isFavorite ? "즐겨찾기가 삭제되었습니다." : "즐겨찾기가 추가되었습니다.");
		} else if (response.status === 401) {
			alert("로그인이 필요합니다. 로그인 후 다시 시도해주세요.");
		} else {
			const errorMsg = await response.text();
			console.error("Error toggling favorite:", errorMsg);
			alert("즐겨찾기 작업 중 문제가 발생했습니다.");
		}
	} catch (error) {
		console.error("Error toggling favorite:", error);
		alert("네트워크 오류가 발생했습니다.");
	}
}

// 즐겨찾기 버튼 UI 업데이트
function updateFavoriteButton(washId) {
	const favoriteButton = document.getElementById(`favorite-${washId}`);
	if (favoriteList.has(washId)) {
		favoriteButton.classList.add("active");
		favoriteButton.innerText = "★";
	} else {
		favoriteButton.classList.remove("active");
		favoriteButton.innerText = "☆";
	}
}

// 초기화 시 전체 즐겨찾기 상태 UI 반영
function updateFavoriteUI() {
	allCarWashes.forEach((carWash) => {
		const favoriteButton = document.getElementById(`favorite-${carWash.washId}`);
		if (favoriteButton) {
			updateFavoriteButton(carWash.washId);
		}
	});
}