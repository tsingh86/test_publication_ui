const _list = {{ _get_meta_country.data }};
const _l = _list.Items.sort((a, b) => a.code.localeCompare(b.code))
return _l
//return _list.Items