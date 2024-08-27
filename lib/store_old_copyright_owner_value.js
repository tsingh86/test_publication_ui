if (
  table_publications.selectedRow.hasOwnProperty("copyright_owner_details") &&
  Array.isArray(table_publications.selectedRow["copyright_owner_details"]) &&
  table_publications.selectedRow["copyright_owner_details"].length > 0
) {
  localStorage.setValue(
    "old_copyright_owner",
    table_publications.selectedRow["copyright_owner_details"][0][
      "copyright_owner"
    ]
  );
} else {
  localStorage.setValue("old_copyright_owner", select_copyright_owner.value);
}
console.log(localStorage.values);