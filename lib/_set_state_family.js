// trigger script to invoke the get data function => _get_meta_family
// and set the data against the form

// get data and set the local state variable 'data_source'
_current_entity_data_source.setValue(_get_meta_family);
// set the shared local state variable with the family schema 
_json_schema_meta_data_form.setValue(_json_schema_family.value);
_current_entity.setValue("family");