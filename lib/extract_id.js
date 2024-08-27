if (table_publications.selectedRow.lookup_attributes.external_ids) {
  external_id_list =
    table_publications.selectedRow.lookup_attributes.external_ids;
  function extractNumericValue(element) {
    // Regular expression to match numeric values
    var regex = /\d+/;
    // Match numeric values in the element
    var matches = element.match(regex);
    // Return the first matched numeric value
    return matches ? matches[0] : null;
  }

  // Iterate over the list

  external_id_list.forEach(function (element) {
    // Check if the element starts with "GMD" prefix
    if (element.startsWith("GMD")) {
      // Extract numeric value from the element
      var numericValue = extractNumericValue(element);
      // If numeric value exists, add it to the array
      if (numericValue !== null) {
        
        gmd_id.setValue(Number(numericValue));
      }
    }
  });
}
