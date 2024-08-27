
// Function to iterate through the array and return a specific key
function getSpecificKey(array, key) {
  let result = [];

  for (let i = 0; i < array.length; i++) {
    if (array[i].hasOwnProperty(key)) {
      result.push(array[i][key]);
    }
  }

  return result;
}

// Usage
let specificKeys = getSpecificKey(_get_publication_search, 'publications');
console.log(specificKeys); // Output: ['John', 'Jane', 'Doe']
