// gets the data retrieved from dynamodb from the shared local state variable.
// this data is used to load the UI at runtime and is written to the shared state after user actions such as clicking on a linked list item
const _getList = {{ _current_entity_data_source.value }};
let _list;
if (_getList.rawData && _getList.rawData.Items.length > 0) {
  _list = _getList.rawData.Items;
} else if (_getList.data && _getList.data.Items.length > 0) {
  _list = _getList.data.Items;
} else {
  _list = [];
}

const _l = _list.sort((a, b) => a.name.localeCompare(b.name));
return _l;