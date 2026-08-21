<div class="scrollToTop" style="display: flex;"> <span class="arrow"><i class="ti ti-arrow-narrow-up fs-20"></i></span> </div>
<footer class="footer mt-auto py-3 bg-white text-center">
    <div class="container"> <span class="text-muted"> Copyright © <span id="year">2025</span>. Developer <span class="bi bi-heart-fill text-danger"></span> by <a href="https://sieuthicode.vn"> <span class="fw-medium text-primary">SIEUTHICODE.VN</span> </a> All rights reserved - </span> Version <span class="text-danger">2.6</span></div>
</footer> <!-- Footer End -->
<div class="modal fade" id="header-responsive-search" tabindex="-1" aria-labelledby="header-responsive-search" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">
                <div class="input-group"> <input type="text" class="form-control border-end-0" placeholder="Search Anything ..." aria-label="Search Anything ..." aria-describedby="button-addon2"> <button class="btn btn-primary" type="button" id="button-addon2"><i class="bi bi-search"></i></button> </div>
            </div>
        </div>
    </div>
</div>
</div>
<script src="/assets/libs/@popperjs/core/umd/popper.min.js"></script>
<script src="/assets/libs/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="/assets/js/defaultmenu.min.js"></script>
<script src="/assets/libs/node-waves/waves.min.js"></script>
<script src="/assets/js/sticky.js"></script>
<script src="/assets/libs/simplebar/simplebar.min.js"></script>
<script src="/assets/js/simplebar.js"></script>
<script src="/assets/libs/@tarekraafat/autocomplete.js/autoComplete.min.js"></script>
<script src="/assets/libs/@simonwep/pickr/pickr.es5.min.js"></script>
<script src="/assets/libs/flatpickr/flatpickr.min.js"></script>
<!-- <script src="/assets/js/custom-switcher.min.js"></script> -->
<script src="/assets/js/custom.js"></script>
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
<script src="/assets/js/select2.js?v=<?= time() ?>"></script>
<script>
    document.addEventListener('DOMContentLoaded', function() {
        const scrollToTopBtn = document.querySelector('.scrollToTop');

        // Show/hide button based on scroll position
        window.addEventListener('scroll', function() {
            if (window.scrollY > 200) {
                scrollToTopBtn.style.display = 'flex';
            } else {
                scrollToTopBtn.style.display = 'none';
            }
        });

        // Scroll to top when button is clicked
        scrollToTopBtn.addEventListener('click', function() {
            window.scrollTo({
                top: 0,
                behavior: 'smooth'
            });
        });
    });
    $(document).ready(function() {
        $('.dropdown-item-currentcy').on('click', function() {
            var currencyCode = $(this).data('currency-code');
            $.ajax({
                url: '/model/update_currency',
                type: 'POST',
                dataType: "json",
                data: {
                    currency_code: currencyCode
                },
                success: function(response) {
                    if (response.status == "success") {
                        Notiflix.Notify.success(response.msg);
                        setTimeout(function() {
                            location.reload();
                        }, 1000);
                    } else {
                        Notiflix.Notify.failure(response.msg);
                    }

                },
                error: function(xhr, status, error) {
                    Notiflix.Notify.failure('Không cập nhật được tiền tệ. Vui lòng thử lại.');
                }
            });
        });
    });
</script>
<script>
    window.USER_CURRENCY = <?= json_encode($db->get_row("SELECT currency_code, currency_symbol, currency_decimal, new_currecry_rate, currency_thousand_separator, currency_decimal_separator FROM currencies WHERE currency_code = '" . Anti_xss($data_user['currency_code']) . "' AND status = 1")) ?>;
    window.DEFAULT_CURRENCY = {
        "currency_code": "VND",
        "currency_symbol": "\u20ab",
        "currency_position": "left",
        "currency_thousand_separator": "dot",
        "currency_decimal_separator": "comma",
        "currency_decimal": "0",
        "auto_rounding_x_decimal_places": "1",
        "new_currecry_rate": "1"
    };


    window.$formatCurrency = function(number, showCurrencySymbol = true, numberDecimal = "", decimalPoint = "", separator = "") {
        const config = window.USER_CURRENCY || {
            currency_code: "THB",
            currency_symbol: "฿",
            currency_decimal: 2,
            new_currecry_rate: 700,
            currency_thousand_separator: "dot",
            currency_decimal_separator: "comma",
            currency_position: "left"
        };

        const DEFAULT_CURRENCY = {
            currency_code: "VND"
        };

        let prefix = '';
        let decimal = 2;

        // Chuyển đổi number thành số nếu nó là chuỗi
        number = typeof number === 'string' ? parseFloat(number) : number;

        if (isNaN(number)) {
            console.error('Invalid number input');
            return 'Invalid input';
        }

        if (config.currency_code !== DEFAULT_CURRENCY.currency_code) {
            number = number / config.new_currecry_rate;
            prefix = '≈ ';
        }


        if (numberDecimal === "") {
            decimal = config.currency_decimal || 2;
        } else {
            decimal = parseInt(numberDecimal, 10);
        }

        if (decimalPoint === "") {
            decimalPoint = config.currency_decimal_separator || 'comma';
        }

        if (separator === "") {
            separator = config.currency_thousand_separator || 'space';
        }

        switch (decimalPoint) {
            case 'dot':
                decimalPoint = '.';
                break;
            case 'comma':
                decimalPoint = ',';
                break;
            default:
                decimalPoint = ".";
                break;
        }

        switch (separator) {
            case 'dot':
                separator = '.';
                break;
            case 'comma':
                separator = ',';
                break;
            case 'space':
                separator = ' ';
                break;
            default:
                separator = ',';
                break;
        }

        let formattedNumber = number.toFixed(decimal);
        let parts = formattedNumber.split('.');
        parts[0] = parts[0].replace(/\B(?=(\d{3})+(?!\d))/g, separator);
        formattedNumber = parts.join(decimalPoint);

        if (showCurrencySymbol) {
            const symbol = config.currency_symbol || '';
            const currencyPosition = config.currency_position || 'left';

            if (currencyPosition === 'left') {
                return prefix + symbol + formattedNumber;
            } else {
                return prefix + formattedNumber + ' ' + symbol;
            }
        }

        return prefix + formattedNumber;
    };
</script>
</body>

</html>