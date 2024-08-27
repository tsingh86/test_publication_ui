// simple wrapper to trigger the dynamodb module to get family enum data
const _getList = {{ _get_meta_family }};
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

