// gets the data retrieved from dynamodb from the shared local state variable.
// this data is used to load the UI at runtime and is written to the shared state after user actions such as clicking on a linked list item
const _ds = {{ _current_entity_data_source.value.data.Items }};
return _ds;