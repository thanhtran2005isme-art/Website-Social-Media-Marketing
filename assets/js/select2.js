
$('select[name="service"]').select2({
  placeholder: "Chọn dịch vụ",
  allowClear: true
});
$('select[name="status"]').select2({
  placeholder: "Chọn trạng thái",
  allowClear: true
});
$('select[name="status"]').select2({
  placeholder: "Chọn trạng thái",
  allowClear: true
});
$('select[name="categories"]').select2({
  placeholder: "Chọn danh mục",
  allowClear: true
});
$('select[name="country"]').select2({
  placeholder: "Chọn quốc gia",
  allowClear: true
});
$('select[name="social"]').select2({
  placeholder: "Chọn nền tảng",
  allowClear: true,
  templateResult: formatOption,
  templateSelection: formatOption
});
function formatOption(option) {
  if (!option.id) {
    return option.text; // Placeholder
  }
  var icon = $(option.element).data('icon');
  var $option = $(
    '<span><img src="' + icon + '" width="20" style="margin-right: 10px;" /> ' + option.text + '</span>'
  );
  return $option;
}

