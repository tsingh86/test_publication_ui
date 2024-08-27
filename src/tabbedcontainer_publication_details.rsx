<Container
  id="tabbedcontainer_publication_details"
  currentViewKey="{{ self.viewKeys[0] }}"
  footerPadding="4px 12px"
  footerPaddingType="normal"
  headerPadding="4px 12px"
  headerPaddingType="normal"
  marginType="normal"
  padding="0"
  paddingType="none"
  showBody={true}
  showHeader={true}
  transition="slide"
>
  <View id="a6b7a" label="Metadata" viewKey="Details">
    <TextInput
      id="text_title"
      formDataKey="global_name"
      label="Name"
      marginType="normal"
      placeholder="Enter value"
      required={true}
      style={{ ordered: [{ accent: "rgb(169, 44, 242)" }] }}
    />
    <Switch
      id="switch_verified"
      formDataKey="verified"
      label="Verified"
      labelPosition="left"
      marginType="normal"
      style={{ ordered: [{ checkedBackground: "rgba(219, 59, 214, 1)" }] }}
      value="{{ table_publications.selectedRow.verified }}"
    />
    <Select
      id="select_country"
      automaticItemColors={true}
      captionByIndex="{{ item.name }}"
      colorByIndex=""
      data="{{ _transform_get_country.value }}"
      disabled="false"
      disabledByIndex=""
      emptyMessage="No options"
      fallbackTextByIndex=""
      hiddenByIndex=""
      iconByIndex=""
      imageByIndex=""
      label="Country"
      labels=""
      loading="false"
      marginType="normal"
      overlayMaxHeight={375}
      placeholder="Select an option"
      required={true}
      showClear={true}
      showSelectionIndicator={true}
      style={{ ordered: [{ accent: "rgb(169, 44, 242)" }] }}
      tooltipByIndex=""
      tooltipText="Country currently set on this publication is: {{ table_publications.selectedRow.country }}"
      value="{{table_publications.selectedRow.country}}"
      values="{{item.code}}"
    >
      <Event
        enabled=""
        event="inputValueChange"
        method="setValue"
        params={{ ordered: [{ key: "{{select_country.value}}" }] }}
        pluginId=""
        type="localStorage"
        waitMs="0"
        waitType="debounce"
      />
    </Select>
    <Select
      id="select_category"
      automaticItemColors={true}
      captionByIndex=""
      data="{{ _transform_get_category.value }}"
      disabledByIndex=""
      emptyMessage="No options"
      formDataKey="{{self.id}}"
      label="Category"
      labels=""
      marginType="normal"
      overlayMaxHeight={375}
      placeholder="Select an option"
      showClear={true}
      showSelectionIndicator={true}
      style={{
        ordered: [
          { accent: "rgb(169, 44, 242)" },
          { adornmentBackground: "rgba(74, 247, 8, 1)" },
        ],
      }}
      tooltipByIndex="Language currently set on this publication is: {{ table_publications.selectedRow.category }}"
      value="{{ table_publications.selectedRow.category}}"
      values="{{ item.name }}"
    >
      <Event
        event="inputValueChange"
        method="setValue"
        params={{
          ordered: [
            { key: "country" },
            { newValue: "{{select_category.value}}" },
          ],
        }}
        pluginId=""
        type="localStorage"
        waitMs="0"
        waitType="debounce"
      />
    </Select>
    <Select
      id="select_media_type"
      automaticItemColors={true}
      captionByIndex=""
      colorByIndex=""
      data="{{ _transform_get_media_types.value }}"
      disabledByIndex=""
      emptyMessage="No options"
      fallbackTextByIndex=""
      hiddenByIndex=""
      iconByIndex=""
      imageByIndex=""
      label="Media Type"
      labels=""
      marginType="normal"
      overlayMaxHeight={375}
      placeholder="Select an option"
      required={true}
      showClear={true}
      showSelectionIndicator={true}
      style={{ ordered: [{ accent: "rgb(169, 44, 242)" }] }}
      tooltipByIndex=""
      tooltipText="Media type currently set on this publication is: {{ table_publications.selectedRow.media }}"
      value="{{ table_publications.selectedRow.media }}"
      values="{{ item.name}}"
    >
      <Event
        event="change"
        method="setValue"
        params={{
          ordered: [
            { key: "media_type" },
            { newValue: "{{select_media_type.value}}" },
          ],
        }}
        pluginId=""
        type="localStorage"
        waitMs="0"
        waitType="debounce"
      />
    </Select>
    <Select
      id="select_frequency"
      automaticItemColors={true}
      data="{{ _transform_get_frequency.value }}"
      emptyMessage="No options"
      label="Frequency"
      labels=""
      marginType="normal"
      overlayMaxHeight={375}
      placeholder="Select an option"
      showClear={true}
      showSelectionIndicator={true}
      style={{ ordered: [{ accent: "rgb(169, 44, 242)" }] }}
      tooltipText="Frequency currently set on this publication is: {{ table_publications.selectedRow.frequency }}"
      value="{{table_publications.selectedRow.frequency}}"
      values="{{ item.name}}"
    >
      <Event
        event="inputValueChange"
        method="setValue"
        params={{
          ordered: [
            { key: "country" },
            { newValue: "{{select_frequency.value}}" },
          ],
        }}
        pluginId=""
        type="localStorage"
        waitMs="0"
        waitType="debounce"
      />
    </Select>
    <Select
      id="select_family"
      automaticItemColors={true}
      data="{{ _transform_get_family.value }}"
      emptyMessage="No options"
      itemAdornmentShape="square"
      label="Family"
      labels=""
      overlayMaxHeight="375"
      placeholder="Select an option"
      showClear={true}
      showSelectionIndicator={true}
      style={{ ordered: [{ accent: "rgb(169, 44, 242)" }] }}
      tooltipText="Family currently set on this publication is: {{ table_publications.selectedRow.family }}"
      value="{{table_publications.selectedRow.family}}"
      values="{{ item.name }}"
    />
    <Multiselect
      id="multiselect_language"
      automaticItemColors={true}
      data="{{ _transform_get_language.value }}"
      emptyMessage="No options"
      label="Languages"
      labels=""
      marginType="normal"
      overlayMaxHeight={375}
      placeholder="Select Languages"
      showClear={true}
      showSelectionIndicator={true}
      style={{ ordered: [{ accent: "rgb(169, 44, 242)" }] }}
      tooltipText="set on this publication is: {{ table_publications.selectedRow.languages }}"
      value="{{ table_publications.selectedRow.languages }}"
      values="{{ item.name }}"
      wrapTags={true}
    >
      <Event
        event="inputValueChange"
        method="setValue"
        params={{ ordered: [{ key: "{{multiselect_language.values}}" }] }}
        pluginId=""
        type="localStorage"
        waitMs="0"
        waitType="debounce"
      />
    </Multiselect>
    <Select
      id="Domain"
      emptyMessage="No options"
      hidden="false
    "
      itemMode="static"
      label="Domain"
      marginType="normal"
      overlayMaxHeight={375}
      placeholder="Select an option"
      showSelectionIndicator={true}
    >
      <Option id="276c7" value="Option 1" />
      <Option id="92098" value="Option 2" />
      <Option id="f4238" value="Option 3" />
    </Select>
    <TextInput
      id="Default_Id"
      disabled="true"
      formDataKey="id"
      hidden="true"
      hideLabel={false}
      label="Id"
      labelCaption="{{ table_publications.selectedRow.id }}"
      loading="false"
      marginType="normal"
      placeholder="Enter value"
      style={{ ordered: [] }}
      value="{{ table_publications.selectedRow.id }}"
    >
      <Event
        event="submit"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="_update_publication_prod"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </TextInput>
  </View>
  <View
    id="a2198"
    disabled={false}
    hidden="false"
    iconPosition="left"
    viewKey="Copyright"
  >
    <Select
      id="select_copyright_owner"
      automaticItemColors={true}
      captionByIndex="
"
      colorByIndex=""
      data="{{ 
  copyright_option.data &&
  copyright_option.data.Items ?
  
  Object.values(copyright_option.data.Items).map(item => ({
    id: item.id,
    name: item.name,
    enum_type: item.enum_type
  })) :
  
  [] 
}}
"
      disabledByIndex=""
      emptyMessage="No options"
      fallbackTextByIndex=""
      hiddenByIndex=""
      iconByIndex=""
      imageByIndex=""
      label="Copyright Owner"
      labels="
{{item.name}}"
      labelWrap={true}
      overlayMaxHeight={375}
      placeholder="Select options"
      required={true}
      showSelectionIndicator={true}
      tooltipByIndex=""
      value={
        '{{ \n  table_publications.selectedRow?.copyright_owner_details?.[0]?.copyright_owner \n  || "No copyright owner" \n}}'
      }
      values="
{{item.name}}
"
    >
      <Event
        event="change"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="delivery_method_reuse_component"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="change"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="store_old_copyright_owner_value"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="change"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="copyright_option"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="change"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="copyright_option"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </Select>
    <Select
      id="nla_publication_type"
      automaticItemColors={true}
      emptyMessage="No options"
      hidden={'{{!select_copyright_owner.value.includes("NLA")}}'}
      itemMode="static"
      label="nla_publication_type"
      overlayMaxHeight="375"
      overlayMinWidth=""
      placeholder="Select an option"
      required={true}
      showClear={true}
      showSelectionIndicator={true}
      value="{{ 
table_publications?.selectedRow?.copyright_owner_details?.[0]?.nla_publication_type ?? null

}}
"
    >
      <Option id="3c4ea" value="Newspaper Regional" />
      <Option id="ae3b3" value="Newspaper National" />
      <Option id="cc9fc" disabled={false} hidden={false} value="Magazine" />
      <Option
        id="38513"
        disabled={false}
        hidden={false}
        value="International"
      />
    </Select>
    <Select
      id="immo_license"
      automaticItemColors={true}
      emptyMessage="No options"
      hidden={'{{!select_copyright_owner.value.includes("NLA")}}'}
      itemMode="static"
      label="immo_license"
      overlayMaxHeight="375"
      overlayMinWidth=""
      placeholder="Select an option"
      showClear={true}
      showSelectionIndicator={true}
      value="{{ 
table_publications?.selectedRow?.copyright_owner_details?.[0]?.immo_license ?? null

}}
"
    >
      <Option id="3c4ea" value="yes" />
      <Option id="ae3b3" value="no" />
    </Select>
    <TextInput
      id="nla_name"
      disabled="false
    "
      hidden={'{{!select_copyright_owner.value.includes("NLA")}}'}
      label="nla_name"
      minLength=""
      placeholder="Enter value"
      required={true}
      value="{{ 
table_publications?.selectedRow?.copyright_owner_details?.[0]?.nla_name ?? null

}}"
    />
    <TextInput
      id="nla_reporting_code"
      disabled="false
    "
      hidden={'{{!select_copyright_owner.value.includes("NLA")}}'}
      label="nla_reporting_code"
      labelWrap={true}
      placeholder="Enter value"
      required={true}
      showClear={true}
      value="{{ 
table_publications?.selectedRow?.copyright_owner_details?.[0]?.nla_reporting_code ?? null

}}"
    />
    <TextInput
      id="nla_publisher"
      disabled="false
    "
      hidden={'{{!select_copyright_owner.value.includes("NLA")}}'}
      label="nla_publisher"
      placeholder="Enter value"
      required={true}
      showClear={true}
      value="{{ 
table_publications?.selectedRow?.copyright_owner_details?.[0]?.nla_publisher ?? null

}}"
    />
    <Select
      id="select_nla_edition"
      automaticItemColors={true}
      emptyMessage="No options"
      hidden={'{{!select_copyright_owner.value.includes("NLA")}}'}
      itemMode="static"
      label="nla_edition"
      overlayMaxHeight={375}
      placeholder="Select an option"
      required={true}
      showClear={true}
      showSelectionIndicator={true}
      value="{{ 
table_publications?.selectedRow?.copyright_owner_details?.[0]?.nla_edition ?? null

}}"
    >
      <Option id="0f675" value="Main" />
      <Option id="24092" value="Changed" />
      <Option id="1dcce" value="Supplement" />
    </Select>
    <TextInput
      id="nla_acronym"
      hidden={'{{!select_copyright_owner.value.includes("NLA")}}'}
      label="nla_acronym"
      placeholder="Enter value"
      showClear={true}
      value="{{ 
table_publications?.selectedRow?.copyright_owner_details?.[0]?.nla_acronym ?? null

}}"
    />
    <TextInput
      id="nli_publication_type"
      disabled="false
    "
      hidden={'{{!select_copyright_owner.value.includes("NLI")}}'}
      label="nli_publication_type"
      placeholder="Enter value"
      required={true}
      showClear={true}
      value="{{ 
table_publications?.selectedRow?.copyright_owner_details?.[0]?.nli_publication_type ?? null

}}"
    />
    <TextArea
      id="nla_region"
      autoResize={true}
      hidden={'{{!select_copyright_owner.value.includes("NLA")}}'}
      label="nla_region"
      minLines="1"
      placeholder="Enter value"
      value="{{ 
table_publications?.selectedRow?.copyright_owner_details?.[0]?.nla_region ?? null

}}"
    />
    <TextInput
      id="cla_reporting_code_plsid"
      disabled="false
    "
      hidden={'{{!select_copyright_owner.value.includes("CLA")}}'}
      label="cla_reporting_code_plsid"
      placeholder="Enter value"
      required={true}
      showClear={true}
      value="{{ 
table_publications?.selectedRow?.copyright_owner_details?.[0]?.cla_reporting_code_plsid ?? null

}}"
    />
    <TextInput
      id="cla_name"
      disabled="false
    "
      hidden={'{{!select_copyright_owner.value.includes("CLA")}}'}
      label="cla_name"
      placeholder="Enter value"
      required={true}
      showClear={true}
      value="{{ 
table_publications?.selectedRow?.copyright_owner_details?.[0]?.cla_name ?? null

}}"
    />
    <TextInput
      id="cla_issn"
      disabled="false
    "
      hidden={'{{!select_copyright_owner.value.includes("CLA")}}'}
      label="cla_issn"
      placeholder="Enter value"
      required={true}
      showClear={true}
      value="{{ 
table_publications?.selectedRow?.copyright_owner_details?.[0]?.cla_issn ?? null

}}"
    />
    <TextInput
      id="nli_name"
      disabled="false
    "
      hidden={'{{!select_copyright_owner.value.includes("NLI")}}'}
      label="nli_name"
      placeholder="Enter value"
      required={true}
      showClear={true}
      value="{{ 
table_publications?.selectedRow?.copyright_owner_details?.[0]?.nli_name ?? null
}}"
    />
    <TextInput
      id="cla_publisher_name"
      disabled="false
    "
      hidden={'{{!select_copyright_owner.value.includes("CLA")}}'}
      label="cla_publisher_name"
      placeholder="Enter value"
      required={true}
      showClear={true}
      value="{{ 
table_publications?.selectedRow?.copyright_owner_details?.[0]?.cla_publisher_name ?? null

}}"
    />
    <TextInput
      id="nli_nla_reciprocal_reporting_code"
      disabled="false
    "
      hidden="true"
      label="nla_reciprocal_reporting_code"
      labelWrap={true}
      placeholder="Enter value"
      required={true}
      showClear={true}
    />
    <TextInput
      id="cfc_name"
      hidden={'{{!select_copyright_owner.value.includes("CFC")}}'}
      label="cfc_name"
      labelWrap={true}
      placeholder="Enter value"
      required={true}
      showClear={true}
    />
    <TextInput
      id="cfc_nla_reciprocal_reporting_code"
      disabled="false
    "
      hidden={'{{!select_copyright_owner.value.includes("CFC")}}'}
      label="nla_reciprocal_reporting_code"
      labelWrap={true}
      placeholder="Enter value"
      required={true}
    />
    <TextInput
      id="cedro_name"
      hidden={'{{!select_copyright_owner.value.includes("CEDRO")}}'}
      label="cedro_name"
      placeholder="Enter value"
      required={true}
    />
    <TextInput
      id="cedro_nla_reciprocal_code"
      hidden={'{{!select_copyright_owner.value.includes("CEDRO")}}'}
      label="nla_reciprocal_reporting_code"
      placeholder="Enter value"
      required={true}
      showClear={true}
    />
    <Select
      id="delivery_method"
      automaticItemColors={true}
      disabled=""
      emptyMessage="No options"
      hidden="true"
      hideLabel={false}
      itemMode="static"
      label="delivery_method"
      labelWrap={true}
      overlayMaxHeight={375}
      placeholder="Select an option"
      required={'{{ select_copyright_owner.value === "NLI" }}'}
      showClear={true}
      showSelectionIndicator={true}
      value="{{
  table_publications.selectedRow?.copyright_owner_details?.[0]?.copyright_owner == select_copyright_owner.value
    ? table_publications.selectedRow.copyright_owner_details[0].delivery_method ?? null
    : null
}}

"
    >
      <Option id="0021f" value="yes" />
      <Option id="b927e" value="no" />
    </Select>
    <TextInput
      id="aday_name"
      hidden={'{{!select_copyright_owner.value.includes("ADAY")}}'}
      label="aday_name"
      placeholder="Enter value"
      required={true}
      showClear={true}
    />
    <TextInput
      id="aday_id"
      hidden={'{{!select_copyright_owner.value.includes("ADAY")}}'}
      label="aday_id"
      placeholder="Enter value"
      required={true}
      showClear={true}
    />
  </View>
  <View id="e7a36" hidden="true" label="Insights data" viewKey="Other">
    <NumberInput
      id="number_colour_page_price2"
      currency="USD"
      disabled="true"
      formDataKey="color_page_price"
      inputValue={0}
      label="Colour page price"
      marginType="normal"
      placeholder="Enter value"
      showSeparators={true}
      showStepper={true}
      textAlign="right"
      value={0}
    />
    <NumberInput
      id="number_circulation"
      currency="USD"
      disabled="true"
      formDataKey="circulation"
      inputValue={0}
      label="Circulation"
      marginType="normal"
      placeholder="Enter value"
      showSeparators={true}
      showStepper={true}
      textAlign="right"
      value={0}
    />
    <NumberInput
      id="number_cost_per_thousand"
      currency="USD"
      disabled="true"
      formDataKey="cost_per_thousand"
      inputValue={0}
      label="Cost per thousand"
      marginType="normal"
      placeholder="Enter value"
      showSeparators={true}
      showStepper={true}
      textAlign="right"
      value={0}
    />
  </View>
  <View
    id="f88a8"
    disabled={false}
    hidden="true"
    iconPosition="left"
    label="Rules"
    viewKey="Rules"
  >
    <Form
      id="form_rules2"
      footerPadding="4px 12px"
      footerPaddingType="normal"
      headerPadding="4px 12px"
      headerPaddingType="normal"
      hoistFetching={true}
      marginType="normal"
      padding="12px"
      paddingType="normal"
      requireValidation={true}
      resetAfterSubmit={true}
      showBody={true}
      showHeader={true}
    >
      <Header>
        <Button
          id="button_add_rule2"
          _disclosedFields={{ array: [] }}
          iconBefore="bold/interface-add-2-alternate"
          marginType="normal"
          style={{ ordered: [{ border: "rgb(100, 219, 59)" }] }}
          styleVariant="outline"
          text="Add Rule"
        >
          <Event
            event="click"
            method="setValue"
            params={{
              ordered: [
                {
                  value: '{{[...state_rules.value, {rule_field: [["", ""]]}]}}',
                },
              ],
            }}
            pluginId="state_rules"
            type="state"
            waitMs="0"
            waitType="debounce"
          />
        </Button>
      </Header>
      <Body>
        <ListView
          id="parentListview3"
          _disclosedFields={{ array: [] }}
          hidden=""
          instances="{{state_rules.value.length}}"
          marginType="normal"
          numColumns="1"
          padding="0"
          paddingType="none"
          showBorder={false}
        >
          <Select
            id="select_rule_source7"
            data={
              '[{"id":"GMD","source":"Local Market Feeds"},\n{"id":"MOREOVER","source":"Moreover"},\n{"id":"NLA","source":"NLA"},\n{"id":"OPOINT","source":"OPoint"},\n]'
            }
            emptyMessage="No options"
            label="Source"
            labels="{{ item.source }}"
            marginType="normal"
            overlayMaxHeight={375}
            placeholder="Select an option"
            showSelectionIndicator={true}
            style={{ ordered: [{ accent: "rgb(169, 44, 242)" }] }}
            value="{{state_rules.value[ri[0]].rule_source}}"
            values="{{ item.id }}"
          >
            <Event
              event="change"
              method="setIn"
              params={{
                ordered: [
                  { keyPath: '[{{ri[0]}}, "rule_source"]' },
                  { value: "{{self.value}}" },
                ],
              }}
              pluginId="state_rules"
              type="state"
              waitMs="0"
              waitType="debounce"
            />
          </Select>
          <Button
            id="button_add_rule_field2"
            _disclosedFields={{ array: ["iconBefore"] }}
            iconBefore="bold/interface-add-square-alternate"
            marginType="normal"
            style={{ ordered: [{ border: "rgb(100, 219, 59)" }] }}
            styleVariant="outline"
            text="Add field"
          >
            <Event
              event="click"
              method="setIn"
              params={{
                ordered: [
                  {
                    keyPath:
                      '[{{i}}, "rule_field", {{state_rules.value[i].rule_field.length}}]',
                  },
                  { value: "" },
                ],
              }}
              pluginId="state_rules"
              type="state"
              waitMs="0"
              waitType="debounce"
            />
          </Button>
          <Icon
            id="icon_delete_rule"
            _disclosedFields={{ array: ["color"] }}
            altText="Delete rule"
            horizontalAlign="center"
            icon="bold/interface-delete-2-alternate"
            marginType="normal"
            style={{ ordered: [{ color: "danger" }] }}
          >
            <Event
              event="click"
              method="setValue"
              params={{
                ordered: [
                  {
                    value:
                      "{{state_rules.value.filter((_, index) => index !== i)}}",
                  },
                ],
              }}
              pluginId="state_rules"
              type="state"
              waitMs="0"
              waitType="debounce"
            />
          </Icon>
          <ListView
            id="nestedListview_fields"
            _disclosedFields={{ array: [] }}
            instances="{{state_rules.value[i].rule_field.length}}"
            marginType="normal"
            numColumns="1"
            padding="0"
            paddingType="none"
          >
            <Select
              id="select_field_id"
              captionByIndex=""
              data={
                '[\n{"id":"gmd_id","field":"GMD Id"},\n{"id":"support_name","field":"Title"},\n{"id":"global_name","field":"Name"},\n{"id":"domain","field":"Domain"}\n]'
              }
              emptyMessage="No options"
              label="Field"
              labels="{{ item.field }}"
              marginType="normal"
              overlayMaxHeight={375}
              showSelectionIndicator={true}
              style={{ ordered: [{ accent: "rgb(169, 44, 242)" }] }}
              value="{{state_rules.value[ri[0]].rule_field[ri[1]][0]}}"
              values="{{ item.id }}"
            >
              <Event
                event="change"
                method="setIn"
                params={{
                  ordered: [
                    { keyPath: '[{{ri[0]}}, "rule_field", {{ri[1]}}, 0]' },
                    { value: "{{self.value}}" },
                  ],
                }}
                pluginId="state_rules"
                type="state"
                waitMs="0"
                waitType="debounce"
              />
            </Select>
            <TextInput
              id="textInput_field_value"
              label="Value"
              marginType="normal"
              style={{ ordered: [{ accent: "rgb(169, 44, 242)" }] }}
              value="{{state_rules.value[ri[0]].rule_field[ri[1]][1]}}"
            >
              <Event
                event="change"
                method="setIn"
                params={{
                  ordered: [
                    { value: "{{self.value}}" },
                    { keyPath: '[{{ri[0]}}, "rule_field", {{ri[1]}}, 1]' },
                  ],
                }}
                pluginId="state_rules"
                type="state"
                waitMs="0"
                waitType="debounce"
              />
            </TextInput>
            <Icon
              id="icon_delete_rule_field"
              _disclosedFields={{ array: ["color"] }}
              altText="Delete rule field"
              horizontalAlign="center"
              icon="bold/interface-delete-bin-4"
              marginType="normal"
              style={{ ordered: [{ color: "danger" }] }}
            >
              <Event
                event="click"
                method="setIn"
                params={{
                  ordered: [
                    { keyPath: '[{{ri[0]}}, "rule_field"]' },
                    {
                      value:
                        "{{state_rules.value[ri[0]].rule_field.filter((_, index) => index !== ri[1])}}",
                    },
                  ],
                }}
                pluginId="state_rules"
                type="state"
                waitMs="0"
                waitType="debounce"
              />
            </Icon>
          </ListView>
          <Divider
            id="divider3"
            _disclosedFields={{ array: [] }}
            hidden="{{state_rules.value[i].rule_field.length=0}}"
            marginType="normal"
            textSize="h6"
          />
        </ListView>
      </Body>
    </Form>
    <JSONExplorer id="jsonExplorer2" value="{{state_rules.value}}" />
  </View>
</Container>
