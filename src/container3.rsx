<Container
  id="container3"
  _gap={0}
  footerPadding="4px 12px"
  headerPadding="4px 12px"
  padding="12px"
  showBody={true}
  showHeader={true}
>
  <Header>
    <Text
      id="containerTitle3"
      horizontalAlign="center"
      value="##### Publication Import"
      verticalAlign="center"
    />
  </Header>
  <View id="1170d" viewKey="View 1">
    <Text
      id="pub_csv_data_preview_text"
      style={{ ordered: [{ color: "primary" }] }}
      value="##### Publication CSV Data Preview"
      verticalAlign="center"
    />
    <Text
      id="pub_validation_error_text"
      style={{ ordered: [{ color: "rgba(227, 17, 17, 1)" }] }}
      value="##### Publication Validation Error"
      verticalAlign="center"
    />
    <Table
      id="pub_csv_data_preview_table"
      actionsOverflowPosition={1}
      cellSelection="none"
      clearChangesetOnSave={true}
      data="{{browse_publication_csv_btn.parsedValue[0]}}"
      defaultSelectedRow={{ mode: "index", indexType: "display", index: 0 }}
      emptyMessage="No rows found"
      enableSaveActions={true}
      groupByColumns={{}}
      heightType="auto"
      overflowType="pagination"
      primaryKeyColumnId="e5b8e"
      rowSelection="none"
      showBorder={true}
      showFooter={true}
      showHeader={true}
      toolbarPosition="bottom"
    >
      <Column
        id="e5b8e"
        alignment="left"
        editable={false}
        format="string"
        groupAggregationMode="none"
        key="global_name"
        label="Global name"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="e5a8d"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        key="gmd_id"
        label="Gmd ID"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="405a5"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        key="publication_id"
        label="Publication ID"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="4b48d"
        alignment="left"
        format="tag"
        formatOptions={{ automaticColors: true }}
        groupAggregationMode="none"
        key="country"
        label="Country"
        placeholder="Select option"
        position="center"
        size={100}
        summaryAggregationMode="none"
        valueOverride="{{ _.startCase(item) }}"
      />
      <Column
        id="2e72d"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        key="category"
        label="Category"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="47c9c"
        alignment="left"
        format="tag"
        formatOptions={{ automaticColors: true }}
        groupAggregationMode="none"
        key="media"
        label="Media"
        placeholder="Select option"
        position="center"
        size={100}
        summaryAggregationMode="none"
        valueOverride="{{ _.startCase(item) }}"
      />
      <Column
        id="7ec82"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        key="frequency"
        label="Frequency"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="c9e35"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        key="family"
        label="Family"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="00320"
        alignment="left"
        format="tag"
        formatOptions={{ automaticColors: true }}
        groupAggregationMode="none"
        key="languages"
        label="Languages"
        placeholder="Select option"
        position="center"
        size={100}
        summaryAggregationMode="none"
        valueOverride="{{ _.startCase(item) }}"
      />
      <Column
        id="09c85"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        key="domain"
        label="Domain"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="ef98d"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        key="copyright_owner"
        label="Copyright owner"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="7428d"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        key="delivery_method"
        label="Delivery method"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="2f88c"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        key="nla_name"
        label="Nla name"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="6ccca"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        key="nla_reporting_code"
        label="Nla reporting code"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="82d05"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        key="nla_publication_type"
        label="Nla publication type"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="10268"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        key="immo_license"
        label="Immo license"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="3b401"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        key="nla_publisher"
        label="Nla publisher"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="9ee4a"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        key="select_nla_edition"
        label="Select nla edition"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="f7ef4"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        key="nla_acronym"
        label="Nla acronym"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="fb550"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        key="nla_region"
        label="Nla region"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="1a6e3"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        key="cla_name"
        label="Cla name"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="c5bbc"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        key="cla_reporting_code_plsid"
        label="Cla reporting code plsid"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="36976"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        key="cla_issn"
        label="Cla issn"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="5e351"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        key="cla_publisher_name"
        label="Cla publisher name"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="62b65"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        key="nli_name"
        label="Nli name"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="e3bdf"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        key="nli_publication_type"
        label="Nli publication type"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <Action id="74f5d" icon="bold/interface-edit-pencil" label="Action 1" />
      <ToolbarButton
        id="1a"
        icon="bold/interface-text-formatting-filter-2"
        label="Filter"
        type="filter"
      />
      <ToolbarButton
        id="3c"
        icon="bold/interface-download-button-2"
        label="Download"
        type="custom"
      >
        <Event
          event="clickToolbar"
          method="exportData"
          pluginId="pub_csv_data_preview_table"
          type="widget"
          waitMs="0"
          waitType="debounce"
        />
      </ToolbarButton>
      <ToolbarButton
        id="4d"
        icon="bold/interface-arrows-round-left"
        label="Refresh"
        type="custom"
      >
        <Event
          event="clickToolbar"
          method="refresh"
          pluginId="pub_csv_data_preview_table"
          type="widget"
          waitMs="0"
          waitType="debounce"
        />
      </ToolbarButton>
    </Table>
    <Table
      id="pub_validation_error_table"
      actionsOverflowPosition={1}
      cellSelection="none"
      clearChangesetOnSave={true}
      data="{{ 
  bulk_csv_validation.data
}}
"
      defaultSelectedRow={{ mode: "index", indexType: "display", index: 0 }}
      emptyMessage="No rows found"
      enableSaveActions={true}
      groupByColumns={{}}
      heightType="auto"
      overflowType="pagination"
      primaryKeyColumnId="83fc5"
      rowSelection="none"
      showBorder={true}
      showFooter={true}
      showHeader={true}
      toolbarPosition="bottom"
    >
      <Column
        id="080e5"
        alignment="left"
        format="multilineString"
        groupAggregationMode="none"
        key="validation_errors"
        label="Validation errors"
        placeholder="Enter value"
        position="center"
        referenceId="validation_errors"
        size={279}
        summaryAggregationMode="none"
      />
      <Column
        id="83fc5"
        alignment="left"
        editable={false}
        format="string"
        groupAggregationMode="none"
        key="global_name"
        label="Global name"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="28c14"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        key="gmd_id"
        label="Gmd ID"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="f86a7"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        key="publication_id"
        label="Publication ID"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="88216"
        alignment="left"
        format="tag"
        formatOptions={{ automaticColors: true }}
        groupAggregationMode="none"
        key="country"
        label="Country"
        placeholder="Select option"
        position="center"
        size={100}
        summaryAggregationMode="none"
        valueOverride="{{ _.startCase(item) }}"
      />
      <Column
        id="1c577"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        key="category"
        label="Category"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="8b4ce"
        alignment="left"
        format="tag"
        formatOptions={{ automaticColors: true }}
        groupAggregationMode="none"
        key="media"
        label="Media"
        placeholder="Select option"
        position="center"
        size={100}
        summaryAggregationMode="none"
        valueOverride="{{ _.startCase(item) }}"
      />
      <Column
        id="fc73c"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        key="frequency"
        label="Frequency"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="b7fc3"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        key="family"
        label="Family"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="b6043"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        key="languages"
        label="Languages"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="45219"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        key="domain"
        label="Domain"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="e9e23"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        key="copyright_owner"
        label="Copyright owner"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="a1333"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        key="delivery_method"
        label="Delivery method"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="cd0d8"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        key="nla_name"
        label="Nla name"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="a71b0"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        key="nla_reporting_code"
        label="Nla reporting code"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="f3ce8"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        key="nla_publication_type"
        label="Nla publication type"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="20cd9"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        key="immo_license"
        label="Immo license"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="59f70"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        key="nla_publisher"
        label="Nla publisher"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="361db"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        key="select_nla_edition"
        label="Select nla edition"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="08f44"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        key="nla_acronym"
        label="Nla acronym"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="bb629"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        key="nla_region"
        label="Nla region"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="ce1fb"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        key="cla_name"
        label="Cla name"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="90fed"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        key="cla_reporting_code_plsid"
        label="Cla reporting code plsid"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="47280"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        key="cla_issn"
        label="Cla issn"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="3dcb8"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        key="cla_publisher_name"
        label="Cla publisher name"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="fa700"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        key="nli_name"
        label="Nli name"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="9502d"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        key="nli_publication_type"
        label="Nli publication type"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <Action id="74f5d" icon="bold/interface-edit-pencil" label="Action 1" />
      <ToolbarButton
        id="1a"
        icon="bold/interface-text-formatting-filter-2"
        label="Filter"
        type="filter"
      />
      <ToolbarButton
        id="3c"
        icon="bold/interface-download-button-2"
        label="Download"
        type="custom"
      >
        <Event
          event="clickToolbar"
          method="exportData"
          pluginId="pub_validation_error_table"
          type="widget"
          waitMs="0"
          waitType="debounce"
        />
      </ToolbarButton>
      <ToolbarButton
        id="4d"
        icon="bold/interface-arrows-round-left"
        label="Refresh"
        type="custom"
      >
        <Event
          event="clickToolbar"
          method="refresh"
          pluginId="pub_validation_error_table"
          type="widget"
          waitMs="0"
          waitType="debounce"
        />
      </ToolbarButton>
    </Table>
  </View>
</Container>
