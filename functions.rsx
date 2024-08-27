<GlobalFunctions>
  <Folder id="transformers">
    <DynamoQuery
      id="_get_bulk_users_uat"
      enableTransformer={true}
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      ExpressionAttributeNames={'{"#user": "user" }'}
      ExpressionAttributeValues={'{":emptyString": { "S": "" }}'}
      FilterExpression="attribute_exists(#user) AND #user <> :emptyString"
      isMultiplayerEdited={false}
      KeyConditionExpression="#user = :user"
      method="scan"
      ProjectionExpression="#user"
      resourceDisplayName="prod-dynamo"
      resourceName="7664569c-3fcb-4f20-9a7e-8dc9e3617965"
      resourceTypeOverride=""
      retoolVersion="3.2.0"
      table="bulk_manual_publications_metadata_uat"
      transformer="// Query results are available as the `data` variable
return formatDataAsArray(data)"
      workflowBlockPluginId={null}
    />
    <Function
      id="_transform_get_media_types"
      funcBody={include("./lib/_transform_get_media_types.js", "string")}
    />
    <Function
      id="_transform_get_frequency"
      funcBody={include("./lib/_transform_get_frequency.js", "string")}
    />
    <JavascriptQuery
      id="_set_state_language"
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      isMultiplayerEdited={false}
      query={include("./lib/_set_state_language.js", "string")}
      resourceName="JavascriptQuery"
      showSuccessToaster={false}
      transformer=""
      workflowBlockPluginId={null}
    >
      <Event
        event="success"
        method="run"
        params={{ ordered: [{ src: "" }] }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
    </JavascriptQuery>
    <Function
      id="transform_get_publications"
      funcBody={include("./lib/transform_get_publications.js", "string")}
    />
    <DynamoQuery
      id="_get_meta_country"
      autoPaginate={false}
      enableTransformer={true}
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      ExpressionAttributeNames={'{"#enum_type": "enum_type"}'}
      ExpressionAttributeValues={'{":enum_type": "country"}'}
      IndexName="enum-type-index"
      isMultiplayerEdited={false}
      KeyConditionExpression="#enum_type = :enum_type"
      resourceDisplayName="prod-dynamo"
      resourceName="7664569c-3fcb-4f20-9a7e-8dc9e3617965"
      resourceTypeOverride=""
      retoolVersion="3.2.0"
      table="enums"
      transformer="// Query results are available as the `data` variable
//  return formatDataAsArray(data)"
      workflowBlockPluginId={null}
    />
    <DynamoQuery
      id="_get_meta_media_type"
      enableTransformer={true}
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      ExpressionAttributeNames={'{"#enum_type": "enum_type"}'}
      ExpressionAttributeValues={'{":enum_type": "media"}'}
      IndexName="enum-type-index"
      KeyConditionExpression="#enum_type = :enum_type"
      resourceDisplayName="prod-dynamo"
      resourceName="7664569c-3fcb-4f20-9a7e-8dc9e3617965"
      resourceTypeOverride=""
      table="enums"
      transformer="// Query results are available as the `data` variable
return formatDataAsArray(data)"
      workflowBlockPluginId={null}
    />
    <JavascriptQuery
      id="_set_state_category"
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      isMultiplayerEdited={false}
      query={include("./lib/_set_state_category.js", "string")}
      resourceName="JavascriptQuery"
      showSuccessToaster={false}
      transformer=""
      workflowBlockPluginId={null}
    >
      <Event
        event="success"
        method="run"
        params={{ ordered: [{ src: "" }] }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
    </JavascriptQuery>
    <DynamoQuery
      id="_get_meta_language"
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      ExpressionAttributeNames={'{"#enum_type": "enum_type"}'}
      ExpressionAttributeValues={'{":enum_type": "language"}'}
      IndexName="enum-type-index"
      isMultiplayerEdited={false}
      KeyConditionExpression="#enum_type = :enum_type"
      resourceDisplayName="prod-dynamo"
      resourceName="7664569c-3fcb-4f20-9a7e-8dc9e3617965"
      resourceTypeOverride=""
      retoolVersion="3.2.0"
      table="enums"
      transformer="// Query results are available as the `data` variable
return formatDataAsArray(data)"
      workflowBlockPluginId={null}
    />
    <DynamoQuery
      id="_get_meta_frequency"
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      ExpressionAttributeNames={'{"#enum_type": "enum_type"}'}
      ExpressionAttributeValues={'{":enum_type": "frequency"}'}
      IndexName="enum-type-index"
      KeyConditionExpression="#enum_type = :enum_type"
      resourceDisplayName="prod-dynamo"
      resourceName="7664569c-3fcb-4f20-9a7e-8dc9e3617965"
      resourceTypeOverride=""
      table="enums"
      transformer="// Query results are available as the `data` variable
return formatDataAsArray(data)"
      workflowBlockPluginId={null}
    />
    <JavascriptQuery
      id="_set_state_country"
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      isMultiplayerEdited={false}
      query={include("./lib/_set_state_country.js", "string")}
      resourceName="JavascriptQuery"
      showSuccessToaster={false}
      transformer=""
      workflowBlockPluginId={null}
    >
      <Event
        event="success"
        method="run"
        params={{ ordered: [{ src: "" }] }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
    </JavascriptQuery>
    <JavascriptQuery
      id="_set_state_family"
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      isMultiplayerEdited={false}
      query={include("./lib/_set_state_family.js", "string")}
      resourceName="JavascriptQuery"
      showSuccessToaster={false}
      transformer=""
      workflowBlockPluginId={null}
    >
      <Event
        event="success"
        method="run"
        params={{ ordered: [{ src: "" }] }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
    </JavascriptQuery>
    <DynamoQuery
      id="_get_meta_category"
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      ExpressionAttributeNames={'{"#enum_type": "enum_type"}'}
      ExpressionAttributeValues={'{":enum_type": "category"}'}
      IndexName="enum-type-index"
      isMultiplayerEdited={false}
      KeyConditionExpression="#enum_type = :enum_type"
      resourceDisplayName="prod-dynamo"
      resourceName="7664569c-3fcb-4f20-9a7e-8dc9e3617965"
      resourceTypeOverride=""
      retoolVersion="3.2.0"
      table="enums"
      transformer="// Query results are available as the `data` variable
return formatDataAsArray(data)"
      workflowBlockPluginId={null}
    />
    <Function
      id="_transform_get_language"
      funcBody={include("./lib/_transform_get_language.js", "string")}
    />
    <DynamoQuery
      id="_get_meta_family"
      enableTransformer={true}
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      ExpressionAttributeNames={'{"#enum_type": "enum_type"}'}
      ExpressionAttributeValues={'{":enum_type": "family"}'}
      IndexName="enum-type-index"
      isMultiplayerEdited={false}
      KeyConditionExpression="#enum_type = :enum_type"
      resourceDisplayName="prod-dynamo"
      resourceName="7664569c-3fcb-4f20-9a7e-8dc9e3617965"
      resourceTypeOverride=""
      retoolVersion="3.2.0"
      table="enums"
      transformer="// Query results are available as the `data` variable
return formatDataAsArray(data)"
      workflowBlockPluginId={null}
    />
    <Function
      id="_transform_get_category"
      funcBody={include("./lib/_transform_get_category.js", "string")}
    />
    <Function
      id="_transform_get_country"
      funcBody={include("./lib/_transform_get_country.js", "string")}
    />
    <Function
      id="_get_state_as_datasource"
      funcBody={include("./lib/_get_state_as_datasource.js", "string")}
    />
    <Function
      id="_transform_get_construct"
      funcBody={include("./lib/_transform_get_construct.js", "string")}
    />
    <JavascriptQuery
      id="_set_state_media_type"
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      isMultiplayerEdited={false}
      query={include("./lib/_set_state_media_type.js", "string")}
      resourceName="JavascriptQuery"
      showSuccessToaster={false}
      transformer=""
      workflowBlockPluginId={null}
    >
      <Event
        event="success"
        method="run"
        params={{ ordered: [{ src: "" }] }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
    </JavascriptQuery>
    <Function
      id="_transform_get_family"
      funcBody={include("./lib/_transform_get_family.js", "string")}
    />
    <DynamoQuery
      id="_get_meta_copyright_owners"
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      ExpressionAttributeNames={'{"#enum_type": "enum_type"}'}
      ExpressionAttributeValues={'{":enum_type": "copyright_owner"}'}
      IndexName="enum-type-index"
      isMultiplayerEdited={false}
      KeyConditionExpression="#enum_type = :enum_type"
      resourceDisplayName="prod-dynamo"
      resourceName="7664569c-3fcb-4f20-9a7e-8dc9e3617965"
      resourceTypeOverride=""
      retoolVersion="3.2.0"
      table="enums"
      transformer="// Query results are available as the `data` variable
return formatDataAsArray(data)"
      workflowBlockPluginId={null}
    />
    <Function
      id="_transform_get_copyright_owners"
      funcBody={include("./lib/_transform_get_copyright_owners.js", "string")}
    />
    <DynamoQuery
      id="_get_bulk_imported_data_by_user_prod"
      enableTransformer={true}
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      ExpressionAttributeNames={'{"#user": "user"}'}
      ExpressionAttributeValues={'{":user": {{ userList.value }} }'}
      IndexName="user-index"
      isMultiplayerEdited={false}
      KeyConditionExpression="#user = :user"
      resourceDisplayName="prod-dynamo"
      resourceName="7664569c-3fcb-4f20-9a7e-8dc9e3617965"
      resourceTypeOverride=""
      retoolVersion="3.2.0"
      table="bulk_manual_publications_metadata"
      transformer="
return formatDataAsArray(data)
"
      workflowBlockPluginId={null}
    />
    <Function
      id="_transform_get_bulk_users_uat"
      funcBody={include("./lib/_transform_get_bulk_users_uat.js", "string")}
    />
    <DynamoQuery
      id="_get_bulk_imported_data_by_user_uat"
      enableTransformer={true}
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      ExpressionAttributeNames={'{"#user": "user"}'}
      ExpressionAttributeValues={'{":user": {{ userList.value }} }'}
      IndexName="user-index"
      isMultiplayerEdited={false}
      KeyConditionExpression="#user = :user"
      resourceDisplayName="prod-dynamo"
      resourceName="7664569c-3fcb-4f20-9a7e-8dc9e3617965"
      resourceTypeOverride=""
      retoolVersion="3.2.0"
      table="bulk_manual_publications_metadata_uat"
      transformer="
return formatDataAsArray(data)
"
      workflowBlockPluginId={null}
    />
    <DynamoQuery
      id="_get_bulk_users_prod"
      enableTransformer={true}
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      ExpressionAttributeNames={'{"#user": "user" }'}
      ExpressionAttributeValues={'{":emptyString": { "S": "" }}'}
      FilterExpression="attribute_exists(#user) AND #user <> :emptyString"
      isMultiplayerEdited={false}
      KeyConditionExpression="#user = :user"
      method="scan"
      ProjectionExpression="#user"
      resourceDisplayName="prod-dynamo"
      resourceName="7664569c-3fcb-4f20-9a7e-8dc9e3617965"
      resourceTypeOverride=""
      retoolVersion="3.2.0"
      table="bulk_manual_publications_metadata"
      transformer="// Query results are available as the `data` variable
return formatDataAsArray(data)"
      workflowBlockPluginId={null}
    />
    <Function
      id="_transform_get_bulk_users_prod"
      funcBody={include("./lib/_transform_get_bulk_users_prod.js", "string")}
    />
    <Function
      id="_transform_bulk_users_uat"
      funcBody={include("./lib/_transform_bulk_users_uat.js", "string")}
    />
    <Function
      id="_transform_bulk_users_prod"
      funcBody={include("./lib/_transform_bulk_users_prod.js", "string")}
    />
    <Function
      id="_transform_get_bulk_imported_data_by_user_prod"
      funcBody={include(
        "./lib/_transform_get_bulk_imported_data_by_user_prod.js",
        "string"
      )}
    />
    <Function
      id="_transform_get_bulk_imported_data_by_user_uat"
      funcBody={include(
        "./lib/_transform_get_bulk_imported_data_by_user_uat.js",
        "string"
      )}
    />
  </Folder>
  <Folder id="es_connection">
    <ElasticSearchQuery
      id="_get_publication_search"
      body=""
      bodyType="none"
      cookies=""
      enableTransformer={true}
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      headers=""
      paginationDataField=""
      paginationEnabled={false}
      paginationLimit=""
      paginationPaginationField=""
      query={include("./lib/_get_publication_search.json5", "string")}
      resourceDisplayName="prod-elasticsearch"
      resourceName="08208166-eca7-4d39-b66d-fff1069007db"
      transformer={
        '// Query results are available as the `data` variable\nlet valuesArray = [];\n\n// Iterate through the array of objects\ndata.forEach(obj => {\n  // Check if the key exists in the object\n  if ("publications" in obj) {\n    // Push the value to the array\n    valuesArray.push(obj["publications"][0]);\n  }\n});\nreturn valuesArray'
      }
      type="GET"
      version={2}
    />
    <JavascriptQuery
      id="query27"
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      isMultiplayerEdited={false}
      query={include("./lib/query27.js", "string")}
      resourceName="JavascriptQuery"
      transformer="// Query results are available as the `data` variable
return data"
    />
    <RESTQuery
      id="_get_publication_search2"
      body={
        '{ "size":100,\n  "query": {\n    "prefix": {\n      "global_name.raw": {{textInput_search_title.value}}\n    }\n  }\n}'
      }
      bodyType="raw"
      enableTransformer={true}
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      headers={
        '[{"key":"Content-Type","value":"application/json"},{"key":"","value":""}]'
      }
      isMultiplayerEdited={false}
      resourceDisplayName="Elasticsearch Rest API"
      resourceName="22e2536e-4262-42b6-8260-a42072f336ba"
      transformer="// Query results are available as the `data` variable
let source = data.hits.hits
let valuesArray = [];

// Iterate through the array of objects
source.forEach(obj => {
    obj._source.id = obj._id;
    valuesArray.push(obj._source);
});
return valuesArray"
    />
    <JavascriptQuery
      id="_js_publication_search"
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      isMultiplayerEdited={false}
      query={include("./lib/_js_publication_search.js", "string")}
      resourceName="JavascriptQuery"
      resourceTypeOverride=""
      transformer="// Query results are available as the `data` variable
return formatDataAsArray(data)"
      workflowBlockPluginId={null}
    />
  </Folder>
  <Folder id="dynamodb">
    <DynamoQuery
      id="_update_publication_prod"
      autoPaginate={false}
      confirmationMessage="Do wish to update this publication?"
      enableTransformer={true}
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      ExpressionAttributeNames="{{expression_attribute_names_variable.value}}"
      ExpressionAttributeValues="{{expression_attribute_values_variable.value}}"
      isMultiplayerEdited={false}
      Key={'{"id":{{Default_Id.value}} }'}
      method="updateItem"
      requireConfirmation={true}
      resourceDisplayName="prod-dynamo"
      resourceName="7664569c-3fcb-4f20-9a7e-8dc9e3617965"
      resourceTypeOverride=""
      runWhenModelUpdates={false}
      successMessage="Publication updated"
      table="publication"
      transformer="// Query results are available as the `data` variable
return formatDataAsArray(data)"
      UpdateExpression="{{update_expression_variable.value}}"
      workflowBlockPluginId={null}
    />
    <DynamoQuery
      id="_update_publication_uat"
      autoPaginate={false}
      confirmationMessage="Do wish to update this publication?"
      enableTransformer={true}
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      ExpressionAttributeNames="{{expression_attribute_names_variable.value}}"
      ExpressionAttributeValues="{{expression_attribute_values_variable.value}}"
      isMultiplayerEdited={false}
      Key={'{"id":{{Default_Id.value}} }'}
      method="updateItem"
      requireConfirmation={true}
      resourceDisplayName="prod-dynamo"
      resourceName="7664569c-3fcb-4f20-9a7e-8dc9e3617965"
      resourceTypeOverride=""
      runWhenModelUpdates={false}
      successMessage="Publication updated"
      table="publication_UAT"
      transformer="// Query results are available as the `data` variable
return formatDataAsArray(data)"
      UpdateExpression="{{update_expression_variable.value}}"
      workflowBlockPluginId={null}
    />
    <DynamoQuery
      id="_put_publication_prod"
      autoPaginate={false}
      confirmationMessage="Do wish to add this publication?"
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      ExpressionAttributeNames=""
      ExpressionAttributeValues=""
      isMultiplayerEdited={false}
      Item="{{item_expression_variable.value}}"
      Key={'{"id":{{Default_Id.value}} }'}
      method="putItem"
      requireConfirmation={true}
      resourceDisplayName="prod-dynamo"
      resourceName="7664569c-3fcb-4f20-9a7e-8dc9e3617965"
      resourceTypeOverride=""
      runWhenModelUpdates={false}
      successMessage="Publication updated"
      table="manual_publications_metadata"
      transformer="// Query results are available as the `data` variable
return data"
      UpdateExpression="SET #title = :title, #media= :media, #family= :family, #country= :country, #frequency= :frequency, #language= :language, #category= :category, #verified= :verified, #construct= :construct"
      workflowBlockPluginId={null}
    />
    <DynamoQuery
      id="_put_publication_uat"
      autoPaginate={false}
      confirmationMessage="Do wish to add this publication?"
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      ExpressionAttributeNames=""
      ExpressionAttributeValues=""
      isMultiplayerEdited={false}
      Item="{{item_expression_variable.value}}"
      Key={'{"id":{{Default_Id.value}} }'}
      method="putItem"
      requireConfirmation={true}
      resourceDisplayName="prod-dynamo"
      resourceName="7664569c-3fcb-4f20-9a7e-8dc9e3617965"
      resourceTypeOverride=""
      runWhenModelUpdates={false}
      successMessage="Publication updated"
      table="manual_publications_metadata_UAT"
      transformer="// Query results are available as the `data` variable
return data"
      UpdateExpression="SET #title = :title, #media= :media, #family= :family, #country= :country, #frequency= :frequency, #language= :language, #category= :category, #verified= :verified, #construct= :construct"
      workflowBlockPluginId={null}
    />
    <DynamoQuery
      id="_update_nla_publication_prod"
      autoPaginate={false}
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      ExpressionAttributeNames="{{expression_attribute_names_variable.value}}"
      ExpressionAttributeValues="{{expression_attribute_values_variable.value}}"
      isMultiplayerEdited={false}
      Key={'{"gmd_id ":{{gmd_id.value}} }'}
      method="updateItem"
      notificationDuration={null}
      queryFailureConditions={
        '[{"condition":"","message":"\\"No gmd id for selected publication\\""}]'
      }
      resourceDisplayName="prod-dynamo"
      resourceName="7664569c-3fcb-4f20-9a7e-8dc9e3617965"
      runWhenModelUpdates={false}
      successMessage="ran updation on nla publication prod "
      table="nla_publications_metadata"
      transformer="// Query results are available as the `data` variable
return data"
      UpdateExpression="{{update_expression_variable.value}}"
    />
    <DynamoQuery
      id="_update_nla_publication_uat"
      autoPaginate={false}
      confirmationMessage="Are you sure triggering nla publication uat?"
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      ExpressionAttributeNames="{{expression_attribute_names_variable.value}}"
      ExpressionAttributeValues="{{expression_attribute_values_variable.value}}"
      isMultiplayerEdited={false}
      Key={'{"gmd_id":{{gmd_id.value}} }'}
      method="updateItem"
      notificationDuration={null}
      queryFailureConditions={
        '[{"condition":"","message":"\\"No gmd id for selected publication\\""}]'
      }
      requireConfirmation={true}
      resourceDisplayName="prod-dynamo"
      resourceName="7664569c-3fcb-4f20-9a7e-8dc9e3617965"
      runWhenModelUpdates={false}
      successMessage="ran updation on nla publication uat"
      table="nla_publications_metadata_uat"
      transformer="// Query results are available as the `data` variable
return data"
      UpdateExpression="{{update_expression_variable.value}}"
    />
    <DynamoQuery
      id="_update_cfc_publication_prod"
      autoPaginate={false}
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      ExpressionAttributeNames="{{expression_attribute_names_variable.value}}"
      ExpressionAttributeValues="{{expression_attribute_values_variable.value}}"
      Key={'{"id":{{Default_Id.value}} }'}
      method="updateItem"
      notificationDuration={null}
      resourceDisplayName="prod-dynamo"
      resourceName="7664569c-3fcb-4f20-9a7e-8dc9e3617965"
      runWhenModelUpdates={false}
      successMessage="ran updation on nla publication prod "
      table="cfc_publications_metadata"
      transformer="// Query results are available as the `data` variable
return data"
      UpdateExpression="{{update_expression_variable.value}}"
    />
    <DynamoQuery
      id="_update_cfc_publication_uat"
      autoPaginate={false}
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      ExpressionAttributeNames="{{expression_attribute_names_variable.value}}"
      ExpressionAttributeValues="{{expression_attribute_values_variable.value}}"
      Key={'{"id":{{Default_Id.value}} }'}
      method="updateItem"
      notificationDuration={null}
      resourceDisplayName="prod-dynamo"
      resourceName="7664569c-3fcb-4f20-9a7e-8dc9e3617965"
      runWhenModelUpdates={false}
      successMessage="ran updation on nla publication prod "
      table="cfc_publications_metadata"
      transformer="// Query results are available as the `data` variable
return data"
      UpdateExpression="{{update_expression_variable.value}}"
    />
    <DynamoQuery
      id="_put_nla_publication_uat"
      autoPaginate={false}
      confirmationMessage="Do wish to add this publication?"
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      ExpressionAttributeNames=""
      ExpressionAttributeValues=""
      isMultiplayerEdited={false}
      Item="{{item_expression_variable.value}}"
      Key={'{"id":{{Default_Id.value}} }'}
      method="putItem"
      requireConfirmation={true}
      resourceDisplayName="prod-dynamo"
      resourceName="7664569c-3fcb-4f20-9a7e-8dc9e3617965"
      resourceTypeOverride=""
      runWhenModelUpdates={false}
      successMessage="Publication updated"
      table="nla_publications_metadata_uat"
      transformer="// Query results are available as the `data` variable
return data"
      UpdateExpression="SET #title = :title, #media= :media, #family= :family, #country= :country, #frequency= :frequency, #language= :language, #category= :category, #verified= :verified, #construct= :construct"
      workflowBlockPluginId={null}
    />
    <DynamoQuery
      id="_put_nla_publication_prod"
      autoPaginate={false}
      confirmationMessage="Do wish to add this publication?"
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      ExpressionAttributeNames=""
      ExpressionAttributeValues=""
      isMultiplayerEdited={false}
      Item="{{item_expression_variable.value}}"
      Key={'{"id":{{Default_Id.value}} }'}
      method="putItem"
      requireConfirmation={true}
      resourceDisplayName="prod-dynamo"
      resourceName="7664569c-3fcb-4f20-9a7e-8dc9e3617965"
      resourceTypeOverride=""
      runWhenModelUpdates={false}
      successMessage="Publication updated"
      table="nla_publications_metadata_uat"
      transformer="// Query results are available as the `data` variable
return data"
      UpdateExpression="SET #title = :title, #media= :media, #family= :family, #country= :country, #frequency= :frequency, #language= :language, #category= :category, #verified= :verified, #construct= :construct"
      workflowBlockPluginId={null}
    />
    <DynamoQuery
      id="_update_publication_testing"
      autoPaginate={false}
      confirmationMessage="Do wish to update this publication?"
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      ExpressionAttributeNames="{{expression_attribute_names_variable.value}}"
      ExpressionAttributeValues="{{expression_attribute_values_variable.value}}"
      isMultiplayerEdited={false}
      Key={'{"id":{{Default_Id.value}} }'}
      method="updateItem"
      requireConfirmation={true}
      resourceDisplayName="prod-dynamo"
      resourceName="7664569c-3fcb-4f20-9a7e-8dc9e3617965"
      resourceTypeOverride=""
      runWhenModelUpdates={false}
      successMessage="Publication updated"
      table="publication_testing"
      transformer="// Query results are available as the `data` variable
return formatDataAsArray(data)"
      UpdateExpression="{{update_expression_variable.value}}"
      workflowBlockPluginId={null}
    />
    <DynamoQuery
      id="_put_publication_testing"
      autoPaginate={false}
      confirmationMessage="Do wish to add this publication?"
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      ExpressionAttributeNames=""
      ExpressionAttributeValues=""
      isMultiplayerEdited={false}
      Item="{{item_expression_variable.value}}"
      Key={'{"id":{{Default_Id.value}} }'}
      method="putItem"
      requireConfirmation={true}
      resourceDisplayName="prod-dynamo"
      resourceName="7664569c-3fcb-4f20-9a7e-8dc9e3617965"
      resourceTypeOverride=""
      runWhenModelUpdates={false}
      successMessage="Publication updated"
      table="manual_publications_metadata_UAT"
      transformer="// Query results are available as the `data` variable
return data"
      UpdateExpression="SET #title = :title, #media= :media, #family= :family, #country= :country, #frequency= :frequency, #language= :language, #category= :category, #verified= :verified, #construct= :construct"
      workflowBlockPluginId={null}
    />
    <DynamoQuery
      id="_put_bulk_manual_publications_metadata_uat"
      autoPaginate={false}
      confirmationMessage="Do wish to add this publication?"
      enableTransformer={true}
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      ExpressionAttributeNames=""
      ExpressionAttributeValues=""
      isMultiplayerEdited={false}
      Item="{{item_expression_variable.value}}"
      Key={'{"global_name":{{global_name_csv.value}} }'}
      method="putItem"
      resourceDisplayName="prod-dynamo"
      resourceName="7664569c-3fcb-4f20-9a7e-8dc9e3617965"
      resourceTypeOverride=""
      runWhenModelUpdates={false}
      showFailureToaster={false}
      showSuccessToaster={false}
      successMessage="Publication updated"
      table="bulk_manual_publications_metadata_uat"
      transformer="// Query results are available as the `data` variable
return data"
      UpdateExpression="{{update_expression_variable.value}}"
      workflowBlockPluginId={null}
    />
    <DynamoQuery
      id="_delete_bulk_manual_publications_metadata"
      autoPaginate={false}
      confirmationMessage="Do wish to add this publication?"
      enableTransformer={true}
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      ExpressionAttributeNames=""
      ExpressionAttributeValues=""
      isMultiplayerEdited={true}
      Item="{{item_expression_variable.value}}"
      Key={'{\n  "global_name": "{{ global_name_csv.value }}"\n}'}
      method="deleteItem"
      resourceDisplayName="prod-dynamo"
      resourceName="7664569c-3fcb-4f20-9a7e-8dc9e3617965"
      resourceTypeOverride=""
      runWhenModelUpdates={false}
      showFailureToaster={false}
      showSuccessToaster={false}
      successMessage="Publication updated"
      table="bulk_manual_publications_metadata"
      transformer=""
      UpdateExpression="{{update_expression_variable.value}}"
      workflowBlockPluginId={null}
    />
    <DynamoQuery
      id="_delete_bulk_manual_publications_metadata_uat"
      autoPaginate={false}
      confirmationMessage="Do wish to add this publication?"
      enableTransformer={true}
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      ExpressionAttributeNames=""
      ExpressionAttributeValues=""
      isMultiplayerEdited={false}
      Item="{{item_expression_variable.value}}"
      Key={'{\n  "global_name": "{{  global_name_csv.value }}"\n}'}
      method="deleteItem"
      resourceDisplayName="prod-dynamo"
      resourceName="7664569c-3fcb-4f20-9a7e-8dc9e3617965"
      resourceTypeOverride=""
      runWhenModelUpdates={false}
      showFailureToaster={false}
      showSuccessToaster={false}
      successMessage="Publication updated"
      table="bulk_manual_publications_metadata_uat"
      transformer="// Query results are available as the `data` variable
//return data"
      UpdateExpression="{{update_expression_variable.value}}"
      workflowBlockPluginId={null}
    />
    <DynamoQuery
      id="_put_bulk_manual_publications_metadata"
      autoPaginate={false}
      confirmationMessage="Do wish to add this publication?"
      enableTransformer={true}
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      ExpressionAttributeNames=""
      ExpressionAttributeValues=""
      isMultiplayerEdited={false}
      Item="{{item_expression_variable.value}}"
      Key={'{"global_name":{{global_name_csv.value}} }'}
      method="putItem"
      resourceDisplayName="prod-dynamo"
      resourceName="7664569c-3fcb-4f20-9a7e-8dc9e3617965"
      resourceTypeOverride=""
      runWhenModelUpdates={false}
      showFailureToaster={false}
      showSuccessToaster={false}
      successMessage="Publication updated"
      table="bulk_manual_publications_metadata"
      transformer="// Query results are available as the `data` variable
return data"
      UpdateExpression="{{update_expression_variable.value}}"
      workflowBlockPluginId={null}
    />
  </Folder>
  <Folder id="schema">
    <State
      id="_json_schema_category"
      _persistedValueGetter={null}
      _persistedValueSetter={null}
      persistedValueKey=""
      persistValue={false}
      value={
        '{\n  "form_schema": {\n    "title": "Category",\n    "description": "Get or set Category data",\n    "type": "object",\n    "required": [\n      "value",\n      "entity"\n    ],\n    "properties": {\n      "entity": {\n        "type": "string",\n        "title": "Entity",\n        "readOnly": true,\n        "default" : "text here"  \n      },\n      "value": {\n        "type": "string",\n        "title": "Name",\n        "default" : "text here"  \n      },\n      "id": {\n        "type": "string",\n        "title": "id"\n      },\n        "code": {\n        "type": "string",\n        "title": "Code"\n      }\n    }\n  },\n  "values_schema": {\n    "id": {\n      "ui:widget": "hidden"\n    },\n    "code": {\n    },\n    "value": {\n    },\n    "entity": {\n    }\n  }\n}'
      }
    />
    <State
      id="_json_schema_meta_data_form"
      _persistedValueGetter={null}
      _persistedValueSetter={null}
      persistedValueKey=""
      persistValue={false}
      value="{}"
    />
    <State
      id="_json_schema_family"
      _persistedValueGetter={null}
      _persistedValueSetter={null}
      persistedValueKey=""
      persistValue={false}
      value={
        '{\n  "form_schema": {\n    "title": "Family",\n    "description": "Get or set Publication Family data",\n    "type": "object",\n    "required": [\n      "value"\n    ],\n    "properties": {\n      "entity": {\n        "type": "string",\n        "title": "Entity",\n        "readOnly": true\n      },\n      "value": {\n        "type": "string",\n        "title": "Value"\n      },\n      "id": {\n        "type": "string",\n        "title": "id"\n      }\n    }\n  },\n  "values_schema": {\n    "id": {\n      "ui:widget": "hidden"\n    },\n    "value": {\n    }\n  }\n}'
      }
    />
    <State
      id="_json_schema_country"
      _persistedValueGetter={null}
      _persistedValueSetter={null}
      persistedValueKey=""
      persistValue={false}
      value={
        '{\n  "form_schema": {\n    "title": "Country",\n    "description": "Get or set Country data",\n    "type": "object",\n    "required": [\n      "name"\n    ],\n    "properties": {\n      "Currency": {\n        "type": "string",\n        "title": "Currency",\n        "readOnly": true,\n        "default": "text here"  \n      },\n      "name": {\n        "type": "string",\n        "title": "Name",\n        "default" :"text here"  \n      },\n        "code": {\n        "type": "string",\n        "title": "Code"\n      }\n    }\n  },\n  "values_schema": {\n    "id": {\n      "ui:widget": "hidden"\n    },\n    "code": {\n    },\n    "Currency": {\n    },\n    "name": {\n    }\n  }\n}'
      }
    />
    <State
      id="_json_schema_media_type"
      _persistedValueGetter={null}
      _persistedValueSetter={null}
      persistedValueKey=""
      persistValue={false}
      value={
        '{\n  "form_schema": {\n    "title": "Type",\n    "description": "Get or set media type data",\n    "type": "object",\n    "required": [\n      "value",\n      "entity"\n    ],\n    "properties": {\n      "entity": {\n        "type": "string",\n        "title": "Entity",\n        "readOnly": true,\n        "default" : "text here"  \n      },\n      "value": {\n        "type": "string",\n        "title": "Value",\n        "default" : "text here"  \n      },\n      "id": {\n        "type": "string",\n        "title": "id"\n      },\n        "code": {\n        "type": "string",\n        "title": "Code"\n      }\n    }\n  },\n  "values_schema": {\n    "id": {\n      "ui:widget": "hidden"\n    },\n    "code": {\n    },\n    "value": {\n    },\n    "entity": {\n    }\n  }\n}'
      }
    />
    <State
      id="_json_schema_language"
      _persistedValueGetter={null}
      _persistedValueSetter={null}
      persistedValueKey=""
      persistValue={false}
      value={
        '{\n  "form_schema": {\n    "title": "Language",\n    "description": "Get or set Language data",\n    "type": "object",\n    "required": [\n      "value",\n      "entity"\n    ],\n    "properties": {\n      "value": {\n        "type": "string",\n        "title": "Value",\n        "default" : "Language here"  \n      },\n      "entity": {\n        "type": "string",\n        "title": "Entity",\n        "readOnly": true,\n      },\n      "id": {\n        "type": "string",\n        "title": "id"\n      },\n        "code": {\n        "type": "string",\n        "title": "Code"\n      }\n    }\n  },\n  "values_schema": {\n    "id": {\n      "ui:widget": "hidden"\n    },\n    "code": {\n    },\n    "value": {\n    },\n    "entity": {\n      "ui:widget": "hidden"\n    }\n  }\n}'
      }
    />
  </Folder>
  <Folder id="scripts">
    <State
      id="construct_variable"
      _persistedValueGetter={null}
      _persistedValueSetter={null}
      persistedValueKey=""
      persistValue={false}
    />
    <JavascriptQuery
      id="_update_publication_trigger"
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      isMultiplayerEdited={false}
      query={include("./lib/_update_publication_trigger.js", "string")}
      resourceName="JavascriptQuery"
      showFailureToaster={false}
      showSuccessToaster={false}
      transformer="// Query results are available as the `data` variable
return formatDataAsArray(data)"
      workflowBlockPluginId={null}
    />
    <State
      id="update_expression_variable"
      _persistedValueGetter={null}
      _persistedValueSetter={null}
      persistedValueKey=""
      persistValue={false}
      value=""
    />
    <State
      id="expression_attribute_values_variable"
      _persistedValueGetter={null}
      _persistedValueSetter={null}
      persistedValueKey=""
      persistValue={false}
    />
    <JavascriptQuery
      id="_put_publication_trigger"
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      isMultiplayerEdited={false}
      query={include("./lib/_put_publication_trigger.js", "string")}
      resourceName="JavascriptQuery"
      showFailureToaster={false}
      showSuccessToaster={false}
      transformer="// Query results are available as the `data` variable
return formatDataAsArray(data)"
      workflowBlockPluginId={null}
    />
    <State
      id="item_expression_variable"
      _persistedValueGetter={null}
      _persistedValueSetter={null}
      persistedValueKey=""
      persistValue={false}
    />
    <State
      id="expression_attribute_names_variable"
      _persistedValueGetter={null}
      _persistedValueSetter={null}
      persistedValueKey=""
      persistValue={false}
    />
    <JavascriptQuery
      id="delivery_method_reuse_component"
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      notificationDuration={4.5}
      query={include("./lib/delivery_method_reuse_component.js", "string")}
      resourceName="JavascriptQuery"
      transformer="// Query results are available as the `data` variable
return data"
    />
    <JavascriptQuery
      id="store_old_copyright_owner_value"
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      isMultiplayerEdited={false}
      notificationDuration={4.5}
      query={include("./lib/store_old_copyright_owner_value.js", "string")}
      resourceName="JavascriptQuery"
      transformer="// Query results are available as the `data` variable
return data"
    />
    <JavascriptQuery
      id="extract_id"
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      isMultiplayerEdited={false}
      notificationDuration={4.5}
      query={include("./lib/extract_id.js", "string")}
      resourceName="JavascriptQuery"
      transformer="// Query results are available as the `data` variable
return data"
    />
    <State
      id="gmd_id"
      _persistedValueGetter={null}
      _persistedValueSetter={null}
      persistedValueKey=""
      persistValue={false}
    />
    <JavascriptQuery
      id="copyright_option"
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      isMultiplayerEdited={false}
      notificationDuration={4.5}
      query={include("./lib/copyright_option.js", "string")}
      resourceName="JavascriptQuery"
      transformer="// Query results are available as the `data` variable
return data"
    />
    <JavascriptQuery
      id="bulk_csv_validation"
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      isMultiplayerEdited={false}
      notificationDuration={4.5}
      query={include("./lib/bulk_csv_validation.js", "string")}
      resourceName="JavascriptQuery"
      transformer="// Query results are available as the `data` variable
return data"
    />
    <State id="global_name_csv" value="" />
    <State
      id="user"
      _persistedValueGetter={null}
      _persistedValueSetter={null}
      persistedValueKey=""
      persistValue={false}
      value="{{ current_user.fullName }}"
    />
    <JavascriptQuery
      id="bulk_status_user_records"
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      isMultiplayerEdited={false}
      notificationDuration={4.5}
      query={include("./lib/bulk_status_user_records.js", "string")}
      resourceName="JavascriptQuery"
      transformer="// Query results are available as the `data` variable
return data"
    />
    <JavascriptQuery
      id="bulk_import_status_user_list"
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      isMultiplayerEdited={false}
      notificationDuration={4.5}
      query={include("./lib/bulk_import_status_user_list.js", "string")}
      resourceName="JavascriptQuery"
      transformer="// Query results are available as the `data` variable
return data"
    />
  </Folder>
  <Folder id="_set_readable_enum_values">
    <SqlTransformQuery
      id="_sql_get_category_id"
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      query={include("./lib/_sql_get_category_id.sql", "string")}
      resourceName="SQL Transforms"
      resourceTypeOverride=""
      runWhenModelUpdates={false}
      transformer="// Query results are available as the `data` variable
return formatDataAsArray(data)"
      workflowBlockPluginId={null}
    />
    <SqlTransformQuery
      id="_sql_get_language_id"
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      query={include("./lib/_sql_get_language_id.sql", "string")}
      resourceName="SQL Transforms"
      resourceTypeOverride=""
      runWhenModelUpdates={false}
      transformer="// Query results are available as the `data` variable
return formatDataAsArray(data)"
      workflowBlockPluginId={null}
    />
    <SqlTransformQuery
      id="_sql_get_media_id"
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      query={include("./lib/_sql_get_media_id.sql", "string")}
      resourceName="SQL Transforms"
      resourceTypeOverride=""
      runWhenModelUpdates={false}
      transformer="// Query results are available as the `data` variable
return formatDataAsArray(data)"
      workflowBlockPluginId={null}
    />
    <SqlTransformQuery
      id="_sql_get_frequency_id"
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      query={include("./lib/_sql_get_frequency_id.sql", "string")}
      resourceName="SQL Transforms"
      resourceTypeOverride=""
      runWhenModelUpdates={false}
      transformer="// Query results are available as the `data` variable
return formatDataAsArray(data)"
      workflowBlockPluginId={null}
    />
    <SqlTransformQuery
      id="_sql_get_country_id"
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      query={include("./lib/_sql_get_country_id.sql", "string")}
      resourceName="SQL Transforms"
      resourceTypeOverride=""
      runWhenModelUpdates={false}
      transformer="// Query results are available as the `data` variable
return formatDataAsArray(data)"
      workflowBlockPluginId={null}
    />
    <SqlTransformQuery
      id="_sql_get_family_id"
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      query={include("./lib/_sql_get_family_id.sql", "string")}
      resourceName="SQL Transforms"
      resourceTypeOverride=""
      runWhenModelUpdates={false}
      transformer="// Query results are available as the `data` variable
return formatDataAsArray(data)"
      workflowBlockPluginId={null}
    />
  </Folder>
</GlobalFunctions>
