<Container
  id="tabbedcontainer_publication"
  currentViewKey="{{ self.viewKeys[0]}}"
  footerPadding="4px 12px"
  footerPaddingType="normal"
  headerPadding="4px 12px"
  headerPaddingType="normal"
  marginType="normal"
  padding="12px"
  paddingType="normal"
  showBody={true}
  showHeader={true}
>
  <Header>
    <Tabs
      id="tabs_navigation"
      itemMode="static"
      marginType="normal"
      navigateContainer={true}
      style={{
        ordered: [
          { selectedBackground: "rgba(100, 219, 59, 0.2)" },
          { selectedText: "rgb(100, 219, 59)" },
          { unselectedText: "rgb(158, 154, 154)" },
        ],
      }}
      targetContainerId="tabbedcontainer_publication"
      value="{{ self.values[0] }}"
    >
      <Option id="06d6a" value="Tab 1" />
      <Option id="8a3d1" value="Tab 2" />
      <Option id="d70c3" value="Tab 3" />
    </Tabs>
  </Header>
  <View id="cd96e" label="Publication" viewKey="Publication">
    <Container
      id="container_search"
      footerPadding="4px 12px"
      footerPaddingType="normal"
      headerPadding="4px 12px"
      headerPaddingType="normal"
      marginType="normal"
      padding="12px"
      paddingType="normal"
      showBody={true}
      showHeader={true}
    >
      <Header>
        <Text
          id="container_search_title"
          marginType="normal"
          style={{ ordered: [{ color: "rgb(158, 154, 154)" }] }}
          value="#### Search publications"
          verticalAlign="center"
        />
      </Header>
      <View id="9b8cb" viewKey="View 1">
        <TextInput
          id="textInput_search_title"
          label="Title"
          marginType="normal"
          placeholder="Enter value"
          style={{ ordered: [{ accent: "rgb(169, 44, 242)" }] }}
          value=" "
        >
          <Event
            event="submit"
            method="trigger"
            params={{ ordered: [] }}
            pluginId="_get_publication_search2"
            type="datasource"
            waitMs="0"
            waitType="debounce"
          />
        </TextInput>
        <DropdownButton
          id="dropdownButton_publicationOptions"
          _colorByIndex={[""]}
          _fallbackTextByIndex={[""]}
          _imageByIndex={[""]}
          _values={[""]}
          hidden="true"
          itemMode="static"
          marginType="normal"
          overlayMaxHeight={375}
          style={{ ordered: [{ border: "rgba(148, 145, 145, 1)" }] }}
          styleVariant="outline"
          text="..."
        >
          <Option
            id="8498f"
            icon="bold/interface-add-circle-alternate"
            label="Add new"
            tooltip="Add a new publication"
          >
            <Event
              event="click"
              method="clear"
              params={{ ordered: [] }}
              pluginId="form_publication"
              type="widget"
              waitMs="0"
              waitType="debounce"
            />
            <Event
              event="click"
              method="setValue"
              params={{ ordered: [{ value: "true" }] }}
              pluginId="_state_item_is_new"
              type="state"
              waitMs="0"
              waitType="debounce"
            />
            <Event
              event="click"
              method="setValue"
              params={{ ordered: [] }}
              pluginId="state_rules"
              type="state"
              waitMs="0"
              waitType="debounce"
            />
          </Option>
          <Event
            event="click"
            method="selectRow"
            params={{
              ordered: [
                {
                  options: {
                    ordered: [
                      { mode: "index" },
                      { indexType: "display" },
                      { index: "1" },
                      { key: null },
                    ],
                  },
                },
              ],
            }}
            pluginId="table_publications"
            targetId="a82fc"
            type="widget"
            waitMs="0"
            waitType="debounce"
          />
        </DropdownButton>
        <Button
          id="button_search"
          marginType="normal"
          style={{ ordered: [{ background: "rgba(100, 219, 59, 1)" }] }}
          text="Search"
        >
          <Event
            event="click"
            method="setHidden"
            params={{ ordered: [{ hidden: false }] }}
            pluginId="container_publicationSearchResults"
            type="widget"
            waitMs="0"
            waitType="debounce"
          />
          <Event
            event="click"
            method="trigger"
            params={{
              ordered: [
                {
                  options: {
                    object: {
                      onSuccess: null,
                      onFailure: null,
                      additionalScope: null,
                    },
                  },
                },
              ],
            }}
            pluginId="_get_publication_search2"
            type="datasource"
            waitMs="0"
            waitType="debounce"
          />
        </Button>
      </View>
    </Container>
    <Spacer id="spacer1" marginType="normal" />
    <Container
      id="container_publications"
      footerPadding="4px 12px"
      footerPaddingType="normal"
      headerPadding="4px 12px"
      headerPaddingType="normal"
      marginType="normal"
      padding="12px"
      paddingType="normal"
      showBody={true}
      showHeader={true}
    >
      <Header>
        <Text
          id="container_title_publications"
          marginType="normal"
          style={{ ordered: [{ color: "rgba(158, 154, 154, 1)" }] }}
          value="#### Publications"
          verticalAlign="center"
        />
      </Header>
      <View id="48330" viewKey="View 1">
        <Form
          id="form_publication"
          disabled="false"
          footerPadding="4px 12px"
          footerPaddingType="normal"
          headerPadding="4px 12px"
          headerPaddingType="normal"
          hidden=""
          initialData="{{ table_publications.selectedRow }}"
          marginType="normal"
          padding="12px"
          paddingType="normal"
          resetAfterSubmit={true}
          scroll={true}
          showBody={true}
          showFooter={true}
          showHeader="true"
          style={{ ordered: [{ border: "canvas" }] }}
        >
          <Body>
            <Tabs
              id="tabs_publication_details_navigation"
              hidden=""
              itemMode="static"
              marginType="normal"
              navigateContainer={true}
              style={{
                ordered: [
                  { selectedBackground: "rgba(100, 219, 59, 0.2)" },
                  { selectedText: "rgb(100, 219, 59)" },
                ],
              }}
              targetContainerId="tabbedcontainer_publication_details"
              value="{{ self.values[0] }}"
            >
              <Option id="bbf59" value="Tab 1" />
              <Option id="4d9ea" value="Tab 2" />
              <Option id="c7ff1" value="Tab 3" />
            </Tabs>
            <Include src="./tabbedcontainer_publication_details.rsx" />
          </Body>
          <Footer>
            <Button
              id="create_publication"
              style={{ ordered: [{ background: "rgb(100, 219, 59)" }] }}
              submitTargetId="form_publication"
              text="create"
              tooltipText="This will create new publication"
            >
              <Event
                event="click"
                method="trigger"
                params={{ ordered: [] }}
                pluginId="_put_publication_trigger"
                type="datasource"
                waitMs="0"
                waitType="debounce"
              />
            </Button>
            <Button
              id="formbutton_publication_details_submit"
              loading=""
              marginType="normal"
              style={{ ordered: [{ background: "rgb(100, 219, 59)" }] }}
              submitTargetId="form_publication"
              text="update"
              tooltipText="This will update the existing publication"
            >
              <Event
                event="click"
                method="trigger"
                params={{ ordered: [] }}
                pluginId="_update_publication_trigger"
                type="datasource"
                waitMs="0"
                waitType="debounce"
              />
            </Button>
          </Footer>
        </Form>
        <Table
          id="table_publications"
          cellSelection="none"
          clearChangesetOnSave={true}
          data="{{ _get_publication_search2.data }}"
          defaultFilters={{
            0: {
              ordered: [
                { columnId: "" },
                { operator: "includes" },
                { value: "" },
                { id: "24e49" },
              ],
            },
            1: {
              ordered: [
                { columnId: "" },
                { operator: "includes" },
                { value: "" },
                { id: "54faf" },
              ],
            },
          }}
          defaultSelectedRow={{ mode: "index", indexType: "display", index: 0 }}
          defaultSort={[{ object: { columnId: "a70ff", direction: "asc" } }]}
          dynamicColumnProperties={{ formatByIndex: "auto" }}
          enableSaveActions={true}
          groupByColumns={{}}
          hidden="false"
          overflowType="pagination"
          showBorder={true}
          showFooter={true}
          showHeader={true}
          style={{ accent: "rgb(100, 219, 59)" }}
          templatePageSize=""
          toolbarPosition="bottom"
        >
          <Column
            id="a23eb"
            alignment="left"
            editable={false}
            format="tag"
            formatOptions={{ automaticColors: true }}
            groupAggregationMode="none"
            key="global_name"
            label="Global name"
            placeholder="Select option"
            position="center"
            size={298.375}
            summaryAggregationMode="none"
          />
          <Column
            id="ef509"
            alignment="left"
            format="string"
            groupAggregationMode="none"
            key="country"
            label="Country"
            placeholder="Enter value"
            position="center"
            size={63.28125}
            summaryAggregationMode="none"
          />
          <Column
            id="2949a"
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
            id="19680"
            alignment="left"
            format="tag"
            formatOptions={{ automaticColors: true }}
            groupAggregationMode="none"
            key="media"
            label="Media"
            placeholder="Select option"
            position="center"
            size={64.296875}
            summaryAggregationMode="none"
          />
          <Column
            id="77445"
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
            id="57548"
            alignment="left"
            format="string"
            groupAggregationMode="none"
            key="family"
            label="Family"
            placeholder="Enter value"
            position="center"
            size={308}
            summaryAggregationMode="none"
          />
          <Column
            id="14e36"
            alignment="left"
            cellTooltipMode="overflow"
            format="tags"
            formatOptions={{ automaticColors: true }}
            groupAggregationMode="none"
            key="languages"
            label="Languages"
            placeholder="Select options"
            position="center"
            size={79.90625}
            summaryAggregationMode="none"
          />
          <Column
            id="94e90"
            alignment="left"
            editable={false}
            editableOptions={{ showStepper: true }}
            format="string"
            formatOptions={{ showSeparators: true, notation: "standard" }}
            groupAggregationMode="sum"
            key="id"
            label="Id"
            placeholder="Enter value"
            position="center"
            size={354.828125}
            summaryAggregationMode="none"
          />
          <Column
            id="21ae0"
            alignment="left"
            format="string"
            groupAggregationMode="none"
            key="lookup_attributes"
            label="Lookup attributes"
            placeholder="Enter value"
            position="center"
            size={571}
            summaryAggregationMode="none"
          />
          <Column
            id="e74db"
            alignment="right"
            editableOptions={{ showStepper: true }}
            format="decimal"
            formatOptions={{ showSeparators: true, notation: "standard" }}
            groupAggregationMode="sum"
            key="gmd_id"
            label="Gmd ID"
            placeholder="Enter value"
            position="center"
            size={100}
            summaryAggregationMode="none"
          />
          <Column
            id="408e6"
            alignment="left"
            format="string"
            groupAggregationMode="none"
            key="support_name"
            label="Support name"
            placeholder="Enter value"
            position="center"
            size={100}
            summaryAggregationMode="none"
          />
          <Column
            id="e8efe"
            alignment="left"
            format="string"
            groupAggregationMode="none"
            key="copyright_details"
            label="Copyright details"
            placeholder="Enter value"
            position="center"
            size={261}
            summaryAggregationMode="none"
          />
          <Column
            id="3c315"
            alignment="left"
            format="boolean"
            groupAggregationMode="none"
            key="enum_construct_flag"
            label="Enum construct flag"
            placeholder="Enter value"
            position="center"
            size={183}
            summaryAggregationMode="none"
          />
          <Column
            id="f3132"
            alignment="center"
            format="string"
            formatOptions={{ automaticColors: true }}
            groupAggregationMode="none"
            key="copyright_owner_details"
            label="Copyright owner details"
            placeholder="Enter value"
            position="center"
            referenceId="copyright_owner_details"
            size={753}
            summaryAggregationMode="none"
            valueOverride="{{item}}"
          />
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
              params={{
                ordered: [{ options: { ordered: [{ fileType: "csv" }] } }],
              }}
              pluginId="table_publications"
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
              pluginId="table_publications"
              type="widget"
              waitMs="0"
              waitType="debounce"
            />
          </ToolbarButton>
          <Event
            event="selectRow"
            method="trigger"
            params={{
              ordered: [
                {
                  options: {
                    object: {
                      onSuccess: null,
                      onFailure: null,
                      additionalScope: null,
                    },
                  },
                },
              ],
            }}
            pluginId="store_old_copyright_owner_value"
            type="datasource"
            waitMs="0"
            waitType="debounce"
          />
          <Event
            enabled="{{table_publications.selectedRow.lookup_attributes.external_ids.values}}"
            event="selectRow"
            method="trigger"
            params={{ ordered: [] }}
            pluginId="extract_id"
            type="datasource"
            waitMs="0"
            waitType="debounce"
          />
          <Event
            event="selectRow"
            method="trigger"
            params={{ ordered: [] }}
            pluginId="copyright_option"
            type="datasource"
            waitMs="0"
            waitType="debounce"
          />
          <Event
            event="clickRow"
            method="trigger"
            params={{ ordered: [] }}
            pluginId="delivery_method_reuse_component"
            type="datasource"
            waitMs="0"
            waitType="debounce"
          />
          <Event
            event="clickRow"
            method="trigger"
            params={{ ordered: [] }}
            pluginId="copyright_option"
            type="datasource"
            waitMs="0"
            waitType="debounce"
          />
        </Table>
        <Container
          id="container_publicationSearchResults"
          footerPadding="4px 12px"
          footerPaddingType="normal"
          headerPadding="4px 12px"
          headerPaddingType="normal"
          marginType="normal"
          padding="12px"
          paddingType="normal"
          showBody={true}
          showBorder={false}
          showHeader="false"
          showHeaderBorder={false}
        >
          <View id="5febd" viewKey="View 1" />
        </Container>
      </View>
    </Container>
    <Button id="button1" text="Button" />
  </View>
  <View id="4586f" label="Taxonomy" viewKey="SupportingData">
    <LinkList
      id="linklist_navigation"
      itemMode="static"
      label=""
      labelPosition="top"
      marginType="normal"
      showUnderline="never"
    >
      <Option id="5bd85" icon="bold/interface-user-single" label="Family">
        <Event
          event="click"
          method="trigger"
          params={{ ordered: [] }}
          pluginId="_set_state_family"
          type="datasource"
          waitMs="0"
          waitType="debounce"
        />
      </Option>
      <Option id="dba3f" icon="bold/interface-align-layers-1" label="Country">
        <Event
          event="click"
          method="trigger"
          params={{ ordered: [] }}
          pluginId="_set_state_country"
          type="datasource"
          waitMs="0"
          waitType="debounce"
        />
      </Option>
      <Option id="80521" icon="bold/travel-map-earth-1" label="Media types">
        <Event
          event="click"
          method="trigger"
          params={{ ordered: [] }}
          pluginId="_set_state_media_type"
          type="datasource"
          waitMs="0"
          waitType="debounce"
        />
      </Option>
      <Option
        id="ff945"
        disabled={false}
        hidden={false}
        icon="bold/programming-script-1"
        label="Language"
        tooltip="Manage the Language dataset "
      >
        <Event
          event="click"
          method="trigger"
          params={{ ordered: [] }}
          pluginId="_set_state_language"
          type="datasource"
          waitMs="0"
          waitType="debounce"
        />
      </Option>
      <Option
        id="4214b"
        disabled={false}
        hidden={false}
        icon="bold/interface-text-formatting-list-bullets"
        label="Category"
      >
        <Event
          event="click"
          method="trigger"
          params={{ ordered: [] }}
          pluginId="_set_state_category"
          type="datasource"
          waitMs="0"
          waitType="debounce"
        />
      </Option>
    </LinkList>
    <TableLegacy
      id="table_entities"
      _columnVisibility={{ ordered: [{ entity: false }, { id: false }] }}
      _compatibilityMode={false}
      actionButtonColumnName="New"
      applyDynamicSettingsToColumnOrder={false}
      columnColors={{
        ordered: [
          { id: "" },
          { name: "" },
          { enum_type: "" },
          { code: "" },
          { currency: "" },
          { entity: "" },
          { value: "" },
          { "iso-code": "" },
        ],
      }}
      columnEditable={{ ordered: [{ value: true }] }}
      columnHeaderNames={{
        ordered: [
          { value: "Value" },
          { currency: "Currency" },
          { code: "Code" },
          { "iso-code": "ISO" },
        ],
      }}
      data="{{ _get_state_as_datasource.value }}"
      doubleClickToEdit={true}
      events={[
        {
          ordered: [
            { event: "rowSelectChange" },
            { type: "script" },
            { method: "run" },
            { pluginId: "" },
            { targetId: null },
            {
              params: {
                ordered: [
                  {
                    src: "form_rules.reset(); form_rules.setData(table_entities.selectedRow.data);",
                  },
                ],
              },
            },
            { waitType: "debounce" },
            { waitMs: "0" },
          ],
        },
      ]}
      showBoxShadow={false}
    />
    <Container
      id="container_entity_details"
      footerPadding="4px 12px"
      footerPaddingType="normal"
      headerPadding="4px 12px"
      headerPaddingType="normal"
      hoistFetching={true}
      loading=""
      marginType="normal"
      padding="12px"
      paddingType="normal"
      showBody={true}
      showHeader={true}
    >
      <Header>
        <Text
          id="containertitle_entity_details"
          marginType="normal"
          value="#### {{table_entities.displayedData[0].entity}}"
          verticalAlign="center"
        />
        <DropdownButton
          id="dropdownButton_publicationOptions2"
          _colorByIndex={[""]}
          _fallbackTextByIndex={[""]}
          _imageByIndex={[""]}
          _values={[""]}
          horizontalAlign="right"
          itemMode="static"
          marginType="normal"
          overlayMaxHeight={375}
          style={{ ordered: [{ border: "rgba(148, 145, 145, 1)" }] }}
          styleVariant="outline"
          text="..."
        >
          <Option
            id="8498f"
            icon="bold/interface-add-circle-alternate"
            label="Add new"
            tooltip="To do ... add a new publication"
          />
          <Event
            event="click"
            method="selectRow"
            params={{
              ordered: [
                {
                  options: {
                    ordered: [
                      { mode: "index" },
                      { indexType: "display" },
                      { index: "1" },
                      { key: null },
                    ],
                  },
                },
              ],
            }}
            pluginId="table_publications"
            targetId="a82fc"
            type="widget"
            waitMs="0"
            waitType="debounce"
          />
        </DropdownButton>
      </Header>
      <View id="a2b3d" viewKey="View 1">
        <JSONSchemaForm
          id="jsonSchema_metadata_form"
          data="{{table_entities.selectedRow.data}}"
          events={[]}
          hidden=""
          jsonSchema="{{ _json_schema_meta_data_form.value.form_schema }}"
          margin="0"
          marginType="none"
          submitDisabled="true"
          uiSchema="{{ _json_schema_meta_data_form.value.values_schema }}"
        />
      </View>
    </Container>
  </View>
  <View
    id="a935e"
    disabled={false}
    hidden="true"
    iconPosition="left"
    viewKey="Hierarchy"
  >
    <Container
      id="container_publications2"
      footerPadding="4px 12px"
      footerPaddingType="normal"
      headerPadding="4px 12px"
      headerPaddingType="normal"
      heightType="fixed"
      marginType="normal"
      padding="12px"
      paddingType="normal"
      showBody={true}
      showHeader={true}
    >
      <Header>
        <Text
          id="container_title_publications2"
          marginType="normal"
          value="#### Publications"
          verticalAlign="center"
        />
      </Header>
      <View id="48330" viewKey="View 1">
        <CheckboxTree id="checkboxTree1" />
      </View>
    </Container>
  </View>
  <View
    id="1a5dc"
    disabled={false}
    hidden="true"
    iconPosition="left"
    viewKey="Rules"
  />
</Container>
