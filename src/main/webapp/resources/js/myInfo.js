document.addEventListener("DOMContentLoaded", () => {
    const modal = document.getElementById("edit-modal");
    const closeModal = document.getElementById("close-edit-modal");
    const editForm = document.getElementById("edit-form");
    
    const currentPassword = document.getElementById("current-password");
    const newPassword = document.getElementById("new-password");
    const confirmPassword = document.getElementById("confirm-password");
    
    document.querySelector(".edit-btn").addEventListener("click", () => {
        modal.style.display = "block";
    });
    
    closeModal.addEventListener("click", () => {
        modal.style.display = "none";
        editForm.reset();
    });
    
    editForm.addEventListener("submit", async (event) => {
        event.preventDefault();
        
        if (newPassword.value !== confirmPassword.value) {
            alert("새 비밀번호가 일치하지 않습니다.");
            return;
        }
        
        const payload = {
            currentPassword: currentPassword.value,
            newPassword: newPassword.value,
        };
        
        try {
            const response = await fetch("/member/updatePassword", {
                method: "POST",
                headers: { "Content-Type": "application/json" },
                body: JSON.stringify(payload)
            });
            
            if (!response.ok) {
                throw new Error("비밀번호 변경에 실패했습니다.");
            }
            
            alert("비밀번호가 성공적으로 변경되었습니다.");
            modal.style.display = "none";
            editForm.reset();
        } catch (error) {
            alert(error.message);
        }
    });
});

function openPasswordModal() {
    document.getElementById("edit-modal").style.display = "block";
}
