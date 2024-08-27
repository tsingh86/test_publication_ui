// simple wrapper to trigger the dynamodb module to get family enum data
const _list = {{ _get_meta_family.data }};
const _l = _list.Items.sort((a, b) => a.name.localeCompare(b.name))
return _l
// return _list.Items