// Sample array of dictionaries
const arrayOfDicts = [
  { id: 1, name: 'John' },
  { id: 2, name: 'Jane' },
  { id: 3, name: 'Doe' }
];

// Function to get the value of a specific key from a dictionary inside the array
function getValueForKey(array, keyToFind, idToMatch) {
  // Find the dictionary with the matching id
  const foundDict = array.find(item => item.id === idToMatch);

  // Return the value of the specified key if the dictionary is found
  return foundDict ? foundDict[keyToFind] : undefined;
}

// Example usage
const idToMatch = 2;
const keyToFind = 'name';
const result = getValueForKey(arrayOfDicts, keyToFind, idToMatch);

console.log(result); // Output: Jane
