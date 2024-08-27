// Retrieve checkbox states
const checkSuccess = check_success.value; 
const checkError = check_error.value;
// Retrieve the selected user from the dropdown
const selectedUser = userList.value;
let _list;

try {
  if (retoolContext.environment === "production") {
    await _get_bulk_imported_data_by_user_prod.trigger();
    _list = await _get_bulk_imported_data_by_user_prod.rawData;
    //_list =  _transform_get_bulk_imported_data_by_user_prod.value;
  } else if (retoolContext.environment === "UAT") {
    await _get_bulk_imported_data_by_user_uat.trigger();
    _list = await _get_bulk_imported_data_by_user_uat.rawData;
    //_list =  _transform_get_bulk_imported_data_by_user_uat.value;
  } else {
    console.error('Unknown environment:', retoolContext.environment);
    return [];
  }
} catch (error) {
  console.error('Error retrieving data:', error);
  return [];
}

if (!_list || !_list.Items) {
  console.error('Error retrieving data or empty result.');
  return [];
}
const _listItems = _list.Items;
console.log(_listItems);
// Determine filters based on checkbox states
const selectedFilters = [];
if (checkSuccess) {
  //selectedFilters.push('updated');
  selectedFilters.push('created');
}
if (checkError) selectedFilters.push('error');

// Filter data based on selected filters and user
const filteredData = _listItems.filter(item => {
  // Check if the item's status matches any of the selected filters
  const matchesFilter = selectedFilters.length === 0 || selectedFilters.includes(item.status);
  
  // Check if the item matches the selected user
  const matchesUser = !selectedUser || item.user === selectedUser;

  // Return true if both conditions are met
  return matchesFilter && matchesUser;
});

return filteredData;

