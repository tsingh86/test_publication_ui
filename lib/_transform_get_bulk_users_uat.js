// simple wrapper to trigger the dynamodb module to get family enum data
const _getList = {{ _get_bulk_users_uat }};
let _list;
if (_getList.rawData && _getList.rawData.Items.length > 0) {
  _list = _getList.rawData.Items;
} else if (_getList.data && _getList.data.Items.length > 0) {
  _list = _getList.data.Items;
} else {
  _list = [];
}
// Fetch raw data from the data source
const rawData =  _list;
// Check if data exists and is an array
if (!rawData || !Array.isArray(rawData)) {
  return [];
}
// Extract user values and remove duplicates
const userList = rawData.map(item => item.user);
const distinctUsers = Array.from(new Set(userList)).filter(user => user);

// Transform distinct user data to the format required by the dropdown
const dropdownOptions = distinctUsers.map(user => ({
  label: user,
  value: user
}));

return dropdownOptions;