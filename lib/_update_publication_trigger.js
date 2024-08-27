// This is the trigger script that is called from the UI Publication form => Submit button.
// It builds up an object to store the id's of the enums selected for this publication.
// This script then invokes the dynmaodb _put_publication module passing in the object as a parameter to set the Expression Attribute Values

mandatory_fields = {
  "Global Name": text_title,
  "Media Type": select_media_type,
  Country: select_country,
};
// logic for checking the mandatory fields
for (var field in mandatory_fields) {
  var component = mandatory_fields[field];
  if (!component.value) {
    return utils.showNotification(
      utils.showNotification({
        title: "Mandatory Fields",
        description: "Please fill out the " + field + " field",
        notificationType: "error",
        duration: 5,
      })
    );
  }
}


let map_copyright_fields = {
  "NLA": {
    "nla_publication_type": "publication_type",
    "immo_license": "immo_license",
    "nla_name": "name",
    "nla_reporting_code": "reporting_code",
    "nla_publisher": "publisher",
    "nla_edition": "edition",
    "nla_acronym": "acronym",
    "nla_region": "region",
    "delivery_method": "delivery_method",
  },
  "CLA": {
    "cla_reporting_code_plsid": "reporting_code_plsid",
    "cla_name": "name",
    "cla_issn": "issn",
    "cla_publisher_name": "publisher_name",
    "delivery_method": "delivery_method",
  },
  "NLI": {
    "nli_publication_type": "publication_type",
    "nli_name": "name",
    "delivery_method": "delivery_method"
  }
};


let update_expression = "";
let copyright_owner_details = select_copyright_owner.value;
let old_copyright_owner = localStorage.values.old_copyright_owner;
let copyright_owner_dict = {};
let expression_attribute_names = {};
let expression_attribute_values = {};
let [
  family_value,
  media_value,
  country_value,
  frequency_value,
  languages_value,
  category_value,
  copyright_owner_value,
  verified_value,
] = [
  undefined,
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
let meta_data = [
  "family",
  "media",
  "country",
  "frequency",
  "languages",
  "category",
  "copyright_owner_details",
];
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
      uat: _update_nla_publication_uat,
      prod: _update_nla_publication_prod,
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
      uat: _update_nla_publication_uat,
      prod: _update_nla_publication_prod,
    },
  },
  NLI: {
    mandatory_components: [nli_name, nli_publication_type, delivery_method],
    components: [nli_name, nli_publication_type, delivery_method],
    publication_table: {
      uat: _update_nla_publication_uat,
      prod: _update_nla_publication_prod,
    },
  },
  CFC: {
    mandatory_components: [cfc_name, delivery_method],
    components: [cfc_name, cfc_nla_reciprocal_reporting_code, delivery_method],
    publication_table: {
      uat: _update_cfc_publication_uat,
      prod: _update_cfc_publication_prod,
    },
  },
  ADAY: {
    mandatory_components: [aday_name, aday_id],
    components: [aday_name, aday_id],
    publication_table: {
      uat: _update_cfc_publication_uat,
      prod: _update_cfc_publication_uat,
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
      //  "uat": _update_cedro_publication_uat,
      //  "prod": _update_cedro_publication_prod
    },
  },
  PMG: {
    mandatory_components: [],
    components: [],
    publication_table: {
      //  "uat": _update_pmg_publication_uat,
      //  "prod": _update_pmg_publication_prod
    },
  },
  Promopress: {
    mandatory_components: [],
    components: [],
    publication_table: {
      //  "uat": _update_promopress_publication_uat,
      //  "prod": _update_promopress_publication_prod
    },
  },
  Publisher: {
    mandatory_components: [],
    components: [],
    publication_table: {
      //  "uat": _update_publisher_publication_uat,
      //  "prod": _update_publisher_publication_prod
    },
  },
}; //  _update_publication logic

if (text_title.value) {
  update_expression = update_expression.concat(
    "#" + "global_name" + " = :" + "global_name" + ", "
  );
  // expression_attribute_names = expression_attribute_names.concat('#'+"global_name"+': '+"global_name"+', ')
  // expression_attribute_names = expression_attribute_names.concat('#'+"global_name"+': '+"global_name"+', ')
  expression_attribute_names["#global_name"] = "global_name";
  expression_attribute_values[":global_name"] = text_title.value;
}

if (typeof switch_verified.value === "boolean") {
  update_expression = update_expression.concat(
    "#" + "verified" + " = :" + "verified" + ", "
  );
  // expression_attribute_names = expression_attribute_names.concat('#'+"verified"+': '+"verified"+', ')
  // expression_attribute_names = expression_attribute_names.concat('#'+"global_name"+': '+"global_name"+', ')
  expression_attribute_names["#verified"] = "verified";
  expression_attribute_values[":verified"] = switch_verified.value;
}
if (select_family.selectedItem) {
  let family_id = select_family.selectedItem.id;
  family_value = select_family.selectedItem.name;
  family_dict = {
    enum_id: family_id,
    value: family_value,
  };
  update_expression = update_expression.concat(
    "#" + "family" + " = :" + "family" + ", "
  );
  // expression_attribute_names = expression_attribute_names.concat('#'+"family"+': '+"family"+', ')
  // expression_attribute_names = expression_attribute_names.concat('#'+"global_name"+': '+"global_name"+', ')
  expression_attribute_names["#family"] = "family";
  expression_attribute_values[":family"] = family_value;
}
if (select_media_type.selectedItem) {
  let media_id = select_media_type.selectedItem.id;
  media_value = select_media_type.selectedItem.name;
  media_dict = {
    enum_id: media_id,
    value: media_value,
  };
  update_expression = update_expression.concat(
    "#" + "media" + " = :" + "media" + ", "
  );
  // expression_attribute_names = expression_attribute_names.concat('#'+"media"+': '+"media"+', ')
  // expression_attribute_names = expression_attribute_names.concat('#'+"global_name"+': '+"global_name"+', ')
  expression_attribute_names["#media"] = "media";
  expression_attribute_values[":media"] = media_value;
}
if (select_country.selectedItem) {
  let country_id = select_country.selectedItem.id;
  country_value = select_country.selectedItem.code;
  country_dict = {
    enum_id: country_id,
    value: country_value,
  };
  update_expression = update_expression.concat(
    "#" + "country" + " = :" + "country" + ", "
  );
  expression_attribute_names["#country"] = "country";
  expression_attribute_values[":country"] = country_value;
}
if (select_frequency.selectedItem) {
  let frequency_id = select_frequency.selectedItem.id;
  frequency_value = select_frequency.selectedItem.name;
  frequency_dict = {
    enum_id: frequency_id,
    value: frequency_value,
  };
  update_expression = update_expression.concat(
    "#" + "frequency" + " = :" + "frequency" + ", "
  );
  expression_attribute_names["#frequency"] = "frequency";
  expression_attribute_values[":frequency"] = frequency_value;

  // expression_attribute_names = expression_attribute_names.concat('#'+"frequency"+': '+"frequency"+', ')
  // expression_attribute_names = expression_attribute_names.concat('#'+"global_name"+': '+"global_name"+', ')
}
if (multiselect_language.selectedItems.length !== 0) {
  languages_value = multiselect_language.selectedItems.map((obj) => obj.name);
  update_expression = update_expression.concat(
    "#" + "languages" + " = :" + "languages" + ", "
  );
  expression_attribute_names["#languages"] = "languages";
  expression_attribute_values[":languages"] = languages_value;

  // expression_attribute_names = expression_attribute_names.concat('#'+"languages"+': '+"languages"+', ')
  // expression_attribute_names = expression_attribute_names.concat('#'+"global_name"+': '+"global_name"+', ')
  languages_values = multiselect_language.selectedItems.map((obj) => {
    return {
      enum_id: obj.id,
      value: obj.name,
    };
  });
}
if (multiselect_language.selectedItems !== 0) {
  languages_dict = {
    values: languages_values,
  };
}

if (select_category.selectedItem) {
  let category_id = select_category.selectedItem.id;
  category_value = select_category.selectedItem.name;
  update_expression = update_expression.concat(
    "#" + "category" + " = :" + "category" + ", "
  );
  expression_attribute_names["#category"] = "category";
  expression_attribute_values[":category"] = category_value;
  // expression_attribute_names = expression_attribute_names.concat('#'+"category"+': '+"category"+', ')
  // expression_attribute_names = expression_attribute_names.concat('#'+"global_name"+': '+"global_name"+', ')
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

if (
  !(
    copyright_owner_details === "No copyright owner" &&
    old_copyright_owner === "No copyright owner"
  )
) {
  if (copyright_owner_details !== "No copyright owner") {
    let copyright_owner_list = []; // Initialize as an empty array for storing objects

    let ownerObject = {
      copyright_owner: copyright_owner_details,
    };

    let copyright_mandatory_components =
      copyright_metadata[copyright_owner_details]["mandatory_components"];
    let all_components =
      copyright_metadata[copyright_owner_details]["components"];

    // Check mandatory components
    for (let component of copyright_mandatory_components) {
      if (!component.value) {
        return utils.showNotification({
          title: "Mandatory Fields",
          description: `Please fill out the ${component.label} field required for ${copyright_owner_details}`,
          notificationType: "error",
          duration: 5,
        });
      }
    }



    console.log(all_components);

    // Collect all components into copyright_owner_dict as objects
   for (let component of all_components) {
     let field_name = component.label; // Define field_name here
 
     // Map the field name based on the owner type
     if (map_copyright_fields[copyright_owner_details] && map_copyright_fields[copyright_owner_details][field_name]) {
       component.label = map_copyright_fields[copyright_owner_details][field_name];
       field_name = component.label; // Update field_name after mapping
       ownerObject[field_name] = component.value;
     }
   }
     console.log('ownerObject');
     console.log(ownerObject);




    // Push ownerObject into copyright_owner_dict array
    copyright_owner_list.push(ownerObject);
    // Now prepare to update the expression if copyright_owner_dict is not empty
    if (copyright_owner_list.length > 0) {
      update_expression = update_expression.concat(
        "#copyright_owner_details = :copyright_owner_details, "
      );
      expression_attribute_names["#copyright_owner_details"] =
        "copyright_owner_details";
      expression_attribute_values[":copyright_owner_details"] =
        copyright_owner_list;
    }
  } else {
    let ownerObject = {
      copyright_owner: copyright_owner_details,
    };
    let copyright_owner_list = [];
    copyright_owner_list.push(ownerObject);
    if (copyright_owner_list.length > 0) {
      update_expression = update_expression.concat(
        "#copyright_owner_details = :copyright_owner_details, "
      );
      expression_attribute_names["#copyright_owner_details"] =
        "copyright_owner_details";
      expression_attribute_values[":copyright_owner_details"] =
        copyright_owner_list;
    }
  }
}

let user = current_user.fullName;

let meta_data_value_mapper = {
  family: family_value,
  media: media_value,
  country: country_value,
  frequency: frequency_value,
  languages: languages_value,
  category: category_value,
  copyright_owner_details: copyright_owner_value,
};

let meta_data_dict_mapper = {
  family: family_dict,
  media: media_dict,
  country: country_dict,
  frequency: frequency_dict,
  languages: languages_dict,
  category: category_dict,
  copyright_owner_details: copyright_owner_dict,
};

for (let key of meta_data) {
  if (key !== "languages" && key !== "copyright_owner_details") {
    if (
      table_publications.selectedRow[key] !== meta_data_value_mapper[key] &&
      table_publications.selectedRow[key]
    ) {
      meta_data_dict_mapper[key].modified_by = user;
    }
  } else if (key === "languages") {
    if (
      JSON.stringify(table_publications.selectedRow[key]) !==
        JSON.stringify(meta_data_value_mapper[key]) &&
      table_publications.selectedRow[key]
    ) {
      meta_data_dict_mapper[key].modified_by = user;
    }
  } else {
    const selectedRow = table_publications.selectedRow[key];
    if (
      selectedRow === undefined &&
      meta_data_value_mapper[key] !== "No copyright owner"
    ) {
      meta_data_dict_mapper[key].modified_by = user;
    } else if (
      selectedRow != undefined &&
      meta_data_value_mapper[key] === "No copyright owner"
    ) {
      meta_data_dict_mapper[key].modified_by = user;
    } else if (
      selectedRow !== undefined &&
      meta_data_value_mapper[key] !== "No copyright owner"
    ) {
      const copyrightOwner =
        table_publications.selectedRow[key][0].copyright_owner;

      const nlaDetailsList = table_publications.selectedRow[key][0];

      if (copyrightOwner === copyright_owner_details) {
        const formData =
          copyright_metadata[copyright_owner_details]["components"];
        const transformformDetails = formData.reduce(
          (acc, { formDataKey, value }) => {
            acc[formDataKey] = value;
            return acc;
          },
          {}
        );
        transformformDetails.copyright_owner = copyright_owner_details;
        const transformformDetailsList = [transformformDetails];

        const finalList = transformformDetailsList.map((item1) => {
          const matchedKeys = Object.keys(item1).filter((key) =>
            transformformDetailsList[0].hasOwnProperty(key)
          );
          return Object.fromEntries(
            matchedKeys.map((key) => [key, item1[key]])
          );
        });

        const nlaObject = nlaDetailsList;
        const formObject = finalList[0];
        const unmatchedData = {};
        for (const key in formObject) {
          if (
            nlaObject[key] !== undefined &&
            nlaObject[key] !== formObject[key]
          ) {
            unmatchedData[key] =
              formObject[key] === undefined ? null : formObject[key];
          }
        }
        if (Object.keys(unmatchedData).length > 0) {
          meta_data_dict_mapper[key].modified_by = user;
        }
      } else {
        meta_data_dict_mapper[key].modified_by = user;
      }
    }
  }
}

var enum_construct = {
  family: family_dict,
  media: media_dict,
  country: country_dict,
  frequency: frequency_dict,
  languages: languages_dict,
  category: category_dict,
  copyright_owner_details: copyright_owner_dict,
};

for (var key in enum_construct) {
  if (enum_construct.hasOwnProperty(key)) {
    if (key !== "languages" && Object.keys(enum_construct[key]).length === 0) {
      delete enum_construct[key];
    } else if (key === "languages") {
      if (
        Object.keys(enum_construct[key]).length === 0 ||
        (enum_construct[key].hasOwnProperty("values") &&
          enum_construct[key].values.length === 0)
      ) {
        delete enum_construct[key];
      }
    }
  }
}

update_expression = update_expression.concat(
  "#enum_construct = :enum_construct"
);
expression_attribute_names["#enum_construct"] = "enum_construct";
expression_attribute_values[":enum_construct"] = enum_construct;
update_expression = "SET ".concat(update_expression);

await construct_variable.setValue(enum_construct);
await update_expression_variable.setValue(update_expression);
await expression_attribute_names_variable.setValue(expression_attribute_names);
await expression_attribute_values_variable.setValue(
  expression_attribute_values
);



if (retoolContext.environment === "production") {
  return utils.showNotification(
    utils.showNotification({
      title: "Action Not allowed",
      description: `update publication button is not enabled for production `,
      notificationType: "error",
      duration: 5,
    })
  )
} else if (retoolContext.environment === "UAT") {
_update_publication_uat.trigger();
}

localStorage.clear();
