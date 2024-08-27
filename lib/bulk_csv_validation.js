// Parse the CSV data
const csvData = browse_publication_csv_btn.parsedValue[0];

try {
  // Retrieve the imported data
   let importedData;
   if (retoolContext.environment === "production") {
         importedData = _transform_get_bulk_imported_data_by_user_prod.value;
    }
    if (retoolContext.environment === "UAT") {
         importedData = _transform_get_bulk_imported_data_by_user_uat.value;
    }
  // Get the current session user's full name
  const currentUser = current_user.fullName;

  // Ensure importedData is an array
  if (!Array.isArray(importedData)) {
    throw new Error("Imported data is not in the expected format.");
  }
  // Filter data based on the current user
  const filteredData = importedData.filter(item => item.user === currentUser);
  // Iterate over the filtered data and trigger the delete query for each
  for (const item of filteredData) {
    try {
      const globalName = item.global_name;
      await global_name_csv.setValue(globalName);
     

    if (retoolContext.environment === "production") {

        await _delete_bulk_manual_publications_metadata.trigger();
    }
    if (retoolContext.environment === "UAT") {
        await _delete_bulk_manual_publications_metadata_uat.trigger();
    }
      
    } catch (error) {
      console.error(`Failed to delete item with global_name ${item.global_name}: ${error.message}`);
    }
  }

} catch (error) {
  console.error(`Error processing data: ${error.message}`);
}

// Check if csvData is valid
if (!csvData || !Array.isArray(csvData) || csvData.length === 0) {
    // Show a notification in Retool
    utils.showNotification({
        title: "No CSV Data Found",
        description: "Please upload a valid CSV file.",
        notificationType: "error",
        duration: 5,
    });
    return false; // Exit early to prevent further execution
}
// Define required columns
const requiredColumns = [
    'global_name', 'publication_id','gmd_id', 'country', 'category', 'media', 'frequency', 'family',
    'languages', 'domain', 'copyright_owner', 'delivery_method',
    'nla_name', 'nla_reporting_code', 'nla_publication_type', 'immo_license',
    'nla_publisher', 'nla_edition', 'nla_acronym', 'nla_region',
    'cla_name', 'cla_reporting_code_plsid', 'cla_issn', 'cla_publisher_name',
    'nli_name', 'nli_publication_type'
];

// Validate columns
function validateColumns(headerRow) {
    if (!headerRow || typeof headerRow !== 'object') {
        console.error("Invalid header row: should be an object representing CSV headers.");
        return false;
    }

    const actualColumns = Object.keys(headerRow);
    const missingColumns = requiredColumns.filter(column => !actualColumns.includes(column));

    if (missingColumns.length) {
        const errorMessage = `The following required columns are missing: ${missingColumns.join(', ')}.`;
        utils.showNotification({
            title: "CSV Validation Error",
            description: errorMessage,
            notificationType: "error",
            duration: 5000 // 5 seconds
        });
        
        return false;
    }

    return true;
}

// Validate header row (first row of CSV data)
const headerRow = csvData[0];
const columnsAreValid = validateColumns(headerRow);

if (!columnsAreValid) {
    return; // Exit early if header row validation fails
}

// Assuming dynamic values are fetched from a table or external source
const dynamicValues = {
    copyrightTypes: ["NLA", "NLI", "CLA", "No copyright owner"]
};

// Define validation functions
const validateGlobalName = (name) => typeof name === 'string' && name.trim() !== '';
const validateCopyrightOwnerDetails = (details) => typeof details === 'string' && details.trim() !== '' && dynamicValues.copyrightTypes.includes(details);

// Function to validate if a value is within allowed values
const validateComponentValue = (component, value, allowedValues) => {
    if (Array.isArray(allowedValues)) {
        return allowedValues.includes(value);
    }
    if (typeof allowedValues === 'string') {
        return typeof value === 'string' && value.trim() !== '';
    }
    return false;
};

const copyrightOwnerDetailsConfig = {
    NLA: {
        mandatory_components: [
            'nla_name',
            'nla_reporting_code',
            'nla_publication_type',
            'nla_publisher'
        ],
        components: [
            'nla_name',
            'nla_reporting_code',
            'nla_publication_type',
            'immo_license',
            'nla_publisher',
            'nla_edition',
            'nla_acronym',
            'nla_region',
            'delivery_method'
        ],
        componentsvalue: {
            nla_name: "",
            nla_reporting_code: "",
            nla_publication_type: "",
            immo_license: "",
            nla_publisher: "",
            nla_edition: "",
            nla_acronym: "",
            nla_region: "",
            delivery_method: "",
        }
    },
    CLA: {
        mandatory_components: [
            'cla_name',
            'cla_reporting_code_plsid',
            'cla_issn',
            'cla_publisher_name'
        ],
        components: [
            'cla_name',
            'cla_reporting_code_plsid',
            'cla_issn',
            'cla_publisher_name',
            'delivery_method'
        ],
        componentsvalue: {
            cla_name: "",
            cla_reporting_code_plsid: "",
            cla_issn: "",
            cla_publisher_name: "",
            delivery_method: ["yes", "no"]
        }
    },
    NLI: {
        mandatory_components: [
            'nli_name',
            'nli_publication_type',
            'delivery_method'
        ],
        components: [
            'nli_name',
            'nli_publication_type',
            'delivery_method'
        ],
        componentsvalue: {
            nli_name: "",
            nli_publication_type: "",
            delivery_method: ["yes", "no"]
        }
    }
};
// Validate each row in the CSV data
const rowsWithErrors = [];
// Validate each row in the CSV data
csvData.forEach((row, rowIndex) => {
    const globalName = row.global_name;
    const gmdId = row.gmd_id;
    const publicationId = row.publication_id;
    const country = row.country;
    const media = row.media;
    const frequency = row.frequency;
    const languages = row.languages;
    const family = row.family;

    const copyrightOwner = row.copyright_owner;

    // Validation
    let isValid = true;
    const rowErrors = [];

    if (!globalName || !validateGlobalName(globalName)) {
        isValid = false;
        rowErrors.push(`Please fill in the required field: global_name.`);
    }

    if (!gmdId) {
        isValid = false;
        rowErrors.push(`Please fill in the required field: gmd_id.`);
    }
   
  
    try {
        if (!copyrightOwner || !validateCopyrightOwnerDetails(copyrightOwner)) {
            isValid = false;
            rowErrors.push(`Copyright owner is required field`);
        } else if (copyrightOwner === 'No copyright owner') {
            // Handle 'No copyright owner' case
        } else if (copyrightOwnerDetailsConfig[copyrightOwner]) {
            const { mandatory_components, componentsvalue } = copyrightOwnerDetailsConfig[copyrightOwner];
            
            // Validate the presence and values of components
            mandatory_components.forEach(component => {
                if (!row[component] || !validateComponentValue(component, row[component], componentsvalue[component])) {
                    isValid = false;
                    rowErrors.push(`Please fill in the required field: '${component}' for copyright owner ${copyrightOwner} .`);
                }
            });

            // Get the list of relevant fields for the current copyright_owner type
            const relevantFields = new Set([...mandatory_components, ...Object.keys(componentsvalue)]);

            // Skip global fields when checking for invalid fields
            const globalFields = ['global_name', 'publication_id','gmd_id','country', 'category', 'media', 'frequency', 'family', 'languages', 'copyright_owner'];
            const fieldsToCheck = Object.keys(row).filter(field => !globalFields.includes(field));

            // Check for any fields not included in the relevant fields list
            const invalidFields = fieldsToCheck.filter(field => !relevantFields.has(field) && row[field]);

            if (invalidFields.length) {
                isValid = false;
                rowErrors.push(`The following additional fields: ${invalidFields.join(', ')} should not be filled for  Copyright Owner ${copyrightOwner}.`);

            }

        } else {
            isValid = false;
            rowErrors.push(`Unknown copyright owner type: ${copyrightOwner}.`);
        }
    } catch (error) {
        isValid = false;
        rowErrors.push(`Error validating copyright_owner: ${error.message}`);
    }

    // Add validation errors to the row with newline characters
    row.validation_errors = isValid ? '' : rowErrors.join('\n');

      // Collect rows with errors
    if (!isValid) {
        rowsWithErrors.push(row);
    }

});

// Function to generate query string
function generateQuery(item_expression) {
    return Object.keys(item_expression)
      .map(key => `${key} = ${JSON.stringify(item_expression[key])}`)
      .join(', ');
  }
  
 // Show errors table if there are validation errors
if (rowsWithErrors.length > 0) {
    // Assuming you have a way to display the errors table, for example:
    return rowsWithErrors;
} else {
    // Define the function as a function expression
const processCsvData = async (csvData) => {
    let allSuccessful = true;
    const user = current_user.fullName; // Get the user's full name once

    for (const entry of csvData) {
        const item_expression = {}; // Declare item_expression inside the loop

        // Populate item_expression with entry data
        const fields = [
            'global_name', 'gmd_id', 'publication_id', 'country', 'category',
            'media', 'frequency', 'languages', 'domain', 'copyright_owner',
            'delivery_method', 'nla_name', 'nla_reporting_code', 'nla_publication_type',
            'immo_license', 'nla_publisher', 'nla_edition', 'nla_acronym',
            'nla_region', 'cla_name', 'cla_reporting_code_plsid', 'cla_issn',
            'cla_publisher_name', 'nli_name', 'nli_publication_type'
        ];

        fields.forEach(field => {
            // Check if entry[field] is not undefined or null
            if (entry.hasOwnProperty(field) && entry[field] != null && entry[field] !== '') {
                if (field === 'languages') {
                    // Initialize languages variable
                    let languages = [];
                    if (entry.languages && entry.languages.length !== 0) {
                        languages = entry.languages.split(',').map(lang => lang.trim());
                    }
                    item_expression[field] = languages;
                } else {
                    item_expression[field] = entry[field];
                }
            }
        });

        item_expression['user'] = user; // Set 'user' to the user's full name
        await item_expression_variable.setValue(item_expression);
        // Handle actions based on environment
        if (retoolContext.environment === "production") {

            utils.showNotification({
                title: "Action Not Allowed",
                description: "Create publication button is not enabled for production.",
                notificationType: "error",
                duration: 5,
            });
            continue; // Skip the UAT trigger if in production
            
        }

        if (retoolContext.environment === "UAT") {
            // Check if item_expression is valid
            if (!item_expression || typeof item_expression !== 'object' || Object.keys(item_expression).length === 0) {
                console.error("Item expression is invalid or empty.");
                allSuccessful = false;
                continue; // Skip if item_expression is invalid
            }

            try {
                // Pass the item_expression to the trigger
                await _put_bulk_manual_publications_metadata_uat.trigger();
            } catch (error) {
                allSuccessful = false; // Mark as unsuccessful if there's an error
                console.error("Error in _put_bulk_manual_publications_metadata_uat.trigger():", error);
                utils.showNotification({
                    title: "Error",
                    description: `An error occurred: ${error.message}`,
                    notificationType: "error",
                    duration: 5,
                });
            }
        }
    }

    // Show success notification after processing all entries
    if (allSuccessful && retoolContext.environment === "UAT") {
        utils.showNotification({
            title: "Success",
            description: "Bulk manual publications metadata has been updated successfully.",
            notificationType: "success",
            duration: 5,
        });

        setTimeout(async () => {
        await _get_bulk_imported_data_by_user_uat.trigger();
        await bulk_status_user_records.trigger();
        }, 5000); //
    }
};
// Call the function
processCsvData(csvData);

}
localStorage.clear();

