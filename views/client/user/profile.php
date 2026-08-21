<?php 
require_once(realpath($_SERVER["DOCUMENT_ROOT"]) . '/libs/init.php');
if (!@$user) {
    new Redirect('/login');
    exit;
}
$title = "Thông tin tài khoản - " . $general_data['title'];
require_once realpath($_SERVER['DOCUMENT_ROOT'] . '/views/client/header.php'); ?>
<div class="main-content app-content">
    <div class="container-fluid">
        <div class="d-flex align-items-center justify-content-between page-header-breadcrumb flex-wrap gap-2">
            <div>
                <nav>
                    <ol class="breadcrumb mb-1">
                        <li class="breadcrumb-item"><a href="javascript:void(0);">Trang chủ</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Tài khoản</li>
                    </ol>
                </nav>
                <h1 class="page-title fw-medium fs-18 mb-0">Thông tin tài khoản</h1>
            </div>
        </div>
        <div class="row">
        <?php require_once realpath($_SERVER['DOCUMENT_ROOT'] . '/views/client/user/menu.php'); ?>
            <div class="col-xxl-8">
                <div class="card custom-card overflow-hidden">
                    <div class="card-body p-3">
                        <div class="row gy-3">
                            <div class="col-xl-6">
                                <label for="profile-username" class="form-label">Tài khoản :</label>
                                <input type="text" class="form-control" id="profile-username" value="<?= htmlspecialchars($data_user['username'] ?? '') ?>" placeholder="Enter Username">
                            </div>
                            <div class="col-xl-6">
                                <label for="profile-email" class="form-label">Email :</label>
                                <input type="email" class="form-control" id="profile-email" value="<?= htmlspecialchars($data_user['email'] ?? '') ?>" placeholder="Enter Email">
                            </div>
                            <div class="col-xl-6">
                                <label for="profile-lastname" class="form-label">Họ :</label>
                                <input type="text" class="form-control" id="profile-lastname" value="<?= htmlspecialchars($data_user['lastname'] ?? '') ?>" placeholder="Enter Last Name">
                            </div>
                            <div class="col-xl-6">
                                <label for="profile-firstname" class="form-label">Tên :</label>
                                <input type="text" class="form-control" id="profile-firstname" value="<?= htmlspecialchars($data_user['firstname'] ?? '') ?>" placeholder="Enter First Name">
                            </div>
                            <div class="col-xl-6">
                                <label for="profile-phone" class="form-label">Số điện thoại :</label>
                                <input type="text" class="form-control" id="profile-phone" value="<?= htmlspecialchars($data_user['phone'] ?? '') ?>" placeholder="Enter Phone Number">
                            </div>
                            <div class="col-xl-6">
                                <label for="profile-address" class="form-label">Địa chỉ :</label>
                                <input type="text" class="form-control" id="profile-address" value="<?= htmlspecialchars($data_user['address_one'] ?? '') ?>" placeholder="Enter Address">
                            </div>
                            <div class="col-xl-6">
                                <label for="profile-status" class="form-label">Tình trạng :</label>
                                <input type="text" class="form-control" id="profile-state" value="<?= htmlspecialchars($data_user['state'] ?? '') ?>" placeholder="Enter state">
                            </div>
                            <div class="col-xl-6">
                                <label for="profile-zipcode" class="form-label">Zip Code :</label>
                                <input type="text" class="form-control" id="profile-zipcode" value="<?= htmlspecialchars($data_user['zip_code'] ?? '') ?>" placeholder="Enter Zip Code">
                            </div>
                            <div class="col-xl-6">
                                <label for="country-select" class="form-label">Quốc gia :</label>
                                <select class="js-example-placeholder-single form-control" name="country" id="country-select">
                                    <option value="">Select a country</option>
                                </select>
                            </div>
                            <div class="col-xl-12">
                                <button type="button" class="btn btn-primary-gradient" id="save-profile-btn">Lưu thông tin</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    // Initialize Notiflix
    Notiflix.Notify.init({
        width: '300px',
        position: 'right-top',
        timeout: 3000,
    });

    // Full country list (ISO 3166-1 alpha-2 codes and names)
    const countries = [{
            code: "AF",
            name: "Afghanistan"
        },
        {
            code: "AX",
            name: "Åland Islands"
        },
        {
            code: "AL",
            name: "Albania"
        },
        {
            code: "DZ",
            name: "Algeria"
        },
        {
            code: "AS",
            name: "American Samoa"
        },
        {
            code: "AD",
            name: "Andorra"
        },
        {
            code: "AO",
            name: "Angola"
        },
        {
            code: "AI",
            name: "Anguilla"
        },
        {
            code: "AQ",
            name: "Antarctica"
        },
        {
            code: "AG",
            name: "Antigua and Barbuda"
        },
        {
            code: "AR",
            name: "Argentina"
        },
        {
            code: "AM",
            name: "Armenia"
        },
        {
            code: "AW",
            name: "Aruba"
        },
        {
            code: "AU",
            name: "Australia"
        },
        {
            code: "AT",
            name: "Austria"
        },
        {
            code: "AZ",
            name: "Azerbaijan"
        },
        {
            code: "BS",
            name: "Bahamas"
        },
        {
            code: "BH",
            name: "Bahrain"
        },
        {
            code: "BD",
            name: "Bangladesh"
        },
        {
            code: "BB",
            name: "Barbados"
        },
        {
            code: "BY",
            name: "Belarus"
        },
        {
            code: "BE",
            name: "Belgium"
        },
        {
            code: "BZ",
            name: "Belize"
        },
        {
            code: "BJ",
            name: "Benin"
        },
        {
            code: "BM",
            name: "Bermuda"
        },
        {
            code: "BT",
            name: "Bhutan"
        },
        {
            code: "BO",
            name: "Bolivia"
        },
        {
            code: "BQ",
            name: "Bonaire, Sint Eustatius and Saba"
        },
        {
            code: "BA",
            name: "Bosnia and Herzegovina"
        },
        {
            code: "BW",
            name: "Botswana"
        },
        {
            code: "BV",
            name: "Bouvet Island"
        },
        {
            code: "BR",
            name: "Brazil"
        },
        {
            code: "IO",
            name: "British Indian Ocean Territory"
        },
        {
            code: "BN",
            name: "Brunei Darussalam"
        },
        {
            code: "BG",
            name: "Bulgaria"
        },
        {
            code: "BF",
            name: "Burkina Faso"
        },
        {
            code: "BI",
            name: "Burundi"
        },
        {
            code: "CV",
            name: "Cabo Verde"
        },
        {
            code: "KH",
            name: "Cambodia"
        },
        {
            code: "CM",
            name: "Cameroon"
        },
        {
            code: "CA",
            name: "Canada"
        },
        {
            code: "KY",
            name: "Cayman Islands"
        },
        {
            code: "CF",
            name: "Central African Republic"
        },
        {
            code: "TD",
            name: "Chad"
        },
        {
            code: "CL",
            name: "Chile"
        },
        {
            code: "CN",
            name: "China"
        },
        {
            code: "CX",
            name: "Christmas Island"
        },
        {
            code: "CC",
            name: "Cocos (Keeling) Islands"
        },
        {
            code: "CO",
            name: "Colombia"
        },
        {
            code: "KM",
            name: "Comoros"
        },
        {
            code: "CG",
            name: "Congo"
        },
        {
            code: "CD",
            name: "Congo, Democratic Republic of the"
        },
        {
            code: "CK",
            name: "Cook Islands"
        },
        {
            code: "CR",
            name: "Costa Rica"
        },
        {
            code: "CI",
            name: "Côte d'Ivoire"
        },
        {
            code: "HR",
            name: "Croatia"
        },
        {
            code: "CU",
            name: "Cuba"
        },
        {
            code: "CW",
            name: "Curaçao"
        },
        {
            code: "CY",
            name: "Cyprus"
        },
        {
            code: "CZ",
            name: "Czech Republic"
        },
        {
            code: "DK",
            name: "Denmark"
        },
        {
            code: "DJ",
            name: "Djibouti"
        },
        {
            code: "DM",
            name: "Dominica"
        },
        {
            code: "DO",
            name: "Dominican Republic"
        },
        {
            code: "EC",
            name: "Ecuador"
        },
        {
            code: "EG",
            name: "Egypt"
        },
        {
            code: "SV",
            name: "El Salvador"
        },
        {
            code: "GQ",
            name: "Equatorial Guinea"
        },
        {
            code: "ER",
            name: "Eritrea"
        },
        {
            code: "EE",
            name: "Estonia"
        },
        {
            code: "SZ",
            name: "Eswatini"
        },
        {
            code: "ET",
            name: "Ethiopia"
        },
        {
            code: "FK",
            name: "Falkland Islands (Malvinas)"
        },
        {
            code: "FO",
            name: "Faroe Islands"
        },
        {
            code: "FJ",
            name: "Fiji"
        },
        {
            code: "FI",
            name: "Finland"
        },
        {
            code: "FR",
            name: "France"
        },
        {
            code: "GF",
            name: "French Guiana"
        },
        {
            code: "PF",
            name: "French Polynesia"
        },
        {
            code: "TF",
            name: "French Southern Territories"
        },
        {
            code: "GA",
            name: "Gabon"
        },
        {
            code: "GM",
            name: "Gambia"
        },
        {
            code: "GE",
            name: "Georgia"
        },
        {
            code: "DE",
            name: "Germany"
        },
        {
            code: "GH",
            name: "Ghana"
        },
        {
            code: "GI",
            name: "Gibraltar"
        },
        {
            code: "GR",
            name: "Greece"
        },
        {
            code: "GL",
            name: "Greenland"
        },
        {
            code: "GD",
            name: "Grenada"
        },
        {
            code: "GP",
            name: "Guadeloupe"
        },
        {
            code: "GU",
            name: "Guam"
        },
        {
            code: "GT",
            name: "Guatemala"
        },
        {
            code: "GG",
            name: "Guernsey"
        },
        {
            code: "GN",
            name: "Guinea"
        },
        {
            code: "GW",
            name: "Guinea-Bissau"
        },
        {
            code: "GY",
            name: "Guyana"
        },
        {
            code: "HT",
            name: "Haiti"
        },
        {
            code: "HM",
            name: "Heard Island and McDonald Islands"
        },
        {
            code: "VA",
            name: "Holy See"
        },
        {
            code: "HN",
            name: "Honduras"
        },
        {
            code: "HK",
            name: "Hong Kong"
        },
        {
            code: "HU",
            name: "Hungary"
        },
        {
            code: "IS",
            name: "Iceland"
        },
        {
            code: "IN",
            name: "India"
        },
        {
            code: "ID",
            name: "Indonesia"
        },
        {
            code: "IR",
            name: "Iran"
        },
        {
            code: "IQ",
            name: "Iraq"
        },
        {
            code: "IE",
            name: "Ireland"
        },
        {
            code: "IM",
            name: "Isle of Man"
        },
        {
            code: "IL",
            name: "Israel"
        },
        {
            code: "IT",
            name: "Italy"
        },
        {
            code: "JM",
            name: "Jamaica"
        },
        {
            code: "JP",
            name: "Japan"
        },
        {
            code: "JE",
            name: "Jersey"
        },
        {
            code: "JO",
            name: "Jordan"
        },
        {
            code: "KZ",
            name: "Kazakhstan"
        },
        {
            code: "KE",
            name: "Kenya"
        },
        {
            code: "KI",
            name: "Kiribati"
        },
        {
            code: "KP",
            name: "Korea, Democratic People's Republic of"
        },
        {
            code: "KR",
            name: "Korea, Republic of"
        },
        {
            code: "KW",
            name: "Kuwait"
        },
        {
            code: "KG",
            name: "Kyrgyzstan"
        },
        {
            code: "LA",
            name: "Lao People's Democratic Republic"
        },
        {
            code: "LV",
            name: "Latvia"
        },
        {
            code: "LB",
            name: "Lebanon"
        },
        {
            code: "LS",
            name: "Lesotho"
        },
        {
            code: "LR",
            name: "Liberia"
        },
        {
            code: "LY",
            name: "Libya"
        },
        {
            code: "LI",
            name: "Liechtenstein"
        },
        {
            code: "LT",
            name: "Lithuania"
        },
        {
            code: "LU",
            name: "Luxembourg"
        },
        {
            code: "MO",
            name: "Macao"
        },
        {
            code: "MG",
            name: "Madagascar"
        },
        {
            code: "MW",
            name: "Malawi"
        },
        {
            code: "MY",
            name: "Malaysia"
        },
        {
            code: "MV",
            name: "Maldives"
        },
        {
            code: "ML",
            name: "Mali"
        },
        {
            code: "MT",
            name: "Malta"
        },
        {
            code: "MH",
            name: "Marshall Islands"
        },
        {
            code: "MQ",
            name: "Martinique"
        },
        {
            code: "MR",
            name: "Mauritania"
        },
        {
            code: "MU",
            name: "Mauritius"
        },
        {
            code: "YT",
            name: "Mayotte"
        },
        {
            code: "MX",
            name: "Mexico"
        },
        {
            code: "FM",
            name: "Micronesia"
        },
        {
            code: "MD",
            name: "Moldova"
        },
        {
            code: "MC",
            name: "Monaco"
        },
        {
            code: "MN",
            name: "Mongolia"
        },
        {
            code: "ME",
            name: "Montenegro"
        },
        {
            code: "MS",
            name: "Montserrat"
        },
        {
            code: "MA",
            name: "Morocco"
        },
        {
            code: "MZ",
            name: "Mozambique"
        },
        {
            code: "MM",
            name: "Myanmar"
        },
        {
            code: "NA",
            name: "Namibia"
        },
        {
            code: "NR",
            name: "Nauru"
        },
        {
            code: "NP",
            name: "Nepal"
        },
        {
            code: "NL",
            name: "Netherlands"
        },
        {
            code: "NC",
            name: "New Caledonia"
        },
        {
            code: "NZ",
            name: "New Zealand"
        },
        {
            code: "NI",
            name: "Nicaragua"
        },
        {
            code: "NE",
            name: "Niger"
        },
        {
            code: "NG",
            name: "Nigeria"
        },
        {
            code: "NU",
            name: "Niue"
        },
        {
            code: "NF",
            name: "Norfolk Island"
        },
        {
            code: "MK",
            name: "North Macedonia"
        },
        {
            code: "MP",
            name: "Northern Mariana Islands"
        },
        {
            code: "NO",
            name: "Norway"
        },
        {
            code: "OM",
            name: "Oman"
        },
        {
            code: "PK",
            name: "Pakistan"
        },
        {
            code: "PW",
            name: "Palau"
        },
        {
            code: "PS",
            name: "Palestine, State of"
        },
        {
            code: "PA",
            name: "Panama"
        },
        {
            code: "PG",
            name: "Papua New Guinea"
        },
        {
            code: "PY",
            name: "Paraguay"
        },
        {
            code: "PE",
            name: "Peru"
        },
        {
            code: "PH",
            name: "Philippines"
        },
        {
            code: "PN",
            name: "Pitcairn"
        },
        {
            code: "PL",
            name: "Poland"
        },
        {
            code: "PT",
            name: "Portugal"
        },
        {
            code: "PR",
            name: "Puerto Rico"
        },
        {
            code: "QA",
            name: "Qatar"
        },
        {
            code: "RE",
            name: "Réunion"
        },
        {
            code: "RO",
            name: "Romania"
        },
        {
            code: "RU",
            name: "Russian Federation"
        },
        {
            code: "RW",
            name: "Rwanda"
        },
        {
            code: "BL",
            name: "Saint Barthélemy"
        },
        {
            code: "KN",
            name: "Saint Kitts and Nevis"
        },
        {
            code: "LC",
            name: "Saint Lucia"
        },
        {
            code: "MF",
            name: "Saint Martin"
        },
        {
            code: "PM",
            name: "Saint Pierre and Miquelon"
        },
        {
            code: "VC",
            name: "Saint Vincent and the Grenadines"
        },
        {
            code: "WS",
            name: "Samoa"
        },
        {
            code: "SM",
            name: "San Marino"
        },
        {
            code: "ST",
            name: "Sao Tome and Principe"
        },
        {
            code: "SA",
            name: "Saudi Arabia"
        },
        {
            code: "SN",
            name: "Senegal"
        },
        {
            code: "RS",
            name: "Serbia"
        },
        {
            code: "SC",
            name: "Seychelles"
        },
        {
            code: "SL",
            name: "Sierra Leone"
        },
        {
            code: "SG",
            name: "Singapore"
        },
        {
            code: "SX",
            name: "Sint Maarten"
        },
        {
            code: "SK",
            name: "Slovakia"
        },
        {
            code: "SI",
            name: "Slovenia"
        },
        {
            code: "SB",
            name: "Solomon Islands"
        },
        {
            code: "SO",
            name: "Somalia"
        },
        {
            code: "ZA",
            name: "South Africa"
        },
        {
            code: "GS",
            name: "South Georgia and the South Sandwich Islands"
        },
        {
            code: "SS",
            name: "South Sudan"
        },
        {
            code: "ES",
            name: "Spain"
        },
        {
            code: "LK",
            name: "Sri Lanka"
        },
        {
            code: "SD",
            name: "Sudan"
        },
        {
            code: "SR",
            name: "Suriname"
        },
        {
            code: "SJ",
            name: "Svalbard and Jan Mayen"
        },
        {
            code: "SE",
            name: "Sweden"
        },
        {
            code: "CH",
            name: "Switzerland"
        },
        {
            code: "SY",
            name: "Syrian Arab Republic"
        },
        {
            code: "TW",
            name: "Taiwan"
        },
        {
            code: "TJ",
            name: "Tajikistan"
        },
        {
            code: "TZ",
            name: "Tanzania"
        },
        {
            code: "TH",
            name: "Thailand"
        },
        {
            code: "TL",
            name: "Timor-Leste"
        },
        {
            code: "TG",
            name: "Togo"
        },
        {
            code: "TK",
            name: "Tokelau"
        },
        {
            code: "TO",
            name: "Tonga"
        },
        {
            code: "TT",
            name: "Trinidad and Tobago"
        },
        {
            code: "TN",
            name: "Tunisia"
        },
        {
            code: "TR",
            name: "Turkey"
        },
        {
            code: "TM",
            name: "Turkmenistan"
        },
        {
            code: "TC",
            name: "Turks and Caicos Islands"
        },
        {
            code: "TV",
            name: "Tuvalu"
        },
        {
            code: "UG",
            name: "Uganda"
        },
        {
            code: "UA",
            name: "Ukraine"
        },
        {
            code: "AE",
            name: "United Arab Emirates"
        },
        {
            code: "GB",
            name: "United Kingdom"
        },
        {
            code: "US",
            name: "United States"
        },
        {
            code: "UM",
            name: "United States Minor Outlying Islands"
        },
        {
            code: "UY",
            name: "Uruguay"
        },
        {
            code: "UZ",
            name: "Uzbekistan"
        },
        {
            code: "VU",
            name: "Vanuatu"
        },
        {
            code: "VE",
            name: "Venezuela"
        },
        {
            code: "VN",
            name: "Vietnam"
        },
        {
            code: "VG",
            name: "Virgin Islands, British"
        },
        {
            code: "VI",
            name: "Virgin Islands, U.S."
        },
        {
            code: "WF",
            name: "Wallis and Futuna"
        },
        {
            code: "EH",
            name: "Western Sahara"
        },
        {
            code: "YE",
            name: "Yemen"
        },
        {
            code: "ZM",
            name: "Zambia"
        },
        {
            code: "ZW",
            name: "Zimbabwe"
        }
    ];

    const csrfToken = "<?= htmlspecialchars($_SESSION['csrf_token'] ?? bin2hex(random_bytes(32))) ?>";

    $(document).ready(function() {
        $('#country-select').select2({
            placeholder: "Select a country",
            allowClear: true
        });

        countries.forEach(country => {
            $('#country-select').append(`<option value="${country.code}">${country.name}</option>`);
        });


        const currentCountry = "<?= htmlspecialchars($data_user['country_code'] ?? '') ?>";
        if (currentCountry) {
            $('#country-select').val(currentCountry).trigger('change');
        }


        $('#save-profile-btn').click(function() {
            const formData = new FormData();
            formData.append('username', $('#profile-username').val());
            formData.append('email', $('#profile-email').val());
            formData.append('lastname', $('#profile-lastname').val());
            formData.append('firstname', $('#profile-firstname').val());
            formData.append('phone', $('#profile-phone').val());
            formData.append('address', $('#profile-address').val());
            formData.append('state', $('#profile-state').val());
            formData.append('zipcode', $('#profile-zipcode').val());

            const selectedCountryCode = $('#country-select').val();
            if (selectedCountryCode) {
                const selectedCountry = countries.find(country => country.code === selectedCountryCode);
                formData.append('country_code', selectedCountry.code);
                formData.append('country_name', selectedCountry.name);
            } else {
                formData.append('country_code', '');
                formData.append('country_name', '');
            }

            formData.append('csrf_token', csrfToken);
            Notiflix.Loading.circle('Đang xử lý...');
            $.ajax({
                url: '/model/update/profile',
                type: 'POST',
                data: formData,
                dataType: "json",
                processData: false,
                contentType: false,
                success: function(response) {
                    Notiflix.Loading.remove();
                    if (response.status == "success") {
                        Notiflix.Notify.success('Cập nhật thông tin thành công!');
                    } else {
                        Notiflix.Notify.failure('Cập nhật thất bại: ' + (response.msg || 'Lỗi không xác định'));
                    }
                },
                error: function(xhr, status, error) {
                    Notiflix.Loading.remove();
                    Notiflix.Notify.failure('Lỗi kết nối: ' + error);
                }
            });
        });
    });
</script>
<?php require_once realpath($_SERVER['DOCUMENT_ROOT'] . '/views/client/footer.php'); ?>