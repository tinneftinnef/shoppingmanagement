document.getElementById('registrationForm').addEventListener('submit', function (event) {
    var password1 = document.getElementById('registerPassword').value;
    var password2 = document.getElementById('registerPasswordReInput').value;

    if (password1 !== password2) {
        alert("Mật khẩu không khớp. Vui lòng nhập lại.");
        event.preventDefault(); // Ngăn form gửi dữ liệu
    }
});

function hideAlterts() {
    setTimeout(function () {
        var alertDiv = document.getElementById('alertDiv');
        if (alertDiv) {
            alertDiv.style.display = 'none';
        }
        var alertEmailDiv = document.getElementById('alertEmailDiv');
        if (alertEmailDiv) {
            alertEmailDiv.style.display = 'none';
        }

        var userAndEmailDiv = document.getElementById('userAndEmailDiv');
        if (userAndEmailDiv) {
            userAndEmailDiv.style.display = 'none';
        }
        var mess = document.getElementById('mess');
        if (mess) {
            mess.style.display = 'none';
        }
        
    }, 3000);
}
window.onload = hideAlterts;