document.addEventListener('DOMContentLoaded', function() {
  const searchForm = document.getElementById('search-form');
  const searchInput = document.getElementById('search-input');
  let timer;
  let currentQuery = '';

  searchInput.addEventListener('input', function() {
    clearTimeout(timer); // reset timer if user begins typing
    timer = setTimeout(function() {
      const query = searchInput.value.trim();
      currentQuery = query; // store user's current query
      if (query.length >= 3) {
        searchForm.submit();
      }
    }, 2000); // submit form after 2000 milliseconds if user stops typing
  });

  searchForm.addEventListener('submit', function(e) {
    e.preventDefault();
    openSearchResults();
  });

  function openSearchResults() {
    const searchQuery = searchInput.value.trim();
    const searchResultsUrl = "/search_results?query=" + encodeURIComponent(searchQuery);
    window.open(searchResultsUrl, '_blank');
  }
});