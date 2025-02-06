document.addEventListener('DOMContentLoaded', function () {
    document.body.addEventListener('click', function (event) {
        if (event.target.classList.contains('update-status')) {
            const rsvnId = event.target.dataset.rsvnid;
            const status = event.target.dataset.status;

            if (status === '이용완료') {
                updateStatus(rsvnId, status);
            } else if (status === '예약취소') {
                cancelReservation(rsvnId);
            }
        }
    });
});

function updateStatus(rsvnId, status) {
    fetch(`/myapp/admin/updateStatus`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
        body: `rsvnId=${rsvnId}&status=${status}`
    })
    .then(response => response.text())
    .then(result => {
        if (result === 'success') {
            document.getElementById(`status-${rsvnId}`).innerText = status;
            alert(`'${status}'로 상태가 성공적으로 변경되었습니다.`);
        } else {
            alert('상태 변경에 실패했습니다.');
        }
    })
    .catch(() => {
        alert('서버 오류가 발생했습니다.');
    });
}

function cancelReservation(rsvnId) {
    fetch(`/myapp/admin/updateStatus`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
        body: `rsvnId=${rsvnId}&status=예약취소`
    })
    .then(response => response.text())
    .then(result => {
        if (result === 'success') {
            document.getElementById(`status-${rsvnId}`).innerText = '예약취소';
            document.getElementById(`cancel-${rsvnId}`).innerText = '취소됨';
            alert("예약이 성공적으로 취소되었습니다.");
        } else {
            alert("예약 취소에 실패했습니다.");
        }
    })
    .catch(() => {
        alert('서버 오류가 발생했습니다.');
    });
}
