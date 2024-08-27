var originalData = _get_meta_copyright_owners.data;

// Log the data before any modifications
//console.log(originalData);

//  if (table_publications.selectedRow && table_publications.selectedRow.lookup_attributes.external_ids) {
//      const externalIds = table_publications.selectedRow.lookup_attributes.external_ids;

//      const mediaIsPrint = table_publications.selectedRow.media === "print";

//      // Configuration object defining filter rules
//      const filterConfig = [
//          { prefixes: ["NLA"], includes: ["NLA", "NLI", "CLA"], filterIfPrint: true },
//          { prefixes: ["CFC"], includes: ["CFC"], filterIfPrint: true },
//          // Add more rules here as needed
//      ];

//      // Initialize a new array to store filtered data
//      let filteredData = [];

//      // Filter the data based on the configuration
//      filterConfig.forEach(({ prefixes, includes, filterIfPrint }) => {
//          const hasPrefix = prefixes.some(prefix => externalIds.some(id => id.startsWith(prefix)));

//          if (hasPrefix && (mediaIsPrint === filterIfPrint)) {
//              // Filter the Items array inside data and concatenate it with the filteredData array
//              filteredData = filteredData.concat(data.Items.filter(item => includes.includes(item.name)));
//          }
//      });

//      // Check if filteredData is not empty before adding "No copyright owner"
//      if (filteredData.length > 0) {
//          const noCopyrightOwner = data.Items.find(item => item.name === "No copyright owner");
//          if (noCopyrightOwner && !filteredData.some(item => item.name === "No copyright owner")) {
//              filteredData.push(noCopyrightOwner);
//          }
//          data.Items = filteredData;
//      }
//  } else {
//      // If no external IDs are found, just return the original data
//      console.log("No external IDs found");
//      console.log('under else');
//  }

var filteredItems = originalData.Items.filter((item) => {
  return (
    item.name === "NLA" ||
    item.name === "CLA" ||
    item.name === "NLI" ||
    item.name === "No copyright owner"
  );
});

// Create a new data object with the filtered items
var data = {
  Count: filteredItems.length,
  ScannedCount: filteredItems.length,
  Items: filteredItems,
};

data.Items.sort((a, b) =>
  a.name.toLowerCase().localeCompare(b.name.toLowerCase())
);
// Return the data
return data;
