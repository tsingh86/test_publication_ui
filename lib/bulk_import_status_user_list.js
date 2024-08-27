let _list;
try {
  if (retoolContext.environment === "production") {
    _list = _get_bulk_users_prod.rawData;
    //_list = _transform_bulk_users_prod.value;
  } else if (retoolContext.environment === "UAT") {
    _list = _get_bulk_users_uat.rawData;
    //_list = _transform_bulk_users_uat.value;
  } else {
    console.error('Unknown environment:', retoolContext.environment);
    return [];
  }
} catch (error) {
  console.error('Error retrieving data:', error);
  return [];
}

if (!_list || !_list.Items || !Array.isArray(_list.Items)) {
  console.error('Invalid data structure:', _list);
  return [];
}
const rawData = _list.Items;
// Extract user values and remove duplicates
const userList = rawData.map(item => item.user);
const distinctUsers = Array.from(new Set(userList)).filter(user => user);
// Transform distinct user data to the format required by the dropdown
const dropdownOptions = distinctUsers.map(user => ({
  label: user,
  value: user
}));
return dropdownOptions;