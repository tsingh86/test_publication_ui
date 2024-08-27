publication_metadata_field_details = {
  global_name: {
    component: text_title.value,
  },
  family: {
    component: select_family.selectedItem,
    value: "select_family.selectedItem.name",
    //   id: select_family.selectedItem.id,
  },
  media: {
    component: select_media_type.selectedItem,
    //   value: select_media_type.selectedItem.name,
    //   id: select_media_type.selectedItem.id,
  },
  country: {
    component: select_country.selectedItem,
    //   value: elect_country.selectedItem.code,
    //   id: select_country.selectedItem.id,
  },
  frequency: {
    component: select_frequency.selectedItem,
    //   value: select_frequency.selectedItem.name,
  },
  languages: {
    component: multiselect_language.selectedItem,
    //   value: multiselect_language.selectedItems.map((obj) => obj.name),
  },
  category: {
    component: select_category.selectedItem,
    //   value: select_category.selectedItem.name,
  },
  verified: {
    component: switch_verified,
    value: switch_verified.value,
  },
};
mandatory_put_enums = ["media", "country", "global_name"];
enum_construct_fields = [
  "family",
  "media",
  "country",
  "frequency",
  "languages",
  "category",
  "verified",
];
for (let key of mandatory_put_enums) {
  if (!publication_metadata_field_details[key].component) {
    return utils.showNotification(
      utils.showNotification({
        title: "Mandatory Fields",
        description: `Please fill out ${key} field `,
        notificationType: "error",
        duration: 5,
      })
    );
  }
}
let [
  family_value,
  media_value,
  country_value,
  frequency_value,
  languages_value,
  category_value,
  verified_value,
] = [
  undefined,
  undefined,
  undefined,
  undefined,
  undefined,
  undefined,
  undefined,
];
let [
  family_dict,
  media_dict,
  country_dict,
  frequency_dict,
  languages_dict,
  category_dict,
  verified_dict,
] = [{}, {}, {}, {}, {}, {}, {}];
let languages_values = [];
let item_expression = {};
let copyright_owner = select_copyright_owner.value;
let copyright_owner_dict = {};
let copyright_metadata = {
  NLA: {
    mandatory_components: [
      nla_name,
      nla_reporting_code,
      nla_publication_type,
      nla_publisher,
    ],
    components: [
      nla_name,
      nla_reporting_code,
      nla_publication_type,
      immo_license,
      nla_publisher,
      select_nla_edition,
      nla_acronym,
      nla_region,
      delivery_method,
    ],
    publication_table: {
      uat: _put_nla_publication_uat,
      prod: _put_nla_publication_prod,
    },
  },
  CLA: {
    mandatory_components: [
      cla_name,
      cla_reporting_code_plsid,
      cla_issn,
      cla_publisher_name,
    ],
    components: [
      cla_name,
      cla_reporting_code_plsid,
      cla_issn,
      cla_publisher_name,
      delivery_method,
    ],
    publication_table: {
      uat: _put_nla_publication_uat,
      prod: _put_nla_publication_prod,
    },
  },
  NLI: {
    mandatory_components: [nli_name, nli_publication_type, delivery_method],
    components: [nli_name, nli_publication_type, delivery_method],
    publication_table: {
      uat: _put_nla_publication_uat,
      prod: _put_nla_publication_prod,
    },
  },
  CFC: {
    mandatory_components: [cfc_name, delivery_method],
    components: [cfc_name, cfc_nla_reciprocal_reporting_code, delivery_method],
    publication_table: {
      //uat: _put_cfc_publication_uat,
      // prod: _put_cfc_publication_prod,
    },
  },
  ADAY: {
    mandatory_components: [aday_name, aday_id],
    components: [aday_name, aday_id],
    publication_table: {
      //uat: _put_aday_publication_uat,
      //prod: _put_aday_publication_uat,
    },
  },
  CEDRO: {
    mandatory_components: [
      cedro_name,
      cedro_nla_reciprocal_code,
      delivery_method,
    ],
    components: [cedro_name, delivery_method],
    publication_table: {
      // uat: _put_cedro_publication_uat,
      // prod: _put_cedro_publication_prod,
    },
  },
  PMG: {
    mandatory_components: [],
    components: [],
    publication_table: {
      //uat: _put_pmg_publication_uat,
      //prod: _put_pmg_publication_prod,
    },
  },
  Promopress: {
    mandatory_components: [],
    components: [],
    publication_table: {
      //uat: _put_promopress_publication_uat,
      //prod: _put_promopress_publication_prod,
    },
  },
  Publisher: {
    mandatory_components: [],
    components: [],
    publication_table: {
      //uat: _put_publisher_publication_uat,
      // prod: _put_publisher_publication_prod,
    },
  },
};
if (text_title.value) {
  item_expression["global_name"] = text_title.value;
}

if (typeof switch_verified.value === "boolean") {
  item_expression["verified"] = switch_verified.value;
}
if (select_family.selectedItem) {
  let family_id = select_family.selectedItem.id;
  family_value = select_family.selectedItem.name;
  family_dict = {
    enum_id: family_id,
    value: family_value,
  };
  item_expression["family"] = family_value;
}
if (select_media_type.selectedItem) {
  let media_id = select_media_type.selectedItem.id;
  media_value = select_media_type.selectedItem.name;
  media_dict = {
    enum_id: media_id,
    value: media_value,
  };
  item_expression["media"] = media_value;
}
if (select_country.selectedItem) {
  let country_id = select_country.selectedItem.id;
  country_value = select_country.selectedItem.code;
  country_dict = {
    enum_id: country_id,
    value: country_value,
  };
  item_expression["country"] = country_value;
}
if (select_frequency.selectedItem) {
  let frequency_id = select_frequency.selectedItem.id;
  frequency_value = select_frequency.selectedItem.name;
  frequency_dict = {
    enum_id: frequency_id,
    value: frequency_value,
  };
  item_expression["frequency"] = frequency_value;
}
if (multiselect_language.selectedItems.length !== 0) {
  languages_value = multiselect_language.selectedItems.map((obj) => obj.name);
  item_expression["languages"] = languages_value;
  // expression_attribute_names = expression_attribute_names.concat('#'+"languages"+': '+"languages"+', ')
  // expression_attribute_names = expression_attribute_names.concat('#'+"global_name"+': '+"global_name"+', ')
  languages_values = multiselect_language.selectedItems.map((obj) => {
    return {
      enum_id: obj.id,
      value: obj.name,
    };
  });
}
if (multiselect_language.selectedItems.length !== 0) {
  languages_dict = {
    values: languages_values,
  };
}
//  return multiselect_language.selectedItems

if (select_category.selectedItem) {
  let category_id = select_category.selectedItem.id;
  category_value = select_category.selectedItem.name;
  item_expression["category"] = category_value;
  category_dict = {
    enum_id: category_id,
    value: category_value,
  };
}

if (select_copyright_owner.selectedItem) {
  let copyright_owner_id = select_copyright_owner.selectedItem.id;
  copyright_owner_value = select_copyright_owner.selectedItem.name;
  copyright_owner_dict = {
    enum_id: copyright_owner_id,
    value: copyright_owner_value,
  };
}

let enum_construct = {
  family: family_dict,
  media: media_dict,
  country: country_dict,
  frequency: frequency_dict,
  languages: languages_dict,
  category: category_dict,
  verified: verified_dict,
  copyright_owner_details: copyright_owner_dict,
};
//  return multiselect_language.selectedItems

if (copyright_owner !== "No copyright owner") {
  let ownerObject = { copyright_owner: copyright_owner };
  let copyright_owner_list = []; // Initialize as an array
  let copyright_mandatory_components =
    copyright_metadata[copyright_owner]["mandatory_components"];
  let all_components = copyright_metadata[copyright_owner]["components"];

  // Check mandatory components
  for (let component of copyright_mandatory_components) {
    if (!component.value) {
      return utils.showNotification({
        title: "Mandatory Fields",
        description:
          "Please fill out the " +
          component.label +
          " field required for " +
          copyright_owner,
        notificationType: "error",
        duration: 5,
      });
    }
  }

  // Collect all component values
  for (let component of all_components) {
    if (component.value) {
      let field_name = component.label;
      ownerObject[field_name] = component.value; // Add component value to ownerObject
    }
  }

  // Push ownerObject into the array
  copyright_owner_list.push(ownerObject);

  // Update item_expression with the collected data
  if (copyright_owner_list.length > 0) {
    //item_expression["copyright_owner"] = copyright_owner;
    item_expression["copyright_owner_details"] = copyright_owner_list;
  }
}

// deleting empty dict from enum construct
for (var key in enum_construct) {
  if (enum_construct.hasOwnProperty(key)) {
    // Check if the value is null and remove the key
    if (key !== "languages") {
      if (Object.keys(enum_construct[key]).length === 0) {
        delete enum_construct[key];
      }
    } else {
      if (Object.keys(enum_construct[key]).length === 0) {
        delete enum_construct[key];
      } else {
        if (enum_construct[key].hasOwnProperty("values")) {
          if (enum_construct[key].values.length === 0) {
            delete enum_construct[key];
          }
        } else {
          delete enum_construct[key];
        }
      }
    }
  }
}
item_expression["enum_construct"] = enum_construct;
item_expression["modified_by"] = current_user.fullName;
//  item_expression["created_at"] = moment().format('YYYY-MM-DDThh:mm:ssZ')
//  return item_expression
await item_expression_variable.setValue(item_expression);
if (retoolContext.environment === "production") {
  _put_publication_prod.trigger();
} else if (retoolContext.environment === "UAT") {
  _put_publication_uat.trigger();
}
localStorage.clear();
