function holdonOpen(theme = "sk-rect", text = "Text here", backgroundColor = "rgba(0,0,0,0.8)", textColor = "white") {
    var options = {
        theme: theme,
        message: text,
        backgroundColor: backgroundColor,
        textColor: textColor
    };
    HoldOn.open(options);
};

function holdonClose() {
    HoldOn.close();
};
function showMessage(status, message) {
    $.notify(message, status);
}

$("#submit-withdraw").on("submit", function (e) {
    e.preventDefault();
    const form = document.getElementById("submit-withdraw");
    let isValid = true;

    $(form).find("input").removeClass("border-red-700");

    $(form).find("input:not([type=hidden]):not(:disabled)").each(function () {
        const input = $(this);
        const value = input.val().trim();
        if (value === "") {
            input.removeClass("border-gray-200");
            input.addClass("border-red-700");
            isValid = false;
        }
    });

    if (isValid) {
        holdonOpen("sk-rect", "Vui lòng chờ...", "rgba(0,0,0,0.8)", "white");
        const formData = $(form).serialize();
        const url__submit = '/model/withdraw';
        $.ajax({
            url: url__submit,
            type: 'POST',
            data: formData,
            success: function (res) {
                const result = JSON.parse(res);
                holdonClose();
                showMessage(result.status, result.msg);
                if (result.status === "success") {
                    setTimeout(() => location.reload(), 1000);
                }
            }
        });
    }
});
$("#submit-login").on("submit", function (e) {
    e.preventDefault();
    const form = document.getElementById("submit-login");
    let isValid = true;

    $(form).find("input").removeClass("border-red-700");

    $(form).find("input:not([type=hidden]):not(:disabled)").each(function () {
        const input = $(this);
        const value = input.val().trim();
        if (value === "") {
            input.removeClass("border-gray-200");
            input.addClass("border-red-700");
            isValid = false;
        }
    });

    if (isValid) {
        holdonOpen("sk-rect", "Vui lòng chờ...", "rgba(0,0,0,0.8)", "white");
        const formData = $(form).serialize();
        const url__submit = '/model/login';
        $.ajax({
            url: url__submit,
            type: 'POST',
            data: formData,
            success: function (res) {
                const result = JSON.parse(res);
                holdonClose();
                showMessage(result.status, result.msg);
                if (result.status === "success") {
                    setTimeout(() => location.reload(), 2000);
                } else if (result.status == 'verify') {
                    setTimeout("location.href = '" + result.url + "';", 2000);
                }
            }
        });
    }
});
$("#submit-register").on("submit", function (e) {
    e.preventDefault();
    const form = document.getElementById("submit-register");
    let isValid = true;

    $(form).find("input").removeClass("border-red-700");

    $(form).find("input:not([type=hidden]):not(:disabled)").each(function () {
        const input = $(this);
        const value = input.val().trim();
        if (value === "") {
            input.removeClass("border-gray-200");
            input.addClass("border-red-700");
            isValid = false;
        }
    });

    if (isValid) {
        holdonOpen("sk-rect", "Vui lòng chờ...", "rgba(0,0,0,0.8)", "white");
        const formData = $(form).serialize();
        const url__submit = '/model/register';
        $.ajax({
            url: url__submit,
            type: 'POST',
            data: formData,
            success: function (res) {
                const result = JSON.parse(res);
                holdonClose();
                showMessage(result.status, result.msg);
                if (result.status === "success") {
                    setTimeout(() => location.reload(), 2000);
                }
            }
        });
    }
});

$("#submit-forgot").on("submit", function (e) {
    e.preventDefault();
    const form = document.getElementById("submit-forgot");
    let isValid = true;

    $(form).find("input").removeClass("border-red-700");

    $(form).find("input:not([type=hidden]):not(:disabled)").each(function () {
        const input = $(this);
        const value = input.val().trim();
        if (value === "") {
            input.removeClass("border-gray-200");
            input.addClass("border-red-700");
            isValid = false;
        }
    });

    if (isValid) {
        holdonOpen("sk-rect", "Vui lòng chờ...", "rgba(0,0,0,0.8)", "white");
        const formData = $(form).serialize();
        const url__submit = '/model/forgotpassword';
        $.ajax({
            url: url__submit,
            type: 'POST',
            data: formData,
            success: function (res) {
                const result = JSON.parse(res);
                holdonClose();
                showMessage(result.status, result.msg);
                if (result.status === "success") {
                    setTimeout(() => location.reload(), 2000);
                }
            }
        });
    }
});

$("#submit-update-profile").on("submit", function (e) {
    e.preventDefault();
    const form = document.getElementById("submit-update-profile");
    let isValid = true;

    $(form).find("input").removeClass("border-red-700");

    $(form).find("input:not([type=hidden]):not(:disabled)").each(function () {
        const input = $(this);
        const value = input.val().trim();
        if (value === "") {
            input.removeClass("border-gray-200");
            input.addClass("border-red-700");
            isValid = false;
        }
    });

    if (isValid) {
        holdonOpen("sk-rect", "Vui lòng chờ...", "rgba(0,0,0,0.8)", "white");
        const formData = $(form).serialize();
        const url__submit = '/model/update/info';
        $.ajax({
            url: url__submit,
            type: 'POST',
            data: formData,
            success: function (res) {
                const result = JSON.parse(res);
                holdonClose();
                showMessage(result.status, result.msg);
                if (result.status === "success") {
                    setTimeout(() => location.reload(), 2000);
                }
            }
        });
    }
});
$("#submit-changepass-profile").on("submit", function (e) {
    e.preventDefault();
    const form = document.getElementById("submit-changepass-profile");
    let isValid = true;

    $(form).find("input").removeClass("border-red-700");

    $(form).find("input:not([type=hidden]):not(:disabled)").each(function () {
        const input = $(this);
        const value = input.val().trim();
        if (value === "") {
            input.removeClass("border-gray-200");
            input.addClass("border-red-700");
            isValid = false;
        }
    });

    if (isValid) {
        holdonOpen("sk-rect", "Vui lòng chờ...", "rgba(0,0,0,0.8)", "white");
        const formData = $(form).serialize();
        const url__submit = '/model/update/password';
        $.ajax({
            url: url__submit,
            type: 'POST',
            data: formData,
            success: function (res) {
                const result = JSON.parse(res);
                holdonClose();
                showMessage(result.status, result.msg);
                if (result.status === "success") {
                    setTimeout(() => location.reload(), 2000);
                }
            }
        });
    }
});
$("#submit-2fa-profile").on("submit", function (e) {
    e.preventDefault();
    const form = document.getElementById("submit-2fa-profile");
    let isValid = true;

    $(form).find("input").removeClass("border-red-700");

    $(form).find("input:not([type=hidden]):not(:disabled)").each(function () {
        const input = $(this);
        const value = input.val().trim();
        if (value === "") {
            input.removeClass("border-gray-200");
            input.addClass("border-red-700");
            isValid = false;
        }
    });

    if (isValid) {
        holdonOpen("sk-rect", "Vui lòng chờ...", "rgba(0,0,0,0.8)", "white");
        const formData = $(form).serialize();
        const url__submit = '/model/authenticator';
        $.ajax({
            url: url__submit,
            type: 'POST',
            data: formData,
            success: function (res) {
                const result = JSON.parse(res);
                holdonClose();
                showMessage(result.status, result.msg);
                if (result.status === "success") {
                    setTimeout(() => location.reload(), 1000);
                }
            }
        });
    }
});
$("#submit-2fa").on("submit", function (e) {
    e.preventDefault();
    const form = document.getElementById("submit-2fa");
    let isValid = true;

    $(form).find("input").removeClass("border-red-700");

    $(form).find("input:not([type=hidden]):not(:disabled)").each(function () {
        const input = $(this);
        const value = input.val().trim();
        if (value === "") {
            input.removeClass("border-gray-200");
            input.addClass("border-red-700");
            isValid = false;
        }
    });

    if (isValid) {
        holdonOpen("sk-rect", "Vui lòng chờ...", "rgba(0,0,0,0.8)", "white");
        const formData = $(form).serialize();
        const url__submit = '/model/authenticator';
        $.ajax({
            url: url__submit,
            type: 'POST',
            data: formData,
            success: function (res) {
                const result = JSON.parse(res);
                holdonClose();
                showMessage(result.status, result.msg);
                if (result.status === "success") {
                    setTimeout("location.href = '/';", 2000);
                }
            }
        });
    }
});

$("#submit-napthe").on('submit', function (e) {
    e.preventDefault();
    const form = document.getElementById("submit-napthe");
    let isValid = true;

    $(form).find("input").removeClass("border-red-700");

    $(form).find("input:not([type=hidden]):not(:disabled)").each(function () {
        const input = $(this);
        const value = input.val().trim();
        if (value === "") {
            input.removeClass("border-gray-200");
            input.addClass("border-red-700");
            isValid = false;
        }
    });

    if (isValid) {
        holdonOpen("sk-rect", "Vui lòng chờ...", "rgba(0,0,0,0.8)", "white");
        const formData = $(form).serialize();
        const url__submit = '/model/card';
        $.ajax({
            url: url__submit,
            type: 'POST',
            data: formData,
            success: function (res) {
                const result = JSON.parse(res);
                holdonClose();
                showMessage(result.status, result.msg);
                if (result.status === "success") {
                    setTimeout("location.href = '/card';", 2000);
                }
            }
        });
    }
});
$("#submit-paypal").on("submit", function (e) {
    e.preventDefault();
    const form = document.getElementById("submit-paypal");
    let isValid = true;

    $(form).find("input").removeClass("border-red-700");

    $(form).find("input:not([type=hidden]):not(:disabled)").each(function () {
        const input = $(this);
        const value = input.val().trim();
        if (value === "") {
            input.removeClass("border-gray-200");
            input.addClass("border-red-700");
            isValid = false;
        }
    });

    if (isValid) {
        holdonOpen("sk-rect", "Vui lòng chờ...", "rgba(0,0,0,0.8)", "white");
        const formData = $(form).serialize();
        const url__submit = '/model/paypal';
        $.ajax({
            url: url__submit,
            type: 'POST',
            data: formData,
            success: function (response) {
                const result = JSON.parse(response);
                holdonClose();
                showMessage(result.status, result.msg);
                if (response.status == "success") {
                    window.location.href = response.link; // Chuyển hướng đến PayPal
                }
            }
        });
    }
});