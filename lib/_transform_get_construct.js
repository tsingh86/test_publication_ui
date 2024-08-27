// Tip: assign your external references to variables instead of chaining off the curly brackets.
//const _template = '{"country":[],"family":[],"media":[]}'
const _ret = {{ table_publications.selectedRow }};

//const _country = _ret?.country || 'No Product';
//const _media = _ret?.family || 'No Product';
//const _family = _ret?.media || 'No Product';

return _ret