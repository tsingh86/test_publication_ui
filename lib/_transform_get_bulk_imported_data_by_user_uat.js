

const _getList = {{ _get_bulk_imported_data_by_user_uat }};
let _list;
if (_getList.rawData && _getList.rawData.Items.length > 0) {
  _list = _getList.rawData.Items;
} else if (_getList.data && _getList.data.Items.length > 0) {
  _list = _getList.data.Items;
} else {
  _list = [];
}
return _list;
