function updateStatus(rsvnId, status) {
    if (confirm(`예약 ID: ${rsvnId} 상태를 '${status}'로 변경하시겠습니까?`)) {
        fetch(`/api/reservations/${rsvnId}/status`, {
            method: 'PUT',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({ status: status })
        })
        .then(response => {
            if (response.ok) {
                alert("상태가 성공적으로 변경되었습니다.");
                location.reload();
            } else {
                alert("상태 변경에 실패했습니다.");
            }
        });
    }
}

function cancelReservation(rsvnId) {
    if (confirm(`예약 ID: ${rsvnId}를 취소하시겠습니까?`)) {
        fetch(`/api/reservations/${rsvnId}/cancel`, {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' }
        })
        .then(response => {
            if (response.ok) {
                alert("예약이 성공적으로 취소되었습니다.");
                location.reload();
            } else {
                alert("예약 취소에 실패했습니다.");
            }
        });
    }
}
