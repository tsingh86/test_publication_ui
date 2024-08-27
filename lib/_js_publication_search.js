// trigger to invoke dynamodb get_publication_search module.  Invoked from Search Publications => search button
_get_publication_search.reset();
_get_publication_search.trigger({
  // You can use the argument to get the data with the //onSuccess function
  onSuccess: function () {
  }
});