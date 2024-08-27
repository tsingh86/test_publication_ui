delivery_method.setHidden(true);
if (
  select_copyright_owner.value === "No copyright owner" ||
  select_copyright_owner.value === "ADAY (FR)"
) {
  delivery_method.setHidden(true);
} else {
  delivery_method.setHidden(false);
}
