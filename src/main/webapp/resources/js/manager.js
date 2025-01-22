document.addEventListener("DOMContentLoaded", () => {
    const contextPath = document.querySelector('meta[name="contextPath"]').getAttribute("content");
    const model = document.getElementById("carwash-model");
    const form = document.getElementById("carwash-form");
    const modelTitle = document.getElementById("model-title");
    const tableBody = document.getElementById("carwash-list");

    if (!tableBody) {
        console.error("Element with ID 'carwash-list' not found.");
        return;
    }

    // 세차장 수정/추가 모델 열기
    function openModel(carwash) {
        if (!model || !modelTitle || !form) {
            console.error("Model elements not found.");
            return;
        }
        model.style.display = "block";
        modelTitle.textContent = carwash ? "세차장 정보 수정" : "세차장 추가";
        if (carwash) {
            document.getElementById("carwash-id").value = carwash.washId || "";
            document.getElementById("carwash-name").value = carwash.washName || "";
            document.getElementById("carwash-address").value = carwash.washAddr || "";
            document.getElementById("carwash-info").value = carwash.washInfo || "";
            document.getElementById("carwash-image").value = carwash.washImg || "";
            document.getElementById("carwash-phone").value = carwash.washTel || "";
            document.getElementById("carwash-hours").value = carwash.openHrs || "";
            document.getElementById("carwash-type").value = carwash.washType || "";
        } else {
            form.reset();
        }
    }

    // 모델 닫기
    document.querySelector(".close-btn").addEventListener("click", () => {
        model.style.display = "none";
    });

    // 폼 제출 (세차장 추가/수정)
    form.addEventListener("submit", async (e) => {
        e.preventDefault();
        const carwashData = {
            washId: document.getElementById("carwash-id").value || null,
            washName: document.getElementById("carwash-name").value,
            washAddr: document.getElementById("carwash-address").value,
            washInfo: document.getElementById("carwash-info").value,
            washImg: document.getElementById("carwash-image").value,
            washTel: document.getElementById("carwash-phone").value,
            openHrs: document.getElementById("carwash-hours").value,
            washType: document.getElementById("carwash-type").value,
        };

        const method = carwashData.washId ? "PUT" : "POST";
        const endpoint = carwashData.washId
            ? `${contextPath}/api/manager/carwashes/${carwashData.washId}`
            : `${contextPath}/api/manager/carwashes`;

        try {
            const response = await fetch(endpoint, {
                method,
                headers: { "Content-Type": "application/json" },
                body: JSON.stringify(carwashData),
            });
            if (!response.ok) throw new Error("Failed to save carwash");
            alert("세차장 정보가 저장되었습니다.");
            model.style.display = "none";
            fetchCarwashes();
        } catch (error) {
            console.error("Error saving carwash:", error);
            alert("저장 중 오류가 발생했습니다.");
        }
    });

    // 세차장 목록 가져오기
    async function fetchCarwashes() {
        try {
            const response = await fetch(`${contextPath}/api/manager/carwashes/user`);
            if (!response.ok) {
                console.error("Failed to fetch carwash data, Status:", response.status);
                throw new Error("Failed to fetch carwash data");
            }
            const carwashes = await response.json();
            renderCarwashList(carwashes);
        } catch (error) {
            console.error("Error fetching carwashes:", error);
        }
    }

    // 세차장 목록 렌더링
    function renderCarwashList(carwashes) {
        tableBody.innerHTML = "";
        if (!Array.isArray(carwashes) || carwashes.length === 0) {
            console.warn("No carwash data found.");
            tableBody.innerHTML = "<tr><td colspan='5'>데이터가 없습니다.</td></tr>";
            return;
        }

        carwashes.forEach((carwash) => {
            const row = document.createElement("tr");
            row.innerHTML = `
                <td>${carwash.washId}</td>
                <td>${carwash.washName}</td>
                <td>${carwash.washAddr}</td>
                <td>${carwash.washTel}</td>
                <td>
                    <button class="edit-btn" data-id="${carwash.washId}">수정</button>
                    <button class="delete-btn" data-id="${carwash.washId}">삭제</button>
                </td>
            `;
            tableBody.appendChild(row);
        });

        // 수정 버튼 이벤트 연결
        document.querySelectorAll(".edit-btn").forEach((btn) =>
            btn.addEventListener("click", (e) =>
                fetch(`${contextPath}/api/manager/carwashes/${e.target.dataset.id}`)
                    .then((res) => {
                        if (!res.ok) {
                            throw new Error("Failed to fetch carwash details");
                        }
                        return res.json();
                    })
                    .then((data) => openModel(data))
                    .catch((error) => console.error("Error fetching carwash details:", error))
            )
        );

        // 삭제 버튼 이벤트 연결
        document.querySelectorAll(".delete-btn").forEach((btn) =>
            btn.addEventListener("click", (e) => deleteCarwash(e.target.dataset.id))
        );
    }

    // 세차장 삭제
    async function deleteCarwash(id) {
        if (!confirm("정말로 삭제하시겠습니까?")) return;
        try {
            const response = await fetch(`${contextPath}/api/manager/carwashes/${id}`, {
                method: "DELETE",
            });
            if (!response.ok) throw new Error("Failed to delete carwash");
            alert("세차장이 삭제되었습니다.");
            fetchCarwashes();
        } catch (error) {
            console.error("Error deleting carwash:", error);
        }
    }

    // 초기화
    fetchCarwashes();
});
