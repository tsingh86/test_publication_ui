const _list = {{ _get_meta_category.data }};
const _l = _list.Items.sort((a, b) => a.name.localeCompare(b.name))
return _l
//return _list.Items